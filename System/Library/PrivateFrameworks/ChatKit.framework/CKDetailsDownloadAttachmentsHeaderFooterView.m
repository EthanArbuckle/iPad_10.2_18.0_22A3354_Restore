@implementation CKDetailsDownloadAttachmentsHeaderFooterView

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsDownloadAttachmentsHeaderFooterView_reuseIdentifier");
}

- (CKDetailsDownloadAttachmentsHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  CKDetailsDownloadAttachmentsHeaderFooterView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *iCloudImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  UITextView *titleTextView;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UITextView *v30;
  void *v31;
  UITextView *v32;
  void *v33;
  UITextView *v34;
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
  uint64_t v53;
  UITextView *buttonTextView;
  void *v55;
  UITextView *v56;
  void *v57;
  UITextView *v58;
  void *v59;
  UITextView *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  objc_super v86;
  _QWORD v87[4];
  _QWORD v88[3];
  _QWORD v89[6];

  v89[4] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  v3 = -[CKDetailsDownloadAttachmentsHeaderFooterView initWithReuseIdentifier:](&v86, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("icloud.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:highlightedImage:", v4, 0);
    iCloudImageView = v3->_iCloudImageView;
    v3->_iCloudImageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_iCloudImageView, "setContentMode:", 1);
    -[CKDetailsDownloadAttachmentsHeaderFooterView addSubview:](v3, "addSubview:", v3->_iCloudImageView);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iCloudImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKDetailsDownloadAttachmentsHeaderFooterView _updateiCloudImageViewAppearance](v3, "_updateiCloudImageViewAppearance");
    v75 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v3->_iCloudImageView, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView topAnchor](v3, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v78, 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v7;
    -[UIImageView centerXAnchor](v3->_iCloudImageView, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView centerXAnchor](v3, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v10;
    -[UIImageView widthAnchor](v3->_iCloudImageView, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    v85 = v4;
    objc_msgSend(v4, "size");
    objc_msgSend(v11, "constraintEqualToConstant:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v13;
    -[UIImageView heightAnchor](v3->_iCloudImageView, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    objc_msgSend(v14, "constraintEqualToConstant:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v17);

    v18 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
    titleTextView = v3->_titleTextView;
    v3->_titleTextView = (UITextView *)v23;

    -[UITextView setEditable:](v3->_titleTextView, "setEditable:", 0);
    -[UITextView textContainer](v3->_titleTextView, "textContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLineFragmentPadding:", 0.0);

    v26 = *MEMORY[0x1E0CEB4B0];
    v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v28 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v29 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[UITextView setTextContainerInset:](v3->_titleTextView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], v27, v28, v29);
    v30 = v3->_titleTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    v32 = v3->_titleTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v32, "setTextColor:", v33);

    -[UITextView setTextAlignment:](v3->_titleTextView, "setTextAlignment:", 1);
    -[UITextView setScrollEnabled:](v3->_titleTextView, "setScrollEnabled:", 0);
    v34 = v3->_titleTextView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "iCloudTextFont");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v34, "setFont:", v36);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKDetailsDownloadAttachmentsHeaderFooterView addSubview:](v3, "addSubview:", v3->_titleTextView);
    v76 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView centerXAnchor](v3->_titleTextView, "centerXAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView centerXAnchor](v3, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v79);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v37;
    -[UITextView leadingAnchor](v3->_titleTextView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView leadingAnchor](v3, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v40;
    -[UITextView trailingAnchor](v3->_titleTextView, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView trailingAnchor](v3, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "activateConstraints:", v44);

    -[UITextView topAnchor](v3->_titleTextView, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_iCloudImageView, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 5.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView setTitleTextTopToLogoConstraint:](v3, "setTitleTextTopToLogoConstraint:", v47);

    -[UITextView topAnchor](v3->_titleTextView, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView topAnchor](v3, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView setTitleTextTopToViewConstraint:](v3, "setTitleTextTopToViewConstraint:", v50);

    -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextTopToLogoConstraint](v3, "titleTextTopToLogoConstraint");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextTopToViewConstraint](v3, "titleTextTopToViewConstraint");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 0);

    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:", v19, v20, v21, v22);
    buttonTextView = v3->_buttonTextView;
    v3->_buttonTextView = (UITextView *)v53;

    -[UITextView setEditable:](v3->_buttonTextView, "setEditable:", 0);
    -[UITextView textContainer](v3->_buttonTextView, "textContainer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](v3->_buttonTextView, "setTextContainerInset:", v26, v27, v28, v29);
    v56 = v3->_buttonTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v56, "setBackgroundColor:", v57);

    v58 = v3->_buttonTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v58, "setTextColor:", v59);

    -[UITextView setTextAlignment:](v3->_buttonTextView, "setTextAlignment:", 1);
    -[UITextView setScrollEnabled:](v3->_buttonTextView, "setScrollEnabled:", 0);
    v60 = v3->_buttonTextView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "downloadButtonFont");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v60, "setFont:", v62);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_buttonTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKDetailsDownloadAttachmentsHeaderFooterView addSubview:](v3, "addSubview:", v3->_buttonTextView);
    v73 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView topAnchor](v3->_buttonTextView, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView bottomAnchor](v3->_titleTextView, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 16.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v80;
    -[UITextView centerXAnchor](v3->_buttonTextView, "centerXAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView centerXAnchor](v3, "centerXAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v74);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v63;
    -[UITextView leadingAnchor](v3->_buttonTextView, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView leadingAnchor](v3, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v66;
    -[UITextView trailingAnchor](v3->_buttonTextView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsDownloadAttachmentsHeaderFooterView trailingAnchor](v3, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "activateConstraints:", v70);

    -[CKDetailsDownloadAttachmentsHeaderFooterView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_handleUserTap_);
    -[UITextView addGestureRecognizer:](v3->_buttonTextView, "addGestureRecognizer:", v71);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  -[CKDetailsDownloadAttachmentsHeaderFooterView layoutSubviews](&v11, sel_layoutSubviews);
  -[CKDetailsDownloadAttachmentsHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsHeaderFooterContentViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  -[CKDetailsDownloadAttachmentsHeaderFooterView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

}

- (void)setTitleText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextView](self, "titleTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setButtonText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_buttonText, a3);
  v5 = a3;
  -[CKDetailsDownloadAttachmentsHeaderFooterView buttonTextView](self, "buttonTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)handleUserTap:(id)a3
{
  void *v4;
  id v5;

  -[CKDetailsDownloadAttachmentsHeaderFooterView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKDetailsDownloadAttachmentsHeaderFooterView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userDidTapDownloadForAttachmentsFooterView:", self);

  }
}

- (void)setTitleTextColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleTextColor, a3);
  v5 = a3;
  -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextView](self, "titleTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (void)setDownloadButtonTextColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_downloadButtonTextColor, a3);
  v5 = a3;
  -[CKDetailsDownloadAttachmentsHeaderFooterView buttonTextView](self, "buttonTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (void)setLogoHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_logoHidden = a3;
  -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextTopToLogoConstraint](self, "titleTextTopToLogoConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", v3 ^ 1);

  -[CKDetailsDownloadAttachmentsHeaderFooterView titleTextTopToViewConstraint](self, "titleTextTopToViewConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", v3);

  -[CKDetailsDownloadAttachmentsHeaderFooterView iCloudImageView](self, "iCloudImageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

}

- (void)_updateiCloudImageViewAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[CKDetailsDownloadAttachmentsHeaderFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
    objc_msgSend(v5, "detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode");
  else
    objc_msgSend(v5, "detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode");
  v8 = v7;

  -[UIImageView setAlpha:](self->_iCloudImageView, "setAlpha:", v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  -[CKDetailsDownloadAttachmentsHeaderFooterView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKDetailsDownloadAttachmentsHeaderFooterView _updateiCloudImageViewAppearance](self, "_updateiCloudImageViewAppearance");
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (CKDetailsDownloadAttachmentsHeaderFooterViewDelegate)delegate
{
  return (CKDetailsDownloadAttachmentsHeaderFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)downloadButtonTextColor
{
  return self->_downloadButtonTextColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (BOOL)logoHidden
{
  return self->_logoHidden;
}

- (UIImageView)iCloudImageView
{
  return self->_iCloudImageView;
}

- (void)setICloudImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudImageView, a3);
}

- (UITextView)titleTextView
{
  return self->_titleTextView;
}

- (void)setTitleTextView:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextView, a3);
}

- (UITextView)buttonTextView
{
  return self->_buttonTextView;
}

- (void)setButtonTextView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextView, a3);
}

- (NSLayoutConstraint)titleTextTopToLogoConstraint
{
  return self->_titleTextTopToLogoConstraint;
}

- (void)setTitleTextTopToLogoConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextTopToLogoConstraint, a3);
}

- (NSLayoutConstraint)titleTextTopToViewConstraint
{
  return self->_titleTextTopToViewConstraint;
}

- (void)setTitleTextTopToViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextTopToViewConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextTopToViewConstraint, 0);
  objc_storeStrong((id *)&self->_titleTextTopToLogoConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_iCloudImageView, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_downloadButtonTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
