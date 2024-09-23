@implementation HUPrototypeLayoutOptionsEditorViewController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUPrototypeLayoutOptionsEditorViewController;
  -[HUPrototypeLayoutOptionsEditorViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[HUPrototypeLayoutOptionsEditorViewController setLayoutOptionsKeys:](self, "setLayoutOptionsKeys:", &unk_1E7042A08);
  -[HUPrototypeLayoutOptionsEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUPrototypeLayoutOptionsEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (void)_done:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUPrototypeLayoutOptionsEditorViewController _viewSizeSubclassDescription](self, "_viewSizeSubclassDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "----------- Start options for: %@ -----------", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUPrototypeLayoutOptionsEditorViewController layoutOptionsKeys](self, "layoutOptionsKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        HFLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "valueForKeyPath:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v11;
          v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ = %@", buf, 0x16u);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[HUPrototypeLayoutOptionsEditorViewController _viewSizeSubclassDescription](self, "_viewSizeSubclassDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v16;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "----------- End options for: %@ -----------", buf, 0xCu);

  }
  -[HUPrototypeLayoutOptionsEditorViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutOptionsEditorDidFinish:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptionsKeys](self, "layoutOptionsKeys", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  char isKindOfClass;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptionsKeys](self, "layoutOptionsKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "section");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setMinimumValue:", 0.0);
  v14 = objc_msgSend(&unk_1E7042A20, "containsObject:", v13);
  v15 = 1.0;
  if ((v14 & 1) == 0)
  {
    v16 = objc_msgSend(v13, "isEqualToString:", CFSTR("overrideNumberOfColumns"), 1.0);
    v15 = 100.0;
    if (v16)
      v15 = 12.0;
  }
  objc_msgSend(v10, "setMaximumValue:", v15);
  -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForKeyPath:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "floatValue");
    v20 = v19;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v20 = 0.0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v18, "pointSize", 0.0);
  }
  objc_msgSend(v10, "setValue:", v20);

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptionsKeys](self, "layoutOptionsKeys", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_viewSizeSubclassDescription
{
  void *v2;
  unint64_t v3;

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewSizeSubclass");

  if (v3 > 0xA)
    return CFSTR("unknown");
  else
    return off_1E6F4FF80[v3];
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  -[HUPrototypeLayoutOptionsEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptionsKeys](self, "layoutOptionsKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("overrideNumberOfColumns")))
  {
    if (floor(a4) == 0.0)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
LABEL_6:
    objc_msgSend(v13, "numberWithDouble:", a4);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = (void *)v14;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  v15 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "fontWithSize:", a4);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_12:
  -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKeyPath:", v15, v9);

  -[HUPrototypeLayoutOptionsEditorViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrototypeLayoutOptionsEditorViewController layoutOptions](self, "layoutOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutOptionsEditor:didUpdateLayoutOptions:", self, v18);

}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (HUPrototypeLayoutOptionsEditorViewControllerDelegate)delegate
{
  return (HUPrototypeLayoutOptionsEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)layoutOptionsKeys
{
  return self->_layoutOptionsKeys;
}

- (void)setLayoutOptionsKeys:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptionsKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptionsKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
