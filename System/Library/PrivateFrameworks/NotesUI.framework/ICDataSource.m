@implementation ICDataSource

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (BOOL)isTogglingLock
{
  return self->_togglingLock;
}

- (void)setWillExpandItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ICDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  ICDataSource *v8;
  ICDataSource *v9;
  uint64_t v10;
  UICollectionViewDiffableDataSource *collectionViewDiffableDataSource;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICDataSource;
  v8 = -[ICDataSource init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", v6, v7);
    collectionViewDiffableDataSource = v9->_collectionViewDiffableDataSource;
    v9->_collectionViewDiffableDataSource = (UICollectionViewDiffableDataSource *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_accountHidesNotesInCustomFoldersDidChange_, *MEMORY[0x1E0D635B8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel_accountHidesNotesInCustomFoldersDidChange_, *MEMORY[0x1E0D635A8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel_accountHidesNotesInCustomFoldersDidChange_, *MEMORY[0x1E0D635B0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel_noteLockManagerWillToggleLock_, CFSTR("ICNoteLockManagerWillToggleLock"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel_noteLockManagerDidToggleLock_, CFSTR("ICNoteLockManagerDidToggleLock"), 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDataSource;
  -[ICDataSource dealloc](&v4, sel_dealloc);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  -[ICDataSource reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:](self, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (void)reindexDataAnimated:(BOOL)a3
{
  -[ICDataSource reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:](self, "reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (id)associatedCellsForItemIdentifiers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ICDataSource_associatedCellsForItemIdentifiers___block_invoke;
  v4[3] = &unk_1E5C23008;
  v4[4] = self;
  objc_msgSend(a3, "ic_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__ICDataSource_associatedCellsForItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collectionViewDiffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (void)noteLockManagerWillToggleLock:(id)a3
{
  -[ICDataSource setTogglingLock:](self, "setTogglingLock:", 1);
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  -[ICDataSource setTogglingLock:](self, "setTogglingLock:", 0);
}

- (NSArray)sectionTypes
{
  return self->_sectionTypes;
}

- (void)setSectionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (id)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (void)setWillCollapseItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ICItemIdentifier)firstRelevantItemIdentifier
{
  return self->_firstRelevantItemIdentifier;
}

- (void)setTogglingLock:(BOOL)a3
{
  self->_togglingLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstRelevantItemIdentifier, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong((id *)&self->_sectionTypes, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
