@implementation UIImage(CarPlayUIServices)

+ (id)crsui_imageNamed:()CarPlayUIServices compatibleWithTraitCollection:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleWithIdentifier:", CFSTR("com.apple.CarPlayUIServices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)crsui_wallpaperImageNamed:()CarPlayUIServices compatibleWithTraitCollection:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(a4, "userInterfaceStyle") == 1)
    v6 = CFSTR("-Light");
  else
    v6 = CFSTR("-Dark");
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CarPlayUIServices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v7, CFSTR("heic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
