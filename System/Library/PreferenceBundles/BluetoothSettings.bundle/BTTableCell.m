@implementation BTTableCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSString *v53;
  BOOL IsAccessibilityCategory;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  objc_super v82;
  uint64_t v83;
  _QWORD v84[2];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v84[1] = *MEMORY[0x24BDAC8D0];
  v82.receiver = self;
  v82.super_class = (Class)BTTableCell;
  -[PSTableCell layoutSubviews](&v82, sel_layoutSubviews);
  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = 0.0;
  if (-[BTTableCell state](self, "state") <= 2)
  {
    -[BTTableCell layoutMargins](self, "layoutMargins");
    v12 = v13;
  }
  v14 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection");
  if (-[BTTableCell state](self, "state") == 1 || -[BTTableCell state](self, "state") == 4)
  {
    -[PSTableCell valueLabel](self, "valueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.0);

    -[BTTableCell spinner](self, "spinner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;

    v21 = v12;
    if (!v14)
    {
      -[BTTableCell contentView](self, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v21 = v23 - v18 - v12;

    }
    -[BTTableCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = floor((v25 - v20) * 0.5);

    v85.origin.x = v21;
    v85.origin.y = v26;
    v85.size.width = v18;
    v85.size.height = v20;
    v86 = CGRectIntegral(v85);
    x = v86.origin.x;
    y = v86.origin.y;
    width = v86.size.width;
    height = v86.size.height;
    -[BTTableCell spinner](self, "spinner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", x, y, width, height);

    -[BTTableCell spinner](self, "spinner");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "startAnimating");

    -[BTTableCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34 - v18;
    -[BTTableCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMargins");
    v9 = v35 - v37 - v12 + -12.0;
  }
  else
  {
    -[BTTableCell spinner](self, "spinner");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stopAnimating");

    -[PSTableCell valueLabel](self, "valueLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setAlpha:", 1.0);

    -[BTTableCell traitCollection](self, "traitCollection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "preferredContentSizeCategory");
    v53 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v53);

    if (IsAccessibilityCategory)
      goto LABEL_12;
    -[PSTableCell valueLabel](self, "valueLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "text");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTTableCell contentView](self, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bounds");
    v59 = v58;
    v61 = v60;
    v83 = *MEMORY[0x24BEBB360];
    -[PSTableCell valueLabel](self, "valueLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "font");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v63;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "boundingRectWithSize:options:attributes:context:", 0, v64, 0, v59, v61);
    v66 = v65;
    v68 = v67;

    v69 = ceil(v66);
    v70 = ceil(v68);
    v71 = v12;
    if (!v14)
    {
      -[BTTableCell contentView](self, "contentView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "frame");
      v71 = v73 - v69 - v12;

    }
    v89.origin.x = v71;
    v89.origin.y = v7;
    v89.size.width = v69;
    v89.size.height = v70;
    v90 = CGRectIntegral(v89);
    v74 = v90.origin.x;
    v75 = v90.origin.y;
    v76 = v90.size.width;
    v77 = v90.size.height;
    -[PSTableCell valueLabel](self, "valueLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFrame:", v74, v75, v76, v77);

    -[BTTableCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v80 = v79 - v69;
    -[BTTableCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMargins");
    v9 = floor(v80 - v81 - v12 + -12.0);
  }

  -[BTTableCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v14)
  {
    objc_msgSend(v38, "size");
    v41 = v40 - v9;
    -[BTTableCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMargins");
    v5 = v41 - v43;

  }
  else
  {
    objc_msgSend(v38, "layoutMargins");
    v5 = v44;
  }

LABEL_12:
  v87.origin.x = v5;
  v87.origin.y = v7;
  v87.size.width = v9;
  v87.size.height = v11;
  v88 = CGRectIntegral(v87);
  v45 = v88.origin.x;
  v46 = v88.origin.y;
  v47 = v88.size.width;
  v48 = v88.size.height;
  -[PSTableCell titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v45, v46, v47, v48);

}

- (int)state
{
  return self->_state;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (BTTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  BTTableCell *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BTTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, 1, a4, a5);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    -[UIActivityIndicatorView setHidesWhenStopped:](v5->_spinner, "setHidesWhenStopped:", 1);
    -[BTTableCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_spinner);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)BTTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)setDeviceState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  BTTableCell *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  -[BTTableCell setState:](self, "setState:", *(_QWORD *)&a3);
  switch(-[BTTableCell state](self, "state"))
  {
    case 0:
    case 1:
      -[PSTableCell valueLabel](self, "valueLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", 0);
      goto LABEL_5;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAIRED_AND_CONNECTED"), &stru_24FCCE738, CFSTR("Devices"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell valueLabel](self, "valueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

LABEL_5:
      v10 = self;
      v11 = 0;
      goto LABEL_8;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PAIRED");
      goto LABEL_7;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PAIRED_AND_CONNECTED");
LABEL_7:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24FCCE738, CFSTR("Devices"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell valueLabel](self, "valueLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      v10 = self;
      v11 = 4;
LABEL_8:
      -[BTTableCell setAccessoryType:](v10, "setAccessoryType:", v11);
      return;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("PAIRED");
      goto LABEL_11;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("PAIRED_AND_CONNECTED");
LABEL_11:
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24FCCE738, CFSTR("Devices"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell valueLabel](self, "valueLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      -[BTTableCell setAccessoryType:](self, "setAccessoryType:", 4);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[BTTableCell setTintColor:](self, "setTintColor:", v19);

      break;
    default:
      return;
  }
}

- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4 andPendingSetup:(BOOL)a5
{
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  if (a4)
    v6 = 5;
  else
    v6 = 3;
  if (a3)
    v5 = v6;
  if (a4)
    v7 = 7;
  else
    v7 = 6;
  if (a5)
    v8 = v7;
  else
    v8 = v5;
  -[BTTableCell setDeviceState:](self, "setDeviceState:", v8);
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)hasLimitedConnectivity
{
  return self->_hasLimitedConnectivity;
}

- (void)setHasLimitedConnectivity:(BOOL)a3
{
  self->_hasLimitedConnectivity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
