@implementation EKEventDetailLocationDisambiguationContentViewController

- (EKEventDetailLocationDisambiguationContentViewController)initWithLocation:(id)a3 pois:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  EKEventDetailLocationDisambiguationContentViewController *v11;
  EKEventDetailLocationDisambiguationContentViewController *v12;
  uint64_t v13;
  NSMutableArray *pois;
  NSMutableArray *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  id completionBlock;
  dispatch_queue_t v25;
  OS_dispatch_queue *iconRenderQueue;
  uint64_t v27;
  NSCache *iconCache;
  void *v29;
  id v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  v11 = -[EKEventDetailLocationDisambiguationContentViewController init](&v40, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_location, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count") + 1);
    pois = v12->_pois;
    v12->_pois = (NSMutableArray *)v13;

    v15 = v12->_pois;
    v16 = (void *)objc_msgSend(v32, "copy");
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v17);
          v21 = v12->_pois;
          v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v20), "copy");
          -[NSMutableArray addObject:](v21, "addObject:", v22);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v18);
    }

    v23 = _Block_copy(v10);
    completionBlock = v12->_completionBlock;
    v12->_completionBlock = v23;

    v25 = dispatch_queue_create("LocationDisambiguationVCIconRenderQueue", MEMORY[0x1E0C80D50]);
    iconRenderQueue = v12->_iconRenderQueue;
    v12->_iconRenderQueue = (OS_dispatch_queue *)v25;

    v27 = objc_opt_new();
    iconCache = v12->_iconCache;
    v12->_iconCache = (NSCache *)v27;

    -[EKEventDetailLocationDisambiguationContentViewController setDefinesPresentationContext:](v12, "setDefinesPresentationContext:", 1);
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v12);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __98__EKEventDetailLocationDisambiguationContentViewController_initWithLocation_pois_completionBlock___block_invoke;
    v33[3] = &unk_1E6018610;
    objc_copyWeak(&v34, &location);
    v30 = (id)-[EKEventDetailLocationDisambiguationContentViewController registerForTraitChanges:withHandler:](v12, "registerForTraitChanges:withHandler:", v29, v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __98__EKEventDetailLocationDisambiguationContentViewController_initWithLocation_pois_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateConstraints");

}

