@implementation HSPCPasscodeEntryViewController

- (HSPCPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  HSPCPasscodeEntryViewController *v6;

  v5 = objc_msgSend(objc_alloc((Class)PRXCardContentView), "initWithCardStyle:", 1);
  v6 = -[HSPCPasscodeEntryViewController initWithContentView:](self, "initWithContentView:", v5);

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryViewController;
  -[HSPCPasscodeEntryViewController viewDidLoad](&v3, "viewDidLoad");
  -[HSPCPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCPasscodeEntryViewController;
  -[HSPCPasscodeEntryViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[HSPCPasscodeEntryView becomeFirstResponder](self->_passcodeEntryView, "becomeFirstResponder");
}

- (void)setNumberOfDigits:(int64_t)a3
{
  if (self->_numberOfDigits != a3)
  {
    self->_numberOfDigits = a3;
    -[HSPCPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }
}

- (void)setUseMonospacedFont:(BOOL)a3
{
  if (self->_useMonospacedFont != a3)
  {
    self->_useMonospacedFont = a3;
    -[HSPCPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }
}

- (void)setImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[HSPCPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }

}

- (void)setFootnote:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *footnote;
  id v6;

  v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_footnote, "isEqualToAttributedString:"))
  {
    v4 = (NSAttributedString *)objc_msgSend(v6, "copy");
    footnote = self->_footnote;
    self->_footnote = v4;

    -[HSPCPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }

}

- (void)_updatePasscodeEntryView
{
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  PRXImageView *v6;
  PRXImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HSPCPasscodeEntryView *v18;
  int64_t numberOfDigits;
  HSPCPasscodeEntryView *v20;
  HSPCPasscodeEntryView *passcodeEntryView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PRXImageView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PRXLabel *v37;
  PRXLabel *footnoteLabel;
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
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  _QWORD v61[2];
  void *v62;
  _QWORD v63[2];
  _QWORD v64[3];

  if (-[HSPCPasscodeEntryViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainContentGuide"));

    -[PRXImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    v5 = &AMSLookupKeyProfileLockup_ptr;
    v56 = v4;
    if (self->_image)
    {
      v6 = (PRXImageView *)objc_claimAutoreleasedReturnValue(+[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", 0));
      imageView = self->_imageView;
      self->_imageView = v6;

      -[PRXImageView setImage:](self->_imageView, "setImage:", self->_image);
      -[PRXImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", self->_imageView);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PRXImageView centerXAnchor](self->_imageView, "centerXAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
      v64[0] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRXImageView topAnchor](self->_imageView, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13));
      v64[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRXImageView heightAnchor](self->_imageView, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 50.0));
      v64[2] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      v4 = v56;
      v5 = &AMSLookupKeyProfileLockup_ptr;

    }
    -[HSPCPasscodeEntryView removeFromSuperview](self->_passcodeEntryView, "removeFromSuperview");
    v18 = [HSPCPasscodeEntryView alloc];
    if (self->_numberOfDigits)
      numberOfDigits = self->_numberOfDigits;
    else
      numberOfDigits = 4;
    v20 = -[HSPCPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](v18, "initWithNumberOfDigits:useMonospacedFont:delegate:", numberOfDigits, self->_useMonospacedFont, self);
    passcodeEntryView = self->_passcodeEntryView;
    self->_passcodeEntryView = v20;

    -[HSPCPasscodeEntryView setSemanticContentAttribute:](self->_passcodeEntryView, "setSemanticContentAttribute:", 3);
    -[HSPCPasscodeEntryView setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeEntryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HSPCPasscodeEntryView addTarget:action:forControlEvents:](self->_passcodeEntryView, "addTarget:action:forControlEvents:", self, "_textDidChange:", 4096);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
    objc_msgSend(v22, "addSubview:", self->_passcodeEntryView);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView leadingAnchor](self->_passcodeEntryView, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24));
    v63[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView centerXAnchor](self->_passcodeEntryView, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v63[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[252], "arrayWithObjects:count:", v63, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v30 = self->_imageView;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView topAnchor](self->_passcodeEntryView, "topAnchor"));
    if (v30)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PRXImageView bottomAnchor](self->_imageView, "bottomAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 20.0));
      v62 = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32));
      v61[0] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView centerYAnchor](self->_passcodeEntryView, "centerYAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerYAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v57));
      v61[1] = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

    }
    -[PRXLabel removeFromSuperview](self->_footnoteLabel, "removeFromSuperview");
    if (self->_footnote)
    {
      v37 = (PRXLabel *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3));
      footnoteLabel = self->_footnoteLabel;
      self->_footnoteLabel = v37;

      -[PRXLabel setAttributedText:](self->_footnoteLabel, "setAttributedText:", self->_footnote);
      -[PRXLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_footnoteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
      objc_msgSend(v39, "addSubview:", self->_footnoteLabel);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[PRXLabel leadingAnchor](self->_footnoteLabel, "leadingAnchor"));
      v40 = v56;
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v54));
      v60[0] = v52;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PRXLabel trailingAnchor](self->_footnoteLabel, "trailingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v55));
      v60[1] = v53;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PRXLabel topAnchor](self->_footnoteLabel, "topAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView bottomAnchor](self->_passcodeEntryView, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 10.0));
      v60[2] = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PRXLabel bottomAnchor](self->_footnoteLabel, "bottomAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v46, 10.0));
      v60[3] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

      v49 = (void *)v52;
      v50 = (void *)v54;

      v51 = v58;
    }
    else
    {
      v40 = v56;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView bottomAnchor](self->_passcodeEntryView, "bottomAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 10.0));
      v59 = v49;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);
    }

  }
}

