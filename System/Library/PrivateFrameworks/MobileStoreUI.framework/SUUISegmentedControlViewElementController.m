@implementation SUUISegmentedControlViewElementController

- (SUUISegmentedControlViewElementController)initWithViewElement:(id)a3
{
  return -[SUUISegmentedControlViewElementController initWithViewElement:segmentedControl:](self, "initWithViewElement:segmentedControl:", a3, 0);
}

- (SUUISegmentedControlViewElementController)initWithViewElement:(id)a3 segmentedControl:(id)a4
{
  id v7;
  id v8;
  SUUISegmentedControlViewElementController *v9;
  SUUISegmentedControlViewElementController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUISegmentedControlViewElementController;
  v9 = -[SUUISegmentedControlViewElementController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_defaultMaximumNumberOfVisibleItems = -1;
    v9->_desiredSegmentWidth = 100.0;
    objc_storeStrong((id *)&v9->_viewElement, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_segmentedControl, a4);
      -[SUUISegmentedControlViewElementController _connectToSegmentedControl:](v10, "_connectToSegmentedControl:", v8);
    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[UIBarButtonItem setTarget:](self->_menuSheetCancelButtonItem, "setTarget:", 0);
  -[SUUIMenuViewController setDelegate:](self->_menuSheetViewController, "setDelegate:", 0);
  -[SUUIMenuPopoverController setDelegate:](self->_popoverMenuViewController, "setDelegate:", 0);
  -[SUUIFlexibleSegmentedControl setDelegate:](self->_segmentedControl, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUISegmentedControlViewElementController;
  -[SUUISegmentedControlViewElementController dealloc](&v3, sel_dealloc);
}

- (void)reloadAfterDocumentUpdate
{
  if (self->_segmentedControl)
  {
    if (-[SUUISegmentedControlViewElement updateType](self->_viewElement, "updateType"))
      -[SUUISegmentedControlViewElementController _connectToSegmentedControl:](self, "_connectToSegmentedControl:", self->_segmentedControl);
  }
}

- (void)setDefaultMaximumNumberOfVisibleItems:(int64_t)a3
{
  if (self->_defaultMaximumNumberOfVisibleItems != a3)
  {
    self->_defaultMaximumNumberOfVisibleItems = a3;
    -[SUUISegmentedControlViewElementController _reloadPropertiesForSegmentedControl:](self, "_reloadPropertiesForSegmentedControl:", self->_segmentedControl);
  }
}

- (void)setDesiredSegmentWidth:(double)a3
{
  if (self->_desiredSegmentWidth != a3)
  {
    self->_desiredSegmentWidth = a3;
    -[SUUIFlexibleSegmentedControl setDesiredSegmentWidth:](self->_segmentedControl, "setDesiredSegmentWidth:");
  }
}

- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4
{
  -[SUUISegmentedControlViewElement dispatchEventOfType:forItemAtIndex:](self->_viewElement, "dispatchEventOfType:forItemAtIndex:", 2, a4);
}

- (void)segmentedControl:(id)a3 showMoreListWithTitles:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    -[SUUISegmentedControlViewElementController _showPopoverMoreListWithTitles:](self, "_showPopoverMoreListWithTitles:", v6);
  }
  else
  {
    objc_msgSend(v8, "itemTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISegmentedControlViewElementController _showMoreListSheetWithTitles:selectedIndex:](self, "_showMoreListSheetWithTitles:selectedIndex:", v7, objc_msgSend(v8, "selectedSegmentIndex"));

  }
}

- (void)menuPopoverDidCancel:(id)a3
{
  -[SUUIFlexibleSegmentedControl cancelMoreList](self->_segmentedControl, "cancelMoreList", a3);
  -[SUUISegmentedControlViewElementController _destroyPopoverController](self, "_destroyPopoverController");
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  int64_t v5;

  v5 = -[SUUIFlexibleSegmentedControl moreListIndex](self->_segmentedControl, "moreListIndex", a3) + a4;
  -[SUUISegmentedControlViewElement dispatchEventOfType:forItemAtIndex:](self->_viewElement, "dispatchEventOfType:forItemAtIndex:", 2, v5);
  -[SUUIFlexibleSegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v5);
  -[SUUISegmentedControlViewElementController _destroyPopoverController](self, "_destroyPopoverController");
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[SUUIFlexibleSegmentedControl frameForSegmentWithIndex:](self->_segmentedControl, "frameForSegmentWithIndex:", -[SUUIFlexibleSegmentedControl moreListIndex](self->_segmentedControl, "moreListIndex", a3, a4, a5));
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  -[SUUISegmentedControlViewElement dispatchEventOfType:forItemAtIndex:](self->_viewElement, "dispatchEventOfType:forItemAtIndex:", 2);
  -[SUUIFlexibleSegmentedControl cancelMoreList](self->_segmentedControl, "cancelMoreList");
  -[SUUIFlexibleSegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", a4);
  -[SUUIMenuViewController dismissViewControllerAnimated:completion:](self->_menuSheetViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SUUISegmentedControlViewElementController _destroyMenuSheetViewController](self, "_destroyMenuSheetViewController");
}

- (void)_cancelMenuAction:(id)a3
{
  -[SUUIFlexibleSegmentedControl cancelMoreList](self->_segmentedControl, "cancelMoreList", a3);
  -[SUUIMenuViewController dismissViewControllerAnimated:completion:](self->_menuSheetViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SUUISegmentedControlViewElementController _destroyMenuSheetViewController](self, "_destroyMenuSheetViewController");
}

- (void)_connectToSegmentedControl:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setDesiredSegmentWidth:", self->_desiredSegmentWidth);
  -[SUUISegmentedControlViewElement segmentItemTitles](self->_viewElement, "segmentItemTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemTitles:", v4);

  -[SUUISegmentedControlViewElement moreListTitle](self->_viewElement, "moreListTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMoreListTitle:", v5);

  objc_msgSend(v8, "setSelectedSegmentIndex:", -[SUUISegmentedControlViewElement initialSelectedItemIndex](self->_viewElement, "initialSelectedItemIndex"));
  -[SUUISegmentedControlViewElement style](self->_viewElement, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  -[SUUISegmentedControlViewElementController _reloadPropertiesForSegmentedControl:](self, "_reloadPropertiesForSegmentedControl:", v8);
}

- (void)_destroyMenuSheetViewController
{
  SUUIMenuViewController *menuSheetViewController;
  UIBarButtonItem *menuSheetCancelButtonItem;

  -[SUUIMenuViewController setDelegate:](self->_menuSheetViewController, "setDelegate:", 0);
  -[SUUIMenuViewController dismissViewControllerAnimated:completion:](self->_menuSheetViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  menuSheetViewController = self->_menuSheetViewController;
  self->_menuSheetViewController = 0;

  -[UIBarButtonItem setTarget:](self->_menuSheetCancelButtonItem, "setTarget:", 0);
  menuSheetCancelButtonItem = self->_menuSheetCancelButtonItem;
  self->_menuSheetCancelButtonItem = 0;

}

- (void)_destroyPopoverController
{
  SUUIMenuPopoverController *popoverMenuViewController;

  -[SUUIMenuPopoverController setDelegate:](self->_popoverMenuViewController, "setDelegate:", 0);
  popoverMenuViewController = self->_popoverMenuViewController;
  self->_popoverMenuViewController = 0;

}

- (void)_reloadPropertiesForSegmentedControl:(id)a3
{
  int64_t defaultMaximumNumberOfVisibleItems;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  defaultMaximumNumberOfVisibleItems = -[SUUISegmentedControlViewElement maximumNumberOfVisibleItems](self->_viewElement, "maximumNumberOfVisibleItems");
  if (defaultMaximumNumberOfVisibleItems > 0
    || (defaultMaximumNumberOfVisibleItems = self->_defaultMaximumNumberOfVisibleItems,
        defaultMaximumNumberOfVisibleItems >= 1))
  {
    objc_msgSend(v8, "setMaximumNumberOfVisibleItems:", defaultMaximumNumberOfVisibleItems);
  }
  -[SUUISegmentedControlViewElement style](self->_viewElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForStyle:", CFSTR("itml-segmented-control-width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("full"));

  objc_msgSend(v8, "setSizesSegmentsToFitWidth:", v7);
}

- (id)_segmentedControl
{
  SUUIFlexibleSegmentedControl *segmentedControl;
  SUUIFlexibleSegmentedControl *v4;
  SUUIFlexibleSegmentedControl *v5;

  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = objc_alloc_init(SUUIFlexibleSegmentedControl);
    v5 = self->_segmentedControl;
    self->_segmentedControl = v4;

    -[SUUISegmentedControlViewElementController _connectToSegmentedControl:](self, "_connectToSegmentedControl:", self->_segmentedControl);
    segmentedControl = self->_segmentedControl;
  }
  return segmentedControl;
}

- (void)_showMoreListSheetWithTitles:(id)a3 selectedIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SUUIMenuViewController *v11;
  SUUIMenuViewController *menuSheetViewController;
  SUUIMenuViewController *v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *menuSheetCancelButtonItem;
  UIBarButtonItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  if (!self->_menuSheetViewController)
  {
    v6 = a3;
    -[SUUISegmentedControlViewElementController parentViewController](self, "parentViewController");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "barStyle");

    }
    else
    {
      v10 = 0;
    }
    v11 = -[SUUIMenuViewController initWithMenuTitles:]([SUUIMenuViewController alloc], "initWithMenuTitles:", v6);

    menuSheetViewController = self->_menuSheetViewController;
    self->_menuSheetViewController = v11;

    -[SUUIMenuViewController setDelegate:](self->_menuSheetViewController, "setDelegate:", self);
    -[SUUIMenuViewController setIndexOfCheckedTitle:](self->_menuSheetViewController, "setIndexOfCheckedTitle:", a4);
    v13 = self->_menuSheetViewController;
    -[SUUIFlexibleSegmentedControl moreListTitle](self->_segmentedControl, "moreListTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuViewController setTitle:](v13, "setTitle:", v14);

    if (v10 == 1)
      -[SUUIMenuViewController setMenuStyle:](self->_menuSheetViewController, "setMenuStyle:", 1);
    v15 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x24BEBD410]);
    menuSheetCancelButtonItem = self->_menuSheetCancelButtonItem;
    self->_menuSheetCancelButtonItem = v15;

    -[UIBarButtonItem setAction:](self->_menuSheetCancelButtonItem, "setAction:", sel__cancelMenuAction_);
    -[UIBarButtonItem setStyle:](self->_menuSheetCancelButtonItem, "setStyle:", 2);
    -[UIBarButtonItem setTarget:](self->_menuSheetCancelButtonItem, "setTarget:", self);
    v17 = self->_menuSheetCancelButtonItem;
    -[SUUISegmentedControlViewElementController clientContext](self, "clientContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "localizedStringForKey:", CFSTR("CANCEL"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANCEL"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](v17, "setTitle:", v20);

    -[SUUIMenuViewController navigationItem](self->_menuSheetViewController, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLeftBarButtonItem:", self->_menuSheetCancelButtonItem);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_menuSheetViewController);
    objc_msgSend(v22, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBarStyle:", v10);

    objc_msgSend(v22, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSemanticContentAttribute:", storeSemanticContentAttribute());

    objc_msgSend(v22, "navigationBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSemanticContentAttribute:", storeSemanticContentAttribute());

    objc_msgSend(v26, "presentViewController:animated:completion:", v22, 1, 0);
  }
}

- (void)_showPopoverMoreListWithTitles:(id)a3
{
  id v4;
  SUUIMenuPopoverController *v5;
  SUUIMenuPopoverController *popoverMenuViewController;

  if (!self->_popoverMenuViewController)
  {
    v4 = a3;
    v5 = -[SUUIMenuPopoverController initWithMenuTitles:]([SUUIMenuPopoverController alloc], "initWithMenuTitles:", v4);

    popoverMenuViewController = self->_popoverMenuViewController;
    self->_popoverMenuViewController = v5;

    -[SUUIMenuPopoverController setDelegate:](self->_popoverMenuViewController, "setDelegate:", self);
    -[SUUIFlexibleSegmentedControl frameForSegmentWithIndex:](self->_segmentedControl, "frameForSegmentWithIndex:", -[SUUIFlexibleSegmentedControl moreListIndex](self->_segmentedControl, "moreListIndex"));
    -[SUUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](self->_popoverMenuViewController, "presentFromRect:inView:permittedArrowDirections:animated:", self->_segmentedControl, 15, 1);
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (int64_t)defaultMaximumNumberOfVisibleItems
{
  return self->_defaultMaximumNumberOfVisibleItems;
}

- (double)desiredSegmentWidth
{
  return self->_desiredSegmentWidth;
}

- (SUUISegmentedControlViewElement)viewElement
{
  return self->_viewElement;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_popoverMenuViewController, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_menuSheetViewController, 0);
  objc_storeStrong((id *)&self->_menuSheetCancelButtonItem, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
