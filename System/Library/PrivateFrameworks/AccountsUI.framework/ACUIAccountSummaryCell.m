@implementation ACUIAccountSummaryCell

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 target:(id)a5 controllerLoadAction:(SEL)a6
{
  id v6;
  id obj;
  SEL v9;
  id *v10;
  id *v11;
  id *v12;
  id *p_location;
  id v14;
  id v15;
  id v16;
  id v17;
  SEL v18;
  id v19;
  id location;
  int64_t v21;
  SEL v22;
  id v23;

  obj = a5;
  v9 = a6;
  v23 = a1;
  v22 = a2;
  v21 = a3;
  p_location = &location;
  v14 = 0;
  location = 0;
  objc_storeStrong(&location, a4);
  v12 = &v19;
  v19 = 0;
  objc_storeStrong(&v19, obj);
  v18 = v9;
  v11 = &v17;
  v17 = (id)objc_msgSend(v23, "_nameForAccountSpecifier:withStyle:", location, v21);
  v6 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, v19, 0, 0, 0, 2, 0);
  v10 = &v16;
  v16 = v6;
  objc_msgSend(v6, "setControllerLoadAction:", v18);
  objc_msgSend(v23, "_configureSpecifier:forAccount:withStyle:valueText:", v16, location, v21, v14);
  v15 = v16;
  objc_storeStrong(v10, v14);
  objc_storeStrong(v11, v14);
  objc_storeStrong(v12, v14);
  objc_storeStrong(p_location, v14);
  return v15;
}

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 detailControllerClass:(Class)a5 presentationStyle:(int64_t)a6
{
  id v9;
  id location;
  int64_t v11;
  SEL v12;
  id v13;

  v13 = a1;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = (id)objc_msgSend(v13, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:", v11, location, 0, a5, a6);
  objc_storeStrong(&location, 0);
  return v9;
}

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 valueText:(id)a5 detailControllerClass:(Class)a6 presentationStyle:(int64_t)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  NSString *v15;
  id v19;
  id v20;
  int64_t v21;
  Class v22;
  id v23;
  id location;
  int64_t v25;
  SEL v26;
  id v27;

  v27 = a1;
  v26 = a2;
  v25 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v22 = a6;
  v21 = a7;
  v20 = 0;
  v19 = (id)objc_msgSend(v27, "_nameForAccountSpecifier:withStyle:", location, v25);
  if (a6)
  {
    if (v21)
    {
      v11 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, 0, 0, 0, v22, 2, 0);
      v12 = v20;
      v20 = v11;

    }
    else
    {
      v9 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, 0, 0, 0, objc_opt_class(), 2, 0);
      v10 = v20;
      v20 = v9;

      v15 = NSStringFromClass(v22);
      objc_msgSend(v20, "setProperty:forKey:");

    }
  }
  else
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, 0, 0, 0, 0, 3, 0);
    v8 = v20;
    v20 = v7;

    objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  }
  objc_msgSend(v27, "_configureSpecifier:forAccount:withStyle:valueText:", v20, location, v25, v23);
  v14 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

+ (id)_nameForAccountSpecifier:(id)a3 withStyle:(int64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v15;
  int64_t v16;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = 0;
  if (a4 == 1 || v16 == 2)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_SETTINGS"), &stru_1E9A15E98, CFSTR("Localizable"));
      v5 = v15;
      v15 = v4;

    }
    else
    {
      v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_INFO"), &stru_1E9A15E98, CFSTR("Localizable"));
      v7 = v15;
      v15 = v6;

    }
  }
  else
  {
    v8 = (id)objc_msgSend(location[0], "accountPropertyForKey:", CFSTR("ACUIAccountSimpleDisplayName"));
    v9 = v15;
    v15 = v8;

    if (!v15)
    {
      v15 = (id)objc_msgSend(location[0], "accountPropertyForKey:", CFSTR("fullname"));

    }
    if (!v15)
    {
      v15 = (id)objc_msgSend(location[0], "accountDescription");

    }
  }
  if (!v15)
    objc_storeStrong(&v15, CFSTR("?"));
  v11 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v11;
}

