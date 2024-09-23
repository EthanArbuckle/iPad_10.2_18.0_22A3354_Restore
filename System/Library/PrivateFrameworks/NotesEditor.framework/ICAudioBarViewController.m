@implementation ICAudioBarViewController

- (ICAudioBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ICAudioBarViewController *v4;
  ICAudioBarView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICAudioBarViewController;
  v4 = -[ICAudioBarViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(ICAudioBarView);
    -[ICAudioBarView doneButton](v5, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v4, sel_done_, 64);

    -[ICAudioBarViewController setView:](v4, "setView:", v5);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAudioBarViewController;
  -[ICAudioBarViewController dealloc](&v4, sel_dealloc);
}

- (UIButton)doneButton
{
  void *v2;
  void *v3;

  -[ICAudioBarViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (void)setHeight:(double)a3
{
  id v4;

  -[ICAudioBarViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeight:", a3);

}

- (double)height
{
  void *v2;
  double v3;
  double v4;

  -[ICAudioBarViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "height");
  v4 = v3;

  return v4;
}

- (void)setNote:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D63808];
    v8 = objc_loadWeakRetained((id *)&self->_note);
    objc_msgSend(v6, "removeObserver:name:object:", self, v7, v8);

    v9 = objc_storeWeak((id *)&self->_note, obj);
    v5 = obj;
    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_note);
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_noteWillBeDeletedNotification_, v7, v11);

      v5 = obj;
    }
  }

}

- (void)addToViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ICAudioBarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[ICAudioBarViewController setAddedToViewController:](self, "setAddedToViewController:", v12);
    objc_msgSend(v12, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioBarViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioBarViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bringSubviewToFront:", v10);

    }
    objc_msgSend(v12, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioBarViewController addConstraintsInSuperview:](self, "addConstraintsInSuperview:", v11);

    -[ICAudioBarViewController adjustTextViewContentInsetWhenAddingView:](self, "adjustTextViewContentInsetWhenAddingView:", 1);
  }

}

- (void)adjustTextViewContentInsetWhenAddingView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ICAudioBarViewController addedToViewController](self, "addedToViewController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          objc_msgSend(v13, "contentInset");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          objc_msgSend(v13, "contentOffset");
          v23 = v22;
          v25 = v24;
          -[ICAudioBarViewController height](self, "height");
          if (!v3)
            v26 = -v26;
          objc_msgSend(v13, "setContentInset:", v15 + v26, v17, v19, v21);
          if (-[ICAudioBarViewController hasTranslucentNavigationBar](self, "hasTranslucentNavigationBar") && v3)
          {
            objc_msgSend(v13, "contentOffset");
            if (v23 != v28 || v25 != v27)
            {
              objc_msgSend(v13, "contentOffset");
              v31 = v30;
              v33 = v32;
              -[ICAudioBarViewController height](self, "height");
              objc_msgSend(v13, "setContentOffset:", v31, v33 + v34);
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }

}

- (void)noteWillBeDeletedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarViewController note](self, "note");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioBarViewController setNote:](self, "setNote:", 0);
    -[ICAudioBarViewController done:](self, "done:", 0);
    v5 = v6;
  }

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ICAudioBarViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICAudioBarViewController adjustTextViewContentInsetWhenAddingView:](self, "adjustTextViewContentInsetWhenAddingView:", 0);
    -[ICAudioBarViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[ICAudioBarViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioBarViewControllerDone:", self);

}

- (BOOL)hasTranslucentNavigationBar
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAudioBarViewController addedToViewController](self, "addedToViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isTranslucent");
  return (char)v2;
}

- (void)addConstraintsInSuperview:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v20 = objc_alloc_init(v4);
  -[ICAudioBarViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v10);

  -[ICAudioBarViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v14);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v15 = -*MEMORY[0x1E0D64E70];
  else
    v15 = 0.0;
  -[ICAudioBarViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICAudioBarViewControllerDelegate)delegate
{
  return (ICAudioBarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (UIViewController)addedToViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_addedToViewController);
}

- (void)setAddedToViewController:(id)a3
{
  objc_storeWeak((id *)&self->_addedToViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addedToViewController);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
