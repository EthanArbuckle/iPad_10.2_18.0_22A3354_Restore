@implementation CPSPointsOfInterestPickerExtendedCell

- (CPSPointsOfInterestPickerExtendedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CPSPointsOfInterestPickerExtendedCell *v4;
  CPSPointsOfInterestPickerExtendedCell *v6;
  objc_super v7;
  id location[3];
  CPSPointsOfInterestPickerExtendedCell *v9;

  v9 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v9;
  v9 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)CPSPointsOfInterestPickerExtendedCell;
  v9 = -[CPSPointsOfInterestPickerCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, location[0]);
  objc_storeStrong((id *)&v9, v9);
  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setTitle:(id)a3
{
  id v3;
  UILabel *v4;
  id location[2];
  CPSPointsOfInterestPickerExtendedCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_title, location[0]);
  v3 = location[0];
  v4 = -[CPSPointsOfInterestPickerExtendedCell extendedTitleLabel](v6, "extendedTitleLabel");
  -[UILabel setText:](v4, "setText:", v3);

  objc_storeStrong(location, 0);
}

- (void)setSubtitle:(id)a3
{
  id v3;
  UILabel *v4;
  id location[2];
  CPSPointsOfInterestPickerExtendedCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_subtitle, location[0]);
  v3 = location[0];
  v4 = -[CPSPointsOfInterestPickerExtendedCell extendedSubtitleLabel](v6, "extendedSubtitleLabel");
  -[UILabel setText:](v4, "setText:", v3);

  objc_storeStrong(location, 0);
}

