@implementation SGUIIconSupport

+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "homeScreenIconImageWithBundleIdentifier:drawBorder:", a3, 0);
}

+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_homeScreenDescriptorWithBorder:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iconImageWithBundleIdentifier:imageDescriptor:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)spotlightIconImageWithBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "spotlightIconImageWithBundleIdentifier:drawBorder:", a3, 0);
}

+ (id)spotlightIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_spotlightDescriptorWithBorder:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iconImageWithBundleIdentifier:imageDescriptor:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_spotlightDescriptorWithBorder:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A888]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setDrawBorder:", 1);
  return v5;
}

+ (id)_homeScreenDescriptorWithBorder:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setDrawBorder:", 1);
  return v5;
}

+ (id)iconForCalendarDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0D3A820];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDate:calendar:format:", v5, v7, 0);

  objc_msgSend(a1, "_homeScreenDescriptorWithBorder:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageWithIcon:imageDescriptor:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)iconForCalendarDate:(id)a3 drawBorder:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D3A820];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDate:calendar:format:", v7, v9, 0);

  objc_msgSend(a1, "_homeScreenDescriptorWithBorder:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageWithIcon:imageDescriptor:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_iconImageWithBundleIdentifier:(id)a3 imageDescriptor:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0D3A820];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithBundleIdentifier:", v8);

  objc_msgSend(a1, "_imageWithIcon:imageDescriptor:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_imageWithIcon:(id)a3 imageDescriptor:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareImagesForImageDescriptors:", v8, v15, v16);

  objc_msgSend(v7, "imageForDescriptor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3870];
  v11 = objc_msgSend(v9, "CGImage");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
