@implementation CNContactSuggestionsViewController

- (CNContactSuggestionsViewController)init
{
  CNContactSuggestionsViewController *v2;
  _PSContactSuggester *v3;
  _PSContactSuggester *contactSuggester;
  NSMutableDictionary *v5;
  NSMutableDictionary *identifiersToIndexPath;
  CNContactSuggestionsViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactSuggestionsViewController;
  v2 = -[CNContactSuggestionsViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = (_PSContactSuggester *)objc_alloc_init(get_PSContactSuggesterClass());
    contactSuggester = v2->_contactSuggester;
    v2->_contactSuggester = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifiersToIndexPath = v2->_identifiersToIndexPath;
    v2->_identifiersToIndexPath = v5;

    v7 = v2;
  }

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactSuggestionsViewController;
  -[CNContactSuggestionsViewController viewDidLoad](&v8, sel_viewDidLoad);
  +[CNUIColorRepository contactSuggestionsBackgroundColor](CNUIColorRepository, "contactSuggestionsBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNContactSuggestionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[CNContactSuggestionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  -[CNContactSuggestionsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNContactSuggestionsViewController buildCollectionView](self, "buildCollectionView");
  -[CNContactSuggestionsViewController fetchContactsIfNeeded](self, "fetchContactsIfNeeded");
}

- (BOOL)useAccessibleLayout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[CNContactSuggestionsViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC48D0];
  v9[0] = *MEMORY[0x1E0DC48D8];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0DC48C0];
  v9[2] = *MEMORY[0x1E0DC48C8];
  v9[3] = v4;
  v9[4] = *MEMORY[0x1E0DC48B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNContactSuggestionsViewController;
  v4 = a3;
  -[CNContactSuggestionsViewController traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, v4);
  -[CNContactSuggestionsViewController traitCollection](self, "traitCollection", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[CNContactSuggestionsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNContactSuggestionsViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactSuggestionsViewController estimatedHeight](self, "estimatedHeight");
      objc_msgSend(v10, "suggestionsController:didChangeToHeight:", self);

    }
    -[CNContactSuggestionsViewController compositionalLayout](self, "compositionalLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setLayout:](self, "setLayout:", v11);

    -[CNContactSuggestionsViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController layout](self, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCollectionViewLayout:animated:", v13, 1);

    -[CNContactSuggestionsViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    -[CNContactSuggestionsViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNContactSuggestionsViewController;
  v7 = a4;
  -[CNContactSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__CNContactSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E204B480;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)prepareForReuse
{
  -[CNContactSuggestionsViewController setContacts:](self, "setContacts:", 0);
}

- (id)compositionalLayout
{
  double v3;
  double v4;
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
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v3 = 1.0;
  else
    v3 = 0.25;
  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v4 = 96.0;
  else
    v4 = 140.0;
  v5 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithWidthDimension:heightDimension:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
  v14 = (void *)MEMORY[0x1E0DC3350];
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalGroupWithLayoutSize:subitems:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewController sectionInsets](self, "sectionInsets");
  objc_msgSend(v17, "setContentInsets:");
  v18 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 44.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithWidthDimension:heightDimension:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v21, *MEMORY[0x1E0DC48A8], 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentInsets:", 0.0, 3.0, 0.0, 3.0);
  v26 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBoundarySupplementaryItems:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:", v17);
  return v24;
}

- (void)buildCollectionView
{
  void *v3;
  id v4;
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
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  id location;

  -[CNContactSuggestionsViewController compositionalLayout](self, "compositionalLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewController setLayout:](self, "setLayout:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNContactSuggestionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CNContactSuggestionsViewController layout](self, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v14, v7, v9, v11, v13);

  objc_msgSend(v15, "setDelegate:", self);
  objc_initWeak(&location, self);
  v16 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke;
  v26[3] = &unk_1E204B4D0;
  objc_copyWeak(&v27, &location);
  v18 = (void *)objc_msgSend(v16, "initWithCollectionView:cellProvider:", v15, v26);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_3;
  v25[3] = &unk_1E204B4F8;
  v25[4] = self;
  objc_msgSend(v18, "setSupplementaryViewProvider:", v25);
  -[CNContactSuggestionsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v18);
  objc_msgSend(v15, "setDataSource:", v18);
  objc_msgSend(v15, "setClipsToBounds:", 0);
  v19 = objc_opt_class();
  +[CNContactSuggestionsCollectionViewCell cellIdentifier](CNContactSuggestionsCollectionViewCell, "cellIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v19, v20);

  v21 = objc_opt_class();
  +[CNContactSuggestionsViewSectionHeader reuseIdentifier](CNContactSuggestionsViewSectionHeader, "reuseIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v21, *MEMORY[0x1E0DC48A8], v22);

  +[CNUIColorRepository contactSuggestionsBackgroundColor](CNUIColorRepository, "contactSuggestionsBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v23);

  objc_msgSend(v15, "setScrollEnabled:", 0);
  objc_msgSend(v15, "setAllowsMultipleSelection:", -[CNContactSuggestionsViewController allowsMultiSelection](self, "allowsMultiSelection"));
  -[CNContactSuggestionsViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v15);

  objc_msgSend(v15, "setAutoresizingMask:", 18);
  -[CNContactSuggestionsViewController setCollectionView:](self, "setCollectionView:", v15);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_allowsMultiSelection != a3)
  {
    v3 = a3;
    self->_allowsMultiSelection = a3;
    -[CNContactSuggestionsViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNContactSuggestionsViewController collectionView](self, "collectionView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsMultipleSelection:", v3);

    }
  }
}

- (void)fetchContactsIfNeeded
{
  void *v3;

  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNContactSuggestionsViewController fetchContacts](self, "fetchContacts");
}

- (void)fetchContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _PSContactSuggester *v8;
  void *v9;
  void *v10;
  void *v11;
  _PSContactSuggester *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  _PSContactSuggester *v17;
  CNContactSuggestionsViewController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  -[CNContactSuggestionsViewController overrideSuggestedContacts](self, "overrideSuggestedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactSuggestionsViewController overrideSuggestedContacts](self, "overrideSuggestedContacts");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController filterResults:](self, "filterResults:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setContacts:](self, "setContacts:", v4);

  }
  else
  {
    -[CNContactSuggestionsViewController fetchIgnoredContactIdentifiersIfNeeded](self, "fetchIgnoredContactIdentifiersIfNeeded");
    -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

    }
    else
    {
      v7 = 0;
    }

    v8 = self->_contactSuggester;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__27916;
    v25 = __Block_byref_object_dispose__27917;
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "immediateScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__CNContactSuggestionsViewController_fetchContacts__block_invoke;
    v16[3] = &unk_1E204E980;
    v19 = &v21;
    v12 = v8;
    v20 = v7;
    v17 = v12;
    v18 = self;
    objc_msgSend(v11, "performBlock:qualityOfService:", v16, 4);

    if (v22[5])
      v13 = v22[5];
    else
      v13 = MEMORY[0x1E0C9AA60];
    -[CNContactSuggestionsViewController filterResults:](self, "filterResults:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setContacts:](self, "setContacts:", v14);

    _Block_object_dispose(&v21, 8);
  }
}

- (void)fetchIgnoredContactIdentifiersIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        !v6))
  {
    -[CNContactSuggestionsViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNContactSuggestionsViewController delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ignoredContactIdentifiersForSuggestionsController:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactSuggestionsViewController setIgnoredContactIdentifiers:](self, "setIgnoredContactIdentifiers:", v9);

    }
  }
}

