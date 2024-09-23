@implementation _CUIInternalLinkRendition

- (void)_setStructuredThemeStore:(id)a3
{
  objc_storeWeak((id *)&self->_sourceProvider, a3);
}

- (CGSize)originalUncroppedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalUncroppedSize.width;
  height = self->_originalUncroppedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  char *v6;
  uint64_t var0;
  const _csiheader *v8;
  unsigned int v9;
  char *v10;
  CGFloat height;
  uint64_t var10;
  const _csiheader *v13;
  unsigned int *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64x2_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64x2_t v23;
  uint64_t v24;
  uint64_t v25;
  CGImage *v26;
  double Width;
  double v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int *v32;
  char *v33;
  unsigned int v34;
  unsigned int v35;
  CGPoint *v36;
  BOOL v37;
  CGSize size;
  uint64_t v39;
  uint64x2_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CUIRenditionMetrics *v50;
  uint64_t v51;
  __int16 v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  double v62;
  double v63;
  double *v64;
  double v65;
  double v66;
  SEL v68;
  NSSize v69;
  NSSize v70;
  NSSize v71;
  NSSize v72;
  unint64_t v73;
  NSSize v74;
  NSSize v75;
  NSSize v76;
  NSSize v77;
  double v78;
  double v79;
  objc_super v80;
  _OWORD v81[6];
  NSSize v82;
  NSSize v83;

  v80.receiver = self;
  v80.super_class = (Class)_CUIInternalLinkRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v80, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var0 = a3->var11.var0;
  if ((_DWORD)var0)
  {
    v8 = a3;
    v68 = a2;
    v9 = 0;
    v10 = (char *)&a3->var11.var1[var0 + 1] + a3->var10;
    height = NSZeroSize.height;
    while (1)
    {
      var10 = v8->var10;
      memset(v81, 0, 92);
      if (!(_DWORD)var10)
        break;
      v13 = v8;
      v14 = 0;
      v15 = 0;
      v16 = &v10[-var10];
      do
      {
        switch(*(_DWORD *)v16)
        {
          case 0x3E9:
            v14 = (unsigned int *)(v16 + 8);
            *((_DWORD *)v6 + 54) = *((_DWORD *)v16 + 2);
            break;
          case 0x3EB:
            v15 = (uint64_t)(v16 + 8);
            break;
          case 0x3EE:
            objc_msgSend(v6, "setExifOrientation:", *((unsigned int *)v16 + 2));
            break;
          case 0x3F2:
            v17 = *((_QWORD *)v16 + 2);
            v18.i64[0] = v17;
            v18.i64[1] = HIDWORD(v17);
            *(float64x2_t *)(v6 + 888) = vcvtq_f64_u64(v18);
            v19 = *((_QWORD *)v16 + 3);
            v18.i64[0] = v19;
            v18.i64[1] = HIDWORD(v19);
            *(float64x2_t *)(v6 + 904) = vcvtq_f64_u64(v18);
            v20 = *(_DWORD *)(v16 + 34);
            if (v20 >= 0x58)
              v21 = 88;
            else
              v21 = v20;
            __memcpy_chk(v81, v16 + 38, v21, 92);
            *((_QWORD *)v6 + 116) = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v81);
            objc_msgSend(v6, "_initializeTypeIdentifiersWithLayout:", *((unsigned __int16 *)v16 + 16));
            break;
          case 0x3F3:
            v22 = *((_QWORD *)v16 + 2);
            v23.i64[0] = v22;
            v23.i64[1] = HIDWORD(v22);
            *(float64x2_t *)(v6 + 936) = vcvtq_f64_u64(v23);
            v24 = *((_QWORD *)v16 + 3);
            v23.i64[0] = v24;
            v23.i64[1] = HIDWORD(v24);
            *(float64x2_t *)(v6 + 952) = vcvtq_f64_u64(v23);
            v25 = *((_QWORD *)v16 + 4);
            v23.i64[0] = v25;
            v23.i64[1] = HIDWORD(v25);
            *(float64x2_t *)(v6 + 968) = vcvtq_f64_u64(v23);
            break;
          default:
            break;
        }
        v16 += *((unsigned int *)v16 + 1) + 8;
      }
      while (v16 < v10);
      if (!v14)
        break;
      v26 = (CGImage *)objc_msgSend(v6, "unslicedImage");
      v78 = 0.0;
      v79 = 0.0;
      Width = (double)CGImageGetWidth(v26);
      v28 = (double)CGImageGetHeight(v26);
      v78 = Width;
      v79 = v28;
      v76 = NSZeroSize;
      v77 = v76;
      v74 = v76;
      v75 = v76;
      v73 = 0xBFF0000000000000;
      v71 = v76;
      v72 = v76;
      v69 = v76;
      v70 = v76;
      if (v15)
      {
        _extractMetrics(v15, (uint64_t)&v78, &v77.width, &v76.width, &v75.width, (int8x16_t *)&v74, &v73, &v72.width, (int8x16_t *)&v71, &v70.width, (int8x16_t *)&v69);
        Width = v78;
        v28 = v79;
      }
      v29 = *v14;
      *((_DWORD *)v6 + 54) = *v14;
      if (v29 >= 0x11)
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v68, v6, CFSTR("CUIThemeRendition.m"), 2986, CFSTR("CoreUI: have more slices than image slots: _CUIInternalLinkRendition"));
      v30 = *v14;
      if ((_DWORD)v30)
      {
        v31 = 0;
        v32 = v14 + 4;
        v33 = v6;
        do
        {
          v34 = *(v32 - 1);
          v35 = *v32;
          v36 = (CGPoint *)(v33 + 224);
          if (v34)
            v37 = v35 == 0;
          else
            v37 = 1;
          if (v37)
          {
            size = CGRectZero.size;
            *v36 = CGRectZero.origin;
            *((CGSize *)v33 + 15) = size;
            v30 = *v14;
          }
          else
          {
            v39 = *(_QWORD *)(v32 - 3);
            v40.i64[0] = v39;
            v40.i64[1] = HIDWORD(v39);
            *(float64x2_t *)v36 = vcvtq_f64_u64(v40);
            *((double *)v33 + 30) = (double)v34;
            *((double *)v33 + 31) = (double)v35;
          }
          ++v31;
          v33 += 32;
          v32 += 4;
        }
        while (v31 < v30);
      }
      if (objc_msgSend(v6, "type") == (id)3)
      {
        v41 = *((double *)v6 + 31);
        v42 = *((double *)v6 + 55);
        v43 = *((double *)v6 + 30) + *((double *)v6 + 38);
        objc_msgSend(v6, "scale");
        Width = v43 + v44;
        objc_msgSend(v6, "scale");
        v28 = v41 + v42 + v45;
      }
      else if (objc_msgSend(v6, "type") == (id)2)
      {
        v46 = *((double *)v6 + 31) + *((double *)v6 + 39);
        objc_msgSend(v6, "scale");
        v28 = v47 + v46;
      }
      else if (objc_msgSend(v6, "type") == (id)1)
      {
        v48 = *((double *)v6 + 30) + *((double *)v6 + 38);
        objc_msgSend(v6, "scale");
        Width = v49 + v48;
      }
      v82.width = NSZeroSize.width;
      v82.height = height;
      v83.width = Width;
      v83.height = v28;
      if (!NSEqualSizes(v82, v83))
      {
        v50 = [CUIRenditionMetrics alloc];
        v51 = v73;
        v52 = objc_msgSend(v6, "type") == (id)2 || objc_msgSend(v6, "type") == (id)3;
        v53 = objc_msgSend(v6, "type") == (id)1 || objc_msgSend(v6, "type") == (id)3;
        objc_msgSend(v6, "scale");
        *((_QWORD *)v6 + 109) = -[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v50, v52, v53, Width, v28, v78, v79, v77.width, v77.height, v76.width, v76.height, v54, v55, v56, v57, v58, *(uint64_t *)&v75.width, *(uint64_t *)&v75.height, *(uint64_t *)&v74.width,
                                  *(uint64_t *)&v74.height,
                                  v51,
                                  *(uint64_t *)&v72.width,
                                  *(uint64_t *)&v72.height,
                                  *(uint64_t *)&v71.width,
                                  *(uint64_t *)&v71.height,
                                  *(uint64_t *)&v70.width,
                                  *(uint64_t *)&v70.height,
                                  *(uint64_t *)&v69.width,
                                  *(uint64_t *)&v69.height,
                                  v59);
      }
      if (objc_msgSend(v6, "type") == (id)3 || objc_msgSend(v6, "type") == (id)2 || objc_msgSend(v6, "type") == (id)1)
      {
        v60 = objc_msgSend(v6, "type");
        v61 = 64;
        if (v60 == (id)3)
          v61 = 256;
        v62 = *((double *)v6 + 30);
        v63 = *((double *)v6 + 31);
        v64 = (double *)&v6[v61 + 224];
        v65 = v64[2];
        v66 = v64[3];
        if (objc_msgSend(v6, "type") == (id)3)
        {
          if (v62 == 0.0)
          {
            if (*((double *)v6 + 42) <= *((double *)v6 + 54))
              v62 = *((double *)v6 + 54);
            else
              v62 = *((double *)v6 + 42);
          }
          if (v63 == 0.0)
          {
            if (*((double *)v6 + 35) <= *((double *)v6 + 39))
              v63 = *((double *)v6 + 39);
            else
              v63 = *((double *)v6 + 35);
          }
          if (v65 == 0.0)
          {
            if (*((double *)v6 + 38) <= *((double *)v6 + 50))
              v65 = *((double *)v6 + 50);
            else
              v65 = *((double *)v6 + 38);
          }
          if (v66 == 0.0)
          {
            if (*((double *)v6 + 55) <= *((double *)v6 + 59))
              v66 = *((double *)v6 + 59);
            else
              v66 = *((double *)v6 + 55);
          }
        }
        *((_QWORD *)v6 + 110) = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", objc_msgSend(v6, "type"), 0.0, 0.0, Width, v28, v62, v63, v65, v66);
      }
      ++v9;
      v8 = v13;
      if (v9 >= v13->var11.var0)
        return v6;
    }

    return 0;
  }
  return v6;
}

