@implementation EKExpandedReminderStackViewController

- (EKExpandedReminderStackViewController)initWithEvents:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  EKExpandedReminderStackViewController *v9;
  EKExpandedReminderStackViewController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKExpandedReminderStackViewController;
  v9 = -[EKExpandedReminderStackViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[EKExpandedReminderStackViewController setPreferModalPresentation:](v9, "setPreferModalPresentation:", 0);
    objc_storeStrong((id *)&v10->_events, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v10->_presentingTransitionCancelled = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__eventModified_, *MEMORY[0x1E0CA9F70], 0);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F70], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKExpandedReminderStackViewController;
  -[EKExpandedReminderStackViewController dealloc](&v4, sel_dealloc);
}

- (id)loadReminderWithEKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  REMStore *reminderStore;
  void *v11;
  objc_class *v12;
  REMStore *v13;
  REMStore **p_reminderStore;
  REMStore *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isReminderIntegrationEvent") & 1) != 0)
  {
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v7 = (void *)getREMObjectIDClass_softClass;
    v27 = getREMObjectIDClass_softClass;
    if (!getREMObjectIDClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getREMObjectIDClass_block_invoke;
      v29 = &unk_1E6018EE8;
      v30 = &v24;
      __getREMObjectIDClass_block_invoke((uint64_t)buf);
      v7 = (void *)v25[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v8, "objectIDWithURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      reminderStore = self->_reminderStore;
      if (!reminderStore)
      {
        v24 = 0;
        v25 = &v24;
        v26 = 0x2050000000;
        v11 = (void *)getREMStoreClass_softClass;
        v27 = getREMStoreClass_softClass;
        if (!getREMStoreClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getREMStoreClass_block_invoke;
          v29 = &unk_1E6018EE8;
          v30 = &v24;
          __getREMStoreClass_block_invoke((uint64_t)buf);
          v11 = (void *)v25[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v24, 8);
        v13 = (REMStore *)objc_alloc_init(v12);
        p_reminderStore = &self->_reminderStore;
        v15 = *p_reminderStore;
        *p_reminderStore = v13;

        reminderStore = *p_reminderStore;
      }
      v23 = 0;
      -[REMStore fetchReminderWithObjectID:error:](reminderStore, "fetchReminderWithObjectID:error:", v9, &v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v23;
      v18 = v17;
      if (!v16 || v17)
      {
        v19 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch reminder (objectID: %@). Error: %@", buf, 0x16u);
        }
      }
      v20 = v16;

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v21 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, "Trying to reload reminder with EKEvent, but it's not a reminder. %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)setEKExpandedReminderStackViewControllerDelegate:(id)a3
{
  id v5;
  UICollectionView *collectionView;
  EKExpandedReminderStackLayout *v7;

  objc_storeStrong((id *)&self->_delegate, a3);
  v5 = a3;
  collectionView = self->_collectionView;
  v7 = -[EKExpandedReminderStackLayout initWithDelegate:]([EKExpandedReminderStackLayout alloc], "initWithDelegate:", self);
  -[UICollectionView setCollectionViewLayout:animated:](collectionView, "setCollectionViewLayout:animated:", v7, 0);

  -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
  -[EKExpandedReminderStackViewController loadSnapshotWithAnimating:completion:](self, "loadSnapshotWithAnimating:completion:", 0, 0);
}

- (void)viewDidLoad
{
  id v3;
  EKExpandedReminderStackLayout *v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  objc_class *v12;
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
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)EKExpandedReminderStackViewController;
  -[EKExpandedReminderStackViewController viewDidLoad](&v33, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v4 = -[EKExpandedReminderStackLayout initWithDelegate:]([EKExpandedReminderStackLayout alloc], "initWithDelegate:", self);
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[EKExpandedReminderStackViewController collectionViewDataSource](self, "collectionViewDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", v7);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v8);

  -[UICollectionView setBackgroundView:](self->_collectionView, "setBackgroundView:", 0);
  -[EKExpandedReminderStackViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_collectionView);

  -[EKExpandedReminderStackViewController transitioningDelegate](self, "transitioningDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[EKExpandedReminderStackViewController loadSnapshotWithAnimating:completion:](self, "loadSnapshotWithAnimating:completion:", 0, 0);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), v32);
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], v31);
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v17;
  -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v22);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKExpandedReminderStackViewController;
  -[EKExpandedReminderStackViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[EKExpandedReminderStackViewController _updateBlurBackground](self, "_updateBlurBackground");
  -[EKExpandedReminderStackViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

  -[EKExpandedReminderStackViewController _updatePopoverSize](self, "_updatePopoverSize");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[EKExpandedReminderStackViewControllerDelegate setModelSelectedEvents:](self->_delegate, "setModelSelectedEvents:", self->_events);
}

- (id)events
{
  return self->_events;
}

- (void)reminderDetailDismissedWithDeletedEvent:(id)a3
{
  NSArray *events;
  id v5;
  NSArray *v6;
  NSArray *v7;

  if (a3)
  {
    events = self->_events;
    v5 = a3;
    v6 = (NSArray *)-[NSArray mutableCopy](events, "mutableCopy");
    -[NSArray removeObject:](v6, "removeObject:", v5);

    v7 = self->_events;
    self->_events = v6;

  }
  -[EKExpandedReminderStackViewController _reloadCollectionViewDataWithoutAnimation](self, "_reloadCollectionViewDataWithoutAnimation");
}

- (id)cellForItemIdentifier:(id)a3 indexPath:(id)a4 collectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
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
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  EKExpandedReminderStackViewController *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[EKExpandedReminderStackViewControllerDelegate overrideCellColor](self->_delegate, "overrideCellColor");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(v8, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  v37 = v11;
  v35 = self;
  if (objc_msgSend(v13, "hasRecurrenceRules"))
  {
    -[EKExpandedReminderStackViewController loadReminderWithEKEvent:](self, "loadReminderWithEKEvent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v15 = (void *)getREMRecurrenceRuleFormatterClass_softClass;
    v42 = getREMRecurrenceRuleFormatterClass_softClass;
    if (!getREMRecurrenceRuleFormatterClass_softClass)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __getREMRecurrenceRuleFormatterClass_block_invoke;
      v38[3] = &unk_1E6018EE8;
      v38[4] = &v39;
      __getREMRecurrenceRuleFormatterClass_block_invoke((uint64_t)v38);
      v15 = (void *)v40[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v39, 8);
    objc_msgSend(v14, "recurrenceRules");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "eventStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortNaturalLanguageDescriptionForRecurrenceRule:date:timeZone:lowercase:", v18, v19, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v36;
  }
  else
  {
    v22 = 0;
  }
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v10;
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v24, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v8, "completed");
  v28 = objc_msgSend(v8, "editable");
  objc_msgSend(v8, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttonImageName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setupCellWithTitle:completed:editable:date:buttonColor:buttonImageName:backgroundColor:recurringString:delegate:", v26, v27, v28, v29, v30, v31, v37, v22, v35);

  if (CalendarLinkLibraryCore())
  {
    objc_msgSend(v8, "event");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "Cal_annotateWithEvent:", v32);

  }
  return v25;
}

- (id)collectionViewDataSource
{
  UICollectionViewDiffableDataSource *dataSource;
  id v4;
  UICollectionView *collectionView;
  uint64_t v6;
  UICollectionViewDiffableDataSource *v7;
  UICollectionViewDiffableDataSource *v8;
  UICollectionViewDiffableDataSource *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    if (self->_collectionView)
    {
      objc_initWeak(&location, self);
      v4 = objc_alloc(MEMORY[0x1E0DC35E8]);
      collectionView = self->_collectionView;
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke;
      v13[3] = &unk_1E6018E48;
      objc_copyWeak(&v14, &location);
      v7 = (UICollectionViewDiffableDataSource *)objc_msgSend(v4, "initWithCollectionView:cellProvider:", collectionView, v13);
      v8 = self->_dataSource;
      self->_dataSource = v7;

      v9 = self->_dataSource;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke_2;
      v11[3] = &unk_1E6018E70;
      objc_copyWeak(&v12, &location);
      -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v9, "setSupplementaryViewProvider:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      dataSource = self->_dataSource;
    }
    else
    {
      dataSource = 0;
    }
  }
  return dataSource;
}

id __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cellForItemIdentifier:indexPath:collectionView:", v9, v8, v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;

  return v13;
}

id __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[122], "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupWithDate:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)loadSnapshotWithAnimating:(BOOL)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  EKExpandedHashableReminder *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v17 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v25[0] = CFSTR("section");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_events;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = -[EKExpandedHashableReminder initWithEKEvent:]([EKExpandedHashableReminder alloc], "initWithEKEvent:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "appendItemsWithIdentifiers:", v8);
  -[EKExpandedReminderStackViewController collectionViewDataSource](self, "collectionViewDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__EKExpandedReminderStackViewController_loadSnapshotWithAnimating_completion___block_invoke;
  v18[3] = &unk_1E6018D30;
  v19 = v5;
  v16 = v5;
  objc_msgSend(v15, "applySnapshot:animatingDifferences:completion:", v6, v17, v18);

}

