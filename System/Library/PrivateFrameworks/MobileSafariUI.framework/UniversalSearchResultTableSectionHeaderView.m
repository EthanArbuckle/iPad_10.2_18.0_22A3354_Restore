@implementation UniversalSearchResultTableSectionHeaderView

- (void)setReportProblemURL:(id)a3
{
  NSURL *v5;
  UIButton *feedbackButton;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSURL *v21;

  v5 = (NSURL *)a3;
  if (self->_reportProblemURL != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_reportProblemURL, a3);
    feedbackButton = self->_feedbackButton;
    if (self->_reportProblemURL)
    {
      if (!feedbackButton)
      {
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
        v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
        v8 = self->_feedbackButton;
        self->_feedbackButton = v7;

        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_feedbackButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v9 = self->_feedbackButton;
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("ParsecBugButton"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_flatImageWithColor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setImage:forState:](v9, "setImage:forState:", v12, 0);

        -[UIButton addTarget:action:forControlEvents:](self->_feedbackButton, "addTarget:action:forControlEvents:", self, sel__handleParsecFeedbackButtonTap_, 64);
      }
      -[UniversalSearchResultTableSectionHeaderView contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", self->_feedbackButton);
      v14 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings((NSString *)CFSTR("_feedbackButton"), self->_feedbackButton, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_feedbackButton(15)]-3-|"), 0, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConstraints:", v16);

      v17 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings((NSString *)CFSTR("_feedbackButton"), self->_feedbackButton, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_feedbackButton(15)]"), 0, 0, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConstraints:", v19);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_feedbackButton, 10, 0, v13, 10, 1.0, 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConstraint:", v20);

    }
    else
    {
      -[UIButton removeFromSuperview](feedbackButton, "removeFromSuperview");
    }
    v5 = v21;
  }

}

- (void)_handleParsecFeedbackButtonTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  objc_msgSend(WeakRetained, "feedbackButtonWasTappedWithProblemURL:", self->_reportProblemURL);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NSURL)reportProblemURL
{
  return self->_reportProblemURL;
}

- (UniversalSearchFeedbackDelegate)feedbackDelegate
{
  return (UniversalSearchFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_reportProblemURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
}

@end