- (CGImage)unslicedImage
{
  CGImage *unslicedImage;
  CGImage *v4;
  CGImage *v5;
  CGFloat x;
  CGFloat width;
  double height;
  CGImage *v9;
  CUIRenditionKey *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGImage *v17;
  CGRect v19;

  objc_sync_enter(self);
  unslicedImage = self->_unslicedImage;
  if (unslicedImage)
    goto LABEL_9;
  v4 = (CGImage *)objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "unslicedImage");
  v5 = v4;
  if (v4)
  {
    x = self->_frame.origin.x;
    width = self->_frame.size.width;
    height = self->_frame.size.height;
    v19.origin.y = (double)CGImageGetHeight(v4) - (self->_frame.origin.y + height);
    v19.origin.x = x;
    v19.size.width = width;
    v19.size.height = height;
    v9 = CGImageCreateWithImageInRect(v5, v19);
    self->_unslicedImage = v9;
    CGImageSetProperty(v9, CFSTR("com.apple.coreui"), +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", -[CUIThemeRendition key](self, "key")));
    if (objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "caAllowSubimageOfImage:", v5))
      CGImageSetProperty(self->_unslicedImage, CFSTR("__CAAllowSubimage"), kCFBooleanTrue);
  }
  else if (objc_loadWeak((id *)&self->_sourceProvider) && !-[_CUIInternalLinkRendition data](self, "data"))
  {
    v10 = +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", -[CUIThemeRendition key](self, "key"));
    objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: Unable to resolve link '%@' to parent image with key '%@' for internalLink image in source at path '%@'", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  unslicedImage = self->_unslicedImage;
  if (unslicedImage)
  {
LABEL_9:
    CFRetain(unslicedImage);
    CFAutorelease(self->_unslicedImage);
    v17 = self->_unslicedImage;
  }
  else
  {
    v17 = 0;
  }
  objc_sync_exit(self);
  return v17;
}

