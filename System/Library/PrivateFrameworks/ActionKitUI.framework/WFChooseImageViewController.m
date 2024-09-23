@implementation WFChooseImageViewController

- (WFChooseImageViewController)initWithCollection:(id)a3 selectedIndexes:(id)a4
{
  id v7;
  id v8;
  WFChooseImageViewController *v9;
  WFChooseImageViewController *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableSet *selectedItems;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFChooseImageViewController;
  v9 = -[WFChooseImageViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v10->_itemsPerRow = 4;
    v11 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v7, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectsAtIndexes:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithArray:", v13);
    selectedItems = v10->_selectedItems;
    v10->_selectedItems = (NSMutableSet *)v14;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v10, sel_done);
    objc_msgSend(v16, "setStyle:", 2);
    -[WFChooseImageViewController navigationItem](v10, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v16);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel_cancel);
    -[WFChooseImageViewController navigationItem](v10, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLeftBarButtonItem:", v18);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFChooseImageViewController;
  -[WFChooseImageViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFChooseImageViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorColor:", v3);

}

- (void)setItemsPerRow:(int64_t)a3
{
  id v3;

  if (a3)
  {
    self->_itemsPerRow = a3;
    -[WFChooseImageViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFChooseImageViewController;
  -[WFChooseImageViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (-[WFChooseImageViewController maximumNumberOfItems](self, "maximumNumberOfItems") == 1)
    v4 = CFSTR("Choose Image");
  else
    v4 = CFSTR("Choose Images");
  WFLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFChooseImageViewController setTitle:](self, "setTitle:", v5);

  v6 = -[NSMutableSet count](self->_selectedItems, "count");
  v7 = v6 >= -[WFChooseImageViewController minimumNumberOfItems](self, "minimumNumberOfItems");
  -[WFChooseImageViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  -[WFChooseImageViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentSize");
  -[WFChooseImageViewController setItemsPerRow:](self, "setItemsPerRow:", vcvtmd_s64_f64(v11 / 80.0));

}

- (void)viewDidLayoutSubviews
{
  CGRect *p_lastFrame;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  BOOL v9;
  void *v10;
  double v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)WFChooseImageViewController;
  -[WFChooseImageViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  p_lastFrame = &self->_lastFrame;
  -[WFChooseImageViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v18.origin.x = v5;
  v18.origin.y = v6;
  v18.size.width = v7;
  v18.size.height = v8;
  v9 = CGRectEqualToRect(self->_lastFrame, v18);

  if (!v9)
  {
    -[WFChooseImageViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentSize");
    -[WFChooseImageViewController setItemsPerRow:](self, "setItemsPerRow:", vcvtmd_s64_f64(v11 / 80.0));

    -[WFChooseImageViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    p_lastFrame->origin.x = v13;
    p_lastFrame->origin.y = v14;
    p_lastFrame->size.width = v15;
    p_lastFrame->size.height = v16;

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[WFContentCollection items](self->_collection, "items", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v5, "count") / (double)self->_itemsPerRow);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  WFImageContentItemCell *v7;
  uint64_t v8;
  unint64_t itemsPerRow;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFImageContentItemCell *v19;
  WFImageContentItemCell *v20;
  _QWORD v22[4];
  WFImageContentItemCell *v23;
  WFChooseImageViewController *v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WFImageContentItemCellIdentifier"));
  v7 = (WFImageContentItemCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[WFImageContentItemCell initWithStyle:reuseIdentifier:]([WFImageContentItemCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WFImageContentItemCellIdentifier"));
  v8 = objc_msgSend(v6, "row");
  itemsPerRow = self->_itemsPerRow;
  v10 = itemsPerRow * v8;
  -[WFContentCollection items](self->_collection, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = v12 - self->_itemsPerRow * objc_msgSend(v6, "row");

  if (itemsPerRow >= v13)
    v14 = v13;
  else
    v14 = itemsPerRow;
  -[WFContentCollection items](self->_collection, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subarrayWithRange:", v10, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  while ((unint64_t)objc_msgSend(v17, "count") < self->_itemsPerRow)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

  }
  -[WFImageContentItemCell setItems:](v7, "setItems:", v17);
  -[WFImageContentItemCell setDelegate:](v7, "setDelegate:", self);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__WFChooseImageViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v22[3] = &unk_24E343278;
  v19 = v7;
  v23 = v19;
  v24 = self;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v22);
  v20 = v19;

  return v20;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  double v6;
  CGRect v8;

  -[WFChooseImageViewController tableView](self, "tableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = floor((CGRectGetWidth(v8) - (double)self->_itemsPerRow + 1.0) / (double)self->_itemsPerRow);

  return v6;
}

- (void)cancel
{
  id v3;

  -[WFChooseImageViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chooseImageControllerDidCancel:", self);

}

- (void)done
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BE19438];
  -[NSMutableSet allObjects](self->_selectedItems, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__WFChooseImageViewController_done__block_invoke;
  v8[3] = &unk_24E3432A0;
  v8[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionWithItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFChooseImageViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chooseImageController:didSelectItems:", self, v6);

}

- (void)cell:(id)a3 didSelectImageViewAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  NSMutableSet *selectedItems;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[WFChooseImageViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 + self->_itemsPerRow * objc_msgSend(v7, "row");

  -[WFContentCollection items](self->_collection, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= objc_msgSend(v9, "count"))
  {
    v11 = v9;
LABEL_12:

    goto LABEL_13;
  }
  -[WFContentCollection items](self->_collection, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[WFChooseImageViewController maximumNumberOfItems](self, "maximumNumberOfItems");
    v13 = -[WFChooseImageViewController minimumNumberOfItems](self, "minimumNumberOfItems");
    v14 = -[NSMutableSet containsObject:](self->_selectedItems, "containsObject:", v11);
    selectedItems = self->_selectedItems;
    if (v14)
    {
      -[NSMutableSet removeObject:](selectedItems, "removeObject:", v11);
    }
    else if (v12 - 1 >= -[NSMutableSet count](selectedItems, "count"))
    {
      -[NSMutableSet addObject:](self->_selectedItems, "addObject:", v11);
    }
    if (-[NSMutableSet count](self->_selectedItems, "count") == 1
      && -[WFChooseImageViewController maximumNumberOfItems](self, "maximumNumberOfItems") == 1)
    {
      -[WFChooseImageViewController done](self, "done");
    }
    else
    {
      objc_msgSend(v19, "setSelected:atIndex:", -[NSMutableSet containsObject:](self->_selectedItems, "containsObject:", v11), v8 % self->_itemsPerRow);
      v16 = -[NSMutableSet count](self->_selectedItems, "count") >= v13;
      -[WFChooseImageViewController navigationItem](self, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rightBarButtonItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setEnabled:", v16);

    }
    goto LABEL_12;
  }
LABEL_13:

}

- (WFChooseImageViewControllerDelegate)delegate
{
  return (WFChooseImageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)minimumNumberOfItems
{
  return self->_minimumNumberOfItems;
}

- (void)setMinimumNumberOfItems:(unint64_t)a3
{
  self->_minimumNumberOfItems = a3;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

- (WFContentCollection)collection
{
  return self->_collection;
}

- (int64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedItems, 0);
}

uint64_t __35__WFChooseImageViewController_done__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  objc_msgSend(v5, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v7);

  objc_msgSend(v12, "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "compare:", v15);

  return v16;
}

void __63__WFChooseImageViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v5 = 0;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setSelected:atIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "containsObject:", v5), a3);

}

@end