- (void)_createConstraints
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
  NSSet *v16;
  NSSet *tallConstraints;
  void *v18;
  void *v19;
  void *v20;
  NSSet *v21;
  NSSet *iPadConstraints;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSSet *splitConstraints;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSSet *v85;
  void *v86;
  _QWORD v87[12];
  _QWORD v88[13];

  v88[11] = *MEMORY[0x1E0C80C00];
  -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_opt_new();
  v85 = (NSSet *)objc_opt_new();
  -[MKMapView leadingAnchor](self->_mapView, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v80);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v78;
  -[MKMapView trailingAnchor](self->_mapView, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v74);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v71;
  -[MKMapView topAnchor](self->_mapView, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v67);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v65;
  -[UIView leadingAnchor](self->_separatorLine, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v61);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v59;
  -[UIView trailingAnchor](self->_separatorLine, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v53;
  -[UIView topAnchor](self->_separatorLine, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView bottomAnchor](self->_mapView, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v47;
  -[UIView heightAnchor](self->_separatorLine, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToConstant:", EKUIPixelSizeInPoints());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v43;
  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v37;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v3;
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v5;
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_separatorLine, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v8;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "addObjectsFromArray:", v12);

  -[MKMapView heightAnchor](self->_mapView, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView widthAnchor](self->_mapView, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setByAddingObject:", v15);
  v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
  tallConstraints = self->_tallConstraints;
  self->_tallConstraints = v16;

  -[MKMapView heightAnchor](self->_mapView, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView widthAnchor](self->_mapView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v19, 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setByAddingObject:", v20);
  v21 = (NSSet *)objc_claimAutoreleasedReturnValue();
  iPadConstraints = self->_iPadConstraints;
  self->_iPadConstraints = v21;

  -[MKMapView leadingAnchor](self->_mapView, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v81);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v79;
  -[MKMapView topAnchor](self->_mapView, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v75);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v72;
  -[MKMapView bottomAnchor](self->_mapView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v68);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v66;
  -[UIView leadingAnchor](self->_separatorLine, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView trailingAnchor](self->_mapView, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v60;
  -[UIView widthAnchor](self->_separatorLine, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", EKUIPixelSizeInPoints());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v56;
  -[UIView topAnchor](self->_separatorLine, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v50;
  -[UIView bottomAnchor](self->_separatorLine, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v44;
  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_separatorLine, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v73);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v40;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v34;
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v24;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v27;
  -[UITableView widthAnchor](self->_tableView, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView widthAnchor](self->_mapView, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet addObjectsFromArray:](v85, "addObjectsFromArray:", v31);

  splitConstraints = self->_splitConstraints;
  self->_splitConstraints = v85;

}

- (id)_constraintsForParadigm:(unint64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__tallConstraints;
  if (a3 == 8)
    v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__splitConstraints;
  if (a3 == 16)
    v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__iPadConstraints;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)updateViewConstraints
{
  void *v3;
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
  objc_super v14;

  -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKUICurrentWindowInterfaceParadigm(v3);

  if (!self->_tallConstraints)
  {
    -[EKEventDetailLocationDisambiguationContentViewController _createConstraints](self, "_createConstraints");
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[EKEventDetailLocationDisambiguationContentViewController _constraintsForParadigm:](self, "_constraintsForParadigm:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v6);
    goto LABEL_5;
  }
  if (v4 != self->_currentLayoutParadigm)
  {
    -[EKEventDetailLocationDisambiguationContentViewController _constraintsForParadigm:](self, "_constraintsForParadigm:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailLocationDisambiguationContentViewController _constraintsForParadigm:](self, "_constraintsForParadigm:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v5);
    objc_msgSend(v7, "minusSet:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v6);
    objc_msgSend(v8, "minusSet:", v5);
    v9 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v12);

LABEL_5:
  }
  v14.receiver = self;
  v14.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  -[EKEventDetailLocationDisambiguationContentViewController updateViewConstraints](&v14, sel_updateViewConstraints);
  self->_currentLayoutParadigm = v4;
}

- (void)viewDidLoad
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  UISearchBar *v7;
  UISearchBar *searchBar;
  void *v9;
  void *v10;
  id v11;
  MKMapView *v12;
  MKMapView *mapView;
  id v14;
  void *v15;
  MKMapView *v16;
  id v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *separatorLine;
  void *v22;
  UITableView *v23;
  UITableView *tableView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  -[EKEventDetailLocationDisambiguationContentViewController viewDidLoad](&v47, sel_viewDidLoad);
  if (!self->_mapView)
  {
    v3 = (objc_class *)EKWeakLinkClass();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    objc_msgSend(v4, "setObscuresBackgroundDuringPresentation:", 0);
    objc_msgSend(v4, "setHidesNavigationBarDuringPresentation:", 0);
    objc_msgSend(v4, "setAutomaticallyShowsCancelButton:", 0);
    -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearchController:", v4);

    -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", 0);

    objc_msgSend(v4, "searchBar");
    v7 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;
    self->_searchBar = v7;

    -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UISearchBar setAutocorrectionType:](self->_searchBar, "setAutocorrectionType:", 0);
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Enter Location"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v10);

    -[UISearchBar setReturnKeyType:](self->_searchBar, "setReturnKeyType:", 9);
    -[UISearchBar setEnablesReturnKeyAutomatically:](self->_searchBar, "setEnablesReturnKeyAutomatically:", 1);
    -[UISearchBar setTextContentType:](self->_searchBar, "setTextContentType:", *MEMORY[0x1E0DC5430]);
    -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
    v11 = [v3 alloc];
    v12 = (MKMapView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    mapView = self->_mapView;
    self->_mapView = v12;

    -[MKMapView setNeedsLayout](self->_mapView, "setNeedsLayout");
    -[MKMapView setZoomEnabled:](self->_mapView, "setZoomEnabled:", 1);
    -[MKMapView setScrollEnabled:](self->_mapView, "setScrollEnabled:", 1);
    -[MKMapView setPitchEnabled:](self->_mapView, "setPitchEnabled:", 0);
    -[MKMapView setRotateEnabled:](self->_mapView, "setRotateEnabled:", 0);
    -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 0);
    v14 = objc_alloc(MEMORY[0x1E0CC1910]);
    v15 = (void *)objc_msgSend(v14, "initExcludingCategories:", MEMORY[0x1E0C9AA60]);
    -[MKMapView setPointOfInterestFilter:](self->_mapView, "setPointOfInterestFilter:", v15);

    -[MKMapView setShowsBuildings:](self->_mapView, "setShowsBuildings:", 1);
    -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 1);
    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
    v16 = self->_mapView;
    v17 = objc_alloc(MEMORY[0x1E0DC3D80]);
    -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTarget:action:", v18, sel_endEditing_);
    -[MKMapView addGestureRecognizer:](v16, "addGestureRecognizer:", v19);

    v20 = (UIView *)objc_opt_new();
    separatorLine = self->_separatorLine;
    self->_separatorLine = v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_separatorLine, "setBackgroundColor:", v22);

    v23 = (UITableView *)objc_alloc_init(MEMORY[0x1E0DC3D48]);
    tableView = self->_tableView;
    self->_tableView = v23;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", self->_mapView);

    -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", self->_tableView);

    -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", self->_separatorLine);

    EventKitUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Add Location"), &stru_1E601DFA8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTitle:", v29);

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped_);
    -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLeftBarButtonItem:", v31);

    v33 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Add"), &stru_1E601DFA8, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v33, "initWithTitle:style:target:action:", v35, 2, self, sel_doneTapped_);
    -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setRightBarButtonItem:", v36);

    -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNeedsUpdateConstraints");

    v39 = (void *)EKWeakLinkClass();
    -[EKStructuredLocation geoLocation](self->_location, "geoLocation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "coordinate");
    v42 = v41;
    v44 = v43;
    -[EKStructuredLocation radius](self->_location, "radius");
    objc_msgSend(v39, "circleWithCenterCoordinate:radius:", v42, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v46, 1);
  }
}

- (void)_selectRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UITableView *tableView;
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
  MKPointAnnotation *v22;
  MKPointAnnotation *pin;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "row");

  if (v8 != a3)
  {
    tableView = self->_tableView;
    -[UITableView indexPathForSelectedRow](tableView, "indexPathForSelectedRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView cellForRowAtIndexPath:](tableView, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessoryType:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessoryType:", 3);

  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", v27, 0, 2);
  -[NSMutableArray objectAtIndexedSubscript:](self->_pois, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3)
  {
    objc_msgSend(v13, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setText:](self->_searchBar, "setText:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D0C328];
    objc_msgSend(v13, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fullDisplayStringWithTitle:address:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setText:](self->_searchBar, "setText:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar searchField](self->_searchBar, "searchField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v16);

  if (objc_msgSend(v14, "isImprecise"))
  {
    -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", self->_pin);
    -[EKEventDetailLocationDisambiguationContentViewController _selectCircle](self, "_selectCircle");
  }
  else
  {
    if (self->_pin)
    {
      -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
    }
    else
    {
      EKWeakLinkClass();
      v22 = (MKPointAnnotation *)objc_opt_new();
      pin = self->_pin;
      self->_pin = v22;

    }
    objc_msgSend(v14, "geoLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinate");
    -[MKPointAnnotation setCoordinate:](self->_pin, "setCoordinate:");

    objc_msgSend(v14, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPointAnnotation setTitle:](self->_pin, "setTitle:", v25);

    objc_msgSend(v14, "address");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPointAnnotation setSubtitle:](self->_pin, "setSubtitle:", v26);

    -[MKPointAnnotation setRepresentation:](self->_pin, "setRepresentation:", 2);
    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", self->_pin);
    -[MKMapView selectAnnotation:animated:](self->_mapView, "selectAnnotation:animated:", self->_pin, 0);
    -[EKEventDetailLocationDisambiguationContentViewController _updateMapRegion](self, "_updateMapRegion");
    -[EKEventDetailLocationDisambiguationContentViewController _deselectCircle](self, "_deselectCircle");
  }
  self->_textChanged = 0;

}

- (void)_updateMapRegion
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  MKPointAnnotation *pin;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;

  if (_updateMapRegion_onceToken != -1)
    dispatch_once(&_updateMapRegion_onceToken, &__block_literal_global_56);
  -[EKStructuredLocation geoLocation](self->_location, "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;

  v8 = -[EKStructuredLocation radius](self->_location, "radius");
  v10 = fmax(v9 * 3.0, 50.0);
  _updateMapRegion_makeRegionWithDistance(v8, v5, v7, v10, v10);
  -[MKMapView regionThatFits:](self->_mapView, "regionThatFits:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  pin = self->_pin;
  if (pin)
  {
    v20 = ((double (*)(uint64_t))_updateMapRegion_makeRegionWithDistance)(-[MKPointAnnotation coordinate](pin, "coordinate"));
    v24 = v12 - v20;
    if (v12 - v20 < 0.0)
      v24 = -(v12 - v20);
    v25 = v24 * 0.1;
    v26 = v14 - v21;
    if (v14 - v21 < 0.0)
      v26 = -(v14 - v21);
    v27 = v26 * 0.1;
    if (v16 >= v25)
      v28 = v16;
    else
      v28 = v25;
    if (v18 >= v27)
      v29 = v18;
    else
      v29 = v27;
    if (v22 < v25)
      v22 = v25;
    if (v23 < v27)
      v23 = v27;
    v30 = v28 * 0.5;
    v31 = v12 - v30;
    v32 = v29 * 0.5;
    v33 = v14 - v32;
    v34 = v12 + v30;
    v35 = v14 + v32;
    v36 = v22 * 0.5;
    v37 = v20 - v36;
    v38 = v23 * 0.5;
    v39 = v21 - v38;
    v40 = v20 + v36 + v25 * 4.0;
    v41 = v21 + v38;
    if (v31 >= v37)
      v42 = v37;
    else
      v42 = v31;
    if (v33 >= v39)
      v43 = v39;
    else
      v43 = v33;
    if (v34 >= v40)
      v40 = v34;
    if (v35 >= v41)
      v41 = v35;
    -[MKMapView regionThatFits:](self->_mapView, "regionThatFits:", v42 + (v40 - v42) * 0.5, v43 + (v41 - v43) * 0.5);
    v12 = v44;
    v14 = v45;
    v16 = v46;
    v18 = v47;
  }
  -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1, v12, v14, v16, v18);
}

uint64_t (*__76__EKEventDetailLocationDisambiguationContentViewController__updateMapRegion__block_invoke())(_QWORD, double, double, double, double)
{
  uint64_t (*result)(_QWORD, double, double, double, double);

  result = (uint64_t (*)(_QWORD, double, double, double, double))EKWeakLinkSymbol();
  _updateMapRegion_makeRegionWithDistance = result;
  return result;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  -[EKEventDetailLocationDisambiguationContentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[EKEventDetailLocationDisambiguationContentViewController _updateMapRegion](self, "_updateMapRegion");
  if (!self->_rowSelectionInitialized)
  {
    -[EKEventDetailLocationDisambiguationContentViewController _selectRow:](self, "_selectRow:", 0);
    self->_rowSelectionInitialized = 1;
  }
}

- (void)cancelTapped:(id)a3
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)doneTapped:(id)a3
{
  void *v4;
  void (**completionBlock)(id, _QWORD, void *);
  NSMutableArray *pois;
  void *v7;
  id v8;

  self->_done = 1;
  -[EKEventDetailLocationDisambiguationContentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  if (!self->_geocoding)
  {
    completionBlock = (void (**)(id, _QWORD, void *))self->_completionBlock;
    pois = self->_pois;
    -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](pois, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    completionBlock[2](completionBlock, 0, v7);

  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;

  -[EKEventDetailLocationDisambiguationContentViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  UITableView *tableView;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  self->_textChanged = 1;
  v5 = -[EKEventDetailLocationDisambiguationContentViewController _shouldEnableAddButton](self, "_shouldEnableAddButton", a3, a4);
  -[EKEventDetailLocationDisambiguationContentViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 2);
  if (v8)
  {
    tableView = self->_tableView;
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  void *v3;
  BOOL v4;

  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "row") == 0;

  return v4;
}

- (BOOL)_shouldEnableAddButton
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UISearchBar searchField](self->_searchBar, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (self->_textChanged)
  {
    self->_geocoding = 1;
    v4 = (void *)MEMORY[0x1E0D0C300];
    -[UISearchBar text](self->_searchBar, "text", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__EKEventDetailLocationDisambiguationContentViewController_searchBarTextDidEndEditing___block_invoke;
    v6[3] = &unk_1E601C5B0;
    v6[4] = self;
    objc_msgSend(v4, "geocodeLocationString:withCompletionBlock:", v5, v6);

  }
}

void __87__EKEventDetailLocationDisambiguationContentViewController_searchBarTextDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3 != 0);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setObject:atIndexedSubscript:", v6, 0);

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 1042))
    {
      (*(void (**)(void))(*(_QWORD *)(v7 + 984) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(v7 + 1016), "beginUpdates");
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v20, 100);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "endUpdates");
      objc_msgSend(*(id *)(a1 + 32), "_selectRow:", 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1041) = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Invalid Location"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Please enter a valid address or select a point of interest from the list."), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Ok"), &stru_1E601DFA8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v17);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 1, 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1041) = 0;

  }
}

