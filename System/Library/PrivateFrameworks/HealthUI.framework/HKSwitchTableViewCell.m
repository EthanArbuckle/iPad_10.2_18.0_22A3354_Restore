@implementation HKSwitchTableViewCell

- (HKSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKSwitchTableViewCell *v4;
  HKSwitchTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSwitchTableViewCell;
  v4 = -[HKSwitchTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    -[HKSwitchTableViewCell _setupUI](v4, "_setupUI");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__contextSizeCategoryChanged, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKSwitchTableViewCell;
  -[HKSwitchTableViewCell dealloc](&v4, sel_dealloc);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  void *v2;
  char v3;

  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontSizeToFitWidth");

  return v3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", v3);

}

- (id)_displayLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *countLabel;
  void *v11;
  void *v12;
  UISwitch *v13;
  UISwitch *v14;
  id v15;

  -[HKSwitchTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[HKSwitchTableViewCell _displayLabelFont](self, "_displayLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1057803469;
  objc_msgSend(v5, "_setHyphenationFactor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  countLabel = self->_countLabel;
  self->_countLabel = v9;

  -[HKSwitchTableViewCell _displayLabelFont](self, "_displayLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_countLabel, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_countLabel, "setTextColor:", v12);

  -[UILabel setTextAlignment:](self->_countLabel, "setTextAlignment:", 2);
  v13 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
  v14 = self->_switch;
  self->_switch = v13;

  -[UISwitch addTarget:action:forControlEvents:](self->_switch, "addTarget:action:forControlEvents:", self, sel_switchValueChanged_, 4096);
  -[UISwitch setEnabled:](self->_switch, "setEnabled:", self->_enabled);
  -[HKSwitchTableViewCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_countLabel);
  objc_msgSend(v15, "addSubview:", self->_switch);

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  -[HKSwitchTableViewCell _displayLabelFont](self, "_displayLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[HKSwitchTableViewCell _displayLabelFont](self, "_displayLabelFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_countLabel, "setFont:", v5);

}

- (void)_contextSizeCategoryChanged
{
  void *v3;

  -[HKSwitchTableViewCell _displayLabelFont](self, "_displayLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_countLabel, "setFont:", v3);

  -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  self->_enabled = a3;
  -[UISwitch setEnabled:](self->_switch, "setEnabled:");
  if (self->_enabled)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)setShouldHideSwitch:(BOOL)a3
{
  self->_shouldHideSwitch = a3;
  -[UISwitch setHidden:](self->_switch, "setHidden:");
}

- (CGSize)iconSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[HKSwitchTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKSwitchTableViewCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  objc_super v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)HKSwitchTableViewCell;
  -[HKSwitchTableViewCell sizeThatFits:](&v17, sel_sizeThatFits_);
  v7 = v6;
  v9 = v8;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    v10 = v9 + 5.0;
    -[UISwitch frame](self->_switch, "frame");
    v12 = v11;
    -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", width, height);
    if (v12 >= v13)
      v14 = v12;
    else
      v14 = v13;
    v9 = v10 + v14;
  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  int IsUsingAccessibilityContentSizeCategory;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinX;
  double MaxX;
  void *v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  CGFloat v108;
  double rect;
  double recta;
  double v111;
  CGFloat v112;
  double v113;
  objc_super v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  v114.receiver = self;
  v114.super_class = (Class)HKSwitchTableViewCell;
  -[HKSwitchTableViewCell layoutSubviews](&v114, sel_layoutSubviews);
  -[HKSwitchTableViewCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v111 = v7;
  v9 = v8;
  -[HKSwitchTableViewCell separatorInset](self, "separatorInset");
  v94 = v10;
  -[HKSwitchTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v6 + v13;
  rect = v4 + v15;
  v21 = v17 - (v6 + v9);
  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  -[UISwitch sizeToFit](self->_switch, "sizeToFit");
  -[UISwitch frame](self->_switch, "frame");
  v102 = v17;
  UIRectCenteredYInRect();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = -[HKSwitchTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v104 = v26;
  v106 = v30;
  v107 = v28;
  v95 = v21;
  v97 = v20;
  v98 = v19 - (v4 + v111);
  v32 = v20;
  v33 = rect;
  v34 = v21;
  v35 = v98;
  if (IsUsingAccessibilityContentSizeCategory == v31)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v32);
    v115.origin.x = v24;
    v115.origin.y = v26;
    v115.size.width = v28;
    v115.size.height = v30;
    MinX = MaxX - CGRectGetWidth(v115);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v32);
  }
  v112 = MinX;
  -[UILabel sizeToFit](self->_countLabel, "sizeToFit");
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  UIRectCenteredYInRect();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  -[UILabel frame](self->_countLabel, "frame");
  UIRectCenteredYInRect();
  v100 = v48;
  v101 = v47;
  v108 = v46;
  v96 = v49;
  if ((-[HKSwitchTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    v51 = rect;
    v50 = v112;
    v52 = v112;
    v53 = v104;
    v54 = v42;
    v55 = v44;
    if ((IsUsingAccessibilityContentSizeCategory & 1) == 0)
    {
      v116.origin.x = v112;
      v116.origin.y = v104;
      v116.size.height = v106;
      v116.size.width = v107;
      v40 = CGRectGetMaxX(v116) + 5.0;
      v55 = v102 - v40 - v94;
      v52 = v94;
    }
  }
  else
  {
    v53 = v104;
    if ((IsUsingAccessibilityContentSizeCategory & 1) != 0)
    {
      v52 = v40;
      v51 = rect;
      v50 = v112;
      v54 = v42;
      v55 = v44;
    }
    else
    {
      v117.origin.x = v112;
      v117.origin.y = v104;
      v117.size.height = v106;
      v117.size.width = v107;
      v56 = CGRectGetMinX(v117);
      v118.origin.x = v40;
      v54 = v42;
      v118.origin.y = v42;
      v118.size.width = v44;
      v118.size.height = v108;
      v57 = v56 - CGRectGetMinX(v118);
      v50 = v112;
      v55 = v57 + -5.0;
      v119.origin.x = v20;
      v119.size.height = v98;
      v51 = rect;
      v119.origin.y = rect;
      v119.size.width = v95;
      v52 = CGRectGetMaxX(v119) + 5.0;
    }
  }
  v99 = v52;
  v113 = v50;
  -[HKSwitchTableViewCell imageView](self, "imageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v60 = v59;
  recta = v61;
  v63 = v62;
  v65 = v64;

  -[HKSwitchTableViewCell imageView](self, "imageView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "image");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v65;
  if (v67)
  {
    if ((-[HKSwitchTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      v68 = v54;
      v69 = v97;
      v70 = v98;
      v71 = v40;
      if (self->_centersIcon)
      {
        v120.origin.x = v40;
        v120.origin.y = v68;
        v120.size.width = v55;
        v120.size.height = v108;
        v72 = CGRectGetMaxX(v120);
        v121.origin.x = v60;
        v121.origin.y = recta;
        v121.size.width = v63;
        v121.size.height = v65;
        v60 = v72 + CGRectGetWidth(v121) * 0.5;
      }
      else
      {
        v77 = v51;
        v78 = v95;
        v79 = CGRectGetMaxX(*(CGRect *)&v69);
        v124.origin.x = v60;
        v124.origin.y = recta;
        v124.size.width = v63;
        v124.size.height = v65;
        v60 = v79 - CGRectGetWidth(v124);
      }
      v73 = v104;
    }
    else
    {
      v73 = v53;
      v68 = v54;
      v74 = v97;
      v75 = v98;
      v71 = v40;
      if (self->_centersIcon)
      {
        v122.origin.x = v40;
        v122.origin.y = v68;
        v122.size.width = v55;
        v122.size.height = v108;
        v76 = CGRectGetMinX(v122);
        v123.origin.x = v60;
        v123.origin.y = recta;
        v123.size.width = v63;
        v123.size.height = v103;
        v73 = v104;
        v60 = (v76 - CGRectGetWidth(v123)) * 0.5 + 0.0;
      }
      else
      {
        v80 = v51;
        v81 = v95;
        v60 = CGRectGetMinX(*(CGRect *)&v74);
      }
    }
  }
  else
  {
    v73 = v53;
    v68 = v54;
    v71 = v40;
  }
  v82 = v60;
  v105 = v63;
  if ((IsUsingAccessibilityContentSizeCategory & 1) != 0)
  {
    -[UISwitch frame](self->_switch, "frame");
    v84 = v83;
    -[UILabel frame](self->_countLabel, "frame");
    if (v84 >= v85)
      v86 = v84;
    else
      v86 = v85;
    v87 = (v86 + 5.0) * 0.5;
    v88 = recta - v87;
    v68 = v68 - v87;
    v125.origin.x = v71;
    v125.origin.y = v68;
    v125.size.width = v55;
    v89 = v55;
    v90 = v108;
    v125.size.height = v108;
    v91 = CGRectGetMaxY(v125) + 5.0;
    v73 = v91;
  }
  else
  {
    v89 = v55;
    v90 = v108;
    v88 = recta;
    v91 = v96;
  }
  -[HKSwitchTableViewCell imageView](self, "imageView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setFrame:", v82, v88, v105, v103);

  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setFrame:", v71, v68, v89, v90);

  -[UISwitch setFrame:](self->_switch, "setFrame:", v113, v73, v107, v106);
  -[UILabel setFrame:](self->_countLabel, "setFrame:", v99, v91, v101, v100);
}

- (void)setDisplayText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
  -[HKSwitchTableViewCell updateAutomationIdentifiersIfNeeded](self, "updateAutomationIdentifiersIfNeeded");
}

- (void)setCountText:(id)a3
{
  -[UILabel setText:](self->_countLabel, "setText:", a3);
  -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKSwitchTableViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isOn
{
  return -[UISwitch isOn](self->_switch, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[UISwitch setOn:](self->_switch, "setOn:", a3);
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  -[UISwitch setOn:animated:](self->_switch, "setOn:animated:", a3, a4);
}

- (void)setCentersIcon:(BOOL)a3
{
  self->_centersIcon = a3;
  -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateAutomationIdentifiersIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
  }
  else
  {
    -[HKSwitchTableViewCell textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    -[HKSwitchTableViewCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_stringByRemovingCharactersInSet:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingFormat:", CFSTR(".%@.SwitchCell"), v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSwitchTableViewCell updateAutomationIdentifiersWithBaseIdentifier:](self, "updateAutomationIdentifiersWithBaseIdentifier:", v4);
  }

}

- (void)updateAutomationIdentifiersWithBaseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HKSwitchTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v4);
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".TitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v5);

  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".CountText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_countLabel, "setAccessibilityIdentifier:", v7);

  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".Switch"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UISwitch setAccessibilityIdentifier:](self->_switch, "setAccessibilityIdentifier:", v8);
}

+ (id)reuseIdentifier
{
  return CFSTR("HKSwitchTableViewCellIdentifier");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSwitchTableViewCell;
  -[HKSwitchTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKSwitchTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[HKSwitchTableViewCell _updateFont](self, "_updateFont");
      -[HKSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)switchValueChanged:(id)a3
{
  id v4;

  -[HKSwitchTableViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchCellValueChanged:value:", self, -[UISwitch isOn](self->_switch, "isOn"));

}

- (HKSwitchTableViewCellDelegate)delegate
{
  return (HKSwitchTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHideSwitch
{
  return self->_shouldHideSwitch;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)centersIcon
{
  return self->_centersIcon;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end
