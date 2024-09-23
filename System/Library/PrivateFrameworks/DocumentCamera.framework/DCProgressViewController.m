@implementation DCProgressViewController

- (DCProgressViewController)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  DCProgressViewController *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)DCProgressViewController;
  v6 = -[DCProgressViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("DCProgressViewController"), v5);

  if (v6)
    -[DCProgressViewController setProgressDelegate:](v6, "setProgressDelegate:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DCProgressViewController;
  -[DCProgressViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCProgressViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[DCProgressViewController label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", CFSTR(" "));

  -[DCProgressViewController circularProgressView](self, "circularProgressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DCProgressViewController;
  -[DCProgressViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[DCProgressViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCProgressViewController;
  -[DCProgressViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[DCProgressViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[DCProgressViewController progressDelegate](self, "progressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismissProgressViewController:", self);

}

- (void)setObservedProgress:(id)a3
{
  NSProgress *v5;
  void *v6;
  NSProgress *observedProgress;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSProgress *v13;

  v5 = (NSProgress *)a3;
  if (self->_observedProgress != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_observedProgress, a3);
    -[DCProgressViewController circularProgressView](self, "circularProgressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObservedProgress:", v13);

    observedProgress = self->_observedProgress;
    -[DCProgressViewController activityIndicator](self, "activityIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (observedProgress)
    {
      objc_msgSend(v8, "setHidden:", 1);

      -[DCProgressViewController circularProgressView](self, "circularProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "setHidden:", 0);

      -[DCProgressViewController circularProgressView](self, "circularProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
    }
    objc_msgSend(v10, "setHidden:", v12);

    v5 = v13;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)showsCancel
{
  return self->_showsCancel;
}

- (void)setShowsCancel:(BOOL)a3
{
  self->_showsCancel = a3;
}

- (DCProgressViewControllerDelegate)progressDelegate
{
  return (DCProgressViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_progressDelegate);
}

- (void)setProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_progressDelegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (DCCircularProgressView)circularProgressView
{
  return self->_circularProgressView;
}

- (void)setCircularProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_circularProgressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularProgressView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end
