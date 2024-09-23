@implementation FBKDevicePairingCell

- (double)spaceFromSuperViewToLabel
{
  void *v2;
  double v3;
  double v4;

  -[FBKDevicePairingCell mainLabel](self, "mainLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

+ (double)estimatedRowHeight
{
  return 181.0;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FBKDevicePairingCell;
  -[FBKDevicePairingCell awakeFromNib](&v12, sel_awakeFromNib);
  -[FBKDevicePairingCell mainLabel](self, "mainLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24E15EAF8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDevicePairingCell mainLabel](self, "mainLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[FBKDevicePairingCell subLabel](self, "subLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_24E15EAF8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDevicePairingCell subLabel](self, "subLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  -[FBKDevicePairingCell deviceImage](self, "deviceImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", 0);

  -[FBKDevicePairingCell activityIndicator](self, "activityIndicator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopAnimating");

  -[FBKDevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  -[FBKDevicePairingCell setDetailLabelTrailingConstraintInitial:](self, "setDetailLabelTrailingConstraintInitial:");

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKDevicePairingCell;
  -[FBKDevicePairingCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5
{
  -[FBKDevicePairingCell updateWithDevice:showsDetail:showsTransport:isSelected:](self, "updateWithDevice:showsDetail:showsTransport:isSelected:", a3, a4, a5, 0);
}

- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5 isSelected:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  NSString *v40;
  _BOOL4 IsAccessibilityCategory;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_msgSend(v10, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDevicePairingCell detailLabel](self, "detailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", &stru_24E15EAF8);

  -[FBKDevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

  if (objc_msgSend(v10, "isCurrentDevice"))
  {
    objc_msgSend(v10, "deviceClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "containsString:", CFSTR("iphone")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("This iPhone");
    }
    else if (objc_msgSend(v15, "containsString:", CFSTR("ipad")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("This iPad");
    }
    else if (objc_msgSend(v15, "containsString:", CFSTR("ipod")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("This iPod");
    }
    else
    {
      v20 = objc_msgSend(v15, "containsString:", CFSTR("mac"));
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v20)
      {
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("THIS_DEVICE_FORMAT"), CFSTR("This %@"), 0);
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "deviceClass");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v49;
        v17 = (void *)v48;
        objc_msgSend(v51, "stringWithFormat:", v48, v50);
        v21 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v50;
        goto LABEL_15;
      }
      v18 = CFSTR("This Mac");
    }
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, v18, 0);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v19);

    v11 = (void *)v21;
    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "isVisibleToDED") & 1) != 0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v15 != 0);
LABEL_16:

  objc_msgSend(v10, "displayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDevicePairingCell mainLabel](self, "mainLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  -[FBKDevicePairingCell subLabel](self, "subLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v11);

  if (!v6)
  {
    if (v8)
    {
      if (objc_msgSend(v10, "isCurrentDevice") && !v7)
        goto LABEL_22;
    }
    else if (!v7)
    {
LABEL_22:
      -[FBKDevicePairingCell setAccessoryType:](self, "setAccessoryType:", 0);
      -[FBKDevicePairingCell detailLabelTrailingConstraintInitial](self, "detailLabelTrailingConstraintInitial");
      v27 = v26;
      -[FBKDevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = v27;
      goto LABEL_25;
    }
    -[FBKDevicePairingCell setAccessoryType:](self, "setAccessoryType:", 4);
    -[FBKDevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = 0.0;
LABEL_25:
    objc_msgSend(v28, "setConstant:", v30);

    if (!v7)
      goto LABEL_27;
    goto LABEL_26;
  }
  -[FBKDevicePairingCell setAccessoryType:](self, "setAccessoryType:", 3);
  if (v7)
  {
LABEL_26:
    v31 = (void *)MEMORY[0x24BDD17C8];
    -[FBKDevicePairingCell mainLabel](self, "mainLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transportsForDisplay");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ (%@)"), v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDevicePairingCell subLabel](self, "subLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scale");
  *(float *)&v38 = v38;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __79__FBKDevicePairingCell_updateWithDevice_showsDetail_showsTransport_isSelected___block_invoke;
  v52[3] = &unk_24E157E88;
  v52[4] = self;
  objc_msgSend(v10, "fetchIconImageDataForScale:completionCompletion:", v52, v38);

  -[FBKDevicePairingCell traitCollection](self, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "preferredContentSizeCategory");
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v40);

  -[FBKDevicePairingCell subLabel](self, "subLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v42, "setNumberOfLines:", 0);

    -[FBKDevicePairingCell mainLabel](self, "mainLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    v46 = 0;
  }
  else
  {
    objc_msgSend(v42, "setNumberOfLines:", 1);

    -[FBKDevicePairingCell mainLabel](self, "mainLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    v46 = 1;
  }
  objc_msgSend(v44, "setNumberOfLines:", v46);

  -[FBKDevicePairingCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setNeedsDisplay");

}

uint64_t __79__FBKDevicePairingCell_updateWithDevice_showsDetail_showsTransport_isSelected___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "deviceImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v3);

    return objc_msgSend(*(id *)(v2 + 32), "setNeedsDisplay");
  }
  return result;
}

- (UIImageView)deviceImage
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_deviceImage);
}

- (void)setDeviceImage:(id)a3
{
  objc_storeWeak((id *)&self->_deviceImage, a3);
}

- (UILabel)mainLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_mainLabel);
}

- (void)setMainLabel:(id)a3
{
  objc_storeWeak((id *)&self->_mainLabel, a3);
}

- (UILabel)detailLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_detailLabel);
}

- (void)setDetailLabel:(id)a3
{
  objc_storeWeak((id *)&self->_detailLabel, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_statusIndicatorImageView);
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeWeak((id *)&self->_statusIndicatorImageView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_activityIndicator);
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeWeak((id *)&self->_activityIndicator, a3);
}

- (NSLayoutConstraint)detailLabelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_detailLabelTrailingConstraint);
}

- (void)setDetailLabelTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_detailLabelTrailingConstraint, a3);
}

- (double)detailLabelTrailingConstraintInitial
{
  return self->_detailLabelTrailingConstraintInitial;
}

- (void)setDetailLabelTrailingConstraintInitial:(double)a3
{
  self->_detailLabelTrailingConstraintInitial = a3;
}

- (UILabel)subLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subLabel);
}

- (void)setSubLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subLabel);
  objc_destroyWeak((id *)&self->_detailLabelTrailingConstraint);
  objc_destroyWeak((id *)&self->_activityIndicator);
  objc_destroyWeak((id *)&self->_statusIndicatorImageView);
  objc_destroyWeak((id *)&self->_detailLabel);
  objc_destroyWeak((id *)&self->_mainLabel);
  objc_destroyWeak((id *)&self->_deviceImage);
}

@end
