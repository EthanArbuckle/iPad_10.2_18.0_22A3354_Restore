@implementation FBADevicePairingCell

- (double)spaceFromSuperViewToLabel
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
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
  v12.super_class = (Class)FBADevicePairingCell;
  -[FBADevicePairingCell awakeFromNib](&v12, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
  objc_msgSend(v3, "setText:", &stru_1000EA660);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell subLabel](self, "subLabel"));
  objc_msgSend(v6, "setText:", &stru_1000EA660);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell subLabel](self, "subLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell deviceImage](self, "deviceImage"));
  objc_msgSend(v9, "setImage:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v10, "stopAnimating");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint"));
  objc_msgSend(v11, "constant");
  -[FBADevicePairingCell setDetailLabelTrailingConstraintInitial:](self, "setDetailLabelTrailingConstraintInitial:");

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBADevicePairingCell;
  -[FBADevicePairingCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
}

- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5
{
  -[FBADevicePairingCell updateWithDevice:showsDetail:showsTransport:isSelected:](self, "updateWithDevice:showsDetail:showsTransport:isSelected:", a3, a4, a5, 0);
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
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  NSString *v47;
  _BOOL4 IsAccessibilityCategory;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell detailLabel](self, "detailLabel"));
  objc_msgSend(v12, "setText:", &stru_1000EA660);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView"));
  objc_msgSend(v13, "setHidden:", 0);

  if (objc_msgSend(v10, "isCurrentDevice"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
    v16 = objc_msgSend(v15, "containsString:", CFSTR("iphone"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("This iPhone");
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
      v22 = objc_msgSend(v21, "containsString:", CFSTR("ipad"));

      if (v22)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = v17;
        v19 = CFSTR("This iPad");
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
        v26 = objc_msgSend(v25, "containsString:", CFSTR("ipod"));

        if (v26)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = v17;
          v19 = CFSTR("This iPod");
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
          v28 = objc_msgSend(v27, "containsString:", CFSTR("mac"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = v17;
          if (!v28)
          {
            v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("THIS_DEVICE_FORMAT"), CFSTR("This %@"), 0));

            v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceClass"));
            v18 = (void *)v55;
            v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v55, v56));

            v11 = (void *)v56;
            goto LABEL_15;
          }
          v19 = CFSTR("This Mac");
        }
      }
    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, v19, 0));
LABEL_15:

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v30, "setTintColor:", v24);

    v11 = (void *)v29;
    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "isVisibleToDED") & 1) != 0)
    v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  else
    v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v14 = (void *)v20;
  v23 = v20 != 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell statusIndicatorImageView](self, "statusIndicatorImageView"));
  objc_msgSend(v24, "setHidden:", v23);
LABEL_16:

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
  objc_msgSend(v32, "setText:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell subLabel](self, "subLabel"));
  objc_msgSend(v33, "setText:", v11);

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
      -[FBADevicePairingCell setAccessoryType:](self, "setAccessoryType:", 0);
      -[FBADevicePairingCell detailLabelTrailingConstraintInitial](self, "detailLabelTrailingConstraintInitial");
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint"));
      v37 = v36;
      v38 = v35;
      goto LABEL_25;
    }
    -[FBADevicePairingCell setAccessoryType:](self, "setAccessoryType:", 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell detailLabelTrailingConstraint](self, "detailLabelTrailingConstraint"));
    v37 = v36;
    v38 = 0.0;
LABEL_25:
    objc_msgSend(v36, "setConstant:", v38);

    if (!v7)
      goto LABEL_27;
    goto LABEL_26;
  }
  -[FBADevicePairingCell setAccessoryType:](self, "setAccessoryType:", 3);
  if (v7)
  {
LABEL_26:
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "text"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transportsForDisplay"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v40, v41));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell subLabel](self, "subLabel"));
    objc_msgSend(v43, "setText:", v42);

  }
LABEL_27:
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v44, "scale");
  *(float *)&v45 = v45;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100033280;
  v57[3] = &unk_1000E7040;
  v57[4] = self;
  objc_msgSend(v10, "fetchIconImageDataForScale:completionCompletion:", v57, v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell traitCollection](self, "traitCollection"));
  v47 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell subLabel](self, "subLabel"));
  v50 = v49;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v49, "setNumberOfLines:", 0);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
    v52 = v51;
    v53 = 0;
  }
  else
  {
    objc_msgSend(v49, "setNumberOfLines:", 1);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell mainLabel](self, "mainLabel"));
    v52 = v51;
    v53 = 1;
  }
  objc_msgSend(v51, "setNumberOfLines:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingCell contentView](self, "contentView"));
  objc_msgSend(v54, "setNeedsDisplay");

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