+ (void)_configureSpecifier:(id)a3 forAccount:(id)a4 withStyle:(int64_t)a5 valueText:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v13;
  id v14;
  int64_t v15;
  id v16;
  id location[2];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = a5;
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v13 = (id)objc_msgSend(v16, "identifier");
  if (v15 == 1 || v15 == 2)
  {
    objc_storeWeak((id *)((char *)location[0] + (int)*MEMORY[0x1E0D805D0]), v18);
    *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x1E0D805C0]) = sel__valueForCellSpecifier_;
    objc_storeStrong(&v13, CFSTR("ACCOUNT_INFO"));
  }
  objc_msgSend(location[0], "setProperty:forKey:", v16, CFSTR("account"));
  v8 = location[0];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  objc_msgSend(v8, "setProperty:forKey:");

  if (v14)
    objc_msgSend(location[0], "setProperty:forKey:", v14, CFSTR("ACUIAccountSummaryValue"));
  objc_msgSend(location[0], "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(location[0], "setProperty:forKey:", v13, *MEMORY[0x1E0D80868]);
  v6 = location[0];
  v19 = CFSTR("account");
  v20[0] = v16;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  objc_msgSend(v6, "setUserInfo:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

+ (id)_valueForCellSpecifier:(id)a3
{
  id v4;
  id v5;
  id location[3];
  id v7;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUIAccountSummaryValue"));
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v4 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("account"));
    v7 = (id)objc_msgSend(v4, "displayUsername");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (ACUIAccountSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  ACUIAccountSummaryCell *v5;
  ACAccount *v6;
  ACAccount *account;
  uint64_t v8;
  NSSet *v9;
  NSSet *enabledDataclasses;
  NSSet *v11;
  NSSet *supportedDataclasses;
  NSString *v13;
  NSString *desiredValue;
  ACUIAccountSummaryCell *v16;
  id v17;
  ACAccountType *v18;
  objc_super v20;
  id v21;
  id location;
  int64_t v23;
  SEL v24;
  ACUIAccountSummaryCell *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v5 = v25;
  v25 = 0;
  v20.receiver = v5;
  v20.super_class = (Class)ACUIAccountSummaryCell;
  v25 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v20, sel_initWithStyle_reuseIdentifier_specifier_, v23, location, v21);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    v6 = (ACAccount *)(id)objc_msgSend(v21, "propertyForKey:", CFSTR("account"));
    account = v25->_account;
    v25->_account = v6;

    v17 = (id)objc_msgSend(v21, "propertyForKey:", CFSTR("ACUIAccountSummaryStyle"));
    v8 = objc_msgSend(v17, "integerValue");
    v25->_style = v8;

    v9 = (NSSet *)(id)-[ACAccount enabledDataclasses](v25->_account, "enabledDataclasses");
    enabledDataclasses = v25->_enabledDataclasses;
    v25->_enabledDataclasses = v9;

    v18 = -[ACAccount accountType](v25->_account, "accountType");
    v11 = (NSSet *)(id)-[ACAccountType supportedDataclasses](v18, "supportedDataclasses");
    supportedDataclasses = v25->_supportedDataclasses;
    v25->_supportedDataclasses = v11;

    v13 = (NSString *)(id)objc_msgSend(v21, "propertyForKey:", CFSTR("ACUIAccountSummaryValue"));
    desiredValue = v25->_desiredValue;
    v25->_desiredValue = v13;

  }
  v16 = v25;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v16;
}

