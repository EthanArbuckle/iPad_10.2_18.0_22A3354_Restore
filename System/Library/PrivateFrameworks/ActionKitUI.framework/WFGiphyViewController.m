@implementation WFGiphyViewController

- (WFGiphyViewController)initWithQuery:(id)a3 selectMultiple:(BOOL)a4
{
  _BOOL4 v4;
  id v8;
  WFGiphyViewController *v9;
  WFGiphyViewController *v10;
  uint64_t v11;
  WFGiphySessionManager *sessionManager;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  UICollectionViewFlowLayout *collectionViewLayout;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  objc_super v32;

  v4 = a4;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGiphyViewController.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  v32.receiver = self;
  v32.super_class = (Class)WFGiphyViewController;
  v9 = -[WFGiphyViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_selectMultiple = v4;
    v11 = objc_opt_new();
    sessionManager = v10->_sessionManager;
    v10->_sessionManager = (WFGiphySessionManager *)v11;

    -[WFGiphySessionManager setApiKey:](v10->_sessionManager, "setApiKey:", *MEMORY[0x24BE01050]);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = 1.0 / v14;

    v16 = objc_opt_new();
    collectionViewLayout = v10->_collectionViewLayout;
    v10->_collectionViewLayout = (UICollectionViewFlowLayout *)v16;

    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v10->_collectionViewLayout, "setMinimumInteritemSpacing:", v15);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v10->_collectionViewLayout, "setMinimumLineSpacing:", v15);
    -[UICollectionViewFlowLayout setSectionInset:](v10->_collectionViewLayout, "setSectionInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    -[UICollectionViewFlowLayout setHeaderReferenceSize:](v10->_collectionViewLayout, "setHeaderReferenceSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    WFLocalizedString(CFSTR("Giphy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGiphyViewController setTitle:](v10, "setTitle:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
    objc_msgSend(v19, "setObscuresBackgroundDuringPresentation:", 0);
    objc_msgSend(v19, "setHidesNavigationBarDuringPresentation:", 0);
    WFLocalizedString(CFSTR("Search Giphy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPlaceholder:", v20);

    objc_msgSend(v19, "searchBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsCancelButton:", 0);

    objc_msgSend(v19, "searchBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", v10);

    objc_msgSend(v19, "searchBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v8);

    -[WFGiphyViewController navigationItem](v10, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSearchController:", v19);

    -[WFGiphyViewController navigationItem](v10, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidesSearchBarWhenScrolling:", 0);

    v27 = objc_alloc(MEMORY[0x24BEBD410]);
    if (v4)
    {
      v28 = (void *)objc_msgSend(v27, "initWithBarButtonSystemItem:target:action:", 0, v10, sel_done);
      objc_msgSend(v28, "setStyle:", 2);
    }
    else
    {
      v28 = (void *)objc_msgSend(v27, "initWithBarButtonSystemItem:target:action:", 1, v10, sel_cancel);
    }
    -[WFGiphyViewController navigationItem](v10, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRightBarButtonItem:", v28);

  }
  return v10;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  WFGiphyViewController *v76;
  objc_super v77;
  _QWORD v78[16];

  v78[14] = *MEMORY[0x24BDAC8D0];
  v77.receiver = self;
  v77.super_class = (Class)WFGiphyViewController;
  -[WFGiphyViewController loadView](&v77, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGiphyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x24BEBD450]);
  -[WFGiphyViewController collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setDataSource:", self);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setAllowsMultipleSelection:", -[WFGiphyViewController selectMultiple](self, "selectMultiple"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("WFGiphyCellReuseIdentifier"));
  -[WFGiphyViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_storeWeak((id *)&self->_collectionView, v7);
  v10 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setHidden:", 1);
  -[WFGiphyViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  v76 = self;
  objc_storeWeak((id *)&self->_emptyListView, v10);
  v12 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v13);

  WFLocalizedString(CFSTR("No Results Found"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v14);

  objc_msgSend(v12, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 28.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v15);

  objc_msgSend(v10, "addSubview:", v12);
  v16 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v18);

  WFLocalizedString(CFSTR("Clear the search bar to view trending GIFs."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v19);

  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setTextAlignment:", 1);
  objc_msgSend(v10, "addSubview:", v16);
  -[WFGiphyViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "widthAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -60.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v73;
  objc_msgSend(v10, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v69;
  objc_msgSend(v10, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v66;
  objc_msgSend(v12, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v62;
  objc_msgSend(v12, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v59;
  v70 = v12;
  objc_msgSend(v12, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v55;
  objc_msgSend(v16, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 10.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v50;
  objc_msgSend(v16, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v47;
  v64 = v16;
  objc_msgSend(v16, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v44;
  objc_msgSend(v16, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v41;
  objc_msgSend(v7, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  objc_msgSend(v20, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v38;
  v22 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v24;
  v57 = v22;
  objc_msgSend(v22, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v21;
  v53 = v21;
  objc_msgSend(v21, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[12] = v28;
  objc_msgSend(v22, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78[13] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "activateConstraints:", v32);

  -[WFGiphyViewController query](v76, "query");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGiphyViewController navigationItem](v76, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "searchController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "searchBar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setText:", v33);

  -[WFGiphyViewController updateResults](v76, "updateResults");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  double Width;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)WFGiphyViewController;
  -[WFGiphyViewController viewWillAppear:](&v28, sel_viewWillAppear_, a3);
  -[WFGiphyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetWidth(v29) / 125.0;
  v6 = ceil(v5);
  v7 = vcvtpd_u64_f64(v5);

  -[WFGiphyViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v30);
  v10 = (double)(v7 - 1);
  -[WFGiphyViewController collectionViewLayout](self, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimumInteritemSpacing");
  v13 = (Width - v10 * v12) / (double)(unint64_t)v6;

  -[WFGiphyViewController collectionViewLayout](self, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItemSize:", v13, v13);

  v15 = *MEMORY[0x24BEBE158];
  v16 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v17 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v18 = *(double *)(MEMORY[0x24BEBE158] + 24);
  -[WFGiphyViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentInset:", v15, v16, v17, v18);

  -[WFGiphyViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScrollIndicatorInsets:", v15, v16, v17, v18);

  v21 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("GiphyLogo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UIImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithImage:", v23);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTintColor:", v25);

  objc_msgSend(v24, "sizeToFit");
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v24);
  -[WFGiphyViewController navigationItem](self, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLeftBarButtonItem:", v26);

}

- (void)setObjects:(id)a3
{
  BOOL v4;
  NSArray *v5;
  NSArray *objects;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSArray isEqualToArray:](self->_objects, "isEqualToArray:", v10);
  v5 = (NSArray *)objc_msgSend(v10, "copy");
  objects = self->_objects;
  self->_objects = v5;

  if (!v4)
  {
    v7 = objc_msgSend(v10, "count") != 0;
    -[WFGiphyViewController emptyListView](self, "emptyListView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v7);

    -[WFGiphyViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (void)setQuery:(id)a3
{
  BOOL v4;
  NSString *v5;
  NSString *query;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[NSString isEqualToString:](self->_query, "isEqualToString:", v8);
  v5 = (NSString *)objc_msgSend(v8, "copy");
  query = self->_query;
  self->_query = v5;

  if (!objc_msgSend(v8, "length"))
  {
    WFLocalizedString(CFSTR("Trending"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGiphyViewController setTitle:](self, "setTitle:", v7);

    if (v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[WFGiphyViewController setTitle:](self, "setTitle:", v8);
  if (!v4)
LABEL_3:
    -[WFGiphyViewController updateResults](self, "updateResults");
LABEL_4:

}

- (void)updateResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFGiphyViewController_updateResults__block_invoke;
  aBlock[3] = &unk_24E343B20;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[WFGiphyViewController query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[WFGiphyViewController sessionManager](self, "sessionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    -[WFGiphyViewController query](self, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "search:limit:completion:", v8, 100, v3);

  }
  else
  {
    objc_msgSend(v6, "trendingWithLimit:completion:", 100, v3);
  }

}

- (void)done
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFGiphyViewController collectionView](self, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9++), "item"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[WFGiphyViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[WFGiphyViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGiphyViewController objects](self, "objects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectsAtIndexes:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "giphyViewController:didSelectObjects:", self, v14);

  }
}

- (void)cancel
{
  void *v3;
  char v4;
  id v5;

  -[WFGiphyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFGiphyViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "giphyViewControllerDidCancel:", self);

  }
}

- (BOOL)accessibilityPerformEscape
{
  -[WFGiphyViewController cancel](self, "cancel");
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;

  v5 = a4;
  if (!objc_msgSend(v5, "length"))
    -[WFGiphyViewController setQuery:](self, "setQuery:", v5);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGiphyViewController setQuery:](self, "setQuery:", v4);

  objc_msgSend(v5, "resignFirstResponder");
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (!-[WFGiphyViewController selectMultiple](self, "selectMultiple", a3, a4))
    -[WFGiphyViewController done](self, "done");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFGiphyViewController objects](self, "objects", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("WFGiphyCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGiphyViewController objects](self, "objects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:", v10);

  return v7;
}

- (BOOL)selectMultiple
{
  return self->_selectMultiple;
}

- (NSString)query
{
  return self->_query;
}

- (WFGiphyViewControllerDelegate)delegate
{
  return (WFGiphyViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)emptyListView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_emptyListView);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (WFGiphySessionManager)sessionManager
{
  return self->_sessionManager;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_emptyListView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
}

void __38__WFGiphyViewController_updateResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObjects:", v6);

}

@end
