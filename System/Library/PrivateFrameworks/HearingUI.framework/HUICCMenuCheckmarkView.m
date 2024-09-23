@implementation HUICCMenuCheckmarkView

- (HUICCMenuCheckmarkView)initWithFrame:(CGRect)a3 andModule:(unint64_t)a4
{
  HUICCMenuCheckmarkView *v4;
  HUICCMenuCheckmarkView *v5;
  NSMutableArray *v6;
  NSMutableArray *menuItemViews;
  HACCCapsuleDarkBackground *v8;
  HACCCapsuleDarkBackground *backgroundMenuView;
  HACCStackView *v10;
  HACCStackView *menuViewStack;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HACCCapsuleTitleView *titleView;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  HACCCapsuleTitleView *v26;
  HACCCapsuleTitleView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v37;
  NSNumber *contentValueCache;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  _QWORD v63[4];
  id v64;
  id location;
  objc_super v66;
  _QWORD v67[8];
  _QWORD v68[4];
  _QWORD v69[6];

  v69[4] = *MEMORY[0x24BDAC8D0];
  v66.receiver = self;
  v66.super_class = (Class)HUICCMenuCheckmarkView;
  v4 = -[HUICCMenuCheckmarkView initWithFrame:](&v66, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[HUICCMenuCheckmarkView setModule:](v4, "setModule:", a4);
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    menuItemViews = v5->_menuItemViews;
    v5->_menuItemViews = v6;

    v8 = objc_alloc_init(HACCCapsuleDarkBackground);
    backgroundMenuView = v5->_backgroundMenuView;
    v5->_backgroundMenuView = v8;

    -[HACCCapsuleDarkBackground setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundMenuView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUICCMenuCheckmarkView addSubview:](v5, "addSubview:", v5->_backgroundMenuView);
    -[HACCCapsuleDarkBackground setupBackgroundVisualStyle](v5->_backgroundMenuView, "setupBackgroundVisualStyle");
    v10 = objc_alloc_init(HACCStackView);
    menuViewStack = v5->_menuViewStack;
    v5->_menuViewStack = v10;

    -[HACCStackView setAxis:](v5->_menuViewStack, "setAxis:", 1);
    -[HACCStackView setAlignment:](v5->_menuViewStack, "setAlignment:", 0);
    -[HACCStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_menuViewStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUICCMenuCheckmarkView addSubview:](v5, "addSubview:", v5->_menuViewStack);
    v51 = (void *)MEMORY[0x24BDD1628];
    -[HACCStackView leadingAnchor](v5->_menuViewStack, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleDarkBackground leadingAnchor](v5->_backgroundMenuView, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v57);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v55;
    -[HACCStackView trailingAnchor](v5->_menuViewStack, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleDarkBackground trailingAnchor](v5->_backgroundMenuView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v13;
    -[HACCStackView topAnchor](v5->_menuViewStack, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleDarkBackground topAnchor](v5->_backgroundMenuView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v16;
    -[HACCStackView bottomAnchor](v5->_menuViewStack, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleDarkBackground bottomAnchor](v5->_backgroundMenuView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v20);

    if (a4 == 32)
    {
      titleView = v5->_titleView;
      v5->_titleView = 0;

      v22 = (void *)MEMORY[0x24BDD1628];
      -[HACCCapsuleDarkBackground leadingAnchor](v5->_backgroundMenuView, "leadingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView leadingAnchor](v5, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v60);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v58;
      -[HACCCapsuleDarkBackground trailingAnchor](v5->_backgroundMenuView, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView trailingAnchor](v5, "trailingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:", v54);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v52;
      -[HACCCapsuleDarkBackground topAnchor](v5->_backgroundMenuView, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView topAnchor](v5, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v48;
      -[HACCCapsuleDarkBackground bottomAnchor](v5->_backgroundMenuView, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView bottomAnchor](v5, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v46);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activateConstraints:", v24);
    }
    else
    {
      if (a4 == 34)
        v25 = 26.0;
      else
        v25 = 52.0;
      v26 = objc_alloc_init(HACCCapsuleTitleView);
      v27 = v5->_titleView;
      v5->_titleView = v26;

      -[HACCCapsuleTitleView setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HACCCapsuleTitleView setAccessibilityElementsHidden:](v5->_titleView, "setAccessibilityElementsHidden:", a4 == 34);
      -[HUICCMenuCheckmarkView addSubview:](v5, "addSubview:", v5->_titleView);
      v41 = (void *)MEMORY[0x24BDD1628];
      -[HACCCapsuleTitleView topAnchor](v5->_titleView, "topAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView topAnchor](v5, "topAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v60);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v58;
      -[HACCCapsuleTitleView leadingAnchor](v5->_titleView, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView leadingAnchor](v5, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:", v54);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v52;
      -[HACCCapsuleTitleView trailingAnchor](v5->_titleView, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView trailingAnchor](v5, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v48;
      -[HACCCapsuleTitleView heightAnchor](v5->_titleView, "heightAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintGreaterThanOrEqualToConstant:", v25);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v67[3] = v46;
      -[HACCCapsuleDarkBackground leadingAnchor](v5->_backgroundMenuView, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView leadingAnchor](v5, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v67[4] = v45;
      -[HACCCapsuleDarkBackground trailingAnchor](v5->_backgroundMenuView, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView trailingAnchor](v5, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v43);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v67[5] = v42;
      -[HACCCapsuleDarkBackground topAnchor](v5->_backgroundMenuView, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HACCCapsuleTitleView bottomAnchor](v5->_titleView, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v67[6] = v30;
      -[HACCCapsuleDarkBackground bottomAnchor](v5->_backgroundMenuView, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView bottomAnchor](v5, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v67[7] = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activateConstraints:", v34);

    }
    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v5, sel__handleTapGesture_);
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = (UITapGestureRecognizer *)v35;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5->_tapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v5->_tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[HUICCMenuCheckmarkView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_tapGestureRecognizer);
  }
  if (-[HUICCMenuCheckmarkView module](v5, "module") == 27)
  {
    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __50__HUICCMenuCheckmarkView_initWithFrame_andModule___block_invoke;
    v63[3] = &unk_24DD60E18;
    objc_copyWeak(&v64, &location);
    objc_msgSend(v37, "registerUpdateBlock:forRetrieveSelector:withListener:", v63, sel_comfortSoundsEnabled, v5);

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
  }
  if (-[HUICCMenuCheckmarkView module](v5, "module") == 34)
  {
    contentValueCache = v5->_contentValueCache;
    v5->_contentValueCache = (NSNumber *)MEMORY[0x24BDBD1C0];

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v5, sel_updateConversationBoostCache, *MEMORY[0x24BE4BE00], 0);

    -[HUICCMenuCheckmarkView updateConversationBoostCache](v5, "updateConversationBoostCache");
  }
  return v5;
}

void __50__HUICCMenuCheckmarkView_initWithFrame_andModule___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (void)subscribeListeners
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Registering Comfort Sounds listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUICCMenuCheckmarkView subscribeListeners]", 142, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_21A95E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (-[HUICCMenuCheckmarkView module](self, "module") == 27)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke;
    v9[3] = &unk_24DD610F0;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v8, "registerListener:forComfortSoundsModelUpdatesHandler:", self, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v9);
}

void __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setAvailableComfortSoundsAssets:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setComfortSoundsDownloadProgress:", *(_QWORD *)(a1 + 40));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_updateMenuViewIfNecessary");

}

- (void)unsubscribeListeners
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unregistering Comfort Sounds listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUICCMenuCheckmarkView unsubscribeListeners]", 160, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_21A95E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (-[HUICCMenuCheckmarkView module](self, "module") == 27)
  {
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterComfortSoundsModelUpdatesHandler:", self);

  }
}

