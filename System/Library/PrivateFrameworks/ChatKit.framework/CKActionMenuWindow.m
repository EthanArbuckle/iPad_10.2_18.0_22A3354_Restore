@implementation CKActionMenuWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CKActionMenuWindow *v5;
  CKActionMenuWindow *v6;
  CKActionMenuWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKActionMenuWindow;
  -[UIAutoRotatingWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKActionMenuWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  if ((-[CKActionMenuWindow isHidden](self, "isHidden", a3) & 1) != 0)
    return 1;
  -[CKActionMenuWindow rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_2 != -1)
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_162);
  return (id)sharedInstance_sSharedInstance_1;
}

void __36__CKActionMenuWindow_sharedInstance__block_invoke()
{
  CKActionMenuWindow *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v0 = [CKActionMenuWindow alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v2 = -[CKActionMenuWindow initWithFrame:](v0, "initWithFrame:");
  v3 = (void *)sharedInstance_sSharedInstance_1;
  sharedInstance_sSharedInstance_1 = v2;

  v4 = (void *)sharedInstance_sSharedInstance_1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionMenuWindowLevel");
  objc_msgSend(v4, "setWindowLevel:");

}

- (void)presentActionMenuView:(id)a3 fromPoint:(CGPoint)a4 inView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v43 = a3;
  v11 = a5;
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  -[CKActionMenuWindow setFrame:](self, "setFrame:");

  -[CKActionMenuWindow actionMenuView](self, "actionMenuView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v43)
  {
    objc_msgSend(v13, "removeFromSuperview");
    -[CKActionMenuWindow setActionMenuView:](self, "setActionMenuView:", v43);
    -[CKActionMenuWindow addSubview:](self, "addSubview:", v43);
    objc_msgSend(MEMORY[0x1E0CEABB8], "attemptRotationToDeviceOrientation");
  }
  -[CKActionMenuWindow bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statusBarFrame");
  v24 = v23;

  if (CKMainScreenScale_once_64 != -1)
    dispatch_once(&CKMainScreenScale_once_64, &__block_literal_global_53_0);
  v25 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
  v26 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0)
    v25 = 1.0;
  v27 = ceil(v25 * 4.0) / v25;
  v28 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0)
    v28 = 1.0;
  v29 = v24 + ceil(v28 * 4.0) / v28 * 0.5;
  if (v27 < v29)
    v27 = v29;
  v30 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0)
    v30 = 1.0;
  v31 = ceil(v30 * 4.0) / v30;
  v32 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0)
    v32 = 1.0;
  v33 = ceil(v32 * 4.0) / v32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_64 != 0.0)
    v26 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
  v34 = v15 + v31;
  v35 = v17 + v27;
  v36 = v19 - (v31 + ceil(v26 * 4.0) / v26);
  v37 = v21 - (v27 + v33);
  -[CKActionMenuWindow convertPoint:fromView:](self, "convertPoint:fromView:", v11, x, y);
  v39 = v38;
  v41 = v40;

  objc_msgSend(v43, "presentActionMenuViewFromPoint:inRect:animated:completion:", v6, 0, v39, v41, v34, v35, v36, v37);
  -[CKActionMenuWindow setHidden:](self, "setHidden:", 0);
  -[CKActionMenuWindow actionMenuView](self, "actionMenuView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuWindow bringSubviewToFront:](self, "bringSubviewToFront:", v42);

}

- (void)dismissActionMenuViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CKActionMenuWindow *v9;

  v3 = a3;
  -[CKActionMenuWindow actionMenuView](self, "actionMenuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CKActionMenuWindow_dismissActionMenuViewAnimated___block_invoke;
  v7[3] = &unk_1E274BE58;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v6, "dismissActionMenuViewAnimated:completion:", v3, v7);

}

void __52__CKActionMenuWindow_dismissActionMenuViewAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "actionMenuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setActionMenuView:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  }
}

- (void)actionMenuGestureRecognized:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKActionMenuWindow actionMenuView](self, "actionMenuView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionMenuGestureRecognized:", v4);

}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (CKActionMenuView)actionMenuView
{
  return *(CKActionMenuView **)&self->_shouldDismissOnTap;
}

- (void)setActionMenuView:(id)a3
{
  objc_storeStrong((id *)&self->_shouldDismissOnTap, a3);
}

- (BOOL)shouldDismissOnTap
{
  return *(&self->super._unknownOrientation + 1);
}

- (void)setShouldDismissOnTap:(BOOL)a3
{
  *(&self->super._unknownOrientation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldDismissOnTap, 0);
}

@end
