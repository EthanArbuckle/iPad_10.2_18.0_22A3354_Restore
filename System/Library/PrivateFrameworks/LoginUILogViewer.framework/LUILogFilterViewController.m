@implementation LUILogFilterViewController

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[LUILogFilterViewController setFilterView:](self, "setFilterView:", v3);
  -[LUILogFilterViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUILogFilterViewController;
  -[LUILogFilterViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[LUILogFilterViewController _setupTableView](self, "_setupTableView");
  -[LUILogFilterViewController _setupCollectionView](self, "_setupCollectionView");
  -[LUILogFilterViewController _setupButtons](self, "_setupButtons");
  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUILogFilterViewController;
  -[LUILogFilterViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  -[LUILogFilterViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "logFilterViewControllerShouldAllowTextEditing:", self);
  -[LUILogFilterViewController filterView](self, "filterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUILogFilterViewController;
  -[LUILogFilterViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterViewController;
  -[LUILogFilterViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicatesKeyCandidateCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateLayout");

  -[LUILogFilterViewController filterView](self, "filterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicatesComparisonCandidateCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateLayout");

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterViewController;
  -[LUILogFilterViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[LUILogFilterViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "logFilterViewControllerShouldAllowTextEditing:", self);
  -[LUILogFilterViewController filterView](self, "filterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", v6);

}

- (void)_setupTableView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingPredicatesTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingPredicatesTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingPredicatesTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("currentPredicateCell"));

}

- (void)_setupCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicatesKeyCandidateCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicatesKeyCandidateCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicatesComparisonCandidateCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicatesComparisonCandidateCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicatesValueCandidateCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicatesValueCandidateCollectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[LUILogFilterViewController filterView](self, "filterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicatesKeyCandidateCollectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("candidateCell"));

  -[LUILogFilterViewController filterView](self, "filterView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicatesComparisonCandidateCollectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("candidateCell"));

  -[LUILogFilterViewController filterView](self, "filterView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicatesValueCandidateCollectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("candidateCell"));

  -[LUILogFilterViewController filterView](self, "filterView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicatesValueCandidateCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAllowsMultipleSelection:", 1);

}

- (void)_setupButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_addButtonTapped_, 64);

  -[LUILogFilterViewController filterView](self, "filterView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_applyButtonTapped_, 64);

}

- (void)predicateDataUpdated
{
  void *v2;
  id v3;

  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingPredicatesTableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)predicateKeyCandidates
{
  if (predicateKeyCandidates_onceToken != -1)
    dispatch_once(&predicateKeyCandidates_onceToken, &__block_literal_global_2);
  return (id)predicateKeyCandidates_candidates;
}

void __52__LUILogFilterViewController_predicateKeyCandidates__block_invoke()
{
  void *v0;

  v0 = (void *)predicateKeyCandidates_candidates;
  predicateKeyCandidates_candidates = (uint64_t)&unk_24FEC1D68;

}

- (id)predicateComparisonCandidates
{
  if (predicateComparisonCandidates_onceToken != -1)
    dispatch_once(&predicateComparisonCandidates_onceToken, &__block_literal_global_137);
  return (id)predicateComparisonCandidates_candidates;
}

void __59__LUILogFilterViewController_predicateComparisonCandidates__block_invoke()
{
  void *v0;

  v0 = (void *)predicateComparisonCandidates_candidates;
  predicateComparisonCandidates_candidates = (uint64_t)&unk_24FEC1D80;

}

- (id)predicateValueCandidates
{
  if (predicateValueCandidates_onceToken != -1)
    dispatch_once(&predicateValueCandidates_onceToken, &__block_literal_global_144);
  return (id)predicateValueCandidates_candidates;
}

void __54__LUILogFilterViewController_predicateValueCandidates__block_invoke()
{
  void *v0;

  v0 = (void *)predicateValueCandidates_candidates;
  predicateValueCandidates_candidates = (uint64_t)&unk_24FEC1D98;

}

- (id)predicateValueCandidatesSize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__LUILogFilterViewController_predicateValueCandidatesSize__block_invoke;
  block[3] = &unk_24FEBBC70;
  block[4] = self;
  if (predicateValueCandidatesSize_onceToken != -1)
    dispatch_once(&predicateValueCandidatesSize_onceToken, block);
  return (id)predicateValueCandidatesSize_candidatesSize;
}

void __58__LUILogFilterViewController_predicateValueCandidatesSize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "predicateValueCandidates");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sizeArrayWithStrings:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)predicateValueCandidatesSize_candidatesSize;
  predicateValueCandidatesSize_candidatesSize = v2;

}

- (id)sizeArrayWithStrings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = *MEMORY[0x24BDF65F8];
    v9 = *MEMORY[0x24BDF7880];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v31 = v8;
        objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, 1000.0, 30.0);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;

        v26[0] = v15;
        v26[1] = v17;
        *(double *)&v26[2] = v19 + 22.0;
        v26[3] = v21;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v26, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v22);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  v23 = (void *)objc_msgSend(v4, "copy");
  return v23;
}

