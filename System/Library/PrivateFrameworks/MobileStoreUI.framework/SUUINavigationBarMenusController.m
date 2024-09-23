@implementation SUUINavigationBarMenusController

- (SUUINavigationBarMenusController)initWithMenuViewElements:(id)a3
{
  id v4;
  SUUINavigationBarMenusController *v5;
  uint64_t v6;
  NSArray *menuViewElements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarMenusController;
  v5 = -[SUUINavigationBarMenusController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    menuViewElements = v5->_menuViewElements;
    v5->_menuViewElements = (NSArray *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUINavigationBarMenusView setButtonTarget:action:](self->_menusView, "setButtonTarget:action:", 0, 0);
  -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUINavigationBarMenusController;
  -[SUUINavigationBarSectionController dealloc](&v3, sel_dealloc);
}

- (void)reloadSectionViews
{
  void *v3;
  double v4;
  uint64_t v5;
  SUUINavigationBarMenusView *menusView;
  NSArray *menuViewElements;
  void *v8;
  objc_super v9;

  -[SUUINavigationBarSectionController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumNavigationBarWidth");
  v5 = (uint64_t)v4;

  menusView = self->_menusView;
  menuViewElements = self->_menuViewElements;
  -[SUUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationBarMenusView reloadWithMenus:width:context:](menusView, "reloadWithMenus:width:context:", menuViewElements, v5, v8);

  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarMenusController;
  -[SUUINavigationBarSectionController reloadSectionViews](&v9, sel_reloadSectionViews);
}

- (id)view
{
  SUUINavigationBarMenusView *menusView;
  SUUINavigationBarMenusView *v4;
  SUUINavigationBarMenusView *v5;
  SUUINavigationBarMenusView *v6;
  void *v7;

  menusView = self->_menusView;
  if (!menusView)
  {
    v4 = objc_alloc_init(SUUINavigationBarMenusView);
    v5 = self->_menusView;
    self->_menusView = v4;

    v6 = self->_menusView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewReuseView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUINavigationBarMenusView setButtonTarget:action:](self->_menusView, "setButtonTarget:action:", self, sel__menuButtonAction_);
    -[SUUINavigationBarMenusView setContentInset:](self->_menusView, "setContentInset:", 1.0, 20.0, 0.0, 20.0);
    menusView = self->_menusView;
  }
  return menusView;
}

- (void)willAppearInNavigationBar
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  objc_super v7;

  -[SUUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationBarSectionController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumNavigationBarWidth");
  v6 = (uint64_t)v5;

  +[SUUINavigationBarMenusView requestLayoutWithMenus:width:context:](SUUINavigationBarMenusView, "requestLayoutWithMenus:width:context:", self->_menuViewElements, v6, v3);
  v7.receiver = self;
  v7.super_class = (Class)SUUINavigationBarMenusController;
  -[SUUINavigationBarSectionController willAppearInNavigationBar](&v7, sel_willAppearInNavigationBar);

}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  id v6;

  -[SUUINavigationBarMenusController _menuViewElementForView:](self, "_menuViewElementForView:", self->_focusedMenuButton);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchEventOfType:forItemAtIndex:", 2, a4);
  -[SUUINavigationBarMenusController _destroyPopover](self, "_destroyPopover");

}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[UIControl frame](self->_focusedMenuButton, "frame", a3, a4, a5);
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)_menuButtonAction:(id)a3
{
  SUUIMenuPopoverController *popoverController;
  UIControl *focusedMenuButton;
  SUUIMenuPopoverController *v7;
  void *v8;
  SUUIMenuPopoverController *v9;
  void *v10;
  SUUIMenuPopoverController *v11;
  SUUIMenuPopoverController *v12;
  SUUIMenuPopoverController *v13;
  id v14;

  v14 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    -[SUUIMenuPopoverController setDelegate:](popoverController, "setDelegate:", 0);
    -[SUUIMenuPopoverController dismissAnimated:](self->_popoverController, "dismissAnimated:", 1);
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    v7 = self->_popoverController;
    self->_popoverController = 0;

  }
  -[SUUINavigationBarMenusController _menuViewElementForView:](self, "_menuViewElementForView:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    v9 = [SUUIMenuPopoverController alloc];
    objc_msgSend(v8, "menuItemTitles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUUIMenuPopoverController initWithMenuTitles:selectedIndex:](v9, "initWithMenuTitles:selectedIndex:", v10, objc_msgSend(v8, "selectedItemIndex"));
    v12 = self->_popoverController;
    self->_popoverController = v11;

    -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    v13 = self->_popoverController;
    -[UIControl frame](self->_focusedMenuButton, "frame");
    -[SUUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v13, "presentFromRect:inView:permittedArrowDirections:animated:", self->_menusView, 15, 1);
  }

}

- (void)_destroyPopover
{
  UIControl *focusedMenuButton;
  SUUIMenuPopoverController *popoverController;

  -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (id)_menuViewElementForView:(id)a3
{
  SUUINavigationBarMenusView *menusView;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  menusView = self->_menusView;
  v5 = a3;
  -[SUUIViewReuseView allExistingViews](menusView, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_menuViewElements, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewElements, 0);
  objc_storeStrong((id *)&self->_menusView, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
}

@end
