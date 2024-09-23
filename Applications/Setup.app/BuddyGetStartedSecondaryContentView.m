@implementation BuddyGetStartedSecondaryContentView

- (BuddyGetStartedSecondaryContentView)initWithFrame:(CGRect)a3
{
  NSBundle *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  UIColor *v9;
  UIColor *v10;
  id v11;
  void *v12;
  NSBundle *v13;
  NSString *v14;
  id v15;
  UIColor *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSArray *v29;
  BuddyGetStartedSecondaryContentView *v30;
  id v32;
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
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  SEL v55;
  id location;
  CGRect v57;
  _QWORD v58[10];

  v57 = a3;
  v55 = a2;
  location = 0;
  v54.receiver = self;
  v54.super_class = (Class)BuddyGetStartedSecondaryContentView;
  location = -[BuddyGetStartedSecondaryContentView initWithFrame:](&v54, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("PROXIMITY_SETUP_INFO"));
    v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v4);
    v53 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));

    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v6;

    objc_msgSend(*((id *)location + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)location + 1), "setText:", v53);
    v8 = objc_msgSend(location, "_labelFont");
    objc_msgSend(*((id *)location + 1), "setFont:", v8);

    v9 = +[UIColor labelColor](UIColor, "labelColor");
    objc_msgSend(*((id *)location + 1), "setTextColor:", v9);

    v10 = +[UIColor clearColor](UIColor, "clearColor");
    objc_msgSend(*((id *)location + 1), "setBackgroundColor:", v10);

    objc_msgSend(*((id *)location + 1), "setNumberOfLines:", 0);
    v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v12 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v11;

    objc_msgSend(*((id *)location + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_SETUP_LOOKING_FOR_DEVICES"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(*((id *)location + 2), "setText:", v14);

    v15 = objc_msgSend(location, "_labelFont");
    objc_msgSend(*((id *)location + 2), "setFont:", v15);

    v16 = +[UIColor labelColor](UIColor, "labelColor");
    objc_msgSend(*((id *)location + 2), "setTextColor:", v16);

    objc_msgSend(*((id *)location + 2), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)location + 2), "setTextAlignment:", 1);
    v17 = objc_alloc((Class)UIActivityIndicatorView);
    v18 = objc_msgSend(v17, "initWithActivityIndicatorStyle:", objc_msgSend(location, "_activityIndicatorViewStyle"));
    v19 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v18;

    objc_msgSend(*((id *)location + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 3));
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 2));
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 1));
    objc_msgSend(*((id *)location + 3), "startAnimating");
    v52 = objc_msgSend(*((id *)location + 2), "topAnchor");
    v51 = objc_msgSend(location, "topAnchor");
    v50 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", 15.0);
    v58[0] = v50;
    v49 = objc_msgSend(*((id *)location + 2), "centerXAnchor");
    v48 = objc_msgSend(location, "centerXAnchor");
    v47 = objc_msgSend(v49, "constraintEqualToAnchor:");
    v58[1] = v47;
    v46 = objc_msgSend(*((id *)location + 3), "leadingAnchor");
    v45 = objc_msgSend(location, "leadingAnchor");
    v44 = objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:");
    v58[2] = v44;
    v43 = objc_msgSend(*((id *)location + 3), "centerYAnchor");
    v42 = objc_msgSend(*((id *)location + 2), "centerYAnchor");
    v41 = objc_msgSend(v43, "constraintEqualToAnchor:");
    v58[3] = v41;
    v40 = objc_msgSend(*((id *)location + 3), "trailingAnchor");
    v39 = objc_msgSend(*((id *)location + 2), "leadingAnchor");
    v38 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", -10.0);
    v58[4] = v38;
    v37 = objc_msgSend(*((id *)location + 2), "trailingAnchor");
    v36 = objc_msgSend(location, "trailingAnchor");
    v35 = objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:");
    v58[5] = v35;
    v34 = objc_msgSend(*((id *)location + 1), "topAnchor");
    v33 = objc_msgSend(*((id *)location + 2), "bottomAnchor");
    v32 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", 20.0);
    v58[6] = v32;
    v20 = objc_msgSend(*((id *)location + 1), "leadingAnchor");
    v21 = objc_msgSend(location, "leadingAnchor");
    v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v58[7] = v22;
    v23 = objc_msgSend(*((id *)location + 1), "trailingAnchor");
    v24 = objc_msgSend(location, "trailingAnchor");
    v25 = objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v58[8] = v25;
    v26 = objc_msgSend(*((id *)location + 1), "bottomAnchor");
    v27 = objc_msgSend(location, "bottomAnchor");
    v28 = objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v58[9] = v28;
    v29 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 10);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    objc_msgSend(location, "_updateContentLabelLayout");
    objc_storeStrong(&v53, 0);
  }
  v30 = (BuddyGetStartedSecondaryContentView *)location;
  objc_storeStrong(&location, 0);
  return v30;
}

