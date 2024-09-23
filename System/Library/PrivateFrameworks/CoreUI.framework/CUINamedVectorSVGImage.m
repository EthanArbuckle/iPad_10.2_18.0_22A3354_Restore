@implementation CUINamedVectorSVGImage

- (CGSVGDocument)svgDocument
{
  return -[CUIThemeRendition svgDocument](-[CUINamedLookup _rendition](self, "_rendition"), "svgDocument");
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height;
  double width;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGSVGDocument *v16;
  double CanvasSize;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  CGColorSpace *DisplayP3;
  uint64_t v26;
  uint64_t v27;
  CGContext *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CGContext *v35;
  CGImage *Image;

  height = a4.height;
  width = a4.width;
  if (a3 == 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorImage.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale"));
  if (width <= 0.0 || height <= 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorImage.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetSizeInPoints.width>0 && targetSizeInPoints.height>0"));
  v9 = -[CUINamedLookup name](self, "name");
  _CUILog(3, (uint64_t)"-[CUINamedVectorImage (%@) rasterizeImageUsingScaleFactor:%f forTargetSize:%fx%f]", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  v16 = -[CUINamedVectorSVGImage svgDocument](self, "svgDocument");
  CanvasSize = CGSVGDocumentGetCanvasSize(v16);
  v19 = v18;
  v20 = floor(width * a3);
  v21 = floor(height * a3);
  if (-[CUIRenditionKey themeDisplayGamut](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeDisplayGamut")
    && CGSVGDocumentContainsWideGamutContent(v16))
  {
    v22 = 4097;
    v23 = 8;
    v24 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    v22 = 8193;
    v23 = 4;
    v24 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  v28 = CUICGBitmapContextCreate((unint64_t)v20, (unint64_t)v21, v24, (unint64_t)(v20 * (double)v23), DisplayP3, v22, v26, v27);
  if (v28)
  {
    v35 = v28;
    CGContextScaleCTM(v28, v20 / CanvasSize, v21 / v19);
    CGContextDrawSVGDocument(v35, v16);
    Image = CGBitmapContextCreateImage(v35);
    CFRelease(v35);
    return Image;
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for %s (%fx%f) colorSpace:'%@' [pdfsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%zd]", v29, v30, v31, v32, v33, v34, (uint64_t)"-[CUINamedVectorSVGImage rasterizeImageUsingScaleFactor:forTargetSize:]");
    return 0;
  }
}

@end
