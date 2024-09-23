@implementation DSRemoteUIController

- (DSRemoteUIController)init
{
  void *v3;
  void *v4;
  DSRemoteUIController *v5;
  objc_super v7;

  DSUILocStringForKey(CFSTR("REMOTE_UI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("REMOTE_UI_DETAIL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DSRemoteUIController;
  v5 = -[DSRemoteUIController initWithTitle:detailText:icon:](&v7, sel_initWithTitle_detailText_icon_, v3, v4, 0);

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSRemoteUIController;
  -[OBBaseWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSRemoteUIController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, v4, sel_pushNextPane);

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
