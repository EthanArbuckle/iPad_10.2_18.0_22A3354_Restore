@implementation CKDetailsChatOptionsCell

- (CKDetailsChatOptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsChatOptionsCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)CKDetailsChatOptionsCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsCellStaticTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineBreakMode:", 0);

    -[CKDetailsChatOptionsCell _configureNewControlSwitch](v4, "_configureNewControlSwitch");
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCell leadingAnchor](v4, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCell trailingAnchor](v4, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v21;
    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCell topAnchor](v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v14;
    -[CKDetailsChatOptionsCell textLabel](v4, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChatOptionsCell bottomAnchor](v4, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v19);

  }
  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsChatOptionsCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (UISwitch)controlSwitch
{
  UISwitch *controlSwitch;

  controlSwitch = self->_controlSwitch;
  if (!controlSwitch)
  {
    -[CKDetailsChatOptionsCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
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

  -[CKDetailsChatOptionsCell controlSwitch](self, "controlSwitch");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKDetailsChatOptionsCell setAccessoryView:](self, "setAccessoryView:", v7);

}

+ (double)preferredHeight
{
  return *MEMORY[0x1E0CEBC10];
}

+ (double)estimatedHeight
{
  return 44.0;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDetailsChatOptionsCell;
  -[CKDetailsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKDetailsChatOptionsCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
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
