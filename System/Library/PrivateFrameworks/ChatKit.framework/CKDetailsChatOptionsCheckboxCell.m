@implementation CKDetailsChatOptionsCheckboxCell

- (CKDetailsChatOptionsCheckboxCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsChatOptionsCheckboxCell *v4;
  CKDetailsChatOptionsCheckboxCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDetailsChatOptionsCheckboxCell;
  v4 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsChatOptionsCheckboxCell _configureNewControlSwitch](v4, "_configureNewControlSwitch");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsCellStaticTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCheckboxCell controlSwitch](v5, "controlSwitch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOnTintColor:", v8);

    -[CKDetailsCell topSeperator](v5, "topSeperator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[CKDetailsCell bottomSeperator](v5, "bottomSeperator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

  }
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsChatOptionsCheckboxCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (CKIsRunningInMacCatalyst())
  {
    v6 = 44.0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKDetailsChatOptionsCheckboxCell;
    -[CKDetailsChatOptionsCheckboxCell sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
    width = v7;
  }
  v8 = width;
  result.height = v6;
  result.width = v8;
  return result;
}

- (UISwitch)controlSwitch
{
  UISwitch *controlSwitch;

  controlSwitch = self->_controlSwitch;
  if (!controlSwitch)
  {
    -[CKDetailsChatOptionsCheckboxCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
    controlSwitch = self->_controlSwitch;
  }
  return controlSwitch;
}

- (void)_configureNewControlSwitch
{
  UISwitch *controlSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;
  id v7;

  controlSwitch = self->_controlSwitch;
  if (controlSwitch)
  {
    -[UISwitch removeFromSuperview](controlSwitch, "removeFromSuperview");
    -[UISwitch removeTarget:action:forControlEvents:](self->_controlSwitch, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  }
  v4 = objc_alloc(MEMORY[0x1E0CEAA38]);
  v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = self->_controlSwitch;
  self->_controlSwitch = v5;

  -[UISwitch setSwitchStyle:](self->_controlSwitch, "setSwitchStyle:", 1);
  -[CKDetailsChatOptionsCheckboxCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_controlSwitch);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKDetailsChatOptionsCheckboxCell;
  -[CKDetailsCell layoutSubviews](&v21, sel_layoutSubviews);
  -[CKDetailsChatOptionsCheckboxCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKDetailsChatOptionsCheckboxCell layoutMargins](self, "layoutMargins");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);

  -[CKDetailsChatOptionsCheckboxCell controlSwitch](self, "controlSwitch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13 + -2.0, v15, v17, v19);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDetailsChatOptionsCheckboxCell;
  -[CKDetailsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKDetailsChatOptionsCheckboxCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
}

- (void)setControlSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_controlSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlSwitch, 0);
}

@end
