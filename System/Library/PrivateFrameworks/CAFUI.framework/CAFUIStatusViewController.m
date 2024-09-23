@implementation CAFUIStatusViewController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_sharedInstance;
}

void __43__CAFUIStatusViewController_sharedInstance__block_invoke()
{
  CAFUIStatusViewController *v0;
  void *v1;

  v0 = objc_alloc_init(CAFUIStatusViewController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CAFUIStatusViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CAFUIStatusTableView *v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v61;
  CAFUIStatusTableView *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _QWORD v70[10];

  v70[8] = *MEMORY[0x24BDAC8D0];
  v68.receiver = self;
  v68.super_class = (Class)CAFUIStatusViewController;
  -[CAFUIStatusViewController viewDidLoad](&v68, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BEBDA88]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setEditable:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v10);

  objc_msgSend(v8, "setTextContainerInset:", 8.0, 8.0, 8.0, 8.0);
  objc_msgSend(v8, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsNonContiguousLayout:", 0);

  -[CAFUIStatusViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v8);

  -[CAFUIStatusViewController setTextView:](self, "setTextView:", v8);
  v13 = -[CAFUIStatusTableView initWithFrame:]([CAFUIStatusTableView alloc], "initWithFrame:", v4, v5, v6, v7);
  -[CAFUIStatusTableView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = objc_opt_class();
  +[CAFUIStatusTableCell identifier](CAFUIStatusTableCell, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusTableView registerClass:forCellReuseIdentifier:](v13, "registerClass:forCellReuseIdentifier:", v14, v15);

  -[CAFUIStatusTableView setDataSource:](v13, "setDataSource:", self);
  -[CAFUIStatusTableView setDelegate:](v13, "setDelegate:", self);
  -[CAFUIStatusTableView setAllowsSelection:](v13, "setAllowsSelection:", 0);
  -[CAFUIStatusTableView setContentInset:](v13, "setContentInset:", 4.0, 0.0, 4.0, 0.0);
  -[CAFUIStatusViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v13);

  -[CAFUIStatusViewController setTableView:](self, "setTableView:", v13);
  v45 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "safeAreaLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v57;
  objc_msgSend(v8, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safeAreaLayoutGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v52;
  objc_msgSend(v8, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "safeAreaLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v47;
  objc_msgSend(v8, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "safeAreaLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:multiplier:", v42, 0.67);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v41;
  -[CAFUIStatusTableView topAnchor](v13, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v36;
  -[CAFUIStatusTableView bottomAnchor](v13, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v31;
  -[CAFUIStatusTableView leadingAnchor](v13, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v8;
  objc_msgSend(v8, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70[6] = v19;
  v62 = v13;
  -[CAFUIStatusTableView trailingAnchor](v13, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIStatusViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v25);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[CAFUIStatusViewController pendingMessages](self, "pendingMessages");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v65 != v29)
          objc_enumerationMutation(v26);
        -[CAFUIStatusViewController appendStringWithFormat:](self, "appendStringWithFormat:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v28);
  }

  -[CAFUIStatusViewController setPendingMessages:](self, "setPendingMessages:", 0);
}

- (void)appendStringWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;

  v10 = &v11;
  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v11);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CAFUIStatusViewController_appendStringWithFormat___block_invoke;
  block[3] = &unk_2508D19E8;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __52__CAFUIStatusViewController_appendStringWithFormat___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertText:", v5);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") - 1;

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollRangeToVisible:", v8, 1);
  }
  else
  {
    objc_msgSend(v3, "pendingMessages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setPendingMessages:", v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 40));
  }

}

- (void)setCarManager:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_carManager);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_carManager);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_carManager);
      objc_msgSend(v7, "unregisterObserver:", self);

    }
    v8 = objc_storeWeak((id *)&self->_carManager, obj);
    objc_msgSend(obj, "registerObserver:", self);

    v5 = obj;
  }

}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CAFUIStatusLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CAFUIStatusViewController carManager:didUpdateCurrentCar:]";
    _os_log_impl(&dword_237505000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendStringWithFormat:", CFSTR("%s"), "-[CAFUIStatusViewController carManager:didUpdateCurrentCar:]");

  WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  if (WeakRetained != v5)
  {
    v9 = objc_loadWeakRetained((id *)&self->_car);

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_car);
      objc_msgSend(v10, "unregisterObserver:", self);

    }
    v11 = objc_storeWeak((id *)&self->_car, v5);
    objc_msgSend(v5, "registerObserver:", self);

  }
}

