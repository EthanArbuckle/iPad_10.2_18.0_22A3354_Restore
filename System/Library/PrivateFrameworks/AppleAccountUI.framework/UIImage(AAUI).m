@implementation UIImage(AAUI)

+ (id)imageForDataclassWithType:()AAUI
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D3A820];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithType:", v5);

  objc_msgSend(a1, "descriptorForDataclassWithSize:", 56.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3870];
  v10 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)imageForDataclassWithBundleID:()AAUI
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D3A820];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:", v5);

  objc_msgSend(a1, "descriptorForDataclassWithSize:", 56.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3870];
  v10 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)descriptorForDataclassWithSize:()AAUI
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = (void *)objc_msgSend(v2, "initWithSize:scale:", a1, a1, v4 * 3.0);

  objc_msgSend(v5, "setDrawBorder:", 1);
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", objc_msgSend(v6, "userInterfaceStyle") != 1);

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "layoutDirection"))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v5, "setLanguageDirection:", v8);

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContrast:", objc_msgSend(v9, "accessibilityContrast") == 1);

  return v5;
}

+ (id)imageForTableUIWithType:()AAUI
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D3A820];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithType:", v4);

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareImageForDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3870];
  v9 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v7, "scale");
  objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