- (void)_selectCircle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCircleRenderer setFillColor:](self->_circleRenderer, "setFillColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCircleRenderer setStrokeColor:](self->_circleRenderer, "setStrokeColor:", v5);

  -[MKCircleRenderer setNeedsDisplay](self->_circleRenderer, "setNeedsDisplay");
}

- (void)_deselectCircle
{
  void *v3;
  void *v4;

  -[MKCircleRenderer fillColor](self->_circleRenderer, "fillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCircleRenderer setFillColor:](self->_circleRenderer, "setFillColor:", v4);

  -[MKCircleRenderer setStrokeColor:](self->_circleRenderer, "setStrokeColor:", 0);
  -[MKCircleRenderer setNeedsDisplay](self->_circleRenderer, "setNeedsDisplay");
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  MKCircleRenderer *circleRenderer;
  id v6;
  MKCircleRenderer *v7;
  MKCircleRenderer *v8;
  double v9;

  circleRenderer = self->_circleRenderer;
  if (!circleRenderer)
  {
    v6 = a4;
    v7 = (MKCircleRenderer *)objc_msgSend(objc_alloc((Class)EKWeakLinkClass()), "initWithCircle:", v6);

    v8 = self->_circleRenderer;
    self->_circleRenderer = v7;

    v9 = CalOnePixelInPoints();
    -[MKCircleRenderer setLineWidth:](self->_circleRenderer, "setLineWidth:", v9 + v9);
    -[EKEventDetailLocationDisambiguationContentViewController _selectCircle](self, "_selectCircle");
    circleRenderer = self->_circleRenderer;
  }
  return circleRenderer;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_pois, "count", a3, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Suggestions"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (EKUICatalyst())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v10, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setBackgroundColor:", v8);
    }
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 32.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  EKEventDetailLocationDisambiguationContentViewController *v37;

  v6 = a3;
  v7 = a4;
  if (tableView_cellForRowAtIndexPath__onceToken != -1)
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_72);
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("MapItemCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("MapItemCell"));
    objc_msgSend(v8, "setSelectionStyle:", 0);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v8, "setSelectedBackgroundView:", v9);

  }
  objc_msgSend(v6, "indexPathForSelectedRow");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v6, "indexPathForSelectedRow"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "row"),
        v14 = objc_msgSend(v7, "row"),
        v12,
        v11,
        v13 == v14))
  {
    v15 = 3;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v8, "setAccessoryType:", v15);
  -[NSMutableArray objectAtIndexedSubscript:](self->_pois, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "row"))
  {
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    objc_msgSend(v16, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v19;
    goto LABEL_11;
  }
  if (objc_msgSend(v16, "isImprecise"))
  {
    objc_msgSend(MEMORY[0x1E0D0CD88], "labelForLocation:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v8, "textLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setText:", v19);

      objc_msgSend(v16, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "detailTextLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setText:", v21);

      goto LABEL_12;
    }
    objc_msgSend(v16, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);

    objc_msgSend(v8, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0;
LABEL_11:
    objc_msgSend(v20, "setText:", v22);
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v16, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  objc_msgSend(v8, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", 0);
LABEL_13:

  -[NSCache objectForKey:](self->_iconCache, "objectForKey:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v23);

  if (!v23)
  {
    v25 = (void *)tableView_cellForRowAtIndexPath__MKMapItemClass;
    objc_msgSend(v16, "mapKitHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v34[3] = &unk_1E601A478;
    v35 = v6;
    v36 = v7;
    v37 = self;
    objc_msgSend(v25, "_mapItemFromHandle:completionHandler:", v26, v34);

  }
  return v8;
}

uint64_t __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  uint64_t result;

  result = EKWeakLinkClass();
  tableView_cellForRowAtIndexPath__MKMapItemClass = result;
  return result;
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v7[3] = &unk_1E601A360;
  v8 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 56);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 1048);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
    v7[3] = &unk_1E601A360;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v10 = v5;
    v11 = v6;
    dispatch_async(v4, v7);

  }
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  CGSize v12;

  ImageForMapItem(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12.width = 26.0;
  v12.height = 26.0;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, 26.0, 26.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_5;
  v7[3] = &unk_1E601A360;
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1056), "setObject:forKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (v4)
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v2);

    objc_msgSend(v4, "setNeedsLayout");
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  -[EKEventDetailLocationDisambiguationContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 0);

  v7 = objc_msgSend(v5, "row");
  -[EKEventDetailLocationDisambiguationContentViewController _selectRow:](self, "_selectRow:", v7);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryType:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitConstraints, 0);
  objc_storeStrong((id *)&self->_iPadConstraints, 0);
  objc_storeStrong((id *)&self->_tallConstraints, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_iconRenderQueue, 0);
  objc_storeStrong((id *)&self->_circleRenderer, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_pois, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