- (void)hideDataclass:(id)a3
{
  uint64_t v3;
  NSSet *enabledDataclasses;
  id v5;
  id location[2];
  ACUIAccountSummaryCell *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[NSSet containsObject:](v7->_enabledDataclasses, "containsObject:", location[0]))
  {
    v5 = (id)-[NSSet mutableCopy](v7->_enabledDataclasses, "mutableCopy");
    objc_msgSend(v5, "removeObject:", location[0]);
    v3 = objc_msgSend(v5, "copy");
    enabledDataclasses = v7->_enabledDataclasses;
    v7->_enabledDataclasses = (NSSet *)v3;

    -[ACUIAccountSummaryCell setNeedsLayout](v7, "setNeedsLayout");
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id *location;
  double MaxX;
  double v37;
  double x;
  id v39;
  NSString *v40;
  id v41;
  ACAccountType *v42;
  BOOL v43;
  id v44;
  NSString *v45;
  id v46;
  BOOL IsAccessibilityCategory;
  double v48;
  id v49;
  double v50;
  id v51;
  id v52;
  double v53;
  id v54;
  id v55;
  double v56;
  id v57;
  double v58;
  id v59;
  BOOL v60;
  id v61;
  id v62;
  NSString *desiredValue;
  id v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  double v70;
  double v71;
  CGRect v72;
  double v73;
  double v74;
  id v75;
  double v76;
  __int128 v77;
  __int128 v78;
  double v79;
  unint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  char v86;
  id v87;
  char v88;
  id v89;
  id v90;
  id v91;
  char v92;
  objc_super v93;
  SEL v94;
  ACUIAccountSummaryCell *v95;
  CGRect v96;

  v95 = self;
  v94 = a2;
  v93.receiver = self;
  v93.super_class = (Class)ACUIAccountSummaryCell;
  -[PSTableCell layoutSubviews](&v93, sel_layoutSubviews);
  v92 = (-[ACUIAccountSummaryCell _shouldReverseLayoutDirection](v95, "_shouldReverseLayoutDirection") ^ 1) & 1;
  if (v95->_style && v95->_style != 2)
  {
    if (v95->_style == 1)
    {
      if (v95->_desiredValue)
      {
        desiredValue = v95->_desiredValue;
        v64 = (id)-[ACUIAccountSummaryCell detailTextLabel](v95, "detailTextLabel");
        objc_msgSend(v64, "setText:", desiredValue);

      }
      else
      {
        v62 = -[ACAccount displayUsername](v95->_account, "displayUsername");
        v61 = (id)-[ACUIAccountSummaryCell detailTextLabel](v95, "detailTextLabel");
        objc_msgSend(v61, "setText:", v62);

      }
    }
    else
    {
      v91 = -[PSTableCell titleLabel](v95, "titleLabel");
      v90 = -[PSTableCell valueLabel](v95, "valueLabel");
      v88 = 0;
      v86 = 0;
      v60 = 0;
      if (v90)
      {
        v89 = (id)objc_msgSend(v90, "text");
        v88 = 1;
        v60 = 0;
        if (v89)
        {
          v87 = (id)objc_msgSend(v90, "text");
          v86 = 1;
          v60 = objc_msgSend(v87, "length") != 0;
        }
      }
      if ((v86 & 1) != 0)

      if ((v88 & 1) != 0)
      if (v60)
      {
        v59 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
        objc_msgSend(v59, "bounds");
        v82 = v2;
        v83 = v3;
        v84 = v4;
        v85 = v5;

        objc_msgSend(v90, "sizeToFit");
        objc_msgSend(v90, "frame");
        v79 = v6;
        v80 = v7;
        *(_QWORD *)&v81 = v8;
        *((_QWORD *)&v81 + 1) = v9;
        if ((v92 & 1) != 0)
          v58 = v84 - *(double *)&v81;
        else
          v58 = 0.0;
        v79 = v58;
        objc_msgSend(v90, "setFrame:", __PAIR128__(v80, *(unint64_t *)&v58), v81);
        objc_msgSend(v91, "frame");
        *(_QWORD *)&v77 = v10;
        *((_QWORD *)&v77 + 1) = v11;
        *((_QWORD *)&v78 + 1) = v12;
        v76 = v13;
        *(double *)&v78 = v84 - *(double *)&v81 - 30.0;
        if ((v92 & 1) == 0)
          *(double *)&v77 = *(double *)&v77 + v76 - *(double *)&v78;
        objc_msgSend(v91, "setFrame:", v77, v78);
      }
      v75 = -[ACUIAccountSummaryCell _dataclassesLabel](v95, "_dataclassesLabel");
      if (!v95->_useCustomDetailsText)
      {
        if ((v92 & 1) != 0)
        {
          v55 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
          objc_msgSend(v55, "bounds");
          v56 = v14;
          objc_msgSend(v91, "frame");
          v74 = v56 + v15;

          v57 = -[PSTableCell valueLabel](v95, "valueLabel");
          objc_msgSend(v57, "frame");
          v73 = v16;

        }
        else
        {
          v51 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
          objc_msgSend(v51, "bounds");
          v50 = v17;
          v49 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
          objc_msgSend(v49, "bounds");
          v48 = v18;
          objc_msgSend(v91, "frame");
          v74 = v50 + v48 - UIRectGetMaxX(v19, v20, v21);

          v54 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
          objc_msgSend(v54, "bounds");
          v53 = v22;
          v52 = -[PSTableCell valueLabel](v95, "valueLabel");
          objc_msgSend(v52, "frame");
          v73 = v53 - UIRectGetMaxX(v23, v24, v25);

        }
        v26 = v73;
        if (v73 > 0.0)
        {
          v26 = v73;
          v74 = v73;
        }
        v46 = (id)-[ACUIAccountSummaryCell traitCollection](v95, "traitCollection", v26);
        v45 = (NSString *)(id)objc_msgSend(v46, "preferredContentSizeCategory");
        IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v45);

        if (IsAccessibilityCategory)
        {
          v44 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
          objc_msgSend(v44, "bounds");
          v74 = v27;

        }
        v42 = -[ACAccount accountType](v95->_account, "accountType");
        v41 = (id)-[ACAccountType supportedDataclasses](v42, "supportedDataclasses");
        v43 = objc_msgSend(v41, "count") != 0;

        if (v43)
        {
          v39 = -[ACUIAccountSummaryCell _enabledDataclassesTextForWidth:](v95, "_enabledDataclassesTextForWidth:", v74);
          -[UILabel setText:](v95->_dataclassesLabel, "setText:");

        }
        else
        {
          v40 = -[ACAccount username](v95->_account, "username");
          -[UILabel setText:](v95->_dataclassesLabel, "setText:");

        }
      }
      objc_msgSend(v91, "frame");
      v72.origin.x = v28;
      v72.size.width = v29;
      v72.size.height = v30;
      objc_msgSend(v75, "sizeToFit");
      objc_msgSend(v75, "frame");
      v70 = v31;
      v71 = v32;
      -[ACUIAccountSummaryCell bounds](v95, "bounds");
      v72.origin.y = CGRound((v33 - (v72.size.height + v71 + 2.0)) / 2.0);
      objc_msgSend(v91, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
      v68 = 0;
      v66 = 0;
      if ((v92 & 1) != 0)
      {
        x = v72.origin.x;
      }
      else
      {
        v69 = (id)objc_msgSend(v75, "superview");
        v68 = 1;
        objc_msgSend(v69, "bounds");
        v37 = v34 - v70;
        v67 = (id)-[ACUIAccountSummaryCell contentView](v95, "contentView");
        v66 = 1;
        objc_msgSend(v67, "bounds");
        MaxX = CGRectGetMaxX(v96);
        x = v37 - (MaxX - CGRectGetMaxX(v72));
      }
      if ((v66 & 1) != 0)

      if ((v68 & 1) != 0)
      objc_msgSend(v75, "setFrame:", x, v72.origin.y + v72.size.height + 2.0, v70, v71, &v75);
      objc_storeStrong(location, 0);
      objc_storeStrong(&v90, 0);
      objc_storeStrong(&v91, 0);
    }
  }
  else
  {
    v65 = (id)-[ACUIAccountSummaryCell detailTextLabel](v95, "detailTextLabel");
    objc_msgSend(v65, "setText:", 0);

  }
}

