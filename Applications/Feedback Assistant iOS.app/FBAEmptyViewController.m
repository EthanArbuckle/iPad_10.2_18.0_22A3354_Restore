@implementation FBAEmptyViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBAEmptyViewController;
  -[FBAEmptyViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAEmptyViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAEmptyViewController contentUnavailableLabel](self, "contentUnavailableLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

}

- (UILabel)contentUnavailableLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_contentUnavailableLabel);
}

- (void)setContentUnavailableLabel:(id)a3
{
  objc_storeWeak((id *)&self->_contentUnavailableLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentUnavailableLabel);
}

@end
