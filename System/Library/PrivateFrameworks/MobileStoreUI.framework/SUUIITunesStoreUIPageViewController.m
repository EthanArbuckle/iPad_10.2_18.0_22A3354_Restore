@implementation SUUIITunesStoreUIPageViewController

- (void)dealloc
{
  SUUIITunesStoreUIPageViewController *v3;
  objc_super v4;

  -[SUBarButtonItem target](self->_cancelButtonItem, "target");
  v3 = (SUUIITunesStoreUIPageViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[SUBarButtonItem setTarget:](self->_cancelButtonItem, "setTarget:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUIITunesStoreUIPageViewController;
  -[SUStorePageViewController dealloc](&v4, sel_dealloc);
}

- (void)handleFailureWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SUViewController isVisible](self, "isVisible"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIITunesStoreUIPageViewController;
    -[SUStorePageViewController handleFailureWithError:](&v5, sel_handleFailureWithError_, v4);
  }

}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  -[SUUIITunesStoreUIPageViewController productPageViewController](self, "productPageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "productPageStyle");

  if (v8 == 1)
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIITunesStoreUIPageViewController;
    v9 = -[SUViewController presentDialogForError:pendUntilVisible:](&v11, sel_presentDialogForError_pendUntilVisible_, v6, v4);
  }

  return v9;
}

- (void)resetNavigationItem:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIITunesStoreUIPageViewController;
  -[SUStorePageViewController resetNavigationItem:](&v5, sel_resetNavigationItem_, v4);
  if (-[SUUIITunesStoreUIPageViewController showsCancelButton](self, "showsCancelButton"))
    -[SUUIITunesStoreUIPageViewController _addCancelButtonToNavigationItem:](self, "_addCancelButtonToNavigationItem:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  if (-[SUUIITunesStoreUIPageViewController showsCancelButton](self, "showsCancelButton"))
  {
    -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIITunesStoreUIPageViewController _addCancelButtonToNavigationItem:](self, "_addCancelButtonToNavigationItem:", v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIITunesStoreUIPageViewController;
  -[SUUIITunesStoreUIPageViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)_addCancelButtonToNavigationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUUIITunesStoreUIPageViewController _cancelButtonItem](self, "_cancelButtonItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUViewController clientInterface](self, "clientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleBarButtonItem:", v7);

  objc_msgSend(v4, "setLeftBarButtonItem:animated:", v7, 0);
}

- (id)_cancelButtonItem
{
  SUBarButtonItem *v3;
  SUBarButtonItem *cancelButtonItem;
  SUBarButtonItem *v5;
  void *v6;
  void *v7;

  if (!self->_cancelButtonItem)
  {
    v3 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x24BEC8CE0]);
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v3;

    -[SUBarButtonItem setAction:](self->_cancelButtonItem, "setAction:", sel__storeSheetCancelButtonAction_);
    -[SUBarButtonItem setStyle:](self->_cancelButtonItem, "setStyle:", 2);
    -[SUBarButtonItem setTarget:](self->_cancelButtonItem, "setTarget:", self);
    v5 = self->_cancelButtonItem;
    if (self->_cancelButtonTitle)
    {
      -[SUBarButtonItem setTitle:](self->_cancelButtonItem, "setTitle:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLOSE_SHEET_BUTTON"), &stru_2511FF0C8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUBarButtonItem setTitle:](v5, "setTitle:", v7);

    }
  }
  return self->_cancelButtonItem;
}

- (void)_storeSheetCancelButtonAction:(id)a3
{
  id v3;

  -[SUUIITunesStoreUIPageViewController productPageViewController](self, "productPageViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendDidFinishWithResult:", 0);

}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1328);
}

- (SUProductPageViewController)productPageViewController
{
  return (SUProductPageViewController *)objc_loadWeakRetained((id *)&self->_productPageViewController);
}

- (void)setProductPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_productPageViewController, a3);
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  self->_showsCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productPageViewController);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
}

@end
