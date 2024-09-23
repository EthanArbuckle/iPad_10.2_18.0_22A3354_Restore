@implementation EKEventDetailItem

- (void)dealloc
{
  objc_super v3;

  -[EKUIRecurrenceAlertController cancelAnimated:](self->_recurrenceAlertController, "cancelAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailItem;
  -[EKEventDetailItem dealloc](&v3, sel_dealloc);
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  REMReminder *v9;
  EKEventStore *v10;
  EKEventStore *store;
  EKEvent *v12;

  v12 = (EKEvent *)a3;
  v9 = (REMReminder *)a4;
  v10 = (EKEventStore *)a5;
  if (self->_event != v12 || self->_reminder != v9)
  {
    objc_storeStrong((id *)&self->_event, a3);
    objc_storeStrong((id *)&self->_reminder, a4);
    if ((unint64_t)v9 | (unint64_t)self->_event)
      -[EKEventDetailItem reset](self, "reset");
  }
  -[EKEventDetailItem setAllowsEditing:](self, "setAllowsEditing:", 0);
  store = self->_store;
  self->_store = v10;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;

  -[EKEventDetailItem defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:](self, "defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:", a3, 1, a4);
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E0DC53D8];
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)layoutCellsForWidth:(double)a3 position:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  if (-[EKEventDetailItem numberOfSubitems](self, "numberOfSubitems"))
  {
    v7 = 0;
    do
    {
      -[EKEventDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "layoutForWidth:position:", v4, a3);

      ++v7;
    }
    while (-[EKEventDetailItem numberOfSubitems](self, "numberOfSubitems") > v7);
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[EKEventDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessoryType") == 1;

  return v4;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)infoDetailViewControllerWithFrame:(CGRect)a3
{
  return 0;
}

- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[EKEventDetailItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_storeStrong((id *)&self->_viewController, v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[EKEditItemViewControllerProtocol setEditDelegate:](self->_viewController, "setEditDelegate:", self);
    objc_msgSend(v9, "navigationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

  }
  if (-[EKEventDetailItem allowsEditing](self, "allowsEditing"))
    -[EKEventDetailItem notifyDidStartEditing](self, "notifyDidStartEditing");

}

- (void)eventViewControllerDidTapInfoButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[EKEventDetailItem infoDetailViewControllerWithFrame:](self, "infoDetailViewControllerWithFrame:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_storeStrong((id *)&self->_viewController, v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[EKEditItemViewControllerProtocol setEditDelegate:](self->_viewController, "setEditDelegate:", self);
    objc_msgSend(v7, "navigationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v5, 1);

  }
  if (-[EKEventDetailItem allowsEditing](self, "allowsEditing"))
    -[EKEventDetailItem notifyDidStartEditing](self, "notifyDidStartEditing");

}

- (void)notifyDidStartEditing
{
  EKEventDetailItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "eventItemDidStartEditing:", self);

  }
}

- (void)notifyDidEndEditing
{
  EKEventDetailItemDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "eventItemDidEndEditing:", self);

  }
}

- (void)notifySubitemDidSave:(unint64_t)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[EKEventDetailItem reset](self, "reset", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "eventItemDidSave:", self);

  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v4;

  if (self->_viewController)
    v4 = !a3;
  else
    v4 = 1;
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
    -[EKEditItemViewControllerProtocol saveAndDismissWithExtremePrejudice](self->_viewController, "saveAndDismissWithExtremePrejudice");
  return 1;
}

- (BOOL)isReadOnlyDelegateCalendar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[EKEvent calendar](self->_event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDelegate"))
  {
    -[EKEvent calendar](self->_event, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isWritable") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isPrivateEvent
{
  return -[EKEvent privacyLevel](self->_event, "privacyLevel") != 0;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return self->_event;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  EKEvent *v11;
  void *v12;
  uint64_t v13;
  EKEvent *event;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  EKEditItemViewControllerProtocol *viewController;
  id v23;

  v23 = a3;
  if (-[EKEvent hasChanges](self->_event, "hasChanges"))
  {
    -[EKEventDetailItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorForEventDetailItem:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0:
        -[EKEvent rollback](self->_event, "rollback");
        -[EKEventDetailItem reset](self, "reset");
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v10, "eventItemDidSave:", self);

        }
        break;
      case 2:
        if (-[EKEvent isOrWasPartOfRecurringSeries](self->_event, "isOrWasPartOfRecurringSeries")
          && -[EKEvent isExternallyOrganizedInvitation](self->_event, "isExternallyOrganizedInvitation"))
        {
          event = self->_event;
          v15 = v7;
          v16 = 0;
        }
        else
        {
          event = self->_event;
          v15 = v7;
          v16 = 1;
        }
        objc_msgSend(v15, "saveEvent:span:error:", event, v16, 0);
        break;
      case 3:
        v11 = self->_event;
        v12 = v7;
        v13 = 0;
        goto LABEL_11;
      case 4:
        v11 = self->_event;
        v12 = v7;
        v13 = 1;
        goto LABEL_11;
      case 5:
        v11 = self->_event;
        v12 = v7;
        v13 = 2;
LABEL_11:
        objc_msgSend(v12, "saveEvent:span:error:", v11, v13, 0);
        -[EKEventDetailItem notifyDidCommit](self, "notifyDidCommit");
        break;
      default:
        break;
    }

  }
  v17 = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v19, "eventItemDidEndEditing:", self);

  }
  if (objc_msgSend(v23, "modal"))
  {
    -[EKEditItemViewControllerProtocol navigationController](self->_viewController, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v20, "popViewControllerAnimated:", 1);

  }
  viewController = self->_viewController;
  self->_viewController = 0;

}

- (void)notifyDidCommit
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "eventItemDidCommit:", self);

}

- (BOOL)requiresLayoutForSubitemCount
{
  return 0;
}

- (BOOL)detailItemVisibilityChanged
{
  return 0;
}

- (EKEventDetailItemDelegate)delegate
{
  return (EKEventDetailItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (int)cellPosition
{
  return self->_cellPosition;
}

- (void)setCellPosition:(int)a3
{
  self->_cellPosition = a3;
}

- (BOOL)shouldIndent
{
  return self->_shouldIndent;
}

- (void)setShouldIndent:(BOOL)a3
{
  self->_shouldIndent = a3;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (EKUINavigationDelegateProvider)viewControllerToPresentFrom
{
  return (EKUINavigationDelegateProvider *)objc_loadWeakRetained((id *)&self->_viewControllerToPresentFrom);
}

- (void)setViewControllerToPresentFrom:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerToPresentFrom, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerToPresentFrom);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_lastEventUpdated, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
