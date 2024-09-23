@implementation VPNTableCell

- (VPNTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  VPNTableCell *v5;
  VPNTableCell *v6;
  NSString *alert;
  NSString *subtitle;
  NSMutableString *v9;
  NSMutableString *detailText;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VPNTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, a5);
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

  }
  return v6;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v4 = (int)*MEMORY[0x24BE75770];
  if (*((_BYTE *)&self->super.super.super.super.super.isa + v4) != a3)
    *((_BYTE *)&self->super.super.super.super.super.isa + v4) = a3;
  -[PSTableCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v6);

  -[VPNTableCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v8);

  if (!setChecked__checkmark)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)setChecked__checkmark;
    setChecked__checkmark = v9;

  }
  -[PSTableCell setIcon:](self, "setIcon:");
  v11 = *((_BYTE *)&self->super.super.super.super.super.isa + v4) == 0;
  -[VPNTableCell imageView](self, "imageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)alert
{
  return self->_alert;
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
    -[NSMutableString setString:](self->_detailText, "setString:", self->_subtitle);
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
    v22.super_class = (Class)VPNTableCell;
    -[VPNTableCell detailTextLabel](&v22, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", self->_detailText);
    v21.receiver = self;
    v21.super_class = (Class)VPNTableCell;
    -[VPNTableCell detailTextLabel](&v21, sel_detailTextLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[VPNTableCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16 + -30.0;

    v20.receiver = self;
    v20.super_class = (Class)VPNTableCell;
    -[VPNTableCell detailTextLabel](&v20, sel_detailTextLabel);
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
      -[VPNTableCell updateDetail](self, "updateDetail");
      -[VPNTableCell setNeedsLayout](self, "setNeedsLayout");
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
  -[VPNTableCell updateDetail](self, "updateDetail");
  -[VPNTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VPNTableCell;
  -[PSTableCell titleLabel](&v5, sel_titleLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  v4.receiver = self;
  v4.super_class = (Class)VPNTableCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);

}

- (NSMutableString)detailText
{
  return (NSMutableString *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
