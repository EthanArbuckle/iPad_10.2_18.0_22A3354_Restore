@implementation CKDetailsSharedWithYouCell

- (CKDetailsSharedWithYouCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsSharedWithYouCell *v4;
  CKDetailsSharedWithYouCell *v5;
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
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsSharedWithYouCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v31, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsSharedWithYouCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailsCellStaticTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v9);

    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineBreakMode:", 0);

    -[CKDetailsSharedWithYouCell _configureNewControlSwitch](v5, "_configureNewControlSwitch");
    v23 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSharedWithYouCell leadingAnchor](v5, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSharedWithYouCell trailingAnchor](v5, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v22;
    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSharedWithYouCell topAnchor](v5, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v15;
    -[CKDetailsSharedWithYouCell textLabel](v5, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSharedWithYouCell bottomAnchor](v5, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v20);

  }
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSharedWithYouCell_reuseIdentifier");
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
    -[CKDetailsSharedWithYouCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
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

  -[CKDetailsSharedWithYouCell controlSwitch](self, "controlSwitch");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSharedWithYouCell setAccessoryView:](self, "setAccessoryView:", v7);

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
  v3.super_class = (Class)CKDetailsSharedWithYouCell;
  -[CKDetailsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKDetailsSharedWithYouCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
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
