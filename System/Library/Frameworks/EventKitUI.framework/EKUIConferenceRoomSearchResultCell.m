@implementation EKUIConferenceRoomSearchResultCell

- (EKUIConferenceRoomSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIConferenceRoomSearchResultCell *v4;
  EKUIConferenceRoomSearchResultCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *title;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *image;
  void *v15;
  uint64_t v16;
  UIActivityIndicatorView *spinner;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  objc_super v55;
  _QWORD v56[11];

  v56[9] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)EKUIConferenceRoomSearchResultCell;
  v4 = -[EKUIConferenceRoomSearchResultCell initWithStyle:reuseIdentifier:](&v55, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUIConferenceRoomSearchResultCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v5->_title;
    v5->_title = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIConferenceRoomSearchResultCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_title, "setFont:", v10);

    -[EKUIConferenceRoomSearchResultCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_title, "setTextColor:", v12);

    objc_msgSend(v6, "addSubview:", v5->_title);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    image = v5->_image;
    v5->_image = v13;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 26.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v5->_image, "setPreferredSymbolConfiguration:", v15);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_image, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v5->_image);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v16;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v5->_spinner);
    v41 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_title, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 4.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v51;
    -[UILabel bottomAnchor](v5->_title, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -4.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v47;
    -[UILabel leadingAnchor](v5->_title, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 45.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v43;
    -[UILabel trailingAnchor](v5->_title, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v38;
    -[UIImageView centerXAnchor](v5->_image, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 17.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v34;
    -[UIImageView centerYAnchor](v5->_image, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v30;
    -[UIActivityIndicatorView centerXAnchor](v5->_spinner, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 17.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v18;
    -[UIActivityIndicatorView centerYAnchor](v5->_spinner, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v22;
    objc_msgSend(v6, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v56[8] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v25);

  }
  -[EKUIConferenceRoomSearchResultCell updateSeparatorInset](v5, "updateSeparatorInset");
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)EKUIConferenceRoomSearchResultCell;
  -[EKUIConferenceRoomSearchResultCell description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withObject:", CFSTR("_spinner"), self->_spinner);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_title"), self->_title);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_image"), self->_image);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateSeparatorInset
{
  CalInterfaceIsLeftToRight();
  -[EKUIConferenceRoomSearchResultCell safeAreaInsets](self, "safeAreaInsets");
  -[EKUIConferenceRoomSearchResultCell separatorInset](self, "separatorInset");
  -[EKUIConferenceRoomSearchResultCell setSeparatorInset:](self, "setSeparatorInset:");
}

- (void)reloadWithConferenceRoom:(id)a3
{
  int v4;
  void *v5;
  __CFString *v6;
  UIImageView **p_image;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = -[UIActivityIndicatorView isHidden](self->_spinner, "isHidden");
  if (!objc_msgSend(v19, "supportsAvailability")
    || !objc_msgSend(v19, "availabilityRequestInProgress"))
  {
    if ((v4 & 1) == 0)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
      -[UIImageView setHidden:](self->_image, "setHidden:", 0);
    }
    if (objc_msgSend(v19, "supportsAvailability"))
    {
      v8 = objc_msgSend(v19, "availability");
      AccessibilityLabelForAvailabilityType(v8);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      ImageForAvailabilityType(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      p_image = &self->_image;
      -[UIImageView setImage:](self->_image, "setImage:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](self->_image, "setTintColor:", v10);

      v11 = 0;
LABEL_11:
      -[UIImageView setHidden:](*p_image, "setHidden:", v11);
      goto LABEL_12;
    }
    p_image = &self->_image;
    v6 = &stru_1E601DFA8;
LABEL_10:
    v11 = 1;
    goto LABEL_11;
  }
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Loading Availability"), &stru_1E601DFA8, 0);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 0);
    p_image = &self->_image;
    goto LABEL_10;
  }
LABEL_12:
  objc_msgSend(v19, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_title, "setText:", v13);

  EventKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Conference Search Result Accessibility Label Format"), CFSTR("%@, %@"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[UILabel text](self->_title, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringWithFormat:", v15, v6, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConferenceRoomSearchResultCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
