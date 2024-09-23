@implementation FMFRefreshBarButtonItem

- (FMFRefreshBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;
  FMFRefreshBarButtonItem *v8;
  void *v9;
  void *v10;
  void *v11;
  FMFTintedActivityIndicatorView *v12;
  void *v13;
  FMFRefreshWrapperButton *v14;
  void *v15;
  FMFRefreshWrapperButton *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  objc_super v43;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v43.receiver = self;
  v43.super_class = (Class)FMFRefreshBarButtonItem;
  v8 = -[FMFRefreshBarButtonItem initWithCustomView:](&v43, sel_initWithCustomView_, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("arrow.clockwise"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageByApplyingSymbolConfiguration:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[FMFTintedActivityIndicatorView initWithActivityIndicatorStyle:]([FMFTintedActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 1);
    -[FMFRefreshBarButtonItem setAiv:](v8, "setAiv:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v11);
    -[FMFRefreshBarButtonItem setImageView:](v8, "setImageView:", v13);

    v14 = [FMFRefreshWrapperButton alloc];
    -[FMFRefreshBarButtonItem imageView](v8, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = -[FMFRefreshWrapperButton initWithFrame:](v14, "initWithFrame:");
    -[FMFRefreshBarButtonItem setWrapperButton:](v8, "setWrapperButton:", v16);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTarget:action:forControlEvents:", v6, a4, 64);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", v8, sel_localTapped, 64);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem setCustomView:](v8, "setCustomView:", v20);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem aiv](v8, "aiv");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    -[FMFRefreshBarButtonItem aiv](v8, "aiv");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem aiv](v8, "aiv");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerHorizontalInView:", v25);

    -[FMFRefreshBarButtonItem aiv](v8, "aiv");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem aiv](v8, "aiv");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerVerticalInView:", v28);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem imageView](v8, "imageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem imageView](v8, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    objc_msgSend(v32, "constraintEqualToConstant:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[FMFRefreshBarButtonItem wrapperButton](v8, "wrapperButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem imageView](v8, "imageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    objc_msgSend(v37, "constraintEqualToConstant:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v8, sel_locatingInProgressChanged_, CFSTR("locatingInProgressChanged"), 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("locatingInProgressChanged"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFRefreshBarButtonItem;
  -[FMFRefreshBarButtonItem dealloc](&v4, sel_dealloc);
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)FMFRefreshBarButtonItem;
  -[FMFRefreshBarButtonItem setImageInsets:](&v9, sel_setImageInsets_);
  -[FMFRefreshBarButtonItem wrapperButton](self, "wrapperButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWrapperInsets:", -top, -left, -bottom, -right);

}

- (void)startAnimating
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[FMFRefreshBarButtonItem isAnimating](self, "isAnimating"))
  {
    -[FMFRefreshBarButtonItem imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    -[FMFRefreshBarButtonItem aiv](self, "aiv");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimating");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_REFRESH_BUTTON_VALUE_REFRESHING"), &stru_24C878158, CFSTR("LocalizableUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem setAccessibilityValue:](self, "setAccessibilityValue:", v5);

  }
}

- (void)stopAnimating
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[FMFRefreshBarButtonItem isAnimating](self, "isAnimating"))
  {
    -[FMFRefreshBarButtonItem imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    -[FMFRefreshBarButtonItem aiv](self, "aiv");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimating");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_REFRESH_BUTTON_VALUE_NOT_REFRESHING"), &stru_24C878158, CFSTR("LocalizableUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFRefreshBarButtonItem setAccessibilityValue:](self, "setAccessibilityValue:", v5);

  }
}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[FMFRefreshBarButtonItem aiv](self, "aiv");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
  -[FMFRefreshBarButtonItem _updateLocateInProgress](self, "_updateLocateInProgress");
}

- (void)addLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  FMFRefreshBarButtonItem *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FMFRefreshBarButtonItem locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = self;
  -[FMFRefreshBarButtonItem locations](self, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
        {
          objc_msgSend(v6, "removeObject:", v12);
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend(v6, "addObject:", v4);
  -[FMFRefreshBarButtonItem setLocations:](v16, "setLocations:", v6);
  -[FMFRefreshBarButtonItem _updateLocateInProgress](v16, "_updateLocateInProgress");

}

- (void)removeLocationForHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FMFRefreshBarButtonItem locations](self, "locations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      objc_msgSend(v10, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    -[FMFRefreshBarButtonItem locations](self, "locations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "removeObject:", v13);
    -[FMFRefreshBarButtonItem setLocations:](self, "setLocations:", v15);

    v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)localTapped
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[FMFRefreshBarButtonItem _updateLocateInProgress](self, "_updateLocateInProgress");
  -[FMFRefreshBarButtonItem startAnimating](self, "startAnimating");
  v3 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__FMFRefreshBarButtonItem_localTapped__block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __38__FMFRefreshBarButtonItem_localTapped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocateInProgress");
}

- (void)locatingInProgressChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__FMFRefreshBarButtonItem_locatingInProgressChanged___block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __53__FMFRefreshBarButtonItem_locatingInProgressChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DD58000, v2, OS_LOG_TYPE_DEFAULT, "locatingInProgressChanged in FMFRefreshBarButtonItem", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__updateLocateInProgress, 0, 0.200000003);
}

- (void)_updateLocateInProgress
{
  void *v3;

  -[FMFRefreshBarButtonItem locations](self, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && -[FMFRefreshBarButtonItem anyLocationIsUpdating](self, "anyLocationIsUpdating"))
    -[FMFRefreshBarButtonItem startAnimating](self, "startAnimating");
  else
    -[FMFRefreshBarButtonItem stopAnimating](self, "stopAnimating");
}

- (BOOL)anyLocationIsUpdating
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[FMFRefreshBarButtonItem locations](self, "locations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isLocatingInProgress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_REFRESH_BUTTON_LABEL"), &stru_24C878158, CFSTR("LocalizableUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_REFRESH_BUTTON_HINT"), &stru_24C878158, CFSTR("LocalizableUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)locations
{
  return self->_locations;
}

- (FMFRefreshWrapperButton)wrapperButton
{
  return self->_wrapperButton;
}

- (void)setWrapperButton:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperButton, a3);
}

- (FMFTintedActivityIndicatorView)aiv
{
  return self->_aiv;
}

- (void)setAiv:(id)a3
{
  objc_storeStrong((id *)&self->_aiv, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (id)locateNotification
{
  return self->_locateNotification;
}

- (void)setLocateNotification:(id)a3
{
  objc_storeStrong(&self->_locateNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locateNotification, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_aiv, 0);
  objc_storeStrong((id *)&self->_wrapperButton, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
