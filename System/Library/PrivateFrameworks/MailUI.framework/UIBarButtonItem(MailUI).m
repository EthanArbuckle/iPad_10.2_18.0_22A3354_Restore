@implementation UIBarButtonItem(MailUI)

+ (id)mui_capsuleButtonItemWithTitle:()MailUI image:action:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0DC34F0];
  v8 = a5;
  objc_msgSend(v7, "_mui_capsuleConfigurationWithTitle:image:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v10);
  return v11;
}

+ (id)mui_capsuleButtonItemWithTitle:()MailUI image:menu:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0DC34F0];
  v8 = a5;
  objc_msgSend(v7, "_mui_capsuleConfigurationWithTitle:image:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMenu:", v8);

  objc_msgSend(v10, "setShowsMenuAsPrimaryAction:", 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v10);

  return v11;
}

+ (id)_mui_capsuleConfigurationWithTitle:()MailUI image:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "filledButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBaseBackgroundColor:", v10);

  objc_msgSend(v8, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSymbolConfigurationForImage:", v11);
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setImage:", v6);
  return v8;
}

@end
