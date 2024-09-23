@implementation MCActivityViewController

- (MCActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MCActivityViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCActivityViewController;
  result = -[MCActivityViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_isInProgress = 1;
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MCActivityViewController;
  -[MCActivityViewController loadView](&v13, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[MCActivityViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController spinnerView](self, "spinnerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[MCActivityViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[MCActivityViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController completionIconImageView](self, "completionIconImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[MCActivityViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController longWaitingWarningLabel](self, "longWaitingWarningLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCActivityViewController;
  -[MCActivityViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[MCActivityViewController isInProgress](self, "isInProgress"))
  {
    -[MCActivityViewController spinnerView](self, "spinnerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimating");

    -[MCActivityViewController _scheduleLongWaitingWarning](self, "_scheduleLongWaitingWarning");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  void *v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v37.receiver = self;
  v37.super_class = (Class)MCActivityViewController;
  -[MCActivityViewController viewDidLayoutSubviews](&v37, sel_viewDidLayoutSubviews);
  -[MCActivityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;
  -[MCActivityViewController spinnerView](self, "spinnerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v5, v7);

  -[MCActivityViewController spinnerView](self, "spinnerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[MCActivityViewController completionIconImageView](self, "completionIconImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[MCActivityViewController textLabel](self, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  objc_msgSend(v19, "sizeThatFits:", CGRectGetWidth(v38) + -16.0, 1.79769313e308);
  v22 = v21;

  -[MCActivityViewController spinnerView](self, "spinnerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = CGRectGetMaxY(v39) + 8.0;
  -[MCActivityViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v26 = CGRectGetWidth(v40) + -16.0;
  -[MCActivityViewController textLabel](self, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", 8.0, v24, v26, v22);

  -[MCActivityViewController longWaitingWarningLabel](self, "longWaitingWarningLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  objc_msgSend(v28, "sizeThatFits:", CGRectGetWidth(v41) + -16.0, 1.79769313e308);
  v31 = v30;

  -[MCActivityViewController textLabel](self, "textLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v33 = CGRectGetMaxY(v42) + 8.0;
  -[MCActivityViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetWidth(v43) + -16.0;
  -[MCActivityViewController longWaitingWarningLabel](self, "longWaitingWarningLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", 8.0, v33, v35, v31);

}

- (void)completeActivityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];

  v3 = a3;
  -[MCActivityViewController setIsInProgress:](self, "setIsInProgress:", 0);
  v5 = 0.200000003;
  if (!v3)
    v5 = 0.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MCActivityViewController_completeActivityAnimated___block_invoke;
  v6[3] = &unk_1EA2B5BC0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, v5);
}

void __53__MCActivityViewController_completeActivityAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "spinnerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 32), "completionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(*(id *)(a1 + 32), "completionIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

}

- (void)setInProgresText:(id)a3
{
  NSString *v4;
  NSString *inProgresText;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_inProgresText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    inProgresText = self->_inProgresText;
    self->_inProgresText = v4;

  }
  if (-[MCActivityViewController isInProgress](self, "isInProgress"))
  {
    v6 = self->_inProgresText;
    -[MCActivityViewController textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)setIsInProgress:(BOOL)a3
{
  id v3;

  self->_isInProgress = a3;
  if (!a3)
  {
    -[MCActivityViewController longWaitingWarningLabel](self, "longWaitingWarningLabel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

- (void)setCompletionText:(id)a3
{
  NSString *v4;
  NSString *completionText;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_completionText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    completionText = self->_completionText;
    self->_completionText = v4;

  }
  if (!-[MCActivityViewController isInProgress](self, "isInProgress"))
  {
    v6 = self->_completionText;
    -[MCActivityViewController textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (UIActivityIndicatorView)spinnerView
{
  UIActivityIndicatorView *spinnerView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  spinnerView = self->_spinnerView;
  if (!spinnerView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_spinnerView;
    self->_spinnerView = v4;

    spinnerView = self->_spinnerView;
  }
  return spinnerView;
}

- (UIImageView)completionIconImageView
{
  UIImageView *completionIconImageView;
  id v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;

  completionIconImageView = self->_completionIconImageView;
  if (!completionIconImageView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "DMCProfileVerifiedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    -[UIImageView image](v6, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v6, "setImage:", v9);

    -[UIImageView setContentMode:](v6, "setContentMode:", 1);
    -[UIImageView setAlpha:](v6, "setAlpha:", 0.0);
    v10 = self->_completionIconImageView;
    self->_completionIconImageView = v6;

    completionIconImageView = self->_completionIconImageView;
  }
  return completionIconImageView;
}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (UILabel)longWaitingWarningLabel
{
  UILabel *longWaitingWarningLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  longWaitingWarningLabel = self->_longWaitingWarningLabel;
  if (!longWaitingWarningLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v5 = self->_longWaitingWarningLabel;
    self->_longWaitingWarningLabel = v4;

    -[UILabel setLineBreakMode:](self->_longWaitingWarningLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_longWaitingWarningLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_longWaitingWarningLabel, "setTextAlignment:", 1);
    v6 = self->_longWaitingWarningLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setHidden:](self->_longWaitingWarningLabel, "setHidden:", 1);
    longWaitingWarningLabel = self->_longWaitingWarningLabel;
  }
  return longWaitingWarningLabel;
}

- (void)_scheduleLongWaitingWarning
{
  double v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[MCActivityViewController longWaitingWarningThreshold](self, "longWaitingWarningThreshold");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MCActivityViewController__scheduleLongWaitingWarning__block_invoke;
  v5[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__MCActivityViewController__scheduleLongWaitingWarning__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isInProgress");
    v2 = v8;
    if (v3)
    {
      objc_msgSend(v8, "longWaitingWarningText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "longWaitingWarningLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v4);

      objc_msgSend(v8, "longWaitingWarningLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 0);

      objc_msgSend(v8, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

      v2 = v8;
    }
  }

}

- (NSString)inProgresText
{
  return self->_inProgresText;
}

- (NSString)completionText
{
  return self->_completionText;
}

- (NSString)longWaitingWarningText
{
  return self->_longWaitingWarningText;
}

- (void)setLongWaitingWarningText:(id)a3
{
  objc_storeStrong((id *)&self->_longWaitingWarningText, a3);
}

- (double)longWaitingWarningThreshold
{
  return self->_longWaitingWarningThreshold;
}

- (void)setLongWaitingWarningThreshold:(double)a3
{
  self->_longWaitingWarningThreshold = a3;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (void)setCompletionIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_completionIconImageView, a3);
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void)setLongWaitingWarningLabel:(id)a3
{
  objc_storeStrong((id *)&self->_longWaitingWarningLabel, a3);
}

- (BOOL)isInProgress
{
  return self->_isInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longWaitingWarningLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_completionIconImageView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_longWaitingWarningText, 0);
  objc_storeStrong((id *)&self->_completionText, 0);
  objc_storeStrong((id *)&self->_inProgresText, 0);
}

@end
