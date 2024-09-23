@implementation ICDocCamSpinner

- (ICDocCamSpinner)initWithView:(id)a3 minimumDuration:(double)a4
{
  id v6;
  ICDocCamSpinner *v7;
  ICDocCamSpinner *v8;
  NSDate *showDate;
  uint64_t v10;
  UIActivityIndicatorView *activityIndicator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamSpinner;
  v7 = -[ICDocCamSpinner init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    showDate = v7->_showDate;
    v7->_showDate = 0;

    v8->_minimumDuration = a4;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v8->_activityIndicator;
    v8->_activityIndicator = (UIActivityIndicatorView *)v10;

    -[UIActivityIndicatorView setHidden:](v8->_activityIndicator, "setHidden:", 1);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v8->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v8->_activityIndicator);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView centerXAnchor](v8->_activityIndicator, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

    -[UIActivityIndicatorView centerYAnchor](v8->_activityIndicator, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v12);
  }

  return v8;
}

- (void)show
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamSpinner setShowDate:](self, "setShowDate:", v3);

  -[ICDocCamSpinner animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICDocCamSpinner animator](self, "animator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimation:", 0);

    -[ICDocCamSpinner animator](self, "animator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishAnimationAtPosition:", 0);

    -[ICDocCamSpinner setAnimator:](self, "setAnimator:", 0);
  }
  -[ICDocCamSpinner activityIndicator](self, "activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAnimating");

  if ((v8 & 1) == 0)
  {
    -[ICDocCamSpinner activityIndicator](self, "activityIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[ICDocCamSpinner activityIndicator](self, "activityIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

    objc_initWeak(&location, self);
    v11 = objc_alloc(MEMORY[0x24BDF6FA8]);
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __23__ICDocCamSpinner_show__block_invoke;
    v18[3] = &unk_24C5B7CE0;
    objc_copyWeak(&v19, &location);
    v13 = (void *)objc_msgSend(v11, "initWithDuration:curve:animations:", 0, v18, 0.25);
    -[ICDocCamSpinner setAnimator:](self, "setAnimator:", v13);

    -[ICDocCamSpinner animator](self, "animator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __23__ICDocCamSpinner_show__block_invoke_2;
    v16[3] = &unk_24C5B8668;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v14, "addCompletion:", v16);

    -[ICDocCamSpinner animator](self, "animator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAnimation");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __23__ICDocCamSpinner_show__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __23__ICDocCamSpinner_show__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startAnimating");

}

- (void)hide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  -[ICDocCamSpinner animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDocCamSpinner animator](self, "animator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimation:", 0);

    -[ICDocCamSpinner animator](self, "animator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishAnimationAtPosition:", 0);

    -[ICDocCamSpinner setAnimator:](self, "setAnimator:", 0);
  }
  -[ICDocCamSpinner activityIndicator](self, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAnimating");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamSpinner showDate](self, "showDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    -[ICDocCamSpinner minimumDuration](self, "minimumDuration");
    v12 = 0.0;
    if (v11 < v13)
    {
      -[ICDocCamSpinner minimumDuration](self, "minimumDuration");
      v12 = v14 - v11;
    }
    objc_initWeak(&location, self);
    v15 = objc_alloc(MEMORY[0x24BDF6FA8]);
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __23__ICDocCamSpinner_hide__block_invoke;
    v22[3] = &unk_24C5B7CE0;
    objc_copyWeak(&v23, &location);
    v17 = (void *)objc_msgSend(v15, "initWithDuration:curve:animations:", 0, v22, 0.25);
    -[ICDocCamSpinner setAnimator:](self, "setAnimator:", v17);

    -[ICDocCamSpinner animator](self, "animator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __23__ICDocCamSpinner_hide__block_invoke_2;
    v20[3] = &unk_24C5B8668;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v18, "addCompletion:", v20);

    -[ICDocCamSpinner animator](self, "animator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startAnimationAfterDelay:", v12);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

void __23__ICDocCamSpinner_hide__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __23__ICDocCamSpinner_hide__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopAnimating");

}

- (NSDate)showDate
{
  return self->_showDate;
}

- (void)setShowDate:(id)a3
{
  objc_storeStrong((id *)&self->_showDate, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (double)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setMinimumDuration:(double)a3
{
  self->_minimumDuration = a3;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_showDate, 0);
}

@end
