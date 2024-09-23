@implementation AAUINavigationItemSpinnerController

- (AAUINavigationItemSpinnerController)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4
{
  id v7;
  AAUINavigationItemSpinnerController *v8;
  AAUINavigationItemSpinnerController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUINavigationItemSpinnerController;
  v8 = -[AAUINavigationItemSpinnerController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navigationItem, a3);
    v9->_shouldHideBackButton = a4;
  }

  return v9;
}

- (void)startSpinning
{
  NSArray *v3;
  NSArray *rightBarItems;
  NSArray *v5;
  NSArray *leftBarItems;
  void *v7;
  void *v8;
  UINavigationItem *navigationItem;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[UINavigationItem rightBarButtonItems](self->_navigationItem, "rightBarButtonItems");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rightBarItems = self->_rightBarItems;
  self->_rightBarItems = v3;

  -[UINavigationItem leftBarButtonItems](self->_navigationItem, "leftBarButtonItems");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leftBarItems = self->_leftBarItems;
  self->_leftBarItems = v5;

  if (self->_shouldHideBackButton)
    self->_hidesBackButton = -[UINavigationItem hidesBackButton](self->_navigationItem, "hidesBackButton");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v7, "setHidesWhenStopped:", 1);
  objc_msgSend(v7, "startAnimating");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
  navigationItem = self->_navigationItem;
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setRightBarButtonItems:animated:](navigationItem, "setRightBarButtonItems:animated:", v10, 1);

  if (self->_shouldHideBackButton)
    -[UINavigationItem setHidesBackButton:animated:](self->_navigationItem, "setHidesBackButton:animated:", 1, 1);

}

- (void)stopSpinning
{
  -[UINavigationItem setLeftBarButtonItems:animated:](self->_navigationItem, "setLeftBarButtonItems:animated:", self->_leftBarItems, 1);
  -[UINavigationItem setRightBarButtonItems:animated:](self->_navigationItem, "setRightBarButtonItems:animated:", self->_rightBarItems, 1);
  if (self->_shouldHideBackButton)
    -[UINavigationItem setHidesBackButton:animated:](self->_navigationItem, "setHidesBackButton:animated:", self->_hidesBackButton, 1);
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (void)setNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarItems, 0);
  objc_storeStrong((id *)&self->_leftBarItems, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
}

@end