- (void)updateValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUICCMenuCheckmarkView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
    -[HUICCMenuCheckmarkView tapGestureRecognizer](self, "tapGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requireGestureRecognizerToFail:", v6);

  }
  -[HUICCMenuCheckmarkView _updateMenuViewIfNecessary](self, "_updateMenuViewIfNecessary");

}

- (id)contentValue
{
  return self->_contentValueCache;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_updateMenuViewIfNecessary
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__HUICCMenuCheckmarkView__updateMenuViewIfNecessary__block_invoke;
  v2[3] = &unk_24DD61118;
  v2[4] = self;
  -[HUICCMenuCheckmarkView _menuItemsWithCompletion:](self, "_menuItemsWithCompletion:", v2);
}

void __52__HUICCMenuCheckmarkView__updateMenuViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  HUICCMenuItemCheckmarkView *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "menuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToArray:", v3);

  if ((v5 & 1) == 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "menuItemViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v11, "removeFromSuperview");
          objc_msgSend(*(id *)(a1 + 32), "menuViewStack");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeArrangedSubview:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "menuItemViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v3;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          v20 = objc_alloc_init(HUICCMenuItemCheckmarkView);
          -[HUICCMenuItemCheckmarkView setMenuItem:](v20, "setMenuItem:", v19, (_QWORD)v30);
          objc_msgSend(*(id *)(a1 + 32), "menuItemViews");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          v23 = *(void **)(a1 + 32);
          if (v22)
          {
            objc_msgSend(v23, "menuViewStack");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addArrangedSubview:withPartialSeparator:", v20, 1);
          }
          else
          {
            objc_msgSend(v23, "titleView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25 != 0;

            objc_msgSend(*(id *)(a1 + 32), "menuViewStack");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addArrangedSubview:withSeparator:", v20, v26);
          }

          objc_msgSend(*(id *)(a1 + 32), "menuViewStack");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addArrangedSubview:", v20);

          objc_msgSend(*(id *)(a1 + 32), "menuItemViews");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v16);
    }

    v29 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setMenuItems:", v29);

  }
}