- (id)_sourceRendition
{
  return objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "renditionWithKey:", -[CUIRenditionKey keyList](self->_referenceKey, "keyList"));
}

- (CGRect)alphaCroppedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alphaCroppedFrame.origin.x;
  y = self->_alphaCroppedFrame.origin.y;
  width = self->_alphaCroppedFrame.size.width;
  height = self->_alphaCroppedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceProvider);
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  CGImageRelease(self->_unslicedImage);
  if (self->_nimages)
  {
    v3 = 0;
    do
      CGImageRelease(self->_image[v3++]);
    while (v3 < self->_nimages);
  }

  v4.receiver = self;
  v4.super_class = (Class)_CUIInternalLinkRendition;
  -[CUIThemeRendition dealloc](&v4, sel_dealloc);
}

- (int)bitmapEncoding
{
  return objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "bitmapEncoding");
}

- (BOOL)isOpaque
{
  return objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "isOpaque");
}

- (int)pixelFormat
{
  return objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "pixelFormat");
}

- (BOOL)isInternalLink
{
  return 1;
}

- (id)linkingToRendition
{
  return self->_referenceKey;
}

- (CGRect)_destinationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)unslicedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[_CUIInternalLinkRendition originalUncroppedSize](self, "originalUncroppedSize");
  if (v3 == 0.0 || v4 == 0.0)
  {
    -[_CUIInternalLinkRendition _destinationFrame](self, "_destinationFrame");
    v3 = v5;
    v4 = v6;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isScaled
{
  return -[CUIThemeRendition subtype](self, "subtype") == 31
      || -[CUIThemeRendition subtype](self, "subtype") == 12
      || (id)-[CUIThemeRendition type](self, "type") == (id)2
      || (id)-[CUIThemeRendition type](self, "type") == (id)1;
}

- (id)data
{
  return objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "data");
}