- (void)_textDidChange:(id)a3
{
  void (**textChangeHandler)(id, void *);
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**textEntryCompletionHandler)(id, void *);
  void *v10;
  id v11;

  v11 = a3;
  -[HSPCPasscodeEntryViewController textDidChange:](self, "textDidChange:");
  textChangeHandler = (void (**)(id, void *))self->_textChangeHandler;
  if (textChangeHandler)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
    textChangeHandler[2](textChangeHandler, v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v11, "numberOfDigits");

  if (v7 == v8)
  {
    -[HSPCPasscodeEntryViewController didCompleteTextEntry:](self, "didCompleteTextEntry:", v11);
    textEntryCompletionHandler = (void (**)(id, void *))self->_textEntryCompletionHandler;
    if (textEntryCompletionHandler)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      textEntryCompletionHandler[2](textEntryCompletionHandler, v10);

    }
  }

}

- (void)_scrollToWells
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (-[HSPCPasscodeEntryView isFirstResponder](self->_passcodeEntryView, "isFirstResponder"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryViewController contentView](self, "contentView"));
    objc_msgSend(v7, "frame");
    v9 = v6 - v8;
    -[HSPCPasscodeEntryView frame](self->_passcodeEntryView, "frame");
    v11 = v10;

    -[HSPCPasscodeEntryView frame](self->_passcodeEntryView, "frame");
    if (v11 - v9 + v12 + 4.0 > 0.0)
      -[HSPCPasscodeEntryViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HSPCPasscodeEntryViewController;
  v7 = a4;
  -[HSPCPasscodeEntryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033D90;
  v8[3] = &unk_1000A25E0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)passcodeEntryViewDidBecomeFirstResponder:(id)a3
{
  if (self->_passcodeEntryView == a3)
    -[HSPCPasscodeEntryViewController _scrollToWells](self, "_scrollToWells");
}

- (HSPCPasscodeEntryView)passcodeEntryView
{
  return self->_passcodeEntryView;
}

- (int64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (PRXImageView)imageView
{
  return self->_imageView;
}

- (PRXLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (id)textChangeHandler
{
  return self->_textChangeHandler;
}

- (void)setTextChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)textEntryCompletionHandler
{
  return self->_textEntryCompletionHandler;
}

- (void)setTextEntryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIImage)image
{
  return self->_image;
}

- (NSAttributedString)footnote
{
  return self->_footnote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_textEntryCompletionHandler, 0);
  objc_storeStrong(&self->_textChangeHandler, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_passcodeEntryView, 0);
}

@end