- (void)_menuItemsWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync();

}

void __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke_2;
  block[3] = &unk_24DD61140;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_menuItemsforBluetoothDevice:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (id)_menuItemsforBluetoothDevice:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  HUICCMenuCheckmarkView *v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id location;
  void *v64;
  void *v65;
  _QWORD v66[4];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v4 = -[HUICCMenuCheckmarkView module](self, "module");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_initWeak(&location, self);
  switch(v4)
  {
    case 0x1BuLL:
      hearingLocString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCMenuCheckmarkView availableComfortSoundsAssets](self, "availableComfortSoundsAssets");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_2;
        v58[3] = &unk_24DD611B8;
        v59 = v25;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v58);

      }
      else
      {
        for (i = 1; i != 9; ++i)
        {
          objc_msgSend(MEMORY[0x24BE4BE60], "defaultComfortSoundForGroup:", i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hcSafeAddObject:", v32);

        }
      }
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_3;
      v52[3] = &unk_24DD61208;
      v53 = v5;
      v54 = self;
      v55 = v6;
      v56 = v7;
      objc_copyWeak(&v57, &location);
      objc_msgSend(v25, "enumerateObjectsUsingBlock:", v52);
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "selectedComfortSound");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v34, "localizedName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v35;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

      objc_destroyWeak(&v57);
      goto LABEL_26;
    case 0x22uLL:
      paLocString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v25);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_5;
      v50[3] = &unk_24DD60E18;
      objc_copyWeak(&v51, &location);
      v27 = (void *)MEMORY[0x22074CEE8](v50);
      v28 = (void *)MEMORY[0x22074CEE8]();
      objc_msgSend(v7, "addObject:", v28);

      -[HUICCMenuCheckmarkView contentValue](self, "contentValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "BOOLValue");

      if (v30)
      {
        v64 = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      objc_destroyWeak(&v51);
      v8 = 0;
      goto LABEL_26;
    case 0x20uLL:
      paLocString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      paLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v9;
      paLocString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

      -[HUICCMenuCheckmarkView personalAudioToggleBlockForType:](self, "personalAudioToggleBlockForType:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      -[HUICCMenuCheckmarkView personalAudioToggleBlockForType:](self, "personalAudioToggleBlockForType:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);

      v14 = objc_msgSend(v43, "featureCapability:", 33);
      if (v14)
      {
        paLocString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke;
        v60[3] = &unk_24DD61190;
        v61 = v43;
        objc_copyWeak(&v62, &location);
        v16 = (void *)MEMORY[0x22074CEE8](v60);
        v17 = (void *)MEMORY[0x22074CEE8]();
        objc_msgSend(v7, "addObject:", v17);

        objc_destroyWeak(&v62);
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personalAudioAccommodationTypes");

      if (compoundAttributeContainsAttribute())
      {
        paLocString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v20);

      }
      if (compoundAttributeContainsAttribute())
      {
        paLocString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v21);

      }
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "transparencyCustomizedForAddress:", v23);

        if (v24)
        {
          paLocString();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);