- (id)filterResults:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__CNContactSuggestionsViewController_filterResults___block_invoke;
  v14[3] = &unk_1E2050520;
  v14[4] = self;
  objc_msgSend(a3, "_cn_filter:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewController fetchIgnoredContactIdentifiersIfNeeded](self, "fetchIgnoredContactIdentifiersIfNeeded");
  -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CNContactSuggestionsViewController ignoredContactIdentifiers](self, "ignoredContactIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v13[0] = v4;
      v13[1] = 3221225472;
      v13[2] = __52__CNContactSuggestionsViewController_filterResults___block_invoke_2;
      v13[3] = &unk_1E2050520;
      v13[4] = self;
      objc_msgSend(v5, "_cn_filter:", v13);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }
  objc_msgSend(v5, "_cn_take:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setContacts:(id)a3
{
  NSArray *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    objc_storeStrong((id *)&self->_contacts, a3);
    -[CNContactSuggestionsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNContactSuggestionsViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactSuggestionsViewController estimatedHeight](self, "estimatedHeight");
      objc_msgSend(v8, "suggestionsController:didChangeToHeight:", self);

    }
    -[CNContactSuggestionsViewController identifiersToIndexPath](self, "identifiersToIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0 && -[NSArray count](v5, "count"))
    {
      v10 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSuggestionsViewController identifiersToIndexPath](self, "identifiersToIndexPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

        ++v10;
      }
      while (v10 < -[NSArray count](v5, "count"));
    }
    v15 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    if (-[NSArray count](v5, "count"))
    {
      v19[0] = CFSTR("Main");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendSectionsWithIdentifiers:", v16);

      -[CNContactSuggestionsViewController contacts](self, "contacts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendItemsWithIdentifiers:", v17);

    }
    -[CNContactSuggestionsViewController diffableDataSource](self, "diffableDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applySnapshot:animatingDifferences:completion:", v15, 1, 0);

  }
}

