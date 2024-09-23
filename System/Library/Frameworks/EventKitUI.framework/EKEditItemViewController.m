@implementation EKEditItemViewController

+ (id)preferredViewControllerForPresentationsFromViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (objc_msgSend(v3, "definesPresentationContext"))
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(v3, "parentViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v6;
    if (!v6)
      v5 = v3;
  }

  return v5;
}

- (EKEditItemViewController)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  EKEditItemViewController *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)EKEditItemViewController;
  result = -[EKEditItemViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (result)
  {
    result->_initialFrame.origin.x = x;
    result->_initialFrame.origin.y = y;
    result->_modal = 0;
    result->_initialFrame.size.width = width;
    result->_initialFrame.size.height = height;
    result->_showsDoneButton = 1;
  }
  return result;
}

- (BOOL)hidesBottomBarWhenPushed
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEditItemViewController;
  -[EKEditItemViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!-[EKEditItemViewController fitsPopoverWhenKeyboardActive](self, "fitsPopoverWhenKeyboardActive"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
    objc_msgSend(WeakRetained, "editItemViewControllerWantsKeyboardPinned:", 0);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEditItemViewController;
  -[EKEditItemViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->_modal && self->_showsDoneButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[EKEditItemViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveAndDismiss);
    -[EKEditItemViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKEditItemViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEditItemViewController;
  -[EKEditItemViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (!self->_modal)
  {
    -[EKEditItemViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self);

    if ((v6 & 1) == 0)
      -[EKEditItemViewController saveAndDismissWithExtremePrejudice](self, "saveAndDismissWithExtremePrejudice");
  }
}

- (void)cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
  objc_msgSend(WeakRetained, "editItemViewController:didCompleteWithAction:", self, 0);

}

- (void)_saveAndDismissWithForce:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__EKEditItemViewController__saveAndDismissWithForce___block_invoke;
  v3[3] = &unk_1E60197C0;
  v3[4] = self;
  -[EKEditItemViewController validateAllowingAlert:callback:](self, "validateAllowingAlert:callback:", !a3, v3);
}

uint64_t __53__EKEditItemViewController__saveAndDismissWithForce___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveAndDismissWithForce:success:", a2, a3);
}

- (void)_saveAndDismissWithForce:(BOOL)a3 success:(BOOL)a4
{
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  EKUIRecurrenceAlertController *v26;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];

  if (!a4)
  {
    if (!a3)
      return;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v9 = 1;
    if (!a3)
      goto LABEL_10;
LABEL_8:
    v10 = objc_loadWeakRetained((id *)&self->_editDelegate);
    v11 = objc_msgSend(v10, "editItemViewControllerShouldShowDetachAlert");

    if (v11)
    {
      -[EKEditItemViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEditItemViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = objc_loadWeakRetained((id *)&self->_editDelegate);
      objc_msgSend(v24, "editItemEventToDetach");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __61__EKEditItemViewController__saveAndDismissWithForce_success___block_invoke;
      v31[3] = &unk_1E60197E8;
      v31[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, self, v13, v25, v31, v17, v19, v21, v23);
      v26 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v26;

      return;
    }
    v30 = objc_loadWeakRetained((id *)&self->_editDelegate);
    objc_msgSend(v30, "editItemViewController:didCompleteWithAction:", self, 2, v30);
    goto LABEL_14;
  }
  v8 = objc_loadWeakRetained((id *)&self->_editDelegate);
  v9 = objc_msgSend(v8, "editItemViewControllerSave:", self);

  if (a3)
    goto LABEL_8;
LABEL_10:
  if (v9)
  {
    v28 = objc_loadWeakRetained((id *)&self->_editDelegate);
    objc_msgSend(v28, "editItemViewController:didCompleteWithAction:", self, 1, v28);
LABEL_14:

  }
}

void __61__EKEditItemViewController__saveAndDismissWithForce_success___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;

  v3 = 0;
  switch(a2)
  {
    case 0:
      v3 = 3;
      goto LABEL_5;
    case 1:
      v3 = 4;
      goto LABEL_5;
    case 2:
      v3 = 5;
      goto LABEL_5;
    case 4:
    case 5:
      return;
    default:
LABEL_5:
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
      objc_msgSend(WeakRetained, "editItemViewController:didCompleteWithAction:", *(_QWORD *)(a1 + 32), v3);

      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 1024);
      *(_QWORD *)(v5 + 1024) = 0;

      return;
  }
}

- (void)saveAndDismiss
{
  -[EKEditItemViewController _saveAndDismissWithForce:](self, "_saveAndDismissWithForce:", 0);
}

- (void)saveAndDismissWithExtremePrejudice
{
  -[EKEditItemViewController _saveAndDismissWithForce:](self, "_saveAndDismissWithForce:", 1);
}

- (void)popIfNonModal
{
  id v2;
  id v3;

  if (!self->_modal)
  {
    -[EKEditItemViewController navigationController](self, "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  }
}

- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4
{
  (*((void (**)(id, BOOL, uint64_t))a4 + 2))(a4, !a3, 1);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)EKEditItemViewController;
  -[EKEditItemViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 IsRegularInViewHierarchy;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;

  -[EKEditItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  v5 = v4;
  v7 = v6;

  -[EKEditItemViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isToolbarHidden");

  if ((v9 & 1) == 0)
  {
    -[EKEditItemViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v7 = v7 + CGRectGetHeight(v17);

  }
  -[EKEditItemViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if (IsRegularInViewHierarchy)
  {
    if (v7 > 600.0)
      v7 = 600.0;
    v5 = EKUIContainedControllerIdealWidth();
  }
  v14 = v5;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)fitsPopoverWhenKeyboardActive
{
  return 1;
}

- (void)setCell:(id)a3 checked:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "accessoryType") == 3 || !objc_msgSend(v8, "accessoryType"))
  {
    if (v4)
      v5 = 3;
    else
      v5 = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryType:", v5);
    objc_msgSend(v8, "setAccessoryView:", 0);
    objc_msgSend(v8, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

  }
}

- (double)marginForTableView:(id)a3
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (EKEditItemViewControllerDelegate)editDelegate
{
  return (EKEditItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_editDelegate);
}

- (void)setEditDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editDelegate, a3);
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
}

- (void)setRemoteUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteUIDelegate, a3);
}

- (unint64_t)subitem
{
  return self->_subitem;
}

- (void)setSubitem:(unint64_t)a3
{
  self->_subitem = a3;
}

- (BOOL)modal
{
  return self->_modal;
}

- (void)setModal:(BOOL)a3
{
  self->_modal = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_destroyWeak((id *)&self->_editDelegate);
}

@end