- (void)_updatePredicateText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  LUILogFilterViewController *v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  _QWORD v29[4];
  id v30;
  LUILogFilterViewController *v31;
  id v32;
  id v33;

  v3 = (void *)objc_opt_new();
  -[LUILogFilterViewController filterView](self, "filterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicatesKeyCandidateCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[LUILogFilterViewController filterView](self, "filterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicatesComparisonCandidateCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LUILogFilterViewController filterView](self, "filterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicatesValueCandidateCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForSelectedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __50__LUILogFilterViewController__updatePredicateText__block_invoke;
  v29[3] = &unk_24FEBBFF8;
  v14 = v6;
  v30 = v14;
  v31 = self;
  v15 = v3;
  v32 = v15;
  v16 = v9;
  v33 = v16;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BBB78](v29);
  objc_msgSend(v12, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v21 = v13;
    v22 = 3221225472;
    v23 = __50__LUILogFilterViewController__updatePredicateText__block_invoke_2;
    v24 = &unk_24FEBC020;
    v28 = v17;
    v25 = v15;
    v26 = self;
    v27 = v12;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", &v21);

  }
  else
  {
    ((void (**)(_QWORD, id))v17)[2](v17, v15);
  }
  -[LUILogFilterViewController filterView](self, "filterView", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v15);

}

void __50__LUILogFilterViewController__updatePredicateText__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1[4], "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[5], "predicateKeyCandidates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = a1[6];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ "), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);

  }
  objc_msgSend(a1[7], "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1[5], "predicateComparisonCandidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "appendString:", v11);
  }
}

void __50__LUILogFilterViewController__updatePredicateText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v8 = a2;
  v7(v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "predicateValueCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 == a3)
    v13 = &stru_24FEBC7E0;
  else
    v13 = CFSTR(" OR ");
  objc_msgSend(v12, "stringWithFormat:", CFSTR(" '%@'%@"), v15, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v14);

}

- (void)_clearCellsSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicatesKeyCandidateCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  -[LUILogFilterViewController filterView](self, "filterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicatesComparisonCandidateCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  -[LUILogFilterViewController filterView](self, "filterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicatesValueCandidateCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v14, "indexPathsForSelectedItems", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v21;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v21 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v14, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), 0);
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v17);
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v11);
  }

}

