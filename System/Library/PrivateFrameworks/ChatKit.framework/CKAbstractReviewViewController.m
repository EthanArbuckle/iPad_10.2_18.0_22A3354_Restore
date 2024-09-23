@implementation CKAbstractReviewViewController

- (CKAbstractReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CKAbstractReviewViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAbstractReviewViewController;
  v4 = -[CKAbstractReviewViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__applicationDidBecomeActive_, *MEMORY[0x1E0CEB270], 0);

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

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKAbstractReviewViewController;
  -[CKAbstractReviewViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  id v34;

  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[CKAbstractReviewViewController setTableView:](self, "setTableView:", v8);

  objc_msgSend((id)-[CKAbstractReviewViewController tableViewCellClass](self, "tableViewCellClass"), "requestedHeight");
  v10 = v9;
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRowHeight:", v10);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeparatorInset:", 0.0, 66.0, 0.0, 0.0);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsSelection:", 1);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsMultipleSelection:", 0);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsMultipleSelectionDuringEditing:", 1);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CKAbstractReviewViewController tableViewCellClass](self, "tableViewCellClass");
  -[CKAbstractReviewViewController tableViewCellReuseIdentifier](self, "tableViewCellReuseIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v17, v18);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  +[CKStorageLoadingCell reuseIdentifier](CKStorageLoadingCell, "reuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", v20, v21);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentInset:", 35.0, 0.0, 0.0, 0.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDataSource:", self);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  -[CKAbstractReviewViewController setTopLineView:](self, "setTopLineView:", v27);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "separatorColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController topLineView](self, "topLineView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v29);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController topLineView](self, "topLineView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  -[CKAbstractReviewViewController navigationBarTitle](self, "navigationBarTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController setTitle:](self, "setTitle:", v33);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController setView:](self, "setView:", v34);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAbstractReviewViewController;
  -[CKAbstractReviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKAbstractReviewViewController _updateNavigationItemState](self, "_updateNavigationItemState");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAbstractReviewViewController;
  -[CKAbstractReviewViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  if (CKPixelWidth_once != -1)
    dispatch_once(&CKPixelWidth_once, &__block_literal_global_1);
  v6 = *(double *)&CKPixelWidth_sPixel;
  -[CKAbstractReviewViewController topLineView](self, "topLineView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v5, v6);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAbstractReviewViewController;
  -[CKAbstractReviewViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditing:animated:", v5, v4);

  -[CKAbstractReviewViewController _updateNavigationItemState](self, "_updateNavigationItemState");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 || v7 != v6)
    return 0;
  else
    return -[CKAbstractReviewViewController numberOfModelObjects](self, "numberOfModelObjects");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[CKAbstractReviewViewController modelObjectAtIndex:](self, "modelObjectAtIndex:", objc_msgSend(v5, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKStorageLoadingCell reuseIdentifier](CKStorageLoadingCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[CKStorageLoadingCell reuseIdentifier](CKStorageLoadingCell, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKAbstractReviewViewController tableViewCellReuseIdentifier](self, "tableViewCellReuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setModelObject:", v6);
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && a4 == 1 && (id)v10 == v8 && !objc_msgSend(v9, "section"))
  {
    v12 = objc_msgSend(v9, "row");
    v13 = -[CKAbstractReviewViewController numberOfModelObjects](self, "numberOfModelObjects");

    if (v12 < v13)
    {
      -[CKAbstractReviewViewController modelObjectAtIndex:](self, "modelObjectAtIndex:", objc_msgSend(v9, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAbstractReviewViewController deleteModelObjectAndUnderlyingData:](self, "deleteModelObjectAndUnderlyingData:", v14);
      -[CKAbstractReviewViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 100);

    }
  }
  else
  {

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  if ((-[CKAbstractReviewViewController isEditing](self, "isEditing") & 1) == 0 && !objc_msgSend(v5, "section"))
    -[CKAbstractReviewViewController didSelectModelObjectAtIndex:](self, "didSelectModelObjectAtIndex:", objc_msgSend(v5, "row"));

}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKAbstractReviewViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v6, 0);

  -[CKAbstractReviewViewController reloadModelData](self, "reloadModelData");
  -[CKAbstractReviewViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_handleCancel
{
  -[CKAbstractReviewViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_handleDelete
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[CKAbstractReviewViewController isEditing](self, "isEditing");

    if (v5)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[CKAbstractReviewViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathsForSelectedRows");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__CKAbstractReviewViewController__handleDelete__block_invoke;
      v14[3] = &unk_1E274A2F0;
      v14[4] = self;
      v14[5] = &v15;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

      v9 = (void *)v16[5];
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __47__CKAbstractReviewViewController__handleDelete__block_invoke_2;
      v13[3] = &unk_1E274A318;
      v13[4] = self;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
      -[CKAbstractReviewViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAbstractReviewViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathsForSelectedRows");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);

      _Block_object_dispose(&v15, 8);
    }
  }
  else
  {

  }
  -[CKAbstractReviewViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

void __47__CKAbstractReviewViewController__handleDelete__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!objc_msgSend(v5, "section"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "modelObjectAtIndex:", objc_msgSend(v5, "row"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

uint64_t __47__CKAbstractReviewViewController__handleDelete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteModelObjectAndUnderlyingData:", a2);
}

- (void)_updateNavigationItemState
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[CKAbstractReviewViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKAbstractReviewViewController navigationItem](self, "navigationItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKAbstractReviewViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = -[CKAbstractReviewViewController isEditing](self, "isEditing");
  if ((_DWORD)v6)
  {
    -[CKAbstractReviewViewController cancelEditingBarButtonItem](self, "cancelEditingBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancel);
      -[CKAbstractReviewViewController setCancelEditingBarButtonItem:](self, "setCancelEditingBarButtonItem:", v8);

    }
    -[CKAbstractReviewViewController deleteBarButtonItem](self, "deleteBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 16, self, sel__handleDelete);
      -[CKAbstractReviewViewController setDeleteBarButtonItem:](self, "setDeleteBarButtonItem:", v10);

    }
    -[CKAbstractReviewViewController cancelEditingBarButtonItem](self, "cancelEditingBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v11);

    -[CKAbstractReviewViewController deleteBarButtonItem](self, "deleteBarButtonItem");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "setLeftBarButtonItem:", 0);
    -[CKAbstractReviewViewController editButtonItem](self, "editButtonItem");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v14, "setRightBarButtonItem:", v12);

  objc_msgSend(v14, "setHidesBackButton:animated:", v6, 1);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIView)topLineView
{
  return self->_topLineView;
}

- (void)setTopLineView:(id)a3
{
  objc_storeStrong((id *)&self->_topLineView, a3);
}

- (UIBarButtonItem)cancelEditingBarButtonItem
{
  return self->_cancelEditingBarButtonItem;
}

- (void)setCancelEditingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelEditingBarButtonItem, a3);
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (void)setDeleteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelEditingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