- (id)properties
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CUIInternalLinkRendition;
  v3 = -[CUIThemeRendition properties](&v8, sel_properties);
  v4 = objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "properties");
  v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v3);
      objc_msgSend(v6, "addEntriesFromDictionary:", v5);
    }
    else
    {
      v6 = objc_msgSend(v3, "copy");
    }
    return v6;
  }
  return v5;
}

- (unsigned)_fillOutImageSlices
{
  unsigned int *v1;
  CGImage *v2;
  size_t Height;
  unint64_t v4;
  double v5;
  CGFloat *v6;
  CGRect v7;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    if (!*((_QWORD *)v1 + 92))
    {
      if (v1[54])
      {
        v2 = (CGImage *)objc_msgSend(v1, "unslicedImage");
        Height = CGImageGetHeight(v2);
        if (v1[54])
        {
          v4 = 0;
          v5 = (double)Height;
          v6 = (CGFloat *)v1;
          do
          {
            v7.origin.x = v6[28];
            v7.size.width = v6[30];
            v7.size.height = v6[31];
            v7.origin.y = v5 - (v6[29] + v7.size.height);
            *(_QWORD *)&v1[2 * v4++ + 184] = CGImageCreateWithImageInRect(v2, v7);
            v6 += 4;
          }
          while (v4 < v1[54]);
        }
      }
    }
    return (unsigned int *)objc_sync_exit(v1);
  }
  return result;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  -[_CUIInternalLinkRendition _fillOutImageSlices]((unsigned int *)self);
  return +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", self->_image[a3]);
}

- (id)maskForSliceIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *v10;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v18;
  CUIImage *v19;
  CGFloat decode[3];

  *(_OWORD *)decode = xmmword_19EC72B00;
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    -[_CUIInternalLinkRendition _fillOutImageSlices]((unsigned int *)self);
    v10 = self->_image[a3];
    Width = CGImageGetWidth(v10);
    Height = CGImageGetHeight(v10);
    BitsPerComponent = CGImageGetBitsPerComponent(v10);
    BitsPerPixel = CGImageGetBitsPerPixel(v10);
    BytesPerRow = CGImageGetBytesPerRow(v10);
    DataProvider = CGImageGetDataProvider(v10);
    ShouldInterpolate = CGImageGetShouldInterpolate(v10);
    v18 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
    v19 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v18);
    CGImageRelease(v18);
  }
  return v19;
}

- (BOOL)isTiled
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((id)-[CUIThemeRendition type](self, "type") == (id)3
    || !-[CUIThemeRendition type](self, "type")
    || (id)-[CUIThemeRendition type](self, "type") == (id)5
    || (id)-[CUIThemeRendition type](self, "type") == (id)8)
  {
    return -[CUIThemeRendition subtype](self, "subtype") == 30 || -[CUIThemeRendition subtype](self, "subtype") == 11;
  }
  v4 = -[CUIThemeRendition name](self, "name");
  _CUILog(1, (uint64_t)"WARNING: -isTiled called on rendition named: %@, which is not a one-part or nine-part image, but the method is only meaningful for one-part and nine-part images. Returning NO.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  return 0;
}

- (BOOL)edgesOnly
{
  return -[CUIThemeRendition subtype](self, "subtype") == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIThemeRendition key](self, "key"), 11) != 2;
}

@end
