@implementation HULocationTriggerRegionEditorViewController

- (HULocationTriggerRegionEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRegion_home_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationTriggerRegionEditorViewController.m"), 62, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationTriggerRegionEditorViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HULocationTriggerRegionEditorViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRegion_home_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationTriggerRegionEditorViewController.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationTriggerRegionEditorViewController initWithCoder:]",
    v6);

  return 0;
}

- (HULocationTriggerRegionEditorViewController)initWithRegion:(id)a3 home:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HULocationTriggerRegionEditorViewController *v12;
  HULocationTriggerRegionEditorViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HULocationTriggerRegionEditorViewController;
  v12 = -[HULocationTriggerRegionEditorViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_region, a3);
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    -[HULocationTriggerRegionEditorViewController _updateRecentsWithSearchText:](v13, "_updateRecentsWithSearchText:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerRegionEditorTitle"), CFSTR("HULocationTriggerRegionEditorTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController setTitle:](v13, "setTitle:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v13, sel__cancel_);
    -[HULocationTriggerRegionEditorViewController navigationItem](v13, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftBarButtonItem:", v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel__done_);
    -[HULocationTriggerRegionEditorViewController navigationItem](v13, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

  }
  return v13;
}

- (void)loadView
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
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v33 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA978]), "initWithFrame:", v4, v5, v6, v7);
  -[HULocationTriggerRegionEditorViewController setSearchBar:](self, "setSearchBar:", v9);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutocorrectionType:", 1);

  _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerEditorSearchFieldPlaceholder"), CFSTR("HULocationTriggerEditorSearchFieldPlaceholder"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlaceholder:", v12);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  objc_msgSend(v33, "addSubview:", self->_searchBar);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  -[HULocationTriggerRegionEditorViewController setDividerView:](self, "setDividerView:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.8, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  -[HULocationTriggerRegionEditorViewController setTableView:](self, "setTableView:", v19);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDataSource:", self);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setKeyboardDismissMode:", 1);

  v23 = *MEMORY[0x1E0CEBC10];
  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRowHeight:", v23);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_scaledValueForValue:", 44.0);
  v27 = v26;
  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEstimatedRowHeight:", v27);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "deselectRowAtIndexPath:animated:", v31, 0);

  -[HULocationTriggerRegionEditorViewController _reloadData](self, "_reloadData");
  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v32);

  -[HULocationTriggerRegionEditorViewController setView:](self, "setView:", v33);
  -[HULocationTriggerRegionEditorViewController _updateUI](self, "_updateUI");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HULocationTriggerRegionEditorViewController;
  -[HULocationTriggerRegionEditorViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (-[HULocationTriggerRegionEditorViewController _hasLocation](self, "_hasLocation")
    && (-[HULocationTriggerRegionEditorViewController region](self, "region"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "regionType"),
        v4,
        v5))
  {
    -[HULocationTriggerRegionEditorViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);

    -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController selectedIndexPath](self, "selectedIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v8, 1, 1);

    -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController selectedIndexPath](self, "selectedIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v9, v10);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HULocationTriggerRegionEditorViewController;
  -[HULocationTriggerRegionEditorViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  -[HULocationTriggerRegionEditorViewController _setupMap](self, "_setupMap");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HULocationTriggerRegionEditorViewController;
  -[HULocationTriggerRegionEditorViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, a3);
  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnnotations:", v6);

  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resignFirstResponder");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HULocationTriggerRegionEditorViewController;
  -[HULocationTriggerRegionEditorViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[HULocationTriggerRegionEditorViewController _setupMap](self, "_setupMap");
  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToNearestSelectedRowAtScrollPosition:animated:", 0, 0);

}

- (void)updateViewConstraints
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
  double v66;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  objc_super v101;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 44.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "superview");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
  }
  else
  {
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v48);

  -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "superview");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "safeAreaLayoutGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v56);

    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "safeAreaLayoutGuide");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v62);

    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "scale");
    objc_msgSend(v64, "constraintEqualToConstant:", 1.0 / v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v67);

  }
  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "superview");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v74);

    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "safeAreaLayoutGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v80);

    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "safeAreaLayoutGuide");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v86);

    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v91);

    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "heightAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToConstant:", 300.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v94);

  }
  -[HULocationTriggerRegionEditorViewController constraints](self, "constraints");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v3, "isEqual:", v95);

  if ((v96 & 1) == 0)
  {
    v97 = (void *)MEMORY[0x1E0CB3718];
    -[HULocationTriggerRegionEditorViewController constraints](self, "constraints");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "deactivateConstraints:", v98);

    -[HULocationTriggerRegionEditorViewController setConstraints:](self, "setConstraints:", v3);
    v99 = (void *)MEMORY[0x1E0CB3718];
    -[HULocationTriggerRegionEditorViewController constraints](self, "constraints");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "activateConstraints:", v100);

  }
  v101.receiver = self;
  v101.super_class = (Class)HULocationTriggerRegionEditorViewController;
  -[HULocationTriggerRegionEditorViewController updateViewConstraints](&v101, sel_updateViewConstraints);

}

