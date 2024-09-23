@implementation UIImage(MTUIStyling)

+ (id)mtui_imageWithSymbolName:()MTUIStyling scale:textStyle:andTintColor:
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x24BDF6AC8];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "systemImageNamed:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageWithSymbolConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mtui_imageWithTintColor:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (uint64_t)mtui_imageWithTintColor:()MTUIStyling
{
  return objc_msgSend(a1, "imageWithTintColor:renderingMode:", a3, 1);
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:
{
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDF6A70];
  v6 = *MEMORY[0x24BDF7888];
  v7 = a4;
  objc_msgSend(v5, "systemFontOfSize:weight:design:", CFSTR("NSCTFontUIFontDesignCompactRounded"), a1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithSymbolConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling font:andTintColor:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x24BDF6AC8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "systemImageNamed:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithSymbolConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mtui_imageWithTintColor:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)mtui_sleepImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__UIImage_MTUIStyling__mtui_sleepImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_sleepImage_onceToken != -1)
    dispatch_once(&mtui_sleepImage_onceToken, block);
  return (id)mtui_sleepImage_SleepImage;
}

+ (id)mtui_wakeImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UIImage_MTUIStyling__mtui_wakeImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_wakeImage_onceToken != -1)
    dispatch_once(&mtui_wakeImage_onceToken, block);
  return (id)mtui_wakeImage_WakeImage;
}

+ (id)mtui_deleteButtonImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__UIImage_MTUIStyling__mtui_deleteButtonImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_deleteButtonImage_onceToken != -1)
    dispatch_once(&mtui_deleteButtonImage_onceToken, block);
  return (id)mtui_deleteButtonImage_DeleteButtonImage;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling style:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = a4;
  objc_msgSend(v5, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithSymbolConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:color:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDF6AC8];
  v8 = a5;
  objc_msgSend(v7, "mtui_imageWithSymbolName:pointSize:", a4, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mtui_imageWithTintColor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
