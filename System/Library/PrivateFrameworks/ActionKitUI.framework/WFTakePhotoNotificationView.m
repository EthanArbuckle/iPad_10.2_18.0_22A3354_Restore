@implementation WFTakePhotoNotificationView

- (WFTakePhotoNotificationView)initWithFrame:(CGRect)a3 shortcutAttribution:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  WFTakePhotoNotificationView *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFTakePhotoNotificationView *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37[4] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WFTakePhotoNotificationView;
  v10 = -[WFTakePhotoNotificationView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BEBD708]);
    v35 = v9;
    if (v9)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("“%@” is taking a photo..."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v14);

    }
    else
    {
      WFLocalizedString(CFSTR("A shortcut is taking a photo..."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v13);
    }

    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v11, "setNumberOfLines:", 0);
    -[WFTakePhotoNotificationView addSubview:](v10, "addSubview:", v11);
    v15 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v34, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v16);

    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", v15, *MEMORY[0x24BEBB600]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v17);

    v28 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v11, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoNotificationView leadingAnchor](v10, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 18.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    objc_msgSend(v11, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoNotificationView trailingAnchor](v10, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -18.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v18;
    objc_msgSend(v11, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoNotificationView topAnchor](v10, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 21.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v21;
    objc_msgSend(v11, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoNotificationView bottomAnchor](v10, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -21.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v25);

    v26 = v10;
    v9 = v35;
  }

  return v10;
}

@end
