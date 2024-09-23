@implementation CNContactListActionExecutor

- (CNContactListActionExecutor)initWithUndoManager:(id)a3
{
  id v5;
  CNContactListActionExecutor *v6;
  CNContactListActionExecutor *v7;
  CNContactListActionExecutor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListActionExecutor;
  v6 = -[CNContactListActionExecutor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_undoManager, a3);
    v8 = v7;
  }

  return v7;
}

- (void)executeAction:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:"))objc_msgSend(v4, "performAction");

}

- (void)executeUndoableAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNContactListActionExecutor undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerUndoWithTarget:selector:object:", self, sel_undoAction_, v5);

  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:", v5, 1))objc_msgSend(v5, "performAction");
}

- (void)undoAction:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:"))objc_msgSend(v4, "performUndoAction");

}

- (BOOL)showEditAuthorizationPaneForAction:(id)a3 withActionType:(int64_t)a4
{
  id v6;
  int v7;
  CNContactListActionAuthorizationContext *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "editRequiresAuthorization");
  if (v7)
  {
    v8 = objc_alloc_init(CNContactListActionAuthorizationContext);
    -[CNContactListActionExecutor setAuthorizationContext:](self, "setAuthorizationContext:", v8);

    -[CNContactListActionExecutor authorizationContext](self, "authorizationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAction:", v6);

    -[CNContactListActionExecutor authorizationContext](self, "authorizationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setType:", a4);

    -[CNContactListActionExecutor showEditAuthorizationPane:animated:forAction:](self, "showEditAuthorizationPane:animated:forAction:", self, 1, v6);
  }

  return v7;
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4 forAction:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CNUIEditAuthorizationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(CNUIEditAuthorizationController);
  -[CNContactListActionExecutor setEditAuthorizationController:](self, "setEditAuthorizationController:", v10);

  -[CNContactListActionExecutor editAuthorizationController](self, "editAuthorizationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[CNContactListActionExecutor editAuthorizationController](self, "editAuthorizationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSender:", v9);

  -[CNContactListActionExecutor editAuthorizationController](self, "editAuthorizationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimated:", v5);

  objc_msgSend(v8, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "presentingViewControllerForActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListActionExecutor editAuthorizationController](self, "editAuthorizationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGuardedViewController:", v15);

  -[CNContactListActionExecutor editAuthorizationController](self, "editAuthorizationController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAuthorizationUI");

}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNContactListActionExecutor setEditAuthorizationController:](self, "setEditAuthorizationController:", 0);
  if (a4 == 2)
  {
    -[CNContactListActionExecutor authorizationContext](self, "authorizationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 2)
    {
      -[CNContactListActionExecutor authorizationContext](self, "authorizationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDFE8320))
        v12 = v11;
      else
        v12 = 0;
      v8 = v12;

      if (v8)
        objc_msgSend(v8, "performUndoAction");
    }
    else
    {
      if (v7 != 1)
      {
LABEL_12:
        -[CNContactListActionExecutor setAuthorizationContext:](self, "setAuthorizationContext:", 0);
        return;
      }
      -[CNContactListActionExecutor authorizationContext](self, "authorizationContext");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performAction");

    }
    goto LABEL_12;
  }
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 8, 1);
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setEditAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationController, a3);
}

- (CNContactListActionAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setAuthorizationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end
