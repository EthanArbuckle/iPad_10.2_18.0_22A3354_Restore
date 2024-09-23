@implementation UIImage(HFAdditions)

- (double)hf_sizeInScreenScale
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "scale");
  v5 = v3 * v4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v5 / v7;
  objc_msgSend(a1, "size");
  objc_msgSend(a1, "scale");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");

  return v8;
}

- (id)imageWithNormalizedOrientation
{
  id v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CGSize v13;

  v1 = a1;
  if (objc_msgSend(v1, "imageOrientation"))
  {
    objc_msgSend(v1, "size");
    v3 = v2;
    v5 = v4;
    objc_msgSend(v1, "scale");
    v7 = v6;
    v13.width = v3;
    v13.height = v5;
    UIGraphicsBeginImageContextWithOptions(v13, 0, v7);
    objc_msgSend(v1, "size");
    v9 = v8;
    objc_msgSend(v1, "size");
    objc_msgSend(v1, "drawInRect:", 0.0, 0.0, v9, v10);
    UIGraphicsGetImageFromCurrentImageContext();
    v11 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v1 = (id)v11;
  }
  return v1;
}

+ (id)hf_fetchImageFromURL:()HFAdditions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__UIImage_HFAdditions__hf_fetchImageFromURL___block_invoke;
  v12[3] = &unk_1EA728A78;
  v13 = v3;
  v5 = (void *)MEMORY[0x1E0D519E8];
  v6 = v3;
  objc_msgSend(v5, "globalAsyncScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithBlock:scheduler:", v12, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hf_safetyAndSecurityImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configurationWithHierarchicalColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "configurationByApplyingConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("house.badge.shield.half.filled.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
