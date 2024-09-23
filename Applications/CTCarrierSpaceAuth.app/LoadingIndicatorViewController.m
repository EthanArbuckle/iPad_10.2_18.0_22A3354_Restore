@implementation LoadingIndicatorViewController

- (LoadingIndicatorViewController)init
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  LoadingIndicatorViewController *v8;
  objc_super v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10.receiver = self;
  v10.super_class = (Class)LoadingIndicatorViewController;
  v8 = -[LoadingIndicatorViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", v5, v7);

  return v8;
}

- (LoadingIndicatorViewController)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  LoadingIndicatorViewController *v9;
  LoadingIndicatorViewController *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[LoadingIndicatorViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_titleText, a3);
    objc_storeStrong((id *)&v10->_messageText, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  NSString *titleText;
  void *v4;
  NSString *messageText;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LoadingIndicatorViewController;
  -[LoadingIndicatorViewController viewDidLoad](&v7, "viewDidLoad");
  titleText = self->_titleText;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingIndicatorViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", titleText);

  messageText = self->_messageText;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingIndicatorViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v6, "setText:", messageText);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LoadingIndicatorViewController;
  -[LoadingIndicatorViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);
  objc_msgSend(WeakRetained, "startAnimating");

}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);
  objc_msgSend(WeakRetained, "stopAnimating");

  v4.receiver = self;
  v4.super_class = (Class)LoadingIndicatorViewController;
  -[LoadingIndicatorViewController dealloc](&v4, "dealloc");
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_messageLabel);
}

- (void)setMessageLabel:(id)a3
{
  objc_storeWeak((id *)&self->_messageLabel, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinnerView);
}

- (void)setSpinnerView:(id)a3
{
  objc_storeWeak((id *)&self->_spinnerView, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_storeStrong((id *)&self->_messageText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_destroyWeak((id *)&self->_messageLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
}

@end
