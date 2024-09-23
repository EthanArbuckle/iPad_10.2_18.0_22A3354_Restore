@implementation UIImage(INUICrossPlatform)

+ (uint64_t)_inui_imageNamed:()INUICrossPlatform inBundle:
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
}

+ (id)_inui_imageWithLightModeImage:()INUICrossPlatform darkModeImage:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "imageAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerImage:withTraitCollection:", v6, v8);

  return v5;
}

@end
