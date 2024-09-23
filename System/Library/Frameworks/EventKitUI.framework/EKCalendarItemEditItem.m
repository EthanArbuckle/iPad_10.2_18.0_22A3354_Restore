@implementation EKCalendarItemEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id obj;

  obj = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_calendarItem);

  if (WeakRetained != obj)
  {
    v8 = objc_storeWeak((id *)&self->_calendarItem, obj);

    if (!obj)
      -[EKCalendarItemEditItem reset](self, "reset");
  }
  v9 = objc_loadWeakRetained((id *)&self->_store);

  if (v9 != v6)
    objc_storeWeak((id *)&self->_store, v6);
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](self, "refreshFromCalendarItemAndStore");

}

- (id)calendarItem
{
  return objc_loadWeakRetained((id *)&self->_calendarItem);
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 0;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 0;
}

- (BOOL)shouldAppear
{
  return 1;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (double)footerHeightForWidth:(double)a3
{
  return 0.0;
}

- (id)footerView
{
  return 0;
}

- (id)footerTitle
{
  return 0;
}

- (id)headerTitle
{
  return 0;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)editor:(id)a3 requestsInjectableViewControllerToBeShownForSubitem:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  -[EKCalendarItemEditItem injectableViewControllerWithFrame:forSubitemAtIndex:](self, "injectableViewControllerWithFrame:forSubitemAtIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItemEditItem showViewController:editor:animated:](self, "showViewController:editor:animated:", v8, v6, 0);
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  -[EKCalendarItemEditItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItemEditItem showViewController:editor:animated:](self, "showViewController:editor:animated:", v8, v6, 1);
}

- (void)showViewController:(id)a3 editor:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  char v10;
  id WeakRetained;
  id v12;
  id v13;
  int v14;
  void *v15;
  EKUIManagedNavigationController *v16;
  id v17;
  EKUIManagedNavigationController *v18;
  void *v19;
  void *v20;
  _BOOL4 IsRegular;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id obj;

  v5 = a5;
  obj = a3;
  v8 = a4;
  if (obj)
  {
    v9 = objc_storeWeak((id *)&self->_viewController, obj);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(WeakRetained, "setEditDelegate:", self);

    }
    v12 = objc_loadWeakRetained((id *)&self->_viewController);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_viewController);
      v14 = objc_msgSend(v13, "presentModally");

      if (v14)
      {
        +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [EKUIManagedNavigationController alloc];
        v17 = objc_loadWeakRetained((id *)&self->_viewController);
        v18 = -[EKUIManagedNavigationController initWithRootViewController:](v16, "initWithRootViewController:", v17);

        objc_msgSend(v8, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v19))
        {
          objc_msgSend(v8, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          IsRegular = EKUICurrentHeightSizeClassIsRegular(v20);

          if (IsRegular)
            -[EKUIManagedNavigationController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 6);
        }
        else
        {

        }
        objc_msgSend(v8, "preferredContentSize");
        v27 = v26;
        v29 = v28;
        v30 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v30, "setPreferredContentSize:", v27, v29);

        objc_msgSend(v15, "presentViewController:animated:completion:", v18, v5, 0);
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    if (v5)
    {
      objc_msgSend(v22, "pushViewController:animated:", obj, 1);
    }
    else
    {
      objc_msgSend(v22, "viewControllers");
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v23);
      objc_msgSend(v24, "addObject:", obj);
      objc_msgSend(v8, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setViewControllers:animated:", v24, 0);

      v15 = (void *)v23;
    }
LABEL_15:

  }
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");

}

- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4
{
  return !-[EKCalendarItemEditItem usesDetailViewControllerForSubitem:](self, "usesDetailViewControllerForSubitem:", a4);
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return !-[EKCalendarItemEditItem isInline](self, "isInline", a3);
}

- (void)notifyDidStartEditing
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "editItemDidStartEditing:", self);

  }
}

- (void)notifyDidEndEditing
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "editItemDidEndEditing:", self);

  }
}

- (void)notifySubitemDidSave:(unint64_t)a3
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v7;
  _BOOL8 v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = -[EKCalendarItemEditItem usesDetailViewControllerForSubitem:](self, "usesDetailViewControllerForSubitem:", a3);
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "editItem:didSaveFromDetailViewController:", self, v8);

  }
}

- (void)notifyTextChanged
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "editItemTextChanged:", self);

  }
}

- (void)notifyRequiresHeightChange
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "editItemRequiresHeightChange:", self);

  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  _BOOL4 v3;
  EKEditItemViewControllerProtocol **p_viewController;
  id WeakRetained;
  id v6;

  v3 = a3;
  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  if (WeakRetained && v3)
  {
    v6 = objc_loadWeakRetained((id *)p_viewController);
    objc_msgSend(v6, "saveAndDismissWithExtremePrejudice");

  }
  return 1;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return 1;
}

- (void)editItemViewControllerWantsKeyboardPinned:(BOOL)a3
{
  _BOOL8 v3;
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "editItem:wantsKeyboardPinned:", self, v3);

  }
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  EKCalendarItemEditItemDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "editItemDidEndEditing:", self);

  }
  v14 = objc_loadWeakRetained((id *)&self->_viewController);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v14, "editItemShouldBeAskedForInjectableViewController"))
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "editItemWantsInjectableViewControllerToBeShown:", self);

    }
  }
  else
  {
    objc_storeWeak((id *)&self->_viewController, 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v14, "presentModally"))
  {
    objc_msgSend(v14, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    objc_msgSend(v14, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);
  }

}

- (BOOL)isInline
{
  return 0;
}

- (BOOL)shouldPinKeyboard
{
  return 1;
}

- (id)viewForActionSheet
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3
{
  return 0;
}

+ (double)scaledHeightOfSystemTableViewCell
{
  void *v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUIUnscaledCatalyst())
    v3 = EKUIUnscaledCatalystTableRowHeightDefault();
  else
    v3 = 44.0;
  objc_msgSend(v2, "_scaledValueForValue:", v3);
  CalRoundToScreenScale(v4);
  if (v5 >= v3)
    v3 = v5;

  return v3;
}

- (EKCalendarItemEditItemDelegate)delegate
{
  return (EKCalendarItemEditItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIResponder)selectedResponder
{
  return self->_selectedResponder;
}

- (void)setSelectedResponder:(id)a3
{
  objc_storeStrong((id *)&self->_selectedResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_calendarItem);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_store);
}

@end