- (double)estimatedHeight
{
  uint64_t v3;
  void *v4;
  double result;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;

  v3 = *MEMORY[0x1E0D137F8];
  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  result = 0.0;
  if ((v3 & 1) == 0)
  {
    if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout", 0.0))
      v6 = 1.0;
    else
      v6 = 4.0;
    -[CNContactSuggestionsViewController contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ceil((double)(unint64_t)objc_msgSend(v7, "count") / v6);

    +[CNUIFontRepository contactSuggestionsNameFont](CNUIFontRepository, "contactSuggestionsNameFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    v11 = ceil(v10 + v10) + 3.0;

    v12 = fmax(v11, 104.0);
    if (v6 <= 1.0)
      v13 = 0.0;
    else
      v13 = (v6 + -1.0) * 20.0;
    -[CNContactSuggestionsViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = CGRectGetWidth(v22) - v13;
    -[CNContactSuggestionsViewController horizontalSectionPadding](self, "horizontalSectionPadding");
    v17 = (v15 - v16) / v6;

    v18 = v11 + fmin(v17, 80.0) + 10.0;
    if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
      v18 = v12;
    -[CNContactSuggestionsViewController verticalSpacing](self, "verticalSpacing");
    v20 = v19 + v18 * v8;
    -[CNContactSuggestionsViewController estimatedHeaderHeight](self, "estimatedHeaderHeight");
    return v21 + v20;
  }
  return result;
}

- (CGSize)avatarSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  CGSize result;
  CGRect v26;
  CGRect v27;

  +[CNUIFontRepository contactSuggestionsNameFont](CNUIFontRepository, "contactSuggestionsNameFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = ceil(v4 + v4) + 3.0;

  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v6 = 1.0;
  else
    v6 = 4.0;
  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ceil((double)(unint64_t)objc_msgSend(v7, "count") / v6);

  v9 = v5 + 10.0;
  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v9 = 44.0;
  -[CNContactSuggestionsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetHeight(v26) - v9 * v8;
  -[CNContactSuggestionsViewController verticalSpacing](self, "verticalSpacing");
  v13 = v11 - v12;
  -[CNContactSuggestionsViewController estimatedHeaderHeight](self, "estimatedHeaderHeight");
  v15 = (v13 - v14) / v8;

  v16 = 0.0;
  if (v6 <= 1.0)
    v17 = 0.0;
  else
    v17 = (v6 + -1.0) * 20.0;
  if (!-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v16 = v17;
  -[CNContactSuggestionsViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = CGRectGetWidth(v27) - v16;
  -[CNContactSuggestionsViewController horizontalSectionPadding](self, "horizontalSectionPadding");
  v21 = (v19 - v20) / v6;

  if (v21 >= v15)
    v21 = v15;
  v22 = -[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout");
  v23 = 80.0;
  if (v22)
    v23 = 60.0;
  if (v21 < v23)
    v23 = v21;
  v24 = v23;
  result.height = v24;
  result.width = v23;
  return result;
}

- (double)estimatedHeaderHeight
{
  void *v2;
  double v3;
  double v4;

  +[CNUIFontRepository contactSuggestionsHeaderTitleFont](CNUIFontRepository, "contactSuggestionsHeaderTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = ceil(v3);

  return v4 + 15.0 + 5.0;
}

- (double)verticalSpacing
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v3 = 1.0;
  else
    v3 = 4.0;
  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ceil((double)(unint64_t)objc_msgSend(v4, "count") / v3);

  -[CNContactSuggestionsViewController sectionInsets](self, "sectionInsets");
  v7 = v6;
  v9 = v8;
  if (v5 <= 1.0)
    v10 = 0.0;
  else
    v10 = (v5 + -1.0) * 20.0;
  if (-[CNContactSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v11 = 0.0;
  else
    v11 = v10;
  return v9 + v7 + v11;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 10.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 20.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)horizontalSectionPadding
{
  double v2;
  double v3;

  -[CNContactSuggestionsViewController sectionInsets](self, "sectionInsets");
  return v2 + v3;
}

- (void)imageForContact:(id)a3 imageUpdateBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNAvatarImageRenderer *v9;
  void *v10;
  CNAvatarImageRenderer *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNContactSuggestionsViewController avatarRenderer](self, "avatarRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [CNAvatarImageRenderer alloc];
    +[CNAvatarImageRendererSettings defaultSettingsWithCacheSize:](CNAvatarImageRendererSettings, "defaultSettingsWithCacheSize:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNAvatarImageRenderer initWithSettings:](v9, "initWithSettings:", v10);
    -[CNContactSuggestionsViewController setAvatarRenderer:](self, "setAvatarRenderer:", v11);

  }
  -[CNContactSuggestionsViewController avatarSize](self, "avatarSize");
  v13 = v12;
  v15 = v14;
  -[CNContactSuggestionsViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "layoutDirection") == 1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v17, 0, v13, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactSuggestionsViewController avatarRenderer](self, "avatarRenderer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke;
  v25[3] = &unk_1E204D070;
  v26 = v7;
  v23 = v7;
  v24 = (id)objc_msgSend(v21, "renderAvatarsForContacts:scope:imageHandler:", v22, v20, v25);

}

- (NSArray)selectedContacts
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNContactSuggestionsViewController collectionView](self, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[CNContactSuggestionsViewController contacts](self, "contacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "item"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a4)
  {
    v5 = a5;
    v6 = a3;
    v8 = a4;
    -[CNContactSuggestionsViewController identifiersToIndexPath](self, "identifiersToIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CNContactSuggestionsViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v6)
        objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v13, v5, 0);
      else
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v13, v5);

    }
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a4;
  -[CNContactSuggestionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactSuggestionsViewController contacts](self, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactSuggestionsViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "suggestionsController:shouldSelectContact:atIndexPath:", self, v9, v5);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactSuggestionsViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestionsController:didSelectContact:", self, v8);

  if (!-[CNContactSuggestionsViewController allowsMultiSelection](self, "allowsMultiSelection"))
    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[CNContactSuggestionsViewController contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactSuggestionsViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionsController:didDeselectContact:", self, v9);

}

- (CNContactSuggestionsViewControllerDelegate)delegate
{
  return (CNContactSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)overrideSuggestedContacts
{
  return self->_overrideSuggestedContacts;
}

- (void)setOverrideSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSuggestedContacts, a3);
}

- (NSString)suggestionsHeaderTitle
{
  return self->_suggestionsHeaderTitle;
}

- (void)setSuggestionsHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, a3);
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (NSArray)interactionDomains
{
  return self->_interactionDomains;
}

- (void)setInteractionDomains:(id)a3
{
  objc_storeStrong((id *)&self->_interactionDomains, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSArray)ignoredContactIdentifiers
{
  return self->_ignoredContactIdentifiers;
}

- (void)setIgnoredContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredContactIdentifiers, a3);
}

- (NSMutableArray)fetchedContacts
{
  return self->_fetchedContacts;
}

- (void)setFetchedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedContacts, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSMutableDictionary)identifiersToIndexPath
{
  return self->_identifiersToIndexPath;
}

- (void)setIdentifiersToIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToIndexPath, a3);
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRenderer, a3);
}

- (_PSContactSuggester)contactSuggester
{
  return (_PSContactSuggester *)objc_getProperty(self, a2, 1072, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggester, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexPath, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_fetchedContacts, 0);
  objc_storeStrong((id *)&self->_ignoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_interactionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, 0);
  objc_storeStrong((id *)&self->_overrideSuggestedContacts, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke_2;
  v7[3] = &unk_1E204F9B0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __52__CNContactSuggestionsViewController_filterResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "suggestionsController:canSelectContact:", *(_QWORD *)(a1 + 32), v3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __52__CNContactSuggestionsViewController_filterResults___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "ignoredContactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

void __51__CNContactSuggestionsViewController_fetchContacts__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56) + 20;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "interactionDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactSuggestionsWithMaxSuggestions:contactKeysTofetch:interactionDomains:appleUsersOnly:", v3, v5, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

id __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  +[CNContactSuggestionsCollectionViewCell cellIdentifier](CNContactSuggestionsCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "item");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayString:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_2;
  v16[3] = &unk_1E204B4A8;
  v14 = v9;
  v17 = v14;
  objc_msgSend(WeakRetained, "imageForContact:imageUpdateBlock:", v12, v16);

  return v14;
}

id __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
  {
    +[CNContactSuggestionsViewSectionHeader reuseIdentifier](CNContactSuggestionsViewSectionHeader, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v11, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "suggestionsHeaderTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC35B0]);
  }

  return v10;
}

uint64_t __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
}

void __89__CNContactSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "suggestionsController:didChangeToHeight:", v5, CGRectGetHeight(v8));

  }
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1)
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_27945);
  return (id)os_log_cn_once_object_2;
}

void __44__CNContactSuggestionsViewController_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "SuggestionsViewController");
  v1 = (void *)os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

}

@end