LABEL_26:

        }
      }
      break;
    default:
      v18 = 0;
      v8 = 0;
      break;
  }
  if (objc_msgSend(v5, "count"))
  {
    v36 = objc_msgSend(v5, "count");
    if (v36 == objc_msgSend(v7, "count"))
    {
      v37 = objc_loadWeakRetained(&location);
      objc_msgSend(v37, "titleView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "titleLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setText:", v8);

      v40 = objc_msgSend(v6, "count");
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_6;
      v44[3] = &unk_24DD61258;
      v45 = v7;
      v49 = v40;
      v46 = v6;
      v47 = v18;
      v48 = v42;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v44);

    }
  }
  objc_destroyWeak(&location);

  return v42;
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke(id *a1)
{
  id *v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v1 = a1;
  objc_msgSend(a1[4], "address");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transparencyCustomizedForAddress:", v9);

  v4 = v3 ^ 1u;
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransparencyCustomized:forAddress:", v4, v9);

  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "_updateMenuViewIfNecessary");

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateView");
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BE4BE60], "comfortSoundWithAsset:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hcSafeAddObject:", v3);

}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  __CFString *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "comfortSoundsDownloadProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "floatValue"), v10 < 1.0))
  {
    hearingLocString();
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24DD62430;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
  v12 = *(void **)(a1 + 56);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_4;
  v16[3] = &unk_24DD611E0;
  v13 = v6;
  v17 = v13;
  v14 = v3;
  v18 = v14;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  v15 = (void *)MEMORY[0x22074CEE8](v16);
  objc_msgSend(v12, "addObject:", v15);

  objc_destroyWeak(&v19);
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_4(id *a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  id v8;
  id v9;

  v2 = objc_msgSend(a1[4], "isInstalled");
  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setSelectedComfortSound:", a1[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE4BE60], "defaultComfortSoundForGroup:", objc_msgSend(a1[5], "soundGroup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectedComfortSound:", v5);

    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadComfortSoundAsset:", a1[4]);
  }

  v6 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_updateMenuViewIfNecessary");

  v8 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateViewForModule:", 27);
  objc_msgSend(v9, "updateViewForModule:", 24);

}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_5(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "controlDidActivate:", v4);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "updateConversationBoostCache");

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "_updateMenuViewIfNecessary");

}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_6(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  unint64_t v14;

  v5 = a2;
  v6 = objc_alloc(MEMORY[0x24BE19B60]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_7;
  v12 = &unk_24DD61230;
  v13 = *(id *)(a1 + 32);
  v14 = a3;
  v7 = (void *)objc_msgSend(v6, "initWithTitle:identifier:handler:", v5, v5, &v9);
  if (*(_QWORD *)(a1 + 64) > a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3, v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v8);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5, v9, v10, v11, v12))
    objc_msgSend(v7, "setSelected:", 1);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

}

uint64_t __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

  return 0;
}

- (id)personalAudioToggleBlockForType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HUICCMenuCheckmarkView_personalAudioToggleBlockForType___block_invoke;
  v6[3] = &unk_24DD61280;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  v4 = (void *)MEMORY[0x22074CEE8](v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
  return v4;
}

void __58__HUICCMenuCheckmarkView_personalAudioToggleBlockForType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id WeakRetained;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalAudioAccommodationTypes");

  if (compoundAttributeContainsAttribute())
    v3 = compoundAttributeByRemovingAttribute();
  else
    v3 = compoundAttributeByAddingAttribute();
  v4 = v3;
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonalAudioAccommodationTypes:", v4);

  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_updateMenuViewIfNecessary");

  v8 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateViewForModule:", 31);
  objc_msgSend(v9, "updateViewForModule:", 32);

}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  -[HUICCMenuCheckmarkView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    v12 = v11;
    if (v5 == 3)
    {
      objc_msgSend(v11, "setHighlighted:", 1);
      v13 = v12;
      AXPerformBlockOnMainThreadAfterDelay();

    }
  }

}

void __44__HUICCMenuCheckmarkView__handleTapGesture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "menuItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction");

}

- (void)updateConversationBoostCache
{
  if (-[HUICCMenuCheckmarkView module](self, "module") == 34)
    paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync();
}

void __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke_2;
  v6[3] = &unk_24DD61050;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "address");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transparencyBeamformingForAddress:", v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setContentValueCache:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_updateMenuViewIfNecessary");
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCCapsuleTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (HACCCapsuleDarkBackground)backgroundMenuView
{
  return self->_backgroundMenuView;
}

- (void)setBackgroundMenuView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMenuView, a3);
}

- (HACCStackView)menuViewStack
{
  return self->_menuViewStack;
}

- (void)setMenuViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_menuViewStack, a3);
}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (NSMutableArray)menuItemViews
{
  return self->_menuItemViews;
}

- (void)setMenuItemViews:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemViews, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (NSArray)availableComfortSoundsAssets
{
  return self->_availableComfortSoundsAssets;
}

- (void)setAvailableComfortSoundsAssets:(id)a3
{
  objc_storeStrong((id *)&self->_availableComfortSoundsAssets, a3);
}

- (NSDictionary)comfortSoundsDownloadProgress
{
  return self->_comfortSoundsDownloadProgress;
}

- (void)setComfortSoundsDownloadProgress:(id)a3
{
  objc_storeStrong((id *)&self->_comfortSoundsDownloadProgress, a3);
}

- (NSNumber)contentValueCache
{
  return self->_contentValueCache;
}

- (void)setContentValueCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentValueCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentValueCache, 0);
  objc_storeStrong((id *)&self->_comfortSoundsDownloadProgress, 0);
  objc_storeStrong((id *)&self->_availableComfortSoundsAssets, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuItemViews, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuViewStack, 0);
  objc_storeStrong((id *)&self->_backgroundMenuView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