uint64_t __78__EKExpandedReminderStackViewController_loadSnapshotWithAnimating_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSnapshotWithAnimating:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  -[EKExpandedReminderStackViewController collectionViewDataSource](self, "collectionViewDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__EKExpandedReminderStackViewController_clearSnapshotWithAnimating_completion___block_invoke;
  v10[3] = &unk_1E6018D30;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "applySnapshot:animatingDifferences:completion:", v7, v4, v10);

}

uint64_t __79__EKExpandedReminderStackViewController_clearSnapshotWithAnimating_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  EKExpandedReminderStackViewControllerDelegate *delegate;
  id v5;

  delegate = self->_delegate;
  -[EKExpandedReminderStackViewController _eventAtIndexPath:](self, "_eventAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewControllerDelegate showReminderDetail:](delegate, "showReminderDetail:", v5);

}

- (BOOL)expandedReminderStackShouldDoCompactLayout
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[EKExpandedReminderStackViewControllerDelegate shouldShowCompactLayout](self->_delegate, "shouldShowCompactLayout");
  else
    return 0;
}

- (CGRect)stackedReminderViewFrame
{
  EKExpandedReminderStackViewControllerDelegate *delegate;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
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
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    -[NSArray firstObject](self->_events, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackViewControllerDelegate occurrenceViewForEvent:](delegate, "occurrenceViewForEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[EKExpandedReminderStackViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[EKExpandedReminderStackViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safeAreaInsets");
    v25 = v18 - v24;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v26 = v16;
  v27 = v25;
  v28 = v20;
  v29 = v22;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_reloadCollectionViewDataWithoutAnimation
{
  UICollectionView *collectionView;
  EKExpandedReminderStackLayout *v4;

  -[EKExpandedReminderStackViewController loadSnapshotWithAnimating:completion:](self, "loadSnapshotWithAnimating:completion:", 0, 0);
  collectionView = self->_collectionView;
  v4 = -[EKExpandedReminderStackLayout initWithDelegate:]([EKExpandedReminderStackLayout alloc], "initWithDelegate:", self);
  -[UICollectionView setCollectionViewLayout:animated:](collectionView, "setCollectionViewLayout:animated:", v4, 0);

  -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
}

- (void)_updateBlurBackground
{
  _BOOL4 v3;
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
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v3 = -[EKExpandedReminderStackViewController expandedReminderStackShouldDoCompactLayout](self, "expandedReminderStackShouldDoCompactLayout");
  -[EKExpandedReminderStackViewController visualEffectView](self, "visualEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
      -[EKExpandedReminderStackViewController setVisualEffectView:](self, "setVisualEffectView:", v6);

      -[EKExpandedReminderStackViewController visualEffectView](self, "visualEffectView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[EKExpandedReminderStackViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController visualEffectView](self, "visualEffectView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      v26 = (void *)MEMORY[0x1E0CB3718];
      -[UIVisualEffectView leadingAnchor](self->_visualEffectView, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v30;
      -[UIVisualEffectView topAnchor](self->_visualEffectView, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v25;
      -[UIVisualEffectView trailingAnchor](self->_visualEffectView, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v13;
      -[UIVisualEffectView bottomAnchor](self->_visualEffectView, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activateConstraints:", v18);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleBackgroundTap_);
      objc_msgSend(v19, "setCancelsTouchesInView:", 0);
      -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v19);
      -[EKExpandedReminderStackViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKExpandedReminderStackViewController visualEffectView](self, "visualEffectView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendSubviewToBack:", v21);

      -[EKExpandedReminderStackViewController transitioningDelegate](self, "transitioningDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v23);

      }
    }
  }
  else
  {

    if (v5)
    {
      -[EKExpandedReminderStackViewController visualEffectView](self, "visualEffectView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeFromSuperview");

      -[EKExpandedReminderStackViewController setVisualEffectView:](self, "setVisualEffectView:", 0);
    }
  }
}

- (void)_handleBackgroundTap:(id)a3
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  id v7;

  objc_msgSend(a3, "locationInView:", self->_collectionView);
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v7),
        (v4 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v5 = (void *)v4,
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    -[EKExpandedReminderStackViewController dismissCurrentViewController](self, "dismissCurrentViewController");
  }

}

- (id)_eventAtIndexPath:(id)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_events, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
}

- (void)_updatePopoverSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  UICollectionView *collectionView;
  void *v12;
  void *v13;
  double v14;
  double v15;

  -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
  -[UICollectionView bounds](self->_collectionView, "bounds");
  if (v3 <= EKUIContainedControllerIdealWidth())
  {
    v5 = EKUIContainedControllerIdealWidth();
  }
  else
  {
    -[UICollectionView bounds](self->_collectionView, "bounds");
    v5 = v4;
  }
  +[EKExpandedReminderStackLayout verticalCellPaddingForPopover](EKExpandedReminderStackLayout, "verticalCellPaddingForPopover");
  v7 = v6;
  +[EKExpandedReminderStackLayout verticalCollectionViewPaddingForPopover](EKExpandedReminderStackLayout, "verticalCollectionViewPaddingForPopover");
  v9 = -(v7 - v8 * 2.0);
  if (-[NSArray count](self->_events, "count"))
  {
    v10 = 0;
    do
    {
      collectionView = self->_collectionView;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v9 + v14;

      v9 = v7 + v15;
      ++v10;
    }
    while (v10 < -[NSArray count](self->_events, "count"));
  }
  -[EKExpandedReminderStackViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v9);
}