- (void)setText:(id)a3
{
  id v3;
  UILabel *v4;
  id location[2];
  CPSPointsOfInterestPickerExtendedCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_text, location[0]);
  v3 = location[0];
  v4 = -[CPSPointsOfInterestPickerExtendedCell extendedInformativeLabel](v6, "extendedInformativeLabel");
  -[UILabel setText:](v4, "setText:", v3);

  objc_storeStrong(location, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  UIEdgeInsetsMake_3();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setupViews
{
  id v2;
  uint64_t v3;
  UILabel *extendedTitleLabel;
  uint64_t v5;
  UILabel *extendedSubtitleLabel;
  uint64_t v7;
  UILabel *extendedInformativeLabel;
  id v9;
  id v10;
  double *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  UIFont *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  UIFont *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  UIFont *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60[2];
  CPSPointsOfInterestPickerExtendedCell *v61;
  _QWORD v62[14];

  v62[13] = *MEMORY[0x24BDAC8D0];
  v61 = self;
  v60[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BDF6B68]);
  v11 = (double *)MEMORY[0x24BDBF090];
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  extendedTitleLabel = v61->_extendedTitleLabel;
  v61->_extendedTitleLabel = (UILabel *)v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v61->_extendedTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = +[CPSEntityStyles pickerCellPrimaryFont](CPSEntityStyles, "pickerCellPrimaryFont");
  -[UILabel setFont:](v61->_extendedTitleLabel, "setFont:");

  -[CPSPointsOfInterestPickerExtendedCell addSubview:](v61, "addSubview:", v61->_extendedTitleLabel);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
  extendedSubtitleLabel = v61->_extendedSubtitleLabel;
  v61->_extendedSubtitleLabel = (UILabel *)v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v61->_extendedSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = +[CPSEntityStyles pickerCellSecondaryFont](CPSEntityStyles, "pickerCellSecondaryFont");
  -[UILabel setFont:](v61->_extendedSubtitleLabel, "setFont:");

  -[CPSPointsOfInterestPickerExtendedCell addSubview:](v61, "addSubview:", v61->_extendedSubtitleLabel);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
  extendedInformativeLabel = v61->_extendedInformativeLabel;
  v61->_extendedInformativeLabel = (UILabel *)v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v61->_extendedInformativeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = +[CPSEntityStyles pickerCellSecondaryFont](CPSEntityStyles, "pickerCellSecondaryFont");
  -[UILabel setFont:](v61->_extendedInformativeLabel, "setFont:");

  -[CPSPointsOfInterestPickerExtendedCell addSubview:](v61, "addSubview:", v61->_extendedInformativeLabel);
  v59 = (id)-[UILabel topAnchor](v61->_extendedTitleLabel, "topAnchor");
  v58 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v57 = (id)objc_msgSend(v58, "topAnchor");
  v56 = (id)objc_msgSend(v59, "constraintEqualToAnchor:");
  v62[0] = v56;
  v55 = (id)-[UILabel leadingAnchor](v61->_extendedTitleLabel, "leadingAnchor");
  v54 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v53 = (id)objc_msgSend(v54, "leadingAnchor");
  v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v62[1] = v52;
  v51 = (id)-[UILabel trailingAnchor](v61->_extendedTitleLabel, "trailingAnchor");
  v50 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v49 = (id)objc_msgSend(v50, "trailingAnchor");
  v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
  v62[2] = v48;
  v47 = (id)-[UILabel heightAnchor](v61->_extendedTitleLabel, "heightAnchor");
  v46 = -[UILabel font](v61->_extendedTitleLabel, "font");
  -[UIFont lineHeight](v46, "lineHeight");
  v45 = (id)objc_msgSend(v47, "constraintEqualToConstant:");
  v62[3] = v45;
  v44 = (id)-[UILabel topAnchor](v61->_extendedSubtitleLabel, "topAnchor");
  v43 = (id)-[UILabel bottomAnchor](v61->_extendedTitleLabel, "bottomAnchor");
  v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
  v62[4] = v42;
  v41 = (id)-[UILabel leadingAnchor](v61->_extendedSubtitleLabel, "leadingAnchor");
  v40 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v39 = (id)objc_msgSend(v40, "leadingAnchor");
  v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
  v62[5] = v38;
  v37 = (id)-[UILabel trailingAnchor](v61->_extendedSubtitleLabel, "trailingAnchor");
  v36 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v35 = (id)objc_msgSend(v36, "trailingAnchor");
  v34 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
  v62[6] = v34;
  v33 = (id)-[UILabel heightAnchor](v61->_extendedSubtitleLabel, "heightAnchor");
  v32 = -[UILabel font](v61->_extendedSubtitleLabel, "font");
  -[UIFont lineHeight](v32, "lineHeight");
  v31 = (id)objc_msgSend(v33, "constraintEqualToConstant:");
  v62[7] = v31;
  v30 = (id)-[UILabel topAnchor](v61->_extendedInformativeLabel, "topAnchor");
  v29 = (id)-[UILabel bottomAnchor](v61->_extendedSubtitleLabel, "bottomAnchor");
  v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v62[8] = v28;
  v27 = (id)-[UILabel leadingAnchor](v61->_extendedInformativeLabel, "leadingAnchor");
  v26 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v25 = (id)objc_msgSend(v26, "leadingAnchor");
  v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v62[9] = v24;
  v23 = (id)-[UILabel trailingAnchor](v61->_extendedInformativeLabel, "trailingAnchor");
  v22 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v21 = (id)objc_msgSend(v22, "trailingAnchor");
  v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v62[10] = v20;
  v19 = (id)-[UILabel heightAnchor](v61->_extendedInformativeLabel, "heightAnchor");
  v18 = -[UILabel font](v61->_extendedInformativeLabel, "font");
  -[UIFont lineHeight](v18, "lineHeight");
  v17 = (id)objc_msgSend(v19, "constraintEqualToConstant:");
  v62[11] = v17;
  v16 = (id)-[UILabel bottomAnchor](v61->_extendedInformativeLabel, "bottomAnchor");
  v15 = (id)-[CPSPointsOfInterestPickerExtendedCell safeAreaLayoutGuide](v61, "safeAreaLayoutGuide");
  v14 = (id)objc_msgSend(v15, "bottomAnchor");
  v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v62[12] = v13;
  v60[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 13);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v60[0]);
  objc_storeStrong(v60, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v3;
  id v4;
  char v5;
  id v6;
  char v7;
  char v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  CPSPointsOfInterestPickerExtendedCell *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSPointsOfInterestPickerExtendedCell;
  -[CPSPointsOfInterestPickerCell setHighlighted:](&v9, sel_setHighlighted_, a3);
  v8 = 1;
  if (!-[CPSPointsOfInterestPickerCell chosen](v12, "chosen"))
    v8 = v10;
  v6 = +[CPSEntityStyles pickerCellPrimaryFontColor:](CPSEntityStyles, "pickerCellPrimaryFontColor:", v8 & 1);
  -[UILabel setTextColor:](v12->_extendedTitleLabel, "setTextColor:");

  v7 = 1;
  if (!-[CPSPointsOfInterestPickerCell chosen](v12, "chosen"))
    v7 = v10;
  v4 = +[CPSEntityStyles pickerCellSecondaryFontColor:](CPSEntityStyles, "pickerCellSecondaryFontColor:", v7 & 1);
  -[UILabel setTextColor:](v12->_extendedSubtitleLabel, "setTextColor:");

  v5 = 1;
  if (!-[CPSPointsOfInterestPickerCell chosen](v12, "chosen"))
    v5 = v10;
  v3 = +[CPSEntityStyles pickerCellSecondaryFontColor:](CPSEntityStyles, "pickerCellSecondaryFontColor:", v5 & 1);
  -[UILabel setTextColor:](v12->_extendedInformativeLabel, "setTextColor:");

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)extendedTitleLabel
{
  return self->_extendedTitleLabel;
}

- (void)setExtendedTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_extendedTitleLabel, a3);
}

- (UILabel)extendedSubtitleLabel
{
  return self->_extendedSubtitleLabel;
}

- (void)setExtendedSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_extendedSubtitleLabel, a3);
}

- (UILabel)extendedInformativeLabel
{
  return self->_extendedInformativeLabel;
}

- (void)setExtendedInformativeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_extendedInformativeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedInformativeLabel, 0);
  objc_storeStrong((id *)&self->_extendedSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_extendedTitleLabel, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
