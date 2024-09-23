@implementation SUUIMenuPopoverController

- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3
{
  return -[SUUIMenuPopoverController initWithMenuTitles:selectedIndex:](self, "initWithMenuTitles:selectedIndex:", a3, -1);
}

- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3 selectedIndex:(int64_t)a4
{
  id v6;
  SUUIMenuPopoverController *v7;
  SUUIMenuViewController *v8;
  SUUIMenuViewController *menuViewController;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMenuPopoverController;
  v7 = -[SUUIMenuPopoverController init](&v11, sel_init);
  if (v7)
  {
    v8 = -[SUUIMenuViewController initWithMenuTitles:]([SUUIMenuViewController alloc], "initWithMenuTitles:", v6);
    menuViewController = v7->_menuViewController;
    v7->_menuViewController = v8;

    -[SUUIMenuViewController setDelegate:](v7->_menuViewController, "setDelegate:", v7);
    -[SUUIMenuViewController setIndexOfCheckedTitle:](v7->_menuViewController, "setIndexOfCheckedTitle:", a4);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuPopoverController;
  -[SUUIMenuPopoverController dealloc](&v3, sel_dealloc);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIPopoverController *v5;

  v3 = a3;
  v5 = self->_popoverController;
  -[SUUIMenuPopoverController _destroyPopoverController](self, "_destroyPopoverController");
  -[UIPopoverController dismissPopoverAnimated:](v5, "dismissPopoverAnimated:", v3);

}

- (NSArray)menuTitles
{
  return -[SUUIMenuViewController menuTitles](self->_menuViewController, "menuTitles");
}

- (void)presentFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  double v14;
  UIPopoverController *v15;
  UIPopoverController *popoverController;
  id v17;

  if (!self->_popoverController)
  {
    v6 = a6;
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v17 = a4;
    -[SUUIMenuPopoverController menuTitles](self, "menuTitles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (float)((float)(unint64_t)objc_msgSend(v13, "count") * 45.0);

    -[SUUIMenuViewController setPreferredContentSize:](self->_menuViewController, "setPreferredContentSize:", 320.0, v14);
    v15 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD858]), "initWithContentViewController:", self->_menuViewController);
    popoverController = self->_popoverController;
    self->_popoverController = v15;

    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    -[UIPopoverController setPopoverContentSize:](self->_popoverController, "setPopoverContentSize:", 320.0, v14);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v17, a5, v6, x, y, width, height);

  }
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  SUUIMenuPopoverDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "menuPopover:didSelectMenuItemAtIndex:", self, a4);

  }
  -[SUUIMenuPopoverController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[SUUIMenuPopoverController _destroyPopoverController](self, "_destroyPopoverController", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "menuPopoverDidCancel:", self);

  }
}

- (void)popoverController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  SUUIMenuPopoverDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "menuPopover:willRepositionToRect:inView:", self, a4, a5);

  }
}

- (void)_destroyPopoverController
{
  SUUIMenuViewController *menuViewController;
  UIPopoverController *popoverController;

  -[SUUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  menuViewController = self->_menuViewController;
  self->_menuViewController = 0;

  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (SUUIMenuPopoverDelegate)delegate
{
  return (SUUIMenuPopoverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