- (id)showLocationRegionInvalidAlert
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HULocationTriggerRegionEditorViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertMessageResetUsersFormat"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertTitleResetUsers"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertTitleResetUsers"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionContinue"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionContinue"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke;
  v30[3] = &unk_1E6F4C6E0;
  v19 = v3;
  v31 = v19;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionCancel"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionCancel"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke_2;
  v28[3] = &unk_1E6F4C6E0;
  v23 = v19;
  v29 = v23;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v24);

  -[HULocationTriggerRegionEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  v25 = v29;
  v26 = v23;

  return v26;
}

uint64_t __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_updateUI
{
  id v3;

  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController _updateUIWithRegion:](self, "_updateUIWithRegion:", v3);

}

- (void)_updateUIWithRegion:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HULocationTriggerEditorMapDragRadiusView *v20;
  void *v21;
  double v22;
  HULocationTriggerEditorMapDragRadiusView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[HULocationTriggerRegionEditorViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v4 = -[HULocationTriggerRegionEditorViewController _hasLocation](self, "_hasLocation");
  objc_msgSend(v35, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
  {
    -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resignFirstResponder");

    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CC1870]);
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v14 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
      -[HULocationTriggerRegionEditorViewController setMapView:](self, "setMapView:", v14);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:", self);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPitchEnabled:", 0);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRotateEnabled:", 0);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setShowsUserLocation:", 1);

      v20 = [HULocationTriggerEditorMapDragRadiusView alloc];
      objc_msgSend(v35, "circularRegion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "radius");
      v23 = -[HULocationTriggerEditorMapDragRadiusView initWithFrame:radiusInMeters:delegate:](v20, "initWithFrame:radiusInMeters:delegate:", self, v10, v11, v12, v13, v22);
      -[HULocationTriggerRegionEditorViewController setDragView:](self, "setDragView:", v23);

      -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAutoresizingMask:", 18);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackgroundColor:", v25);

      -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMapView:", v27);

      v29 = -[HULocationTriggerRegionEditorViewController _proximityType](self, "_proximityType");
      -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProximity:", v29);

      -[MKMapView addSubview:](self->_mapView, "addSubview:", self->_dragView);
    }
    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", self->_mapView);

    -[HULocationTriggerRegionEditorViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", self->_dividerView);
  }
  else
  {
    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeFromSuperview");

    -[HULocationTriggerRegionEditorViewController dividerView](self, "dividerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeFromSuperview");
  }

  -[HULocationTriggerRegionEditorViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setNeedsUpdateConstraints");

}

- (void)_updateRecentsWithSearchText:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D18298];
    v5 = *MEMORY[0x1E0D18248];
    v22 = *MEMORY[0x1E0D18220];
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a3;
    objc_msgSend(v6, "arrayWithObjects:count:", &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForKey:inCollection:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v10 = (void *)MEMORY[0x1E0D18298];
    objc_msgSend(MEMORY[0x1E0D18298], "predicateForKey:matchingText:comparison:", *MEMORY[0x1E0D18240], v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0D18298], "predicateForKey:matchingText:comparison:", *MEMORY[0x1E0D18238], v7, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateSatisfyingAnySubpredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateSatisfyingAllSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0D182A0]);
  objc_msgSend(v17, "setSearchPredicate:", v16);
  objc_msgSend(v17, "setDomains:", &unk_1E7042930);
  objc_msgSend(MEMORY[0x1E0D182A0], "frecencyComparator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComparator:", v18);

  objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HULocationTriggerRegionEditorViewController__updateRecentsWithSearchText___block_invoke;
  v20[3] = &unk_1E6F4C708;
  v20[4] = self;
  objc_msgSend(v19, "performRecentsSearch:queue:completion:", v17, MEMORY[0x1E0C80D38], v20);

}