- (void)_clearPredicateInput
{
  void *v3;
  void *v4;

  -[LUILogFilterViewController filterView](self, "filterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[LUILogFilterViewController _clearCellsSelection](self, "_clearCellsSelection");
}

- (void)_shakeInputView:(id)a3
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x24BDE5648];
  v4 = a3;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("position"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", 0.05);
  LODWORD(v5) = 2.0;
  objc_msgSend(v15, "setRepeatCount:", v5);
  objc_msgSend(v15, "setAutoreverses:", 1);
  v6 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "center");
  v8 = v7 + -15.0;
  objc_msgSend(v4, "center");
  objc_msgSend(v6, "valueWithCGPoint:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v9);

  v10 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "center");
  v12 = v11 + 15.0;
  objc_msgSend(v4, "center");
  objc_msgSend(v10, "valueWithCGPoint:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v13);

  objc_msgSend(v4, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAnimation:forKey:", v15, CFSTR("position"));
}

- (void)addButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
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
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  -[LUILogFilterViewController filterView](self, "filterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v39, "length") == 0;
  -[LUILogFilterViewController filterView](self, "filterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5)
  {
    objc_msgSend(v6, "predicateTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogFilterViewController _shakeInputView:](self, "_shakeInputView:", v16);

  }
  else
  {
    objc_msgSend(v6, "predicatesValueCandidateCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForSelectedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      -[LUILogFilterViewController filterView](self, "filterView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicatesKeyCandidateCollectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathsForSelectedItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        -[LUILogFilterViewController filterView](self, "filterView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicatesComparisonCandidateCollectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "indexPathsForSelectedItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v15, "count") != 0;

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

    -[LUILogFilterViewController filterView](self, "filterView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicatesValueCandidateCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexPathsForSelectedItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = 0;
    }
    else
    {
      -[LUILogFilterViewController filterView](self, "filterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predicatesKeyCandidateCollectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "indexPathsForSelectedItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        v20 = 0;
      }
      else
      {
        -[LUILogFilterViewController filterView](self, "filterView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "predicatesComparisonCandidateCollectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "indexPathsForSelectedItems");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v24;
        v20 = objc_msgSend(v26, "count") == 0;

      }
    }

    if (v37 || v20)
    {
      v27 = (void *)MEMORY[0x24BDD1758];
      -[LUILogFilterViewController filterView](self, "filterView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "predicateTextField");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "text");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "predicateWithFormat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[LUILogFilterViewController delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logFilterViewController:didAddPredicates:", self, v33);

      -[LUILogFilterViewController _clearPredicateInput](self, "_clearPredicateInput");
    }
    else
    {
      -[LUILogFilterViewController filterView](self, "filterView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "predicateTextField");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[LUILogFilterViewController _shakeInputView:](self, "_shakeInputView:", v35);

    }
  }

}

- (void)applyButtonTapped:(id)a3
{
  id v4;

  -[LUILogFilterViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logFilterViewControllerApplyButtonTapped:", self);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("candidateCell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterViewController filterView](self, "filterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicatesKeyCandidateCollectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    -[LUILogFilterViewController predicateKeyCandidates](self, "predicateKeyCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[LUILogFilterViewController filterView](self, "filterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicatesComparisonCandidateCollectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v6)
  {
    -[LUILogFilterViewController predicateComparisonCandidates](self, "predicateComparisonCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[LUILogFilterViewController filterView](self, "filterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicatesValueCandidateCollectionView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v6)
  {
    -[LUILogFilterViewController predicateValueCandidates](self, "predicateValueCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = v15;
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

  }
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v19, "CGColor");
  objc_msgSend(v8, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBorderColor:", v20);

  objc_msgSend(v8, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderWidth:", 1.5);

  objc_msgSend(v8, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", 5.0);

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[LUILogFilterViewController filterView](self, "filterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicatesKeyCandidateCollectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[LUILogFilterViewController predicateKeyCandidates](self, "predicateKeyCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = v13;
    v12 = objc_msgSend(v13, "count");

    goto LABEL_9;
  }
  -[LUILogFilterViewController filterView](self, "filterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicatesComparisonCandidateCollectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    -[LUILogFilterViewController predicateComparisonCandidates](self, "predicateComparisonCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[LUILogFilterViewController filterView](self, "filterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicatesValueCandidateCollectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v5)
  {
    -[LUILogFilterViewController predicateValueCandidates](self, "predicateValueCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  v7 = a3;
  v8 = a5;
  -[LUILogFilterViewController filterView](self, "filterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicatesValueCandidateCollectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    -[LUILogFilterViewController predicateValueCandidatesSize](self, "predicateValueCandidatesSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v11 = v14;

  }
  else
  {
    objc_msgSend(v7, "frame");
    v11 = CGRectGetWidth(v18) + -20.0;
  }

  v15 = 30.0;
  v16 = v11;
  result.height = v15;
  result.width = v16;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 10.0;
  v7 = 0.0;
  v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("currentPredicateCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPredicates:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "section");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v7, "setDelegate:", self);
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[LUILogFilterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPredicates:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= 1)
    return 1;
  else
    return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[LUILogFilterViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPredicates:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 10.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 30.0;
}

- (void)predicateTableViewCellDeleteButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[LUILogFilterViewController filterView](self, "filterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingPredicatesTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[LUILogFilterViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPredicates:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logFilterViewController:didDeletePredicate:", self, v10);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  -[LUILogFilterViewController _clearCellsSelection](self, "_clearCellsSelection", a3, a4.location, a4.length, a5);
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[LUILogFilterViewController _clearPredicateInput](self, "_clearPredicateInput");
  v5 = objc_msgSend(v4, "isFirstResponder");
  if ((v5 & 1) == 0)
    objc_msgSend(v4, "setText:", 0);

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[LUILogFilterViewController addButtonTapped:](self, "addButtonTapped:", 0);
  return 1;
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  -[LUILogFilterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "logFilterViewControllerShouldAllowTextEditing:", self);

  if (v5)
  {
    CGAffineTransformMakeTranslation(&v8, 0.0, -200.0);
    -[LUILogFilterViewController filterView](self, "filterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setTransform:", &v7);

  }
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  -[LUILogFilterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "logFilterViewControllerShouldAllowTextEditing:", self);

  if (v5)
  {
    CGAffineTransformMakeTranslation(&v8, 0.0, 0.0);
    -[LUILogFilterViewController filterView](self, "filterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setTransform:", &v7);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LUILogFilterViewControllerDelegate)delegate
{
  return (LUILogFilterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LUILogFilterView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
  objc_storeStrong((id *)&self->_filterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
