@implementation CUIMutableThemeRendition

- (CGImage)unslicedImage
{
  return self->_image;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (void)setName:(id)a3
{
  if (-[CUIThemeRendition internalName](self, "internalName") != a3)
    -[CUIThemeRendition setInternalName:](self, "setInternalName:", a3);
}

- (CUIMutableThemeRendition)initWithCGImage:(CGImage *)a3 withDescription:(id)a4 forKey:(const _renditionkeytoken *)a5
{
  CUIMutableThemeRendition *v9;
  CGImage *v10;
  size_t Width;
  size_t Height;
  id v13;
  int v14;
  unsigned __int16 v15;
  _renditionkeytoken *v16;
  double v17;
  CUIMutableThemeRendition *v18;
  uint64_t v19;
  CUIMutableThemeRendition *v20;
  uint64_t v21;
  double y;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CUIRenditionMetrics *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSAssertionHandler *v46;
  id v47;
  uint64_t v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CUIMutableThemeRendition;
  v9 = -[CUIMutableThemeRendition init](&v49, sel_init);
  v10 = CGImageRetain(a3);
  v9->_image = v10;
  Width = CGImageGetWidth(v10);
  Height = CGImageGetHeight(v9->_image);
  v13 = objc_msgSend(a4, "resizingMode");
  -[CUIThemeRendition setExifOrientation:](v9, "setExifOrientation:", objc_msgSend(a4, "exifOrientation"));
  v14 = CUIRenditionKeyTokenCount((uint64_t)a5);
  v15 = v14 + 1;
  v16 = (_renditionkeytoken *)malloc_type_calloc((v14 + 1), 4uLL, 0x100004052888210uLL);
  v9->_renditionKey = v16;
  CUIRenditionKeyCopy(v16, a5, v15);
  -[CUIThemeRendition setInternalScale:](v9, "setInternalScale:", CUIRenditionKeyValueForAttribute(&v9->_renditionKey->identifier, 12));
  LODWORD(a5) = -[CUIThemeRendition internalScale](v9, "internalScale");
  objc_msgSend(a4, "scale");
  if ((_DWORD)a5 != v17)
  {
    v46 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v47 = (id)-[CUIThemeRendition internalScale](v9, "internalScale");
    objc_msgSend(a4, "scale");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CUIMutableThemeRendition.m"), 39, CFSTR("scale %u in rendition key does not match with scale %f passed in the image description"), v47, v48);
  }
  if (!-[CUIThemeRendition internalScale](v9, "internalScale"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CUIMutableThemeRendition.m"), 40, CFSTR("scale must be > 0"));
  -[CUIThemeRendition setInternalTemplateRenderingMode:](v9, "setInternalTemplateRenderingMode:", objc_msgSend(a4, "templateRenderingMode"));
  -[CUIThemeRendition setBlendMode:](v9, "setBlendMode:", objc_msgSend(a4, "blendMode"));
  switch((unint64_t)objc_msgSend(a4, "imageType"))
  {
    case 0uLL:
      -[CUIThemeRendition setType:](v9, "setType:", 0);
      v18 = v9;
      if (v13 == (id)1)
        v19 = 12;
      else
        v19 = 11;
      goto LABEL_21;
    case 1uLL:
      -[CUIThemeRendition setType:](v9, "setType:", 1);
      v18 = v9;
      if (v13 == (id)1)
        v19 = 21;
      else
        v19 = 20;
      goto LABEL_21;
    case 2uLL:
      -[CUIThemeRendition setType:](v9, "setType:", 2);
      v18 = v9;
      if (v13 == (id)1)
        v19 = 24;
      else
        v19 = 23;
      goto LABEL_21;
    case 3uLL:
      -[CUIThemeRendition setType:](v9, "setType:", 3);
      v18 = v9;
      if (v13 == (id)1)
        v19 = 31;
      else
        v19 = 30;
LABEL_21:
      -[CUIThemeRendition setSubtype:](v18, "setSubtype:", v19);
      break;
    case 4uLL:
      v20 = v9;
      v21 = 4;
      goto LABEL_16;
    case 5uLL:
      v20 = v9;
      v21 = 5;
LABEL_16:
      -[CUIThemeRendition setType:](v20, "setType:", v21);
      break;
    default:
      break;
  }
  y = NSZeroRect.origin.y;
  objc_msgSend(a4, "edgeInsets");
  v9->_sliceInformation = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", -[CUIThemeRendition type](v9, "type"), NSZeroRect.origin.x, y, (double)Width, (double)Height, v24 * (double)-[CUIThemeRendition internalScale](v9, "internalScale"), v23 * (double)-[CUIThemeRendition internalScale](v9, "internalScale"), v26 * (double)-[CUIThemeRendition internalScale](v9, "internalScale"), v25 * (double)-[CUIThemeRendition internalScale](v9, "internalScale"));
  objc_msgSend(a4, "alignmentEdgeInsets");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33 * (double)-[CUIThemeRendition internalScale](v9, "internalScale");
  v35 = v30 * (double)-[CUIThemeRendition internalScale](v9, "internalScale");
  v36 = v28 * (double)-[CUIThemeRendition internalScale](v9, "internalScale");
  v37 = v32 * (double)-[CUIThemeRendition internalScale](v9, "internalScale");
  v38 = [CUIRenditionMetrics alloc];
  v39 = -[CUIThemeRendition internalScale](v9, "internalScale");
  v9->_renditionMetrics = (CUIRenditionMetrics *)-[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v38, 0, 0, (double)Width, (double)Height, (double)Width, (double)Height, v36, v35, v37, v34, v40, v41, v42, v43, v44, *(uint64_t *)&NSZeroSize.width, *(_QWORD *)&NSZeroSize.height, *(uint64_t *)&NSZeroSize.width,
                                                   *(_QWORD *)&NSZeroSize.height,
                                                   0,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(_QWORD *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(_QWORD *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(_QWORD *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(_QWORD *)&NSZeroSize.height,
                                                   COERCE__INT64((double)v39));
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_renditionKey);
  CGImageRelease(self->_image);

  v3.receiver = self;
  v3.super_class = (Class)CUIMutableThemeRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (const)key
{
  return self->_renditionKey;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

@end