- (void)carDidUpdateAccessories:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CAFUIStatusLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CAFUIStatusViewController carDidUpdateAccessories:]";
    _os_log_impl(&dword_237505000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendStringWithFormat:", CFSTR("%s"), "-[CAFUIStatusViewController carDidUpdateAccessories:]");

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CAFUIStatusLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CAFUIStatusViewController carDidUpdate:receivedAllValues:]";
    v16 = 1024;
    v17 = objc_msgSend(v5, "receivedAllValues");
    _os_log_impl(&dword_237505000, v6, OS_LOG_TYPE_DEFAULT, "%s: %u", buf, 0x12u);
  }

  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendStringWithFormat:", CFSTR("%s: %u"), "-[CAFUIStatusViewController carDidUpdate:receivedAllValues:]", objc_msgSend(v5, "receivedAllValues"));

  if (objc_msgSend(v5, "receivedAllValues"))
  {
    CAFUIStatusLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "accessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v15 = (const char *)v10;
      _os_log_impl(&dword_237505000, v8, OS_LOG_TYPE_DEFAULT, "✅ Car received all values with %lu accessories", buf, 0xCu);

    }
    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendStringWithFormat:", CFSTR("✅ Car received all values with %lu accessories"), objc_msgSend(v12, "count"));

  }
  -[CAFUIStatusViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "update");

}

- (void)carDidUpdate:(id)a3 accessory:(id)a4 service:(id)a5 characteristic:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  CAFUIStatusLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v24 = "-[CAFUIStatusViewController carDidUpdate:accessory:service:characteristic:]";
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_237505000, v12, OS_LOG_TYPE_DEFAULT, "%s\n\tAccessory: %@\n\tService: %@\n\tCharacteristic: %@\n\tValue: %@", buf, 0x34u);

  }
  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendStringWithFormat:", CFSTR("%s\n\tAccessory: %@\n\tService: %@\n\tCharacteristic: %@\n\tValue: %@"), "-[CAFUIStatusViewController carDidUpdate:accessory:service:characteristic:]", v18, v19, v20, v21);

  -[CAFUIStatusViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "update");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CAFUIStatusViewController car](self, "car", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "receivedAllValues"))
    v4 = 3;
  else
    v4 = 1;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = 1;
  if (a4 && a4 != 2)
  {
    if (a4 == 1)
    {
      -[CAFUIStatusViewController car](self, "car");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "count");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v6 = a4;
  v7 = a3;
  +[CAFUIStatusTableCell identifier](CAFUIStatusTableCell, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    -[CAFUIStatusViewController car](self, "car");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "receivedAllValues");

    if (v16)
      v17 = CFSTR("checkmark.square");
    else
      v17 = CFSTR("xmark.square");
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v18);

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("ready");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("not ready");
    }
    objc_msgSend(v10, "imageProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTintColor:", v19);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Car %@"), v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v13);
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    -[CAFUIStatusViewController car](self, "car");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("a.circle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v14);

    if (objc_msgSend(v13, "receivedAllValues"))
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageProperties");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTintColor:", v32);

    objc_msgSend(v13, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v34);

    if (objc_msgSend(v13, "receivedAllValues"))
      v35 = CFSTR("Yes");
    else
      v35 = CFSTR("No");
    objc_msgSend(v10, "setSecondaryText:", v35);
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(v6, "section") == 2)
  {
    -[CAFUIStatusViewController car](self, "car");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (void *)MEMORY[0x24BDD16E0];
    -[CAFUIStatusViewController car](self, "car");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = CFSTR("accessories");
    if (v23 == 1)
      v29 = CFSTR("accessory");
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ %@"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v30);

    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v10, "imageProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setMaximumSize:", 12.0, 12.0);

  objc_msgSend(v10, "imageProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setReservedLayoutSize:", 12.0, 12.0);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 9.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFont:", v38);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 9.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryTextProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFont:", v40);

  objc_msgSend(v10, "setImageToTextPadding:", 6.0);
  objc_msgSend(v10, "setTextToSecondaryTextHorizontalPadding:", 0.0);
  objc_msgSend(v10, "setTextToSecondaryTextVerticalPadding:", 0.0);
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 2.0, 2.0, 3.0, 2.0);
  objc_msgSend(v9, "setContentConfiguration:", v10);

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  double result;

  v4 = objc_msgSend(a4, "section", a3);
  result = 18.0;
  if (v4 == 1)
    return 25.0;
  return result;
}

- (CAFCarManager)carManager
{
  return (CAFCarManager *)objc_loadWeakRetained((id *)&self->_carManager);
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (CAFUIStatusTableView)tableView
{
  return (CAFUIStatusTableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (CAFCar)car
{
  return (CAFCar *)objc_loadWeakRetained((id *)&self->_car);
}

- (void)setCar:(id)a3
{
  objc_storeWeak((id *)&self->_car, a3);
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_destroyWeak((id *)&self->_car);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_carManager);
}

@end
