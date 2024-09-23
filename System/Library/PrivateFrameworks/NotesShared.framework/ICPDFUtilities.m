@implementation ICPDFUtilities

+ (id)renderedImageForPage:(CGPDFPage *)a3 scale:(double)a4 size:(CGSize)a5 colorSpace:(CGColorSpace *)a6
{
  void *v6;
  double height;
  double width;
  void *v10;
  void *v11;
  _QWORD v13[4];
  __int128 v14;
  double v15;
  double v16;
  void *v17;

  v6 = a3;
  if (a3)
  {
    height = a5.height;
    width = a5.width;
    v14 = *MEMORY[0x1E0C9D538];
    objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat", a3, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScale:", a4);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v10, width, height);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__ICPDFUtilities_renderedImageForPage_scale_size_colorSpace___block_invoke;
    v13[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v15 = width;
    v16 = height;
    v17 = v6;
    objc_msgSend(v11, "imageWithActions:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __61__ICPDFUtilities_renderedImageForPage_scale_size_colorSpace___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGColorSpace *DeviceGray;
  CGColor *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat MinY;
  CGAffineTransform v18;
  CGAffineTransform transform;
  CGAffineTransform v20;
  CGFloat components[3];
  uint64_t v22;
  CGRect BoxRect;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  DeviceGray = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)components = xmmword_1BDC15B10;
  v5 = CGColorCreate(DeviceGray, components);
  CGContextSetFillColorWithColor(v3, v5);
  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
  CGColorRelease(v5);
  CGColorSpaceRelease(DeviceGray);
  CGContextGetCTM(&v20, v3);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 56));
  BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)*(_QWORD *)(a1 + 64), kCGPDFCropBox);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  memset(&v20, 0, sizeof(v20));
  v10 = *(double *)(a1 + 48);
  v11 = CGRectGetWidth(BoxRect);
  v12 = *(double *)(a1 + 56);
  v13 = v10 / v11;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v14 = CGRectGetHeight(v24);
  CGAffineTransformMakeScale(&v20, v13, v12 / v14);
  transform = v20;
  CGContextConcatCTM(v3, &transform);
  memset(&transform, 0, sizeof(transform));
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v15 = -CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinY = CGRectGetMinY(v26);
  CGAffineTransformMakeTranslation(&transform, v15, -MinY);
  v18 = transform;
  CGContextConcatCTM(v3, &v18);
  return CGContextDrawPDFPageWithAnnotations();
}

@end
