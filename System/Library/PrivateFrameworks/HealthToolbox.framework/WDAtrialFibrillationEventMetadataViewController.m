@implementation WDAtrialFibrillationEventMetadataViewController

- (WDAtrialFibrillationEventMetadataViewController)initWithEvent:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  WDAtrialFibrillationEventMetadataViewController *v9;
  WDAtrialFibrillationEventMetadataViewController *v10;
  NSMutableArray *v11;
  NSMutableArray *sections;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  v9 = -[WDAtrialFibrillationEventMetadataViewController initWithStyle:](&v14, sel_initWithStyle_, 1);
  v10 = v9;
  if (v9)
  {
    v9->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = v10->_sections;
    v10->_sections = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  -[HKTableViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[WDAtrialFibrillationEventMetadataViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventMetadataViewController setTitle:](self, "setTitle:", v5);

  v6 = *MEMORY[0x24BE4A140];
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", v6);

  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  v9 = *MEMORY[0x24BE4A250];
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setSectionCornerRadius:", v9);

  -[WDAtrialFibrillationEventMetadataViewController _loadSections](self, "_loadSections");
  -[WDAtrialFibrillationEventMetadataViewController _reloadAtrialFibrillationEducationTableHeaderView](self, "_reloadAtrialFibrillationEducationTableHeaderView");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  -[WDAtrialFibrillationEventMetadataViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  if (-[WDAtrialFibrillationEventMetadataViewController firstViewDidLayoutSubviews](self, "firstViewDidLayoutSubviews"))
  {
    -[WDAtrialFibrillationEventMetadataViewController setFirstViewDidLayoutSubviews:](self, "setFirstViewDidLayoutSubviews:", 0);
    -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);

  }
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  return a3 != 0;
}

- (void)_loadSections
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WDAtrialFibrillationEventMetadataViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDAtrialFibrillationEventMetadataViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayTypeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[WDAtrialFibrillationEventMetadataViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDAtrialFibrillationEventMetadataViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[WDAtrialFibrillationEventMetadataViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BE4A678]);
  -[WDAtrialFibrillationEventMetadataViewController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithEvent:healthStore:displayTypeController:unitController:delegate:", v13, v11, v6, v9, self);

  -[WDAtrialFibrillationEventMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v14);
  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BE4A588]);
  -[WDAtrialFibrillationEventMetadataViewController event](self, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithSample:displayTypeController:unitController:", v17, v6, v9);
  objc_msgSend(v15, "addObject:", v18);

  objc_msgSend(v11, "profileIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 != 2)
  {
    v21 = objc_alloc(MEMORY[0x24BE4A590]);
    -[WDAtrialFibrillationEventMetadataViewController event](self, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithSample:", v22);

    if (!v23)
    {
      v24 = objc_alloc(MEMORY[0x24BE4A598]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DEVICE_DETAILS"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v24, "initWithTitle:", v26);

    }
    -[WDAtrialFibrillationEventMetadataViewController event](self, "event");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BDD4378]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[WDAtrialFibrillationEventMetadataViewController _shortVersionNumberFromString:](self, "_shortVersionNumberFromString:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_PRODUCT_FEATURE_VERSION_WATCH"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Antimony"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v9;
      v44[0] = *MEMORY[0x24BDD3378];
      v33 = v44[0];
      v44[1] = CFSTR("FeatureVersion");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
      v40 = v14;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier();
      v42 = v6;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addText:detail:baseIdentifier:", v30, v32, v35);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_PRODUCT_UPDATE_VERSION_WATCH"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Antimony"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v33;
      v43[1] = CFSTR("UpdateVersion");
      v9 = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addText:detail:baseIdentifier:", v29, v37, v39);

      v14 = v40;
      v6 = v42;
    }
    -[WDAtrialFibrillationEventMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v23, v40);

  }
}

- (id)_shortVersionNumberFromString:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v3);
}

- (void)_reloadAtrialFibrillationEducationTableHeaderView
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
  id v18;

  -[WDAtrialFibrillationEventMetadataViewController _atrialFibrillationEducationContainerView](self, "_atrialFibrillationEducationContainerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v18);

  objc_msgSend(v18, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v18, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v18, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[WDAtrialFibrillationEventMetadataViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tableHeaderView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

}

- (id)_atrialFibrillationEducationContainerView
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x24BDF6F90]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BE4C080]);
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v4, "hk_alignConstraintsWithView:", v3);

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (!v8)
    goto LABEL_3;
  -[WDAtrialFibrillationEventMetadataViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
LABEL_3:
    -[WDAtrialFibrillationEventMetadataViewController _reloadAtrialFibrillationEducationTableHeaderView](self, "_reloadAtrialFibrillationEducationTableHeaderView");

}

- (void)heartbeatSequecesListQueryComplete:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__WDAtrialFibrillationEventMetadataViewController_heartbeatSequecesListQueryComplete___block_invoke;
  block[3] = &unk_24D38D000;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __86__WDAtrialFibrillationEventMetadataViewController_heartbeatSequecesListQueryComplete___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "numberOfRowsInSection");
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "row");
  objc_msgSend(v9, "cellForIndex:tableView:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "row");
  -[WDAtrialFibrillationEventMetadataViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectCellForIndex:navigationController:animated:", v8, v9, 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WDAtrialFibrillationEventMetadataViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "row");
  objc_msgSend(v13, "willDisplayCell:forIndex:tableView:", v9, v12, v10);

}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __87__WDAtrialFibrillationEventMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D38D0A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[WDAtrialFibrillationEventMetadataViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __87__WDAtrialFibrillationEventMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[WDAtrialFibrillationEventMetadataViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (HKCategorySample)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  return (HKDataMetadataViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
