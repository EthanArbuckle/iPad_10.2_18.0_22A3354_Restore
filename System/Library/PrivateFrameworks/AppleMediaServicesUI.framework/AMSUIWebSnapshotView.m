@implementation AMSUIWebSnapshotView

- (AMSUIWebSnapshotView)initWithView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AMSUIWebSnapshotView *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebSnapshotView;
  v8 = -[AMSUICommonView init](&v16, sel_init);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = (void *)objc_opt_class();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__AMSUIWebSnapshotView_initWithView_completion___block_invoke;
    v12[3] = &unk_24CB51C30;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    objc_msgSend(v9, "_screenCapFromView:completion:", v6, v12);
    -[AMSUIWebSnapshotView traitCollection](v8, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_originalInterfaceStyle = objc_msgSend(v10, "userInterfaceStyle");

    v8->_visibilityModifiers = 0;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __48__AMSUIWebSnapshotView_initWithView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
    objc_msgSend(WeakRetained, "updateSnapshot:", v6);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)updateSnapshot:(id)a3
{
  void *v4;
  void *v5;

  -[AMSUIWebSnapshotView setSnapshot:](self, "setSnapshot:", a3);
  -[AMSUIWebSnapshotView snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSnapshotView addSubview:](self, "addSubview:", v5);

    -[AMSUIWebSnapshotView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)removeSnapshot
{
  void *v3;
  void *v4;

  -[AMSUIWebSnapshotView snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSnapshotView snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[AMSUIWebSnapshotView setSnapshot:](self, "setSnapshot:", 0);
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebSnapshotView;
  -[AMSUIWebSnapshotView layoutSubviews](&v28, sel_layoutSubviews);
  -[AMSUIWebSnapshotView bounds](self, "bounds");
  v4 = v3;
  -[AMSUIWebSnapshotView bounds](self, "bounds");
  v6 = v4 / v5;
  -[AMSUIWebSnapshotView originalRatio](self, "originalRatio");
  if (v7 == 0.0)
  {
    -[AMSUIWebSnapshotView bounds](self, "bounds");
    v9 = v8;
    -[AMSUIWebSnapshotView bounds](self, "bounds");
    -[AMSUIWebSnapshotView setOriginalRatio:](self, "setOriginalRatio:", v9 / v10);
  }
  -[AMSUIWebSnapshotView originalRatio](self, "originalRatio");
  if (v6 == v11)
  {
    -[AMSUIWebSnapshotView setVisibilityModifiers:](self, "setVisibilityModifiers:", -[AMSUIWebSnapshotView visibilityModifiers](self, "visibilityModifiers") & 0xFFFFFFFFFFFFFFFELL);
    if (!-[AMSUIWebSnapshotView _visibilityUnmodified](self, "_visibilityUnmodified"))
      return;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unhiding snapshot.", buf, 0x16u);

    }
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 1.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2114;
      v32 = v23;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding layout visibility modifier and hiding snapshot.", buf, 0x16u);

    }
    -[AMSUIWebSnapshotView setVisibilityModifiers:](self, "setVisibilityModifiers:", -[AMSUIWebSnapshotView visibilityModifiers](self, "visibilityModifiers") | 1);
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 0);

    -[AMSUIWebSnapshotView originalRatio](self, "originalRatio");
    v26 = v25 - v6;
    if (v26 >= 0.0)
      v26 = -v26;
    v27 = v26 * 100.0 + 1.0;
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v27;
  }
  objc_msgSend(v17, "setAlpha:", v19);

}

+ (id)_imageViewForImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEBD668];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  return v5;
}

+ (void)_screenCapFromView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v6;
  objc_msgSend(v6, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v15 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v15;
        else
          v11 = 0;

        objc_msgSend(v11, "underlyingWebView");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;

          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __54__AMSUIWebSnapshotView__screenCapFromView_completion___block_invoke;
          v21[3] = &unk_24CB51C58;
          v23 = v7;
          v11 = v11;
          v22 = v11;
          objc_msgSend(v11, "takeSnapshotWithCompletion:", v21);

          v18 = v23;
          v19 = v20;
          goto LABEL_16;
        }
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v19 = v20;
  objc_msgSend(v20, "snapshotViewAfterScreenUpdates:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageViewForImage:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *, _QWORD))v7 + 2))(v7, v11, v18, 0);
LABEL_16:

}

uint64_t __54__AMSUIWebSnapshotView__screenCapFromView_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebSnapshotView;
  -[AMSUIWebSnapshotView traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, a3);
  -[AMSUIWebSnapshotView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = -[AMSUIWebSnapshotView originalInterfaceStyle](self, "originalInterfaceStyle");

  if (v5 == v6)
  {
    -[AMSUIWebSnapshotView setVisibilityModifiers:](self, "setVisibilityModifiers:", -[AMSUIWebSnapshotView visibilityModifiers](self, "visibilityModifiers") & 0xFFFFFFFFFFFFFFFDLL);
    if (!-[AMSUIWebSnapshotView _visibilityUnmodified](self, "_visibilityUnmodified"))
      return;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unhiding snapshot.", buf, 0x16u);

    }
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding interface style visibility modifier and hiding snapshot.", buf, 0x16u);

    }
    -[AMSUIWebSnapshotView setVisibilityModifiers:](self, "setVisibilityModifiers:", -[AMSUIWebSnapshotView visibilityModifiers](self, "visibilityModifiers") | 2);
    -[AMSUIWebSnapshotView snapshot](self, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1;
  }
  objc_msgSend(v11, "setHidden:", v13);

}

- (BOOL)_visibilityUnmodified
{
  return -[AMSUIWebSnapshotView visibilityModifiers](self, "visibilityModifiers") == 0;
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (double)originalRatio
{
  return self->_originalRatio;
}

- (void)setOriginalRatio:(double)a3
{
  self->_originalRatio = a3;
}

- (int64_t)originalInterfaceStyle
{
  return self->_originalInterfaceStyle;
}

- (void)setOriginalInterfaceStyle:(int64_t)a3
{
  self->_originalInterfaceStyle = a3;
}

- (unint64_t)visibilityModifiers
{
  return self->_visibilityModifiers;
}

- (void)setVisibilityModifiers:(unint64_t)a3
{
  self->_visibilityModifiers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