- (void)reminderToggled:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController _eventAtIndexPath:](self, "_eventAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "CUIK_reminderShouldBeEditable"))
  {
    v6 = v5;
    objc_msgSend(v6, "setCompleted:", objc_msgSend(v6, "completed") ^ 1);
    -[UIResponder EKUI_editor](self, "EKUI_editor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v8 = objc_msgSend(v7, "saveEvent:span:error:", v6, 0, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
      }
    }
    -[EKExpandedReminderStackViewController loadSnapshotWithAnimating:completion:](self, "loadSnapshotWithAnimating:completion:", 0, 0);

  }
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (void)dismissCurrentViewController
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  UICollectionView *collectionView;
  EKExpandedReminderStackDismissingLayout *v23;
  NSObject *v24;
  EKExpandedReminderStackDismissingLayout *v25;
  void *v26;
  EKExpandedReminderStackViewController *v27;
  _QWORD block[4];
  id v29;
  id location;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  NSObject *v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD v49[5];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (-[EKExpandedReminderStackViewController isBeingPresented](self, "isBeingPresented"))
  {
    v3 = dispatch_group_create();
    self->_presentingTransitionCancelled = 1;
    -[UICollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
    dispatch_group_enter(v3);
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke;
    v49[3] = &unk_1E6018688;
    v49[4] = self;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_2;
    v47[3] = &unk_1E6018638;
    v6 = v3;
    v48 = v6;
    objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 65540, v49, v47, 0.2, 0.0);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v27 = self;
    -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v13 = objc_alloc(MEMORY[0x1E0DC3F38]);
          v42[0] = v5;
          v42[1] = 3221225472;
          v42[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_3;
          v42[3] = &unk_1E6018688;
          v42[4] = v12;
          v14 = (void *)objc_msgSend(v13, "initWithDuration:curve:animations:", 4, v42, 0.2);
          dispatch_group_enter(v6);
          v40[0] = v5;
          v40[1] = 3221225472;
          v40[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_4;
          v40[3] = &unk_1E6018E98;
          v41 = v6;
          objc_msgSend(v14, "addCompletion:", v40);
          objc_msgSend(v14, "startAnimation");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v9);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[UICollectionView visibleSupplementaryViewsOfKind:](v27->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0DC3F38], "expandingStackedRemindersSpringAnimator");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = v5;
            v35[1] = 3221225472;
            v35[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_5;
            v35[3] = &unk_1E6018688;
            v35[4] = v20;
            objc_msgSend(v21, "addAnimations:", v35);
            dispatch_group_enter(v6);
            v33[0] = v5;
            v33[1] = 3221225472;
            v33[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_6;
            v33[3] = &unk_1E6018E98;
            v34 = v6;
            objc_msgSend(v21, "addCompletion:", v33);
            objc_msgSend(v21, "startAnimation");

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v17);
    }

    dispatch_group_enter(v6);
    collectionView = v27->_collectionView;
    v23 = [EKExpandedReminderStackDismissingLayout alloc];
    v31[0] = v5;
    v31[1] = 3221225472;
    v31[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_7;
    v31[3] = &unk_1E6018688;
    v32 = v6;
    v24 = v6;
    v25 = -[EKExpandedReminderStackDismissingLayout initWithDelegate:completionHandler:](v23, "initWithDelegate:completionHandler:", v27, v31);
    -[UICollectionView setCollectionViewLayout:animated:completion:](collectionView, "setCollectionViewLayout:animated:completion:", v25, 1, 0);

    objc_initWeak(&location, v27);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_8;
    block[3] = &unk_1E6018A70;
    objc_copyWeak(&v29, &location);
    dispatch_group_notify(v24, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    -[EKExpandedReminderStackViewController transitioningDelegate](self, "transitioningDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      -[EKExpandedReminderStackViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 2);
    -[EKExpandedReminderStackViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 0.0);
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleForExpandingAnimation:", 0);
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBlurFilterRadius:", 20.0);
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_8(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[126], "completeTransition:", 0);
    v2 = v3[126];
    v3[126] = 0;

    objc_msgSend(v3, "setOccurrenceViewOnCanvasHidden:", 0);
    WeakRetained = v3;
  }

}

- (void)animateTransition:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t m;
  void *v15;
  void *v16;
  EKExpandedReminderStackViewController *v17;
  EKExpandedReminderStackViewControllerDelegate *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGContext *CurrentContext;
  void *v24;
  void *v25;
  UICollectionView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  id *p_isa;
  EKExpandedReminderStackViewControllerDelegate *delegate;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  UICollectionView *collectionView;
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
  _BOOL4 v72;
  NSArray *events;
  NSObject *v74;
  void *v75;
  const char *v76;
  NSArray *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  uint64_t v83;
  id v84;
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
  void *v96;
  EKExpandedReminderStackViewController *v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[5];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[5];
  _QWORD v115[5];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[5];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[5];
  _QWORD v126[5];
  id v127;
  _BYTE v128[128];
  _QWORD v129[4];
  uint8_t v130[128];
  uint8_t buf[4];
  void *v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;
  CGSize v137;

  v136 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[EKExpandedReminderStackViewController isBeingPresented](self, "isBeingPresented");
  v7 = MEMORY[0x1E0C809B0];
  v96 = v5;
  v97 = self;
  if (!v6)
  {
    objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v40;
    objc_msgSend(v40, "setAlpha:", 1.0);
    -[UICollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
    v114[0] = v7;
    v114[1] = 3221225472;
    v114[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_5;
    v114[3] = &unk_1E6018688;
    v114[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x20000, v114, 0, 0.2, 0.0);
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    -[UICollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v111 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0DC3F38], "expandingStackedRemindersSpringAnimator");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v109[0] = MEMORY[0x1E0C809B0];
            v109[1] = 3221225472;
            v109[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_6;
            v109[3] = &unk_1E6018688;
            v109[4] = v46;
            objc_msgSend(v47, "addAnimations:", v109);
            objc_msgSend(v47, "startAnimation");

          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
      }
      while (v43);
    }

    p_isa = (id *)&v97->super.super.super.isa;
    v38 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_55;
    delegate = v97->_delegate;
    -[NSArray firstObject](v97->_events, "firstObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackViewControllerDelegate occurrenceViewForEvent:](delegate, "occurrenceViewForEvent:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "setHidden:", 0);
    objc_msgSend(v51, "snapshotViewAfterScreenUpdates:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHidden:", 0);
    objc_msgSend(v51, "setHidden:", 1);
    v93 = v52;
    v94 = v51;
    if (v51 && v52)
    {
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      -[UICollectionView visibleCells](v97->_collectionView, "visibleCells");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v106;
        do
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v106 != v56)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "backgroundImageView");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setImage:", 0);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
        }
        while (v55);
      }

      collectionView = v97->_collectionView;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "backgroundImageView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "addSubview:", v52);
      objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v88 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v52, "leadingAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "leadingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToAnchor:", v92);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v129[0] = v91;
      objc_msgSend(v52, "topAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v89);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v129[1] = v87;
      objc_msgSend(v52, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "trailingAnchor");
      v64 = v52;
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v129[2] = v66;
      objc_msgSend(v64, "bottomAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v129[3] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 4);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "activateConstraints:", v70);

      p_isa = (id *)&v97->super.super.super.isa;
      goto LABEL_47;
    }
    v71 = (void *)kEKUILogHandle;
    v72 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR);
    if (v51)
    {
      if (v72)
      {
        events = v97->_events;
        v74 = v71;
        -[NSArray firstObject](events, "firstObject");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v132 = v75;
        v76 = "Couldn't snapshot occurrence view for event: %@";
LABEL_46:
        _os_log_impl(&dword_1AF84D000, v74, OS_LOG_TYPE_ERROR, v76, buf, 0xCu);

      }
    }
    else if (v72)
    {
      v77 = v97->_events;
      v74 = v71;
      -[NSArray firstObject](v77, "firstObject");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v132 = v75;
      v76 = "Couldn't find occurrence view for event: %@";
      goto LABEL_46;
    }
