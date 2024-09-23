@implementation IFPDFPage

- (IFPDFPage)initWithCGPDFPage:(CGPDFPage *)a3
{
  IFPDFPage *v4;
  IFPDFPage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IFPDFPage;
  v4 = -[IFPDFPage init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_pdfPage = a3;
  }
  return v5;
}

- (void)dealloc
{
  CGPDFPage *pdfPage;
  objc_super v4;

  pdfPage = self->_pdfPage;
  if (pdfPage)
    CFRelease(pdfPage);
  v4.receiver = self;
  v4.super_class = (Class)IFPDFPage;
  -[IFPDFPage dealloc](&v4, sel_dealloc);
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  size_t v8;
  size_t v9;
  CGColorSpace *v10;
  CGContext *v11;
  double x;
  double y;
  double v14;
  __int128 v15;
  double v16;
  CGImageRef Image;
  CGImageRef v18;
  IFImage *v19;
  CGAffineTransform v21;
  CGAffineTransform transform;
  CGAffineTransform v23;
  CGRect v24;
  CGRect BoxRect;
  CGRect v26;

  if (self->_pdfPage)
  {
    height = a3.height;
    width = a3.width;
    v8 = (unint64_t)(a3.width * a4);
    v9 = (unint64_t)(a3.height * a4);
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v11 = CGBitmapContextCreate(0, v8, v9, 8uLL, 4 * v8, v10, 2u);
    CGContextScaleCTM(v11, a4, a4);
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = width;
    v24.size.height = height;
    CGContextClearRect(v11, v24);
    BoxRect = CGPDFPageGetBoxRect(self->_pdfPage, kCGPDFCropBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    if (BoxRect.size.width <= BoxRect.size.height)
      v14 = BoxRect.size.height;
    else
      v14 = BoxRect.size.width;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v15;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&transform.a = *(_OWORD *)&v23.a;
    *(_OWORD *)&transform.c = v15;
    *(_OWORD *)&transform.tx = *(_OWORD *)&v23.tx;
    CGAffineTransformScale(&v23, &transform, 1024.0 / v14, 1024.0 / v14);
    if (width <= height)
      v16 = height;
    else
      v16 = width;
    v21 = v23;
    CGAffineTransformScale(&transform, &v21, v16 * 0.0009765625, v16 * 0.0009765625);
    v23 = transform;
    v21 = transform;
    CGAffineTransformTranslate(&transform, &v21, -x, -y);
    v23 = transform;
    CGContextSaveGState(v11);
    transform = v23;
    CGContextConcatCTM(v11, &transform);
    v26 = CGPDFPageGetBoxRect(self->_pdfPage, kCGPDFArtBox);
    CGContextClipToRect(v11, v26);
    CGContextDrawPDFPage(v11, self->_pdfPage);
    CGContextRestoreGState(v11);
    CGContextFlush(v11);
    Image = CGBitmapContextCreateImage(v11);
    if (Image)
    {
      v18 = Image;
      v19 = -[IFImage initWithCGImage:scale:]([IFImage alloc], "initWithCGImage:scale:", Image, a4);
      CFRelease(v18);
    }
    else
    {
      v19 = 0;
    }
    CGContextRelease(v11);
    CGColorSpaceRelease(v10);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (CGPDFPage)pdfPage
{
  return self->_pdfPage;
}

- (void)setPdfPage:(CGPDFPage *)a3
{
  self->_pdfPage = a3;
}

@end
