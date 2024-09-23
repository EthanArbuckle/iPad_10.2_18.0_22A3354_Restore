@implementation AKAttributePickerViewController

- (AKAttributePickerViewController)initWithController:(id)a3 selectedAnnotations:(id)a4
{
  id v6;
  id v7;
  AKAttributePickerViewController *v8;
  AKAttributePickerViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAttributePickerViewController;
  v8 = -[AKAttributePickerViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKAttributePickerViewController setController:](v8, "setController:", v6);
    -[AKAttributePickerViewController setSelectedAnnotations:](v9, "setSelectedAnnotations:", v7);
  }

  return v9;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AKAttributePickerViewController;
  -[AKAttributePickerViewController viewDidLoad](&v19, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKAttributePickerViewController setTableView:](self, "setTableView:", v4);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", 0);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsSelection:", 0);

  v7 = *MEMORY[0x24BDF7718];
  v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[AKAttributePickerViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorInset:", v7, v8, v9, v10);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlwaysBounceVertical:", 0);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceHorizontal:", 0);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("identifier"));

  -[AKAttributePickerViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[AKAttributePickerViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataSource:", self);

  -[AKAttributePickerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributePickerViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ak_addSubview:withEdgeInsets:", v18, v7, v8, v9, v10);

  -[AKAttributePickerViewController updateLayoutForSelectedAnnotations](self, "updateLayoutForSelectedAnnotations");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSelectedAnnotations:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_selectedAnnotations, a3);
  -[AKAttributePickerViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AKAttributePickerViewController updateLayoutForSelectedAnnotations](self, "updateLayoutForSelectedAnnotations");
}

- (void)updateLayoutForSelectedAnnotations
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t i;
  char v7;
  char v8;
  void *v9;
  AKLineStylePicker *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  AKLineStylePicker *v15;
  AKLineStylePicker *v16;
  AKLineStylePicker *v17;
  void *v18;
  AKFillableShapeStylePicker *v19;
  void *v20;
  id obj;
  uint64_t v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  AKLineStylePicker *v29;
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[AKAttributePickerViewController selectedAnnotations](self, "selectedAnnotations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v2)
  {
    v3 = v2;
    v24 = 0;
    v4 = 0;
    v5 = 0;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(obj);
        v7 = objc_opt_respondsToSelector();
        v8 = objc_opt_respondsToSelector();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_opt_class();
          v24 |= objc_opt_isKindOfClass() ^ 1;
        }
        v5 |= v7;
        v4 |= v8;
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v3);
  }
  else
  {
    LOBYTE(v24) = 0;
    v4 = 0;
    v5 = 0;
  }

  -[AKAttributePickerViewController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v24 & 1) != 0)
  {
    v10 = [AKLineStylePicker alloc];
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v15 = -[AKLineStylePicker initWithFrame:lineType:controller:](v10, "initWithFrame:lineType:controller:", 0, v9, *MEMORY[0x24BDBF090], v12, v13, v14);
    -[AKLineStylePicker setTag:](v15, "setTag:", 1000);
    -[AKLineStylePicker addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", self, sel__lineAttributesChanged_, 4096);
    v16 = -[AKLineStylePicker initWithFrame:lineType:controller:]([AKLineStylePicker alloc], "initWithFrame:lineType:controller:", 1, v9, v11, v12, v13, v14);
    -[AKLineStylePicker setTag:](v16, "setTag:", 1000);
    -[AKLineStylePicker addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, sel__lineAttributesChanged_, 4096);
    v17 = -[AKLineStylePicker initWithFrame:lineType:controller:]([AKLineStylePicker alloc], "initWithFrame:lineType:controller:", 2, v9, v11, v12, v13, v14);
    -[AKLineStylePicker setTag:](v17, "setTag:", 1000);
    -[AKLineStylePicker addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, sel__lineAttributesChanged_, 4096);
    v30[0] = v15;
    v30[1] = v16;
    v30[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributePickerViewController setRowViews:](self, "setRowViews:", v18);

LABEL_16:
    goto LABEL_17;
  }
  if ((v5 & 1) != 0)
  {
    v19 = [AKFillableShapeStylePicker alloc];
    v15 = -[AKFillableShapeStylePicker initWithFrame:controller:](v19, "initWithFrame:controller:", v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AKLineStylePicker setTag:](v15, "setTag:", 1000);
    -[AKLineStylePicker setShowFill:](v15, "setShowFill:", v4 & 1);
    -[AKLineStylePicker addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", self, sel__attributeStyleChanged_, 4096);
    v29 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v16 = (AKLineStylePicker *)objc_claimAutoreleasedReturnValue();
    -[AKAttributePickerViewController setRowViews:](self, "setRowViews:", v16);
    goto LABEL_16;
  }
LABEL_17:
  -[AKAttributePickerViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadData");

  -[AKAttributePickerViewController revalidateItems](self, "revalidateItems");
  -[AKAttributePickerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)_updatePreferredContentSize
{
  void *v3;
  double Width;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  id v19;
  CGRect v20;

  -[AKAttributePickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v20);

  -[AKAttributePickerViewController rowViews](self, "rowViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = *MEMORY[0x24BDF7B88];
    v9 = *(double *)(MEMORY[0x24BDF7B88] + 8);
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      -[AKAttributePickerViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForRowAtIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "systemLayoutSizeFittingSize:", v8, v9);
      if (v15 > v11)
        v11 = v15;
      if (v16 > v10)
        v10 = v16;

      ++v7;
      -[AKAttributePickerViewController rowViews](self, "rowViews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v7 < v18);
  }
  else
  {
    v11 = 0.0;
    v10 = 0.0;
  }
  if (v11 > 0.0)
    Width = v11;
  -[AKAttributePickerViewController rowViews](self, "rowViews");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAttributePickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v10 * (double)(unint64_t)objc_msgSend(v19, "count"));

}

- (void)_attributeStyleChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v4 = objc_msgSend(a3, "currentTag");
  -[AKAttributePickerViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 != 763000)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "attributePicker:didSelectToolWithTag:attributeTag:", self, v4, 763000);
      v6 = v8;
    }
  }

}

- (void)_lineAttributesChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentTag");
  v6 = objc_msgSend(v4, "lineStyle");

  -[AKAttributePickerViewController delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 != 763000)
  {
    v10 = (void *)v7;
    v9 = objc_opt_respondsToSelector();
    v8 = v10;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "attributePicker:didSelectToolWithTag:attributeTag:", self, v5, v6);
      v8 = v10;
    }
  }

}

- (void)revalidateItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AKAttributePickerViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKAttributePickerViewController rowViews](self, "rowViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "revalidateItems:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AKAttributePickerViewController rowViews](self, "rowViews", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWithTag:", 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAttributePickerViewController rowViews](self, "rowViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "removeFromSuperview");
  objc_msgSend(v7, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ak_addSubview:withEdgeInsets:", v12, 0.0, 12.0, 0.0, -12.0);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a3;
  v8 = objc_msgSend(a5, "row");
  v9 = objc_msgSend(v7, "numberOfRowsInSection:", 0);

  if (v8 < v9 - 1)
    objc_msgSend(v10, "setSeparatorStyle:", 1);

}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKAttributePickerViewControllerDelegate)delegate
{
  return (AKAttributePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setTableView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSArray)rowViews
{
  return (NSArray *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setRowViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedAnnotations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_controller);
}

@end
