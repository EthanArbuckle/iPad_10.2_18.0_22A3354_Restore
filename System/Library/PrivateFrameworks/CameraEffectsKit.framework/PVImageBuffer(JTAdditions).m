@implementation PVImageBuffer(JTAdditions)

- (uint64_t)copyOfUIImage
{
  UIImage *v1;
  UIImage *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uiImage");
  v1 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    return 0;
  v2 = v1;
  UIImagePNGRepresentation(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)copyOfUIImage:()JTAdditions
{
  CGImage *v9;
  CGImage *v10;
  UIImage *v11;
  void *v12;
  uint64_t v13;
  CGRect v15;

  v9 = (CGImage *)objc_msgSend(a1, "cgImage");
  if (!v9)
    return 0;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  v10 = CGImageCreateWithImageInRect(v9, v15);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v10);
  UIImagePNGRepresentation(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)copyOfUIImageFromRectInPixels:()JTAdditions atSizeInPixels:
{
  CGImage *v13;
  CGImage *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[7];
  CGRect v22;

  v13 = (CGImage *)objc_msgSend(a1, "cgImage");
  if (!v13)
    return 0;
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  v14 = CGImageCreateWithImageInRect(v13, v22);
  if (copyOfUIImageFromRectInPixels_atSizeInPixels__onceToken != -1)
    dispatch_once(&copyOfUIImageFromRectInPixels_atSizeInPixels__onceToken, &__block_literal_global_58);
  v15 = a6 / *(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale;
  v16 = a7 / *(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale;
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOpaque:", 0);
  objc_msgSend(v17, "setPreferredRange:", 2);
  objc_msgSend(v17, "setScale:", *(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithBounds:format:", v17, 0.0, 0.0, v15, v16);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke_2;
  v21[3] = &__block_descriptor_56_e35_v16__0__UIGraphicsRendererContext_8l;
  *(double *)&v21[4] = v15;
  *(double *)&v21[5] = v16;
  v21[6] = v14;
  objc_msgSend(v18, "imageWithActions:", v21);
  v19 = objc_claimAutoreleasedReturnValue();
  CGImageRelease(v14);

  return v19;
}

@end