- (BOOL)shouldUseAccessibilityLayout
{
  UIApplication *v2;
  UIContentSizeCategory lhs[3];

  lhs[2] = (UIContentSizeCategory)&self->super.super.super.isa;
  lhs[1] = (UIContentSizeCategory)a2;
  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  lhs[0] = -[UIApplication preferredContentSizeCategory](v2, "preferredContentSizeCategory");

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(lhs[0], UIContentSizeCategoryExtraExtraExtraLarge) > NSOrderedSame;
  objc_storeStrong((id *)lhs, 0);
  return v2 & 1;
}

- (int64_t)_activityIndicatorViewStyle
{
  if (-[BuddyGetStartedSecondaryContentView shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
    return 101;
  else
    return 100;
}

- (void)_updateContentLabelLayout
{
  UILabel *v2;

  if (-[BuddyGetStartedSecondaryContentView shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout", a2))
  {
    v2 = -[BuddyGetStartedSecondaryContentView contentLabel](self, "contentLabel");
    -[UILabel setTextAlignment:](v2, "setTextAlignment:", 4);
  }
  else
  {
    v2 = -[BuddyGetStartedSecondaryContentView contentLabel](self, "contentLabel");
    -[UILabel setTextAlignment:](v2, "setTextAlignment:", 1);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  UIActivityIndicatorView *v4;
  id v5;
  UILabel *v6;
  id v7;
  UILabel *v8;
  objc_super v9;
  id location[2];
  BuddyGetStartedSecondaryContentView *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)BuddyGetStartedSecondaryContentView;
  -[BuddyGetStartedSecondaryContentView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", location[0]);
  v3 = -[BuddyGetStartedSecondaryContentView _activityIndicatorViewStyle](v11, "_activityIndicatorViewStyle");
  v4 = -[BuddyGetStartedSecondaryContentView spinner](v11, "spinner");
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v4, "setActivityIndicatorViewStyle:", v3);

  v5 = -[BuddyGetStartedSecondaryContentView _labelFont](v11, "_labelFont");
  v6 = -[BuddyGetStartedSecondaryContentView spinnerLabel](v11, "spinnerLabel");
  -[UILabel setFont:](v6, "setFont:", v5);

  v7 = -[BuddyGetStartedSecondaryContentView _labelFont](v11, "_labelFont");
  v8 = -[BuddyGetStartedSecondaryContentView contentLabel](v11, "contentLabel");
  -[UILabel setFont:](v8, "setFont:", v7);

  -[BuddyGetStartedSecondaryContentView _updateContentLabelLayout](v11, "_updateContentLabelLayout");
  objc_storeStrong(location, 0);
}

- (id)_labelFont
{
  id v2;
  UIFontDescriptor *v3;
  UIFont *v4;

  v2 = -[BuddyGetStartedSecondaryContentView traitCollection](self, "traitCollection", a2, self);
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v2);
  v4 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0);

  return v4;
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabel, a3);
}

- (UILabel)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLabel, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_spinnerLabel, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
