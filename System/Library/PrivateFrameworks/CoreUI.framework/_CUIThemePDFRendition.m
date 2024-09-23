@implementation _CUIThemePDFRendition

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (int)pixelFormat
{
  return 1346651680;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  _CUISubrangeData *v12;
  _CUISubrangeData *v13;
  CGDataProvider *v14;
  CGDataProvider *v15;
  NSAssertionHandler *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  NSAssertionHandler *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_CUIThemePDFRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v25, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (a3->var6 != 1346651680)
  {
    v17 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v19 = (objc_class *)objc_opt_class(v6, v18);
    v20 = NSStringFromClass(v19);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemePDFRendition.m"), 43, CFSTR("CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatPDF"), v20, NSStringFromSelector(a2));
  }
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v8 = v7 + 180;
  if (*((_DWORD *)v7 + 46))
  {
    v21 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v23 = (objc_class *)objc_opt_class(v6, v22);
    v24 = NSStringFromClass(v23);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemePDFRendition.m"), 46, CFSTR("CoreUI:-[%@ %@]  data shouldn't be compressed here"), v24, NSStringFromSelector(a2));
  }
  v9 = *((_DWORD *)v8 + 2);
  v10 = bswap32(v9);
  if (*(_DWORD *)v8 == 1146569042)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", objc_msgSend(v6, "srcData"), v8 - (_BYTE *)objc_msgSend(objc_msgSend(v6, "srcData"), "bytes") + 12, v11);
  if (v12)
  {
    v13 = v12;
    v14 = CGDataProviderCreateWithCFData((CFDataRef)v12);
    if (v14)
    {
      v15 = v14;
      v6[27] = CGPDFDocumentCreateWithProvider(v14);
      CGDataProviderRelease(v15);
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_pdfDocument);
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemePDFRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)metrics
{
  return 0;
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  CGPDFDocument *v5;
  CGPDFPage *Page;
  CGPDFPage *v7;
  CGPDFPage *Image;
  double width;
  double height;
  double v11;
  size_t v12;
  size_t v13;
  CGColorSpace *SRGB;
  uint64_t v15;
  uint64_t v16;
  CGContextRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGContext *v24;
  CGAffineTransform transform;
  CGRect BoxRect;
  CGRect v28;

  v5 = -[_CUIThemePDFRendition pdfDocument](self, "pdfDocument");
  if (!v5)
    return 0;
  Page = CGPDFDocumentGetPage(v5, 1uLL);
  v7 = CGPDFPageRetain(Page);
  Image = v7;
  if (v7)
  {
    BoxRect = CGPDFPageGetBoxRect(v7, kCGPDFCropBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    -[CUIThemeRendition scale](self, "scale", BoxRect.origin.x, BoxRect.origin.y);
    if (v11 < 1.0)
      v11 = 1.0;
    v12 = vcvtad_u64_f64(width * a3 / v11);
    v13 = vcvtad_u64_f64(height * a3 / v11);
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    v17 = CUICGBitmapContextCreate(v12, v13, 8uLL, 4 * (v12 & 0x7FFFFFFFFFFFFFFLL), SRGB, 8194, v15, v16);
    if (v17)
    {
      v24 = v17;
      v28.origin.x = 0.0;
      v28.origin.y = 0.0;
      v28.size.width = width;
      v28.size.height = height;
      CGPDFPageGetDrawingTransform(&transform, Image, kCGPDFCropBox, v28, 0, 1);
      CGContextConcatCTM(v24, &transform);
      CGContextScaleCTM(v24, a3, a3);
      CGContextDrawPDFPage(v24, Image);
      CGPDFPageRelease(Image);
      Image = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      return Image;
    }
    _CUILog(4, (uint64_t)"%s %d couldn't create bitmapcontext size:[%zu %zu] bpr %zu", v18, v19, v20, v21, v22, v23, (uint64_t)"-[_CUIThemePDFRendition createImageFromPDFRenditionWithScale:]");
    CGPDFPageRelease(Image);
    return 0;
  }
  return Image;
}

@end
