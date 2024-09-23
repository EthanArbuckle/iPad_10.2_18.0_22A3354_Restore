@implementation UIColor(NotificationCenterAdditions)

+ (id)nc_labelColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 1, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_visualStylingForStyle:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v1;
  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visualStylingForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 1, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_visualStylingForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_dynamicColorWithColorsByTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