void __76__HULocationTriggerRegionEditorViewController__updateRecentsWithSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecents:", v3);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "_reloadData");
  }
}

- (int64_t)_homeRowIndex
{
  return 0;
}

- (int64_t)_firstRecentRowIndex
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;

  -[HULocationTriggerRegionEditorViewController recents](self, "recents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v6 + 1;
  }
  return v5;
}

- (int64_t)_lastRecentRowIndex
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;

  v3 = -[HULocationTriggerRegionEditorViewController _firstRecentRowIndex](self, "_firstRecentRowIndex");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    -[HULocationTriggerRegionEditorViewController recents](self, "recents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 + objc_msgSend(v6, "count") - 1;

  }
  return v4;
}

- (int64_t)_firstLocalSearchResultRowIndex
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;

  -[HULocationTriggerRegionEditorViewController localSearchResults](self, "localSearchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = -[HULocationTriggerRegionEditorViewController _lastRecentRowIndex](self, "_lastRecentRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v6 + 1;
  }
  return v5;
}

- (void)_reloadData
{
  id v2;

  -[HULocationTriggerRegionEditorViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_setupMap
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[HULocationTriggerRegionEditorViewController _hasLocation](self, "_hasLocation"))
  {
    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[HULocationTriggerRegionEditorViewController region](self, "region");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULocationTriggerRegionEditorViewController _displayLocation:](self, "_displayLocation:", v5);

    }
  }
}

- (BOOL)_hasLocation
{
  void *v2;
  BOOL v3;

  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)_proximityType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "regionType");

  if (v4 != 1)
    return 0;
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "circularRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "notifyOnExit"))
    v7 = 2;
  else
    v7 = 1;

  return v7;
}

- (void)_displayLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  v4 = a3;
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "regionType");

  if (v6 != 1)
    goto LABEL_3;
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "circularRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radius");
  v10 = v9;

  if (v10 < 100.0)
LABEL_3:
    v10 = 100.0;
  -[HULocationTriggerRegionEditorViewController _shiftLocationIfNeeded:](self, "_shiftLocationIfNeeded:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HULocationTriggerRegionEditorViewController__displayLocation___block_invoke;
  v13[3] = &unk_1E6F4C730;
  v13[4] = self;
  *(double *)&v13[5] = v10;
  v12 = (id)objc_msgSend(v11, "addSuccessBlock:", v13);

}

void __64__HULocationTriggerRegionEditorViewController__displayLocation___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a2, "coordinate");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "desiredAddressAnnotation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "desiredAddressAnnotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    if (v10 == v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "desiredAddressAnnotation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      v13 = v12;

      if (v13 == v6)
        return;
    }
    else
    {

    }
  }
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1908]), "initWithCoordinate:", v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "_showMapRegionForCoordinate:radius:animated:", 1, v4, v6, *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "annotations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAnnotations:", v16);

  objc_msgSend(*(id *)(a1 + 32), "setDesiredAddressAnnotation:", v20);
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnnotation:", v20);

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "desiredAddressAnnotation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectAnnotation:animated:", v19, 1);

}

- (id)_locationForRecentMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  void *v7;
  CLLocationDegrees v8;
  CLLocationCoordinate2D v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("latitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKey:", CFSTR("longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = CLLocationCoordinate2DMake(v6, v8);

  v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v3, "objectForKey:", CFSTR("hAccuracy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v3, "objectForKey:", CFSTR("vAccuracy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("referenceFrame"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v17, objc_msgSend(v18, "integerValue"), v9.latitude, v9.longitude, 0.0, v13, v16);
  return v19;
}

- (void)_showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double longitude;
  double latitude;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v5 = a5;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[HULocationTriggerRegionEditorViewController radiusInPoints](self, "radiusInPoints");
  v10 = 3.5;
  if (v11 > 1.0)
  {
    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    -[HULocationTriggerRegionEditorViewController radiusInPoints](self, "radiusInPoints");
    v10 = v14 / v15;

  }
  v16 = MEMORY[0x1BCCC0FF8](latitude, longitude, 0.0, v10 * a4);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "regionThatFits:", v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if (v27 >= -180.0
    && v27 <= 180.0
    && v25 >= -90.0
    && v25 <= 90.0
    && v29 >= 0.0
    && v29 <= 180.0
    && v31 >= 0.0
    && v31 <= 360.0)
  {
    -[HULocationTriggerRegionEditorViewController mapView](self, "mapView");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRegion:animated:", v5, v25, v27, v29, v31);

  }
}

- (void)setRegion:(id)a3
{
  HULocationTriggerRegion *v5;
  unint64_t v6;
  void *v7;
  HULocationTriggerRegion *v8;

  v5 = (HULocationTriggerRegion *)a3;
  if (self->_region != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_region, a3);
    v6 = -[HULocationTriggerRegionEditorViewController _proximityType](self, "_proximityType");
    -[HULocationTriggerRegionEditorViewController dragView](self, "dragView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProximity:", v6);

    v5 = v8;
  }

}

