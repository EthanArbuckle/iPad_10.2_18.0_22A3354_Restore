@implementation VPNPrimaryTableCell

- (VPNPrimaryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  VPNPrimaryTableCell *v5;
  VPNPrimaryTableCell *v6;
  NSString *alert;
  NSString *subtitle;
  NSMutableString *v9;
  NSMutableString *detailText;
  UILabel *specialStatusLabel;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VPNPrimaryTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v13, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, a5);
  v6 = v5;
  if (v5)
  {
    alert = v5->_alert;
    v5->_alert = 0;

    subtitle = v6->_subtitle;
    v6->_subtitle = 0;

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    detailText = v6->_detailText;
    v6->_detailText = v9;

    specialStatusLabel = v6->_specialStatusLabel;
    v6->_specialStatusLabel = 0;

  }
  return v6;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)vpnPrimaryTableCellStatus
{
  return self->_vpnPrimaryTableCellStatus;
}

- (NSString)alert
{
  return self->_alert;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)updateDetail
{
  NSString *subtitle;
  NSString *v4;
  NSString *alert;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  -[NSMutableString setString:](self->_detailText, "setString:", &stru_24EE4DF70);
  subtitle = self->_subtitle;
  if (subtitle && !-[NSString isEqualToString:](subtitle, "isEqualToString:", &stru_24EE4DF70))
  {
    -[NSMutableString appendString:](self->_detailText, "appendString:", self->_subtitle);
    alert = self->_alert;
    if (alert && !-[NSString isEqualToString:](alert, "isEqualToString:", &stru_24EE4DF70))
    {
      -[NSMutableString appendString:](self->_detailText, "appendString:", CFSTR(" - "));
      -[NSMutableString appendString:](self->_detailText, "appendString:", self->_alert);
      goto LABEL_10;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_11;
  }
  v4 = self->_alert;
  if (!v4 || -[NSString isEqualToString:](v4, "isEqualToString:", &stru_24EE4DF70))
    goto LABEL_8;
  -[NSMutableString setString:](self->_detailText, "setString:", self->_alert);
LABEL_10:
  v6 = 1;
LABEL_11:
  if ((-[NSMutableString isEqualToString:](self->_detailText, "isEqualToString:", &stru_24EE4DF70) & 1) == 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)VPNPrimaryTableCell;
    -[VPNPrimaryTableCell detailTextLabel](&v22, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", self->_detailText);
    v21.receiver = self;
    v21.super_class = (Class)VPNPrimaryTableCell;
    -[VPNPrimaryTableCell detailTextLabel](&v21, sel_detailTextLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[VPNPrimaryTableCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16 + -30.0;

    v20.receiver = self;
    v20.super_class = (Class)VPNPrimaryTableCell;
    -[VPNPrimaryTableCell detailTextLabel](&v20, sel_detailTextLabel);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v17, v14);

    if (v6)
      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColor:", v19);

  }
}

- (void)setSubtitle:(id)a3
{
  id v5;
  BOOL v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = -[NSString isEqualToString:](self->_subtitle, "isEqualToString:", v5);
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_subtitle, a3);
      -[VPNPrimaryTableCell updateDetail](self, "updateDetail");
      -[VPNPrimaryTableCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (void)setVpnPrimaryTableCellStatus:(id)a3
{
  id v5;
  BOOL v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = -[NSString isEqualToString:](self->_vpnPrimaryTableCellStatus, "isEqualToString:", v5);
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_vpnPrimaryTableCellStatus, a3);
      -[VPNPrimaryTableCell updateDetail](self, "updateDetail");
      -[VPNPrimaryTableCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (void)setAlert:(id)a3
{
  id v4;
  NSString *alert;
  NSString *v6;
  id v7;

  v4 = a3;
  alert = self->_alert;
  v7 = v4;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (!-[NSString isEqualToString:](alert, "isEqualToString:", v4))
  {
    v6 = (NSString *)v7;
    alert = self->_alert;
LABEL_5:
    self->_alert = v6;

  }
  -[VPNPrimaryTableCell updateDetail](self, "updateDetail");
  -[VPNPrimaryTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[VPNPrimaryTableCell updateDetail](self, "updateDetail");
    -[VPNPrimaryTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)VPNPrimaryTableCell;
  -[PSTableCell titleLabel](&v43, sel_titleLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  if (-[VPNPrimaryTableCell disabled](self, "disabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  v42.receiver = self;
  v42.super_class = (Class)VPNPrimaryTableCell;
  -[PSTableCell layoutSubviews](&v42, sel_layoutSubviews);
  v5 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("vpn-status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VPNPrimaryTableCell specialStatusLabel](self, "specialStatusLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
      -[VPNPrimaryTableCell setSpecialStatusLabel:](self, "setSpecialStatusLabel:", v10);

      -[VPNPrimaryTableCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNPrimaryTableCell specialStatusLabel](self, "specialStatusLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

    }
    -[VPNPrimaryTableCell specialStatusLabel](self, "specialStatusLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNPrimaryTableCell vpnPrimaryTableCellStatus](self, "vpnPrimaryTableCellStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);

    objc_msgSend(v13, "setTextAlignment:", 2);
    objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColor:", v15);

    -[VPNPrimaryTableCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v17;
    -[VPNPrimaryTableCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    objc_msgSend(v13, "setFrame:", 0.0, 0.0, v18, v20);

    objc_msgSend(v13, "sizeToFit");
    -[VPNPrimaryTableCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;
    objc_msgSend(v13, "frame");
    v25 = v23 - v24;

    v26 = objc_loadWeakRetained(v5);
    v27 = objc_msgSend(v26, "cellType");

    if (v27 == 3)
    {
      v28 = objc_loadWeakRetained(v5);
      objc_msgSend(v28, "propertyForKey:", *MEMORY[0x24BE75850]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "intValue");

      if (!v30)
        v25 = v25 + -40.0;
    }
    objc_msgSend(v13, "frame");
    v32 = v31;
    -[VPNPrimaryTableCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "size");
    objc_msgSend(v13, "setFrame:", v25, 0.0, v32, v34);

    objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v3, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v3, "origin");
    objc_msgSend(v3, "setFrame:", v36, v38, v25 - v41, v40);

  }
}

- (UILabel)specialStatusLabel
{
  return self->_specialStatusLabel;
}

- (void)setSpecialStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_specialStatusLabel, a3);
}

- (NSMutableString)detailText
{
  return (NSMutableString *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_specialStatusLabel, 0);
  objc_storeStrong((id *)&self->_vpnPrimaryTableCellStatus, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
