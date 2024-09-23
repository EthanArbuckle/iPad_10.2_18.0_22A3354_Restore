@implementation IKAppTabBar

- (IKAppTabBar)initWithTabBarController:(id)a3
{
  id v4;
  IKAppTabBar *v5;
  IKAppTabBar *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKAppTabBar;
  v5 = -[IKAppTabBar init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (void)onSelect
{
  id v2;

  -[IKAppTabBar jsTabBar](self, "jsTabBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onSelect");

}

- (IKAppTabBarController)controller
{
  return (IKAppTabBarController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (IKJSTabBar)jsTabBar
{
  return (IKJSTabBar *)objc_loadWeakRetained((id *)&self->_jsTabBar);
}

- (void)setJsTabBar:(id)a3
{
  objc_storeWeak((id *)&self->_jsTabBar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsTabBar);
  objc_destroyWeak((id *)&self->_controller);
}

@end