- (void)_cancel:(id)a3
{
  id v4;

  -[HULocationTriggerRegionEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionEditorDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  id v5;

  -[HULocationTriggerRegionEditorViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionEditor:didFinishWithRegion:", self, v4);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v5 = -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex", a3, a4);
  -[HULocationTriggerRegionEditorViewController recents](self, "recents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = v7;
  else
    v8 = v7 + 1;
  -[HULocationTriggerRegionEditorViewController localSearchResults](self, "localSearchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + objc_msgSend(v9, "count");

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("locationCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("locationCell"));
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  v12 = -[HULocationTriggerRegionEditorViewController _firstRecentRowIndex](self, "_firstRecentRowIndex");
  v13 = -[HULocationTriggerRegionEditorViewController _firstLocalSearchResultRowIndex](self, "_firstLocalSearchResultRowIndex");
  v14 = objc_msgSend(v6, "row");
  if (v14 == -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerEditorOptionHome"), CFSTR("HULocationTriggerEditorOptionHome"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_homeImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    goto LABEL_14;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "row") < v12
    || (v18 = objc_msgSend(v6, "row"),
        v18 > -[HULocationTriggerRegionEditorViewController _lastRecentRowIndex](self, "_lastRecentRowIndex")))
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "row") < v13)
    {
      v17 = 0;
      v16 = 0;
      v15 = 0;
      goto LABEL_14;
    }
    v19 = objc_msgSend(v6, "row") - v13;
    -[HULocationTriggerRegionEditorViewController localSearchResults](self, "localSearchResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_shortAddress");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_msgSend(v6, "row") - v12;
    -[HULocationTriggerRegionEditorViewController recents](self, "recents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "address");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v22;
  objc_msgSend((id)objc_opt_class(), "_pinImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_msgSend(v7, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v15);

  objc_msgSend(v7, "detailTextLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v17);

  objc_msgSend(v7, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImage:", v16);

  -[HULocationTriggerRegionEditorViewController selectedIndexPath](self, "selectedIndexPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v28))
  {
    if (-[HULocationTriggerRegionEditorViewController _hasLocation](self, "_hasLocation"))
      v29 = 3;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v29);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a4;
  v6 = a3;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v32, 1);
  -[HULocationTriggerRegionEditorViewController selectedIndexPath](self, "selectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessoryType:", 0);

  objc_msgSend(v6, "cellForRowAtIndexPath:", v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 3);
  -[HULocationTriggerRegionEditorViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v32);
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HULocationTriggerRegionEditorViewController _firstRecentRowIndex](self, "_firstRecentRowIndex");
  v12 = -[HULocationTriggerRegionEditorViewController _firstLocalSearchResultRowIndex](self, "_firstLocalSearchResultRowIndex");
  v13 = objc_msgSend(v32, "row");
  if (v13 == -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex"))
  {
    -[HULocationTriggerRegionEditorViewController home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController region](self, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v14, objc_msgSend(v15, "eventType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v32, "row") >= v11)
  {
    v17 = objc_msgSend(v32, "row");
    if (v17 <= -[HULocationTriggerRegionEditorViewController _lastRecentRowIndex](self, "_lastRecentRowIndex"))
    {
      v23 = objc_msgSend(v32, "row") - v11;
      -[HULocationTriggerRegionEditorViewController recents](self, "recents");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "metadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULocationTriggerRegionEditorViewController _locationForRecentMetadataDictionary:](self, "_locationForRecentMetadataDictionary:", v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "address");
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v32, "row") >= v12)
  {
    v18 = objc_msgSend(v32, "row") - v12;
    -[HULocationTriggerRegionEditorViewController localSearchResults](self, "localSearchResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "placemark");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "name");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = (void *)v22;

    goto LABEL_12;
  }
  v15 = 0;
  v14 = 0;
LABEL_12:
  objc_msgSend(v10, "circularRegion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v10, "circularRegion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "radius");

  }
  v28 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(v14, "coordinate");
  v29 = (void *)objc_msgSend(v28, "initWithCenter:radius:identifier:", v15);
  objc_msgSend(v29, "setReferenceFrame:", objc_msgSend(v14, "referenceFrame"));
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setNotifyOnEntry:", objc_msgSend(v30, "eventType") == 1);

  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setNotifyOnExit:", objc_msgSend(v31, "eventType") == 2);

  +[HULocationTriggerRegion customRegionWithCircularRegion:](HULocationTriggerRegion, "customRegionWithCircularRegion:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  -[HULocationTriggerRegionEditorViewController setRegion:](self, "setRegion:", v16);
  -[HULocationTriggerRegionEditorViewController _updateUI](self, "_updateUI");

}

- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4 radiusInPoints:(double)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[6];

  -[HULocationTriggerRegionEditorViewController setRadiusInPoints:](self, "setRadiusInPoints:", a3, a5);
  -[HULocationTriggerRegionEditorViewController region](self, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "regionType");

  if (v8 == 1)
  {
    -[HULocationTriggerRegionEditorViewController region](self, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "circularRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v10, "center");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithCenter:radius:identifier:", v16, v13, v15, a4);

    objc_msgSend(v17, "setNotifyOnEntry:", objc_msgSend(v10, "notifyOnEntry"));
    objc_msgSend(v17, "setNotifyOnExit:", objc_msgSend(v10, "notifyOnExit"));
    objc_msgSend(v17, "setReferenceFrame:", objc_msgSend(v10, "referenceFrame"));
    +[HULocationTriggerRegion customRegionWithCircularRegion:](HULocationTriggerRegion, "customRegionWithCircularRegion:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController setRegion:](self, "setRegion:", v18);

    -[HULocationTriggerRegionEditorViewController region](self, "region");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController _shiftLocationIfNeeded:](self, "_shiftLocationIfNeeded:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__HULocationTriggerRegionEditorViewController_mapRadiusView_radiusDidChange_radiusInPoints___block_invoke;
    v23[3] = &unk_1E6F4C730;
    v23[4] = self;
    *(double *)&v23[5] = a4;
    v22 = (id)objc_msgSend(v21, "addSuccessBlock:", v23);

  }
}

uint64_t __92__HULocationTriggerRegionEditorViewController_mapRadiusView_radiusDidChange_radiusInPoints___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "coordinate");
  return objc_msgSend(v2, "_showMapRegionForCoordinate:radius:animated:", 0);
}

- (void)_resetSearchResults
{
  void *v3;
  void *v4;

  -[HULocationTriggerRegionEditorViewController localSearch](self, "localSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HULocationTriggerRegionEditorViewController localSearch](self, "localSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[HULocationTriggerRegionEditorViewController setLocalSearch:](self, "setLocalSearch:", 0);
  }
  -[HULocationTriggerRegionEditorViewController setLocalSearchResults:](self, "setLocalSearchResults:", 0);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a4;
  -[HULocationTriggerRegionEditorViewController _resetSearchResults](self, "_resetSearchResults");
  if (v5 && !objc_msgSend(v5, "isEqualToString:", &stru_1E6F60E80))
  {
    -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerRegionEditorViewController _updateRecentsWithSearchText:](self, "_updateRecentsWithSearchText:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0CC1808]);
    -[HULocationTriggerRegionEditorViewController searchBar](self, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNaturalLanguageQuery:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v8);
    -[HULocationTriggerRegionEditorViewController setLocalSearch:](self, "setLocalSearch:", v11);

    -[HULocationTriggerRegionEditorViewController localSearch](self, "localSearch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__HULocationTriggerRegionEditorViewController_searchBar_textDidChange___block_invoke;
    v13[3] = &unk_1E6F4C758;
    v13[4] = self;
    objc_msgSend(v12, "startWithCompletionHandler:", v13);

  }
  else
  {
    -[HULocationTriggerRegionEditorViewController _updateRecentsWithSearchText:](self, "_updateRecentsWithSearchText:", 0);
    -[HULocationTriggerRegionEditorViewController _updateUIWithRegion:](self, "_updateUIWithRegion:", 0);
    -[HULocationTriggerRegionEditorViewController _reloadData](self, "_reloadData");
  }

}

uint64_t __71__HULocationTriggerRegionEditorViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "mapItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalSearchResults:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_reloadData");
}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

+ (id)_homeImage
{
  return (id)HUCommonImageNamed();
}

+ (id)_pinImage
{
  return (id)HUCommonImageNamed();
}

- (id)_shiftLocationIfNeeded:(id)a3
{
  return -[HULocationTriggerRegionEditorViewController _shiftLocationIfNeeded:isRetry:](self, "_shiftLocationIfNeeded:isRetry:", a3, 0);
}

- (id)_shiftLocationIfNeeded:(id)a3 isRetry:(BOOL)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  BOOL v32;
  id location;
  _QWORD aBlock[4];
  id v35;
  id v36;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v6, "horizontalAccuracy");
  v9 = v8;
  objc_msgSend(v6, "coordinate");
  v11 = v10;
  objc_msgSend(v6, "coordinate");
  v13 = v12;
  v14 = objc_msgSend(v6, "referenceFrame");
  v15 = objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v11, v13);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke;
  aBlock[3] = &unk_1E6F4C780;
  v17 = v6;
  v35 = v17;
  v18 = v7;
  v36 = v18;
  v19 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_2;
  v28[3] = &unk_1E6F4C7D0;
  v32 = a4;
  objc_copyWeak(&v31, &location);
  v20 = v17;
  v29 = v20;
  v21 = v18;
  v30 = v21;
  v22 = _Block_copy(v28);
  if (v14 == 2 || !v15)
  {
    objc_msgSend(v21, "finishWithResult:", v20);
  }
  else
  {
    -[HULocationTriggerRegionEditorViewController locationShifter](self, "locationShifter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C80D38];
    v25 = MEMORY[0x1E0C80D38];
    objc_msgSend(v23, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v19, 0, v22, v24, v11, v13, v9);

  }
  v26 = v21;

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v26;
}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  CLLocationCoordinate2D v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v6 = CLLocationCoordinate2DMake(a2, a3);
  v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "verticalAccuracy");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v6.latitude, v6.longitude, v9, a4, v11);

  objc_msgSend(v13, "setReferenceFrame:", 2);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v13);

}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x1E0D309D0];
  if (v4)
  {
    objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D309D0], 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_3;
    v12[3] = &unk_1E6F4C7A8;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_4;
    v9[3] = &unk_1E6F4C638;
    v10 = *(id *)(a1 + 40);
    v11 = v3;
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v11, v7, 0, v12, v9);

    objc_destroyWeak(&v15);
  }

}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_shiftLocationIfNeeded:isRetry:", *(_QWORD *)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "addCompletionBlock:", v3);

}

uint64_t __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

- (GEOLocationShifter)locationShifter
{
  GEOLocationShifter *locationShifter;
  GEOLocationShifter *v4;
  GEOLocationShifter *v5;

  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (HULocationTriggerRegion)region
{
  return self->_region;
}

- (HMHome)home
{
  return self->_home;
}

- (HULocationTriggerRegionEditorViewControllerDelegate)delegate
{
  return (HULocationTriggerRegionEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (HULocationTriggerEditorMapDragRadiusView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
  objc_storeStrong((id *)&self->_dragView, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
  objc_storeStrong((id *)&self->_recents, a3);
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
  objc_storeStrong((id *)&self->_localSearch, a3);
}

- (NSArray)localSearchResults
{
  return self->_localSearchResults;
}

- (void)setLocalSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_localSearchResults, a3);
}

- (MKPointAnnotation)desiredAddressAnnotation
{
  return self->_desiredAddressAnnotation;
}

- (void)setDesiredAddressAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAddressAnnotation, a3);
}

- (double)radiusInPoints
{
  return self->_radiusInPoints;
}

- (void)setRadiusInPoints:(double)a3
{
  self->_radiusInPoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredAddressAnnotation, 0);
  objc_storeStrong((id *)&self->_localSearchResults, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
