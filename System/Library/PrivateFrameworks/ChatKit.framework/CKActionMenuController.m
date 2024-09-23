@implementation CKActionMenuController

- (void)dealloc
{
  objc_super v3;

  -[CKActionMenuView setActionMenuController:](self->_actionMenuView, "setActionMenuController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKActionMenuController;
  -[CKActionMenuController dealloc](&v3, sel_dealloc);
}

- (CKActionMenuController)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5
{
  id v8;
  CKActionMenuController *v9;
  CKActionMenuController *v10;
  CKActionMenuView *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKActionMenuController;
  v9 = -[CKActionMenuController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_shouldDismissOnTap = 1;
    v11 = -[CKActionMenuView initWithActionMenuItems:defaultActionIndex:blurEffectStyle:]([CKActionMenuView alloc], "initWithActionMenuItems:defaultActionIndex:blurEffectStyle:", v8, a4, a5);
    -[CKActionMenuController setActionMenuView:](v10, "setActionMenuView:", v11);
    -[CKActionMenuView setActionMenuController:](v11, "setActionMenuController:", v10);

  }
  return v10;
}

- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  -[CKActionMenuController actionMenuView](self, "actionMenuView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActionMenuItems:defaultActionIndex:animated:", v8, a4, v5);

}

- (NSArray)actionMenuItems
{
  void *v2;
  void *v3;

  -[CKActionMenuController actionMenuView](self, "actionMenuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isActionMenuVisible
{
  void *v3;
  void *v4;
  void *v5;

  +[CKActionMenuWindow sharedInstance](CKActionMenuWindow, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionMenuView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuController actionMenuView](self, "actionMenuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)presentActionMenuFromPoint:(CGPoint)a3 inView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v13 = a4;
  +[CKActionMenuWindow sharedInstance](CKActionMenuWindow, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CKActionMenuController actionMenuView](self, "actionMenuView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldDismissOnTap:", -[CKActionMenuController shouldDismissOnTap](self, "shouldDismissOnTap"));
    objc_msgSend(v13, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWindowScene:", v12);

    objc_msgSend(v9, "presentActionMenuView:fromPoint:inView:animated:", v10, v13, v5, x, y);
  }

}

- (void)dismissActionMenuAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (-[CKActionMenuController isActionMenuVisible](self, "isActionMenuVisible"))
  {
    +[CKActionMenuWindow sharedInstance](CKActionMenuWindow, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissActionMenuViewAnimated:", v3);

  }
}

- (CGRect)convertActionMenuFrameToView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[CKActionMenuController actionMenuView](self, "actionMenuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v5, "convertRect:toView:", v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unint64_t)defaultActionIndex
{
  return self->_defaultActionIndex;
}

- (CKActionMenuControllerDelegate)delegate
{
  return (CKActionMenuControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDismissOnTap
{
  return self->_shouldDismissOnTap;
}

- (void)setShouldDismissOnTap:(BOOL)a3
{
  self->_shouldDismissOnTap = a3;
}

- (CKActionMenuView)actionMenuView
{
  return self->_actionMenuView;
}

- (void)setActionMenuView:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