LABEL_47:
    v104 = 0u;
    v102 = 0u;
    v103 = 0u;
    v101 = 0u;
    objc_msgSend(p_isa[123], "visibleCells");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v128, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v102 != v81)
            objc_enumerationMutation(v78);
          v83 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * k);
          v84 = objc_alloc(MEMORY[0x1E0DC3F38]);
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_102;
          v100[3] = &unk_1E6018688;
          v100[4] = v83;
          v85 = (void *)objc_msgSend(v84, "initWithDuration:curve:animations:", 0, v100, 0.2);
          objc_msgSend(v85, "startAnimation");

        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v128, 16);
      }
      while (v80);
    }

LABEL_55:
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2_103;
    v98[3] = &unk_1E6018EC0;
    v98[4] = p_isa;
    v99 = v96;
    objc_msgSend(p_isa, "clearSnapshotWithAnimating:completion:", 1, v98);

    goto LABEL_56;
  }
  objc_msgSend(v5, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v8;
  objc_msgSend(v8, "addSubview:", v9);

  objc_storeStrong((id *)&self->_transitionContext, a3);
  v126[0] = v7;
  v126[1] = 3221225472;
  v126[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke;
  v126[3] = &unk_1E6018EC0;
  v126[4] = self;
  v127 = v5;
  -[EKExpandedReminderStackViewController loadSnapshotWithAnimating:completion:](self, "loadSnapshotWithAnimating:completion:", 1, v126);
  v125[0] = v7;
  v125[1] = 3221225472;
  v125[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2;
  v125[3] = &unk_1E6018688;
  v125[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x20000, v125, 0, 0.5, 0.0);
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  -[UICollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v122;
    do
    {
      for (m = 0; m != v12; ++m)
      {
        if (*(_QWORD *)v122 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "setBlurFilterRadius:", 20.0);
          objc_msgSend(MEMORY[0x1E0DC3F38], "expandingStackedRemindersSpringAnimator");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_3;
          v120[3] = &unk_1E6018688;
          v120[4] = v15;
          objc_msgSend(v16, "addAnimations:", v120);
          objc_msgSend(v16, "startAnimation");

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
    }
    while (v12);
  }

  v17 = v97;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = v97->_delegate;
    -[NSArray firstObject](v97->_events, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackViewControllerDelegate occurrenceViewForEvent:](v18, "occurrenceViewForEvent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "bounds");
    v137.width = v21;
    v137.height = v22;
    UIGraphicsBeginImageContextWithOptions(v137, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v20, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "renderInContext:", CurrentContext);

    CGContextRestoreGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v26 = v97->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](v26, "cellForItemAtIndexPath:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "backgroundImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v25);

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    -[UICollectionView visibleCells](v97->_collectionView, "visibleCells");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v117;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v117 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
          objc_msgSend(v35, "setVisibleForExpandingAnimation:", 0);
          v36 = objc_alloc(MEMORY[0x1E0DC3F38]);
          v115[0] = MEMORY[0x1E0C809B0];
          v115[1] = 3221225472;
          v115[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_4;
          v115[3] = &unk_1E6018688;
          v115[4] = v35;
          v37 = (void *)objc_msgSend(v36, "initWithDuration:curve:animations:", 0, v115, 0.2);
          objc_msgSend(v37, "startAnimation");

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
      }
      while (v32);
    }

    v17 = v97;
  }
  -[EKExpandedReminderStackViewController setOccurrenceViewOnCanvasHidden:](v17, "setOccurrenceViewOnCanvasHidden:", 1);
  -[EKExpandedReminderStackViewController setSelectedOccurrenceViewOnCanvasHidden:](v17, "setSelectedOccurrenceViewOnCanvasHidden:", 1);

  v38 = v96;
LABEL_56:

}

void __59__EKExpandedReminderStackViewController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 1008);
    *(_QWORD *)(v2 + 1008) = 0;

  }
}

void __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setEffect:", v2);

}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBlurFilterRadius:", 0.0);
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleForExpandingAnimation:", 1);
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 0.0);
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBlurFilterRadius:", 20.0);
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleForExpandingAnimation:", 0);
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2_103(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOccurrenceViewOnCanvasHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)setOccurrenceViewOnCanvasHidden:(BOOL)a3
{
  _BOOL8 v3;
  EKExpandedReminderStackViewControllerDelegate *delegate;
  void *v6;
  id v7;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    -[NSArray firstObject](self->_events, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackViewControllerDelegate occurrenceViewForEvent:](delegate, "occurrenceViewForEvent:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

  }
}

- (void)setSelectedOccurrenceViewOnCanvasHidden:(BOOL)a3
{
  _BOOL8 v3;
  EKExpandedReminderStackViewControllerDelegate *delegate;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    -[NSArray firstObject](self->_events, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackViewControllerDelegate occurrenceViewForEvent:](delegate, "occurrenceViewForEvent:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

  }
}

- (BOOL)preferModalPresentation
{
  return self->_preferModalPresentation;
}

- (void)setPreferModalPresentation:(BOOL)a3
{
  self->_preferModalPresentation = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