- (id)_dataclassesLabel
{
  id v2;
  UILabel *v3;
  UILabel *dataclassesLabel;
  id v6;
  id v7;

  if (!self->_dataclassesLabel)
  {
    v2 = objc_alloc(MEMORY[0x1E0CEA700]);
    v3 = (UILabel *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    dataclassesLabel = self->_dataclassesLabel;
    self->_dataclassesLabel = v3;

    v7 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    -[UILabel setTextColor:](self->_dataclassesLabel, "setTextColor:");

    -[UILabel setBackgroundColor:](self->_dataclassesLabel, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_dataclassesLabel, "setOpaque:", 0);
    -[ACUIAccountSummaryCell addSubview:](self, "addSubview:", self->_dataclassesLabel);
  }
  v6 = -[ACUIAccountSummaryCell _font](self, "_font");
  -[UILabel setFont:](self->_dataclassesLabel, "setFont:");

  return self->_dataclassesLabel;
}

- (id)_enabledDataclassesTextForWidth:(double)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  float v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  id v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
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
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  BOOL v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  BOOL v88;
  id v89;
  id v90;
  BOOL v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101[3];
  double v102;
  uint64_t v103;
  id v104;
  id v105;
  double v106;
  double v107;
  uint64_t v108;
  id v109;
  char *v110;
  unint64_t i;
  double v112;
  double v113;
  double v114;
  uint64_t v115;
  int v116;
  double v117;
  double v118;
  uint64_t v119;
  char v120;
  id v121;
  id location;
  id v123;
  id v124;
  double v125;
  SEL v126;
  ACUIAccountSummaryCell *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  _QWORD v142[2];

  v142[1] = *MEMORY[0x1E0C80C00];
  v127 = self;
  v126 = a2;
  v125 = a3;
  v124 = 0;
  if (!-[NSSet count](self->_enabledDataclasses, "count"))
  {
    v100 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("INACTIVE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v4 = v124;
    v124 = v3;

LABEL_73:
    v24 = (void *)MEMORY[0x1E0CB3940];
    v26 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("COMBINED_STRING"), &stru_1E9A15E98, CFSTR("Localizable"));
    v128 = (id)objc_msgSend(v24, "stringWithFormat:", v124);

    v116 = 1;
    goto LABEL_74;
  }
  v123 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F430]))
  {
    v99 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F430], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3D0]))
  {
    v98 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3D0], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F388]))
  {
    v97 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F388], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F378]))
  {
    v96 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F378], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F368]))
  {
    v95 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F368], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F400]))
  {
    v94 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F400], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3E0]))
  {
    v93 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3E0], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3F8]))
  {
    v92 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3F8], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v123, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3F0]))
  {
    location = (id)objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.news"));
    v90 = (id)objc_msgSend(location, "appState");
    v120 = 0;
    v91 = 0;
    if ((objc_msgSend(v90, "isRestricted") & 1) == 0)
    {
      v121 = (id)objc_msgSend(location, "appState");
      v120 = 1;
      v91 = (objc_msgSend(v121, "isInstalled") & 1) == 1;
    }
    if ((v120 & 1) != 0)

    if (v91)
    {
      v89 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3F0], CFSTR("LABEL"), v127->_account);
      objc_msgSend(v123, "addObject:");

    }
    objc_storeStrong(&location, 0);
  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3B0]))
  {
    v130 = 0;
    v86 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v87 = objc_msgSend(v86, "userInterfaceIdiom");

    v130 = v87;
    v88 = 1;
    if (v87 != 1)
      v88 = v130 == 5;
    if (!v88)
    {
      v84 = v123;
      v85 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3B0], CFSTR("LABEL"), v127->_account);
      objc_msgSend(v84, "addObject:");

    }
  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3D8])
    || -[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F410]))
  {
    v82 = v123;
    v83 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3D8], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v82, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F418]))
  {
    v129 = 0;
    v79 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v80 = objc_msgSend(v79, "userInterfaceIdiom");

    v129 = v80;
    v81 = 1;
    if (v80 != 1)
      v81 = v129 == 5;
    if (!v81)
    {
      v77 = v123;
      v78 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F418], CFSTR("LABEL"), v127->_account);
      objc_msgSend(v77, "addObject:");

    }
  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F390])
    && -[NSSet count](v127->_supportedDataclasses, "count") == 1)
  {
    v75 = v123;
    v76 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F390], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v75, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3A8]))
  {
    v73 = v123;
    v74 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3A8], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v73, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F360]))
  {
    v71 = v123;
    v72 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F360], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v71, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F3E8]))
  {
    v69 = v123;
    v70 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F3E8], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v69, "addObject:");

  }
  if (-[NSSet containsObject:](v127->_enabledDataclasses, "containsObject:", *MEMORY[0x1E0C8F428]))
  {
    v67 = v123;
    v68 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", *MEMORY[0x1E0C8F428], CFSTR("LABEL"), v127->_account);
    objc_msgSend(v67, "addObject:");

  }
  if (objc_msgSend(v123, "count"))
  {
    v63 = v123;
    v65 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v64 = (id)objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("MIDDLE_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
    v7 = (id)objc_msgSend(v63, "componentsJoinedByString:");
    v8 = v124;
    v124 = v7;

  }
  else
  {
    v66 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("INACTIVE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v6 = v124;
    v124 = v5;

  }
  v118 = 0.0;
  v119 = 0;
  v60 = v124;
  v141 = *MEMORY[0x1E0CEA098];
  v62 = -[ACUIAccountSummaryCell _font](v127, "_font");
  v142[0] = v62;
  v61 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, &v141, 1);
  objc_msgSend(v60, "sizeWithAttributes:");
  v118 = v9;
  v119 = v10;

  v117 = v118;
  if (v118 >= v125)
  {
    v114 = 0.0;
    v115 = 0;
    v59 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v58 = (id)objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("MIDDLE_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
    v139 = *MEMORY[0x1E0CEA098];
    v57 = -[ACUIAccountSummaryCell _font](v127, "_font");
    v140 = v57;
    v56 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
    objc_msgSend(v58, "sizeWithAttributes:");
    v114 = v11;
    v115 = v12;

    v113 = v114;
    v112 = 0.0;
    v110 = 0;
    v109 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v123, "count"));
    for (i = 0; i < objc_msgSend(v123, "count"); ++i)
    {
      v107 = 0.0;
      v108 = 0;
      v54 = (id)objc_msgSend(v123, "objectAtIndexedSubscript:", i);
      v137 = *MEMORY[0x1E0CEA098];
      v53 = -[ACUIAccountSummaryCell _font](v127, "_font");
      v138 = v53;
      v52 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
      objc_msgSend(v54, "sizeWithAttributes:");
      v107 = v13;
      v108 = v14;

      v106 = v107;
      v55 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v107);
      objc_msgSend(v109, "addObject:");

      if (i)
        v106 = v106 + v113;
      if (v112 + v106 >= v125)
        break;
      v112 = v112 + v106;
      ++v110;
    }
    if ((unint64_t)v110 < objc_msgSend(v123, "count"))
    {
      v43 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      v42 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      objc_msgSend(v43, "setLocale:");

      v44 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      objc_msgSend(v44, "setNumberStyle:");

      v46 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      v45 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v123, "count") - (_QWORD)v110);
      v105 = (id)objc_msgSend(v46, "stringFromNumber:");

      v47 = (void *)MEMORY[0x1E0CB3940];
      v49 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v48 = (id)objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v104 = (id)objc_msgSend(v47, "stringWithFormat:", v105);

      v102 = 0.0;
      v103 = 0;
      v135 = *MEMORY[0x1E0CEA098];
      v51 = -[ACUIAccountSummaryCell _font](v127, "_font");
      v136 = v51;
      v50 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      objc_msgSend(v104, "sizeWithAttributes:");
      v102 = v15;
      v103 = v16;

      while (1)
      {
        v41 = 0;
        if (v112 + v102 > v125)
          v41 = v110 != 0;
        if (!v41)
          break;
        --v110;
        v40 = (id)objc_msgSend(v109, "objectAtIndex:", v112 + v102);
        objc_msgSend(v40, "floatValue");
        v112 = v112 - v17;

      }
      objc_storeStrong(&v104, 0);
      objc_storeStrong(&v105, 0);
    }
    v132 = 0;
    v131 = v110;
    v133 = 0;
    v134 = v110;
    v101[1] = 0;
    v101[2] = v110;
    v38 = (id)objc_msgSend(v123, "subarrayWithRange:", 0, v110);
    v37 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v36 = (id)objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("MIDDLE_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
    v18 = (id)objc_msgSend(v38, "componentsJoinedByString:");
    v19 = v124;
    v124 = v18;

    v39 = (unint64_t)v110;
    if (v39 < objc_msgSend(v123, "count"))
    {
      v28 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      v27 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      objc_msgSend(v28, "setLocale:");

      v29 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      objc_msgSend(v29, "setNumberStyle:", 1);

      v32 = -[ACUIAccountSummaryCell _numberFormatter](v127, "_numberFormatter");
      v30 = (void *)MEMORY[0x1E0CB37E8];
      v20 = objc_msgSend(v123, "count");
      v31 = (id)objc_msgSend(v30, "numberWithUnsignedInteger:", v20 - (_QWORD)v110);
      v101[0] = (id)objc_msgSend(v32, "stringFromNumber:");

      v33 = v124;
      v35 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v21 = (id)objc_msgSend(v33, "stringByAppendingFormat:", v101[0]);
      v22 = v124;
      v124 = v21;

      objc_storeStrong(v101, 0);
    }
    objc_storeStrong(&v109, 0);
    v116 = 0;
  }
  else
  {
    v128 = v124;
    v116 = 1;
  }
  objc_storeStrong(&v123, 0);
  if (!v116)
    goto LABEL_73;
LABEL_74:
  objc_storeStrong(&v124, 0);
  return v128;
}

- (id)_font
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x1E0CEA718], "subtitleCellConfiguration");
  v3 = (id)objc_msgSend(v4, "secondaryTextProperties");
  v5 = (id)objc_msgSend(v3, "font");

  return v5;
}

- (id)_numberFormatter
{
  id v2;
  void *v3;

  if (!__ACUINumberFormatter)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v3 = (void *)__ACUINumberFormatter;
    __ACUINumberFormatter = (uint64_t)v2;

  }
  return (id)__ACUINumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredValue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_supportedDataclasses, 0);
  objc_storeStrong((id *)&self->_enabledDataclasses, 0);
  objc_storeStrong((id *)&self->_dataclassesLabel, 0);
}

@end
