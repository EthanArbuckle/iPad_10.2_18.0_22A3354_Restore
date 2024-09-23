@implementation ICDocCamSaveButton

- (ICDocCamSaveButton)initWithFrame:(CGRect)a3
{
  ICDocCamSaveButton *v3;
  ICDocCamSaveButton *v4;
  UILabel *v5;
  UILabel *countLabel;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  UILabel *saveLabel;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)ICDocCamSaveButton;
  v3 = -[ICDocCamSaveButton initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_documentCount = 0;
    v3->_maxWidthForPortraitIPhone = 0x7FFFFFFFLL;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    countLabel = v4->_countLabel;
    v4->_countLabel = v5;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_countLabel, "setBackgroundColor:", v7);

    v8 = v4->_countLabel;
    -[ICDocCamSaveButton saveButtonCountStringForDocumentCount:](v4, "saveButtonCountStringForDocumentCount:", v4->_documentCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8, "setText:", v9);

    -[UILabel sizeToFit](v4->_countLabel, "sizeToFit");
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    saveLabel = v4->_saveLabel;
    v4->_saveLabel = v10;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_saveLabel, "setBackgroundColor:", v12);

    v13 = v4->_saveLabel;
    -[ICDocCamSaveButton saveButtonTitleForDocumentCount:](v4, "saveButtonTitleForDocumentCount:", v4->_documentCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13, "setText:", v14);

    if ((DCDebugInterfaceEnabled() & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "userInterfaceIdiom"),
          v15,
          v16 == 1))
    {
      v17 = (void *)MEMORY[0x24BDF6A70];
      v18 = (double *)MEMORY[0x24BDF7890];
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDF6A70];
      v18 = (double *)MEMORY[0x24BDF7888];
    }
    v19 = *v18;
    objc_msgSend(v17, "systemFontOfSize:weight:", 17.0, *v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_saveLabel, "setFont:", v20);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_countLabel, "setFont:", v21);

    -[UILabel setLineBreakMode:](v4->_saveLabel, "setLineBreakMode:", 4);
    -[ICDocCamSaveButton layer](v4, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 14.0);

    -[ICDocCamSaveButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamSaveButton setBackgroundColor:](v4, "setBackgroundColor:", v23);

    -[ICDocCamSaveButton heightAnchor](v4, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 28.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_countLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICDocCamSaveButton addSubview:](v4, "addSubview:", v4->_countLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_saveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICDocCamSaveButton addSubview:](v4, "addSubview:", v4->_saveLabel);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamSaveButton countLabel](v4, "countLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v26);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamSaveButton saveLabel](v4, "saveLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v28);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;

  -[ICDocCamSaveButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
    v8 = 1;
  else
    v8 = (unint64_t)(v5 - 1) > 1;
  if (v8)
    v9 = 2147483650.0;
  else
    v9 = (double)-[ICDocCamSaveButton maxWidthForPortraitIPhone](self, "maxWidthForPortraitIPhone");
  if (-[ICDocCamSaveButton documentCount](self, "documentCount") >= 2)
    v10 = 3.0;
  else
    v10 = 0.0;
  if (-[ICDocCamSaveButton documentCount](self, "documentCount") >= 2)
    v11 = 12.0;
  else
    v11 = 18.0;
  v12 = *MEMORY[0x24BDF7888];
  v13 = 17;
  while (1)
  {
    v14 = v13;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", (double)v13, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamSaveButton saveLabel](self, "saveLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v15);

      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", (double)v14, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamSaveButton countLabel](self, "countLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v17);

    }
    -[ICDocCamSaveButton countLabel](self, "countLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeToFit");

    -[ICDocCamSaveButton saveLabel](self, "saveLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeToFit");

    -[ICDocCamSaveButton countLabel](self, "countLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;

    -[ICDocCamSaveButton saveLabel](self, "saveLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;

    v27 = v10 + v23 + v26 + v11 * 2.0;
    if (v27 <= v9)
      break;
    if (v14 <= 15)
      v10 = 0.0;
    v13 = v14 - 1;
    if ((v14 - 1) <= 0xE)
    {
      v28 = v27 - v9;
      if (v14 > 15)
        v28 = 0.0;
      v26 = v26 - v28;
      break;
    }
  }
  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deactivateConstraints:", v31);

    -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeAllObjects");
  }
  else
  {
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICDocCamSaveButton setLayoutConstraints:](self, "setLayoutConstraints:", v32);
  }

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton countLabel](self, "countLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton trailingAnchor](self, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v37);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton countLabel](self, "countLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v41);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton countLabel](self, "countLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton centerYAnchor](self, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v46);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton saveLabel](self, "saveLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton countLabel](self, "countLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, -v10);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v52);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton saveLabel](self, "saveLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToConstant:", v26);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObject:", v56);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton saveLabel](self, "saveLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "centerYAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton centerYAnchor](self, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObject:", v61);

  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton widthAnchor](self, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToConstant:", v10 + v26 + v23 + v11 * 2.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v64);

  v65 = (void *)MEMORY[0x24BDD1628];
  -[ICDocCamSaveButton layoutConstraints](self, "layoutConstraints");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "activateConstraints:", v66);

}

- (void)setDocumentCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  self->_documentCount = a3;
  -[ICDocCamSaveButton saveButtonTitleForDocumentCount:](self, "saveButtonTitleForDocumentCount:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton saveLabel](self, "saveLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ICDocCamSaveButton saveButtonCountStringForDocumentCount:](self, "saveButtonCountStringForDocumentCount:", self->_documentCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSaveButton countLabel](self, "countLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[ICDocCamSaveButton setNeedsLayout](self, "setNeedsLayout");
  -[ICDocCamSaveButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)saveButtonTitleForDocumentCount:(unint64_t)a3
{
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)saveButtonCountStringForDocumentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  if (a3 < 2)
  {
    v6 = &stru_24C5B9710;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("SAVE_%lu_SCANNED_IMAGES_COUNT"), CFSTR("SAVE_%lu_SCANNED_IMAGES_COUNT"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("%lu scans"), CFSTR("%lu scans"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v4, -[ICDocCamSaveButton documentCount](self, "documentCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __DCAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[ICDocCamSaveButton accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double tap to save this document."), CFSTR("Double tap to save this document."), CFSTR("Localizable"));
}

- (int64_t)documentCount
{
  return self->_documentCount;
}

- (int64_t)maxWidthForPortraitIPhone
{
  return self->_maxWidthForPortraitIPhone;
}

- (void)setMaxWidthForPortraitIPhone:(int64_t)a3
{
  self->_maxWidthForPortraitIPhone = a3;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (UILabel)saveLabel
{
  return self->_saveLabel;
}

- (void)setSaveLabel:(id)a3
{
  objc_storeStrong((id *)&self->_saveLabel, a3);
}

- (NSMutableArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_saveLabel, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end
