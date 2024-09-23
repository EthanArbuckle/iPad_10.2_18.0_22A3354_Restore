@implementation CUINamedVectorPDFImage

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height;
  double width;
  CGPDFPage *Page;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  CGColorSpace *DisplayP3;
  uint64_t v18;
  uint64_t v19;
  CGContextRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CGContext *v27;
  CGImage *Image;
  CGAffineTransform transform;
  CGRect BoxRect;
  CGRect v32;

  height = a4.height;
  width = a4.width;
  if (a3 == 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorImage.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale"));
  if (width <= 0.0 || height <= 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorImage.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetSizeInPoints.width>0 && targetSizeInPoints.height>0"));
  Page = CGPDFDocumentGetPage(-[CUINamedVectorPDFImage pdfDocument](self, "pdfDocument"), 1uLL);
  BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  v10 = BoxRect.size.width;
  v11 = BoxRect.size.height;
  v12 = width * a3;
  v13 = height * a3;
  if (-[CUIRenditionKey themeDisplayGamut](-[CUINamedLookup renditionKey](self, "renditionKey", BoxRect.origin.x, BoxRect.origin.y), "themeDisplayGamut")&& CGPDFPageContainsWideGamutContent(Page))
  {
    v14 = 4097;
    v15 = 8;
    v16 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    v14 = 8193;
    v15 = 4;
    v16 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  v20 = CUICGBitmapContextCreate((unint64_t)v12, (unint64_t)v13, v16, (unint64_t)(v12 * (double)v15), DisplayP3, v14, v18, v19);
  if (v20)
  {
    v27 = v20;
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.width = v10;
    v32.size.height = v11;
    CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v32, 0, 1);
    CGContextConcatCTM(v27, &transform);
    CGContextScaleCTM(v27, v12 / v10, v13 / v11);
    CGContextDrawPDFPage(v27, Page);
    Image = CGBitmapContextCreateImage(v27);
    CFRelease(v27);
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for (%fx%f) colorSpace:'%@' [pdfsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%d]", v21, v22, v23, v24, v25, v26, (uint64_t)"-[CUINamedVectorPDFImage rasterizeImageUsingScaleFactor:forTargetSize:]");
    return 0;
  }
  return Image;
}

- (CGPDFDocument)pdfDocument
{
  return -[CUIThemeRendition pdfDocument](-[CUINamedLookup _rendition](self, "_rendition"), "pdfDocument");
}

@end
