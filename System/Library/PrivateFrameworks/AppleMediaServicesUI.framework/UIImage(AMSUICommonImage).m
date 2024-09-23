@implementation UIImage(AMSUICommonImage)

- (uint64_t)ams_aspectRatio
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "size");
  if (v3 != 0.0)
  {
    objc_msgSend(a1, "size", -1.0);
    return objc_msgSend(a1, "size");
  }
  return result;
}

- (id)ams_imageCroppedTo:()AMSUICommonImage
{
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGImage *v20;
  CGImageRef v21;
  CGImage *v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(a1, "size");
  v26.size.width = v12;
  v26.size.height = v13;
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  v26.origin.x = v10;
  v26.origin.y = v11;
  if (CGRectEqualToRect(v24, v26))
  {
    v14 = a1;
  }
  else
  {
    objc_msgSend(a1, "scale");
    v16 = a2 * v15;
    v17 = a3 * v15;
    v18 = a4 * v15;
    v19 = a5 * v15;
    v20 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
    v25.origin.x = v16;
    v25.origin.y = v17;
    v25.size.width = v18;
    v25.size.height = v19;
    v21 = CGImageCreateWithImageInRect(v20, v25);
    if (v21)
    {
      v22 = v21;
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", v21);
      CGImageRelease(v22);
    }
    else
    {
      v14 = 0;
    }
  }
  return v14;
}

- (uint64_t)ams_imageScaledTo:()AMSUICommonImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", objc_msgSend(objc_retainAutorelease(a1), "CGImage"), 0, a2);
}

- (id)ams_imageWithRenderingMode:()AMSUICommonImage
{
  id v5;

  if (objc_msgSend(a1, "isSymbolImage"))
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "imageWithRenderingMode:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (uint64_t)ams_imageWithSystemSymbolName:()AMSUICommonImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:");
}

+ (uint64_t)ams_systemChevronLeft
{
  return objc_msgSend(a1, "ams_imageWithSystemSymbolName:", CFSTR("chevron.left"));
}

+ (uint64_t)ams_systemChevronRight
{
  return objc_msgSend(a1, "ams_imageWithSystemSymbolName:", CFSTR("chevron.right"));
}

@end
