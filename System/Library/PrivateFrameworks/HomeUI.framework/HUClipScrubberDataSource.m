@implementation HUClipScrubberDataSource

- (NSArray)currentEvents
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[HUClipScrubberDataSource isEditing](self, "isEditing");
  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "cameraClips");
  else
    objc_msgSend(v4, "cameraEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (HUClipScrubberDataSource)initWithPlaybackEngine:(id)a3
{
  id v4;
  HUClipScrubberDataSource *v5;
  HUClipScrubberDataSource *v6;
  HUClipScrubberTimeController *v7;
  HUClipScrubberTimeController *timeController;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *snapshotQueue;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  NSDate *currentDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUClipScrubberDataSource;
  v5 = -[HUClipScrubberDataSource init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUClipScrubberDataSource setPlaybackEngine:](v5, "setPlaybackEngine:", v4);
    v7 = objc_alloc_init(HUClipScrubberTimeController);
    timeController = v6->_timeController;
    v6->_timeController = v7;

    v6->_lastSelectedClipIndex = -1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Home.HUClipScrubberDataSource.snapshotQueue", v9);
    snapshotQueue = v6->_snapshotQueue;
    v6->_snapshotQueue = (OS_dispatch_queue *)v10;

    -[HUClipScrubberDataSource reloadEvents](v6, "reloadEvents");
    objc_msgSend(v4, "cameraEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_currentEvent, v13);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_currentEvent);
    objc_msgSend(WeakRetained, "dateOfOccurrence");
    v15 = objc_claimAutoreleasedReturnValue();
    currentDate = v6->_currentDate;
    v6->_currentDate = (NSDate *)v15;

  }
  return v6;
}

- (void)reloadEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCameraPortraitMode");
  -[HUClipScrubberDataSource timeController](self, "timeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPortraitMode:", v4);

  -[HUClipScrubberDataSource updateMostRecentClipIndex](self, "updateMostRecentClipIndex");
  -[HUClipScrubberDataSource timeController](self, "timeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clipWithLongestDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recalculateMaximumPosterFrameDuration:", v8);

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cameraEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134217984;
    v13 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Reloaded clip data source with %lu clips.", (uint8_t *)&v12, 0xCu);

  }
  -[HUClipScrubberDataSource _updateSnapshot](self, "_updateSnapshot");
}

- (void)setPlaybackEngine:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    objc_msgSend(v5, "removeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_playbackEngine, obj);
    objc_msgSend(MEMORY[0x1E0D31250], "defaultOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "addObserver:withOptions:", self, v7);

  }
}

- (void)setEditing:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_editing != a3)
  {
    v3 = a3;
    self->_editing = a3;
    -[HUClipScrubberDataSource setDisplayMode:](self, "setDisplayMode:", a3);
    -[HUClipScrubberDataSource updateMostRecentClipIndex](self, "updateMostRecentClipIndex");
    if (v3)
    {
      -[HUClipScrubberDataSource _updateSnapshotForEditing](self, "_updateSnapshotForEditing");
    }
    else
    {
      -[HUClipScrubberDataSource _updateSnapshot](self, "_updateSnapshot");
      -[HUClipScrubberDataSource setSelectionViewHidden:](self, "setSelectionViewHidden:", 1);
    }
  }
}

- (void)toggleSelectionStateForItemAtIndexPath:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[HUClipScrubberDataSource isEditing](self, "isEditing");
  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v4, 0, 0);
  else
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v4, 0);

}

- (void)updateToClipAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HUClipScrubberDataSource setLastSelectedClipIndex:](self, "setLastSelectedClipIndex:", objc_msgSend(v11, "section"));
  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberDataSource setCurrentEvent:](self, "setCurrentEvent:", v5);

  -[HUClipScrubberDataSource setCurrentTimelineState:](self, "setCurrentTimelineState:", 2);
  if (objc_msgSend(v11, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, objc_msgSend(v11, "section"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v11;
  }
  v7 = v6;
  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUClipScrubberDataSource selectionView](self, "selectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFrameToMatchView:", v9);

  }
}

- (void)setCurrentEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentEvent);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_currentEvent, v4);
    -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[HUClipScrubberDataSource isEditing](self, "isEditing");
    }
    else
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Updating last selected index after current clip change to %@", (uint8_t *)&v13, 0xCu);
      }

      -[HUClipScrubberDataSource setLastSelectedClipIndex:](self, "setLastSelectedClipIndex:", v7);
      if (-[HUClipScrubberDataSource isEditing](self, "isEditing"))
      {
        -[HUClipScrubberDataSource setLastSelectedClipIndex:](self, "setLastSelectedClipIndex:", v7);
        -[HUClipScrubberDataSource updateSelectionViewIfNeeded](self, "updateSelectionViewIfNeeded");
        -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForItemAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUClipScrubberDataSource selectionView](self, "selectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateFrameToMatchView:", v11);

      }
    }
  }

}

- (BOOL)isSpacerAtIndexPath:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
    v4 = objc_msgSend(v3, "row") != 1;
  else
    v4 = 0;

  return v4;
}

- (double)posterFrameWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveCameraSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aspectRatio");
  if (v4 >= 1.0)
    v5 = 58.0;
  else
    v5 = 33.0;

  return v5;
}

- (void)setClipCollectionView:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clipCollectionView);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_clipCollectionView, obj);
    -[HUClipScrubberDataSource _addDiffableDataSource](self, "_addDiffableDataSource");
    -[HUClipScrubberDataSource _updateSnapshot](self, "_updateSnapshot");
  }

}

- (void)_addDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0CEA440]);
  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke;
  v10 = &unk_1E6F53528;
  objc_copyWeak(&v11, &location);
  v5 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, &v7);
  -[HUClipScrubberDataSource setDiffableDataSource:](self, "setDiffableDataSource:", v5, v7, v8, v9, v10);

  -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupplementaryViewProvider:", &__block_literal_global_96);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Requesting cell for ip:%@ ii:%@", (uint8_t *)&v15, 0x16u);
    }

    if (objc_msgSend(v9, "isEqual:", CFSTR("Live")) && (objc_msgSend(WeakRetained, "isEditing") & 1) == 0)
    {
      objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("liveSpacer"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(WeakRetained, "eventForSection:", objc_msgSend(v8, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containerType") == 2)
        objc_msgSend(WeakRetained, "reachabilitySectionCellForCollectionView:forEvent:atIndexPath:", v7, v12, v8);
      else
        objc_msgSend(WeakRetained, "recordingSectionCellForCollectionView:forEvent:atIndexPath:", v7, v12, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Requesting supplementary cell for ip:%@ ii:%@", (uint8_t *)&v13, 0x16u);
  }

  if ((id)*MEMORY[0x1E0CEB3B0] == v6)
    v10 = CFSTR("footer");
  else
    v10 = CFSTR("header");
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v6, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_updateSnapshot
{
  -[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:](self, "_updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[HUClipScrubberDataSource setIsUpdating:](self, "setIsUpdating:", 1);
  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest"))
  {
    -[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:](self, "_updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:", v6, v7, v8);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HUClipScrubberDataSource snapshotQueue](self, "snapshotQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers___block_invoke;
    block[3] = &unk_1E6F53590;
    objc_copyWeak(&v14, &location);
    v11 = v6;
    v12 = v7;
    v13 = v8;
    dispatch_async(v9, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __86__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 forEvents:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__11;
  v27[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28 = v12;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke;
  v23[3] = &unk_1E6F535B8;
  v26 = v27;
  v14 = v11;
  v24 = v14;
  v15 = v10;
  v25 = v15;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
  v34[0] = CFSTR("Live");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendSectionsWithIdentifiers:", v16);

  v33 = CFSTR("Live");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, CFSTR("Live"));

  objc_msgSend(v14, "reconfigureItemsWithIdentifiers:", v8);
  objc_msgSend(v14, "reloadItemsWithIdentifiers:", v9);
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v14, "numberOfSections");
    *(_DWORD *)buf = 136315394;
    v30 = "-[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:]";
    v31 = 2048;
    v32 = v19;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%s, applying snapshot with (%ld) sections", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke_25;
  v21[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v22, (id *)buf);
  objc_msgSend(v20, "applySnapshot:animatingDifferences:completion:", v14, 0, v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(v27, 8);
}

void __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  void *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:", v6) & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      v16 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendSectionsWithIdentifiers:", v8);

      if (a3 && objc_msgSend(*(id *)(a1 + 40), "count") != a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spacer-%@"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 32);
        v14[0] = v10;
        v14[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v6);

      }
      else
      {
        v9 = *(void **)(a1 + 32);
        v15 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, v6);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);
    }
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%s event's uniqueIdentifier is nil: %@", buf, 0x16u);
    }

  }
}

void __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsUpdating:", 0);

}

- (void)_updateSnapshotForEditing
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraClips");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUClipScrubberDataSource updateMostRecentClipIndex](self, "updateMostRecentClipIndex");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest"))
  {
    -[HUClipScrubberDataSource _updateSnapshotForEditingFor:](self, "_updateSnapshotForEditingFor:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HUClipScrubberDataSource snapshotQueue](self, "snapshotQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HUClipScrubberDataSource__updateSnapshotForEditing__block_invoke;
    block[3] = &unk_1E6F50A68;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __53__HUClipScrubberDataSource__updateSnapshotForEditing__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateSnapshotForEditingFor:", *(_QWORD *)(a1 + 32));

}

- (void)_updateSnapshotForEditingFor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = -1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__11;
  v18[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke;
  v13[3] = &unk_1E6F535E0;
  v16 = v18;
  v17 = v20;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v8, "na_each:", v13);
  objc_initWeak(&location, self);
  -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke_2;
  v10[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "applySnapshot:animatingDifferences:completion:", v7, 0, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:", v3) & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v4 = *(void **)(a1 + 32);
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v6 && v6 != objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spacer-%@"), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 32);
      v11[0] = v8;
      v11[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, v3);

    }
    else
    {
      v7 = *(void **)(a1 + 32);
      v12 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, v3);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);
  }

}

void __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateMostRecentClipIndex");
  objc_msgSend(WeakRetained, "selectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
  {
    +[HUClipScrubberSelectionView selectionView](HUClipScrubberSelectionView, "selectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSelectionView:", v2);

    objc_msgSend(WeakRetained, "clipCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "selectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v4);

  }
  objc_msgSend(WeakRetained, "setSelectionViewHidden:", 1);
  objc_msgSend(WeakRetained, "currentEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "currentEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(WeakRetained, "diffableDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexForSectionIdentifier:", v10);

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v11 = objc_msgSend(WeakRetained, "mostRecentClipIndex");
      objc_msgSend(WeakRetained, "setLastSelectedClipIndex:", v11);
    }

  }
  objc_msgSend(WeakRetained, "updateSelectionViewIfNeeded");

}

- (id)recordingSectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v9;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v12;
    if (v13)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

  }
  v14 = 0;
LABEL_8:

  if (-[HUClipScrubberDataSource isSpacerAtIndexPath:](self, "isSpacerAtIndexPath:", v10))
  {
    -[HUClipScrubberDataSource spacerCellForCollectionView:forEvent:atIndexPath:](self, "spacerCellForCollectionView:forEvent:atIndexPath:", v8, v12, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HUCameraEventRecordingCellIdentifier"), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HUClipScrubberDataSource displayMode](self, "displayMode");
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isCameraPortraitMode");
    -[HUClipScrubberDataSource timeController](self, "timeController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithCameraClipEvent:mode:portraitMode:timeController:", v14, v18, v20, v21);

    v22 = -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex");
    if (v22 == objc_msgSend(v10, "section"))
    {
      -[HUClipScrubberDataSource selectionView](self, "selectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateFrameToMatchView:", v17);

    }
  }

  return v17;
}

- (id)reachabilitySectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (-[HUClipScrubberDataSource isSpacerAtIndexPath:](self, "isSpacerAtIndexPath:", v9))
  {
    -[HUClipScrubberDataSource spacerCellForCollectionView:forEvent:atIndexPath:](self, "spacerCellForCollectionView:forEvent:atIndexPath:", v10, v11, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HUCameraEventReachabilityCellIdentifier"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "updateWithReachabilityEventContainer:mode:", v13, -[HUClipScrubberDataSource displayMode](self, "displayMode"));
  v15 = -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex");
  if (v15 == objc_msgSend(v9, "section"))
  {
    -[HUClipScrubberDataSource selectionView](self, "selectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFrameToMatchView:", v14);
    goto LABEL_8;
  }
LABEL_9:

  return v14;
}

- (id)spacerCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HUCameraEventSpacerCellIdentifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isFirstEventOfTheDay:", v8))
  {
    objc_msgSend(v8, "dateOfOccurrence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_isMidnight") ^ 1;

  }
  else
  {
    v13 = 0;
  }

  if (objc_msgSend(v9, "section") < 1)
  {
    v14 = 0;
  }
  else
  {
    -[HUClipScrubberDataSource previousEventForSection:](self, "previousEventForSection:", objc_msgSend(v9, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "updateWithRecordingEvent:previousEvent:spanningMultipleDays:", v8, v14, v13);

  return v10;
}

- (void)beginTimeScaleTrackingForPinchGesture:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[HUClipScrubberDataSource lastGestureScale](self, "lastGestureScale");
  if (v4 < 1.0)
    -[HUClipScrubberDataSource setLastGestureScale:](self, "setLastGestureScale:", 1.0);
  -[HUClipScrubberDataSource lastGestureScale](self, "lastGestureScale");
  objc_msgSend(v5, "setScale:");

}

- (BOOL)isZoomingIn:(double)a3
{
  double v4;

  -[HUClipScrubberDataSource lastGestureScale](self, "lastGestureScale");
  return v4 - a3 < 0.0;
}

- (void)changeTimeScaleForPinchGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HUClipScrubberDataSource currentEvent](self, "currentEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUClipScrubberDataSource timeController](self, "timeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "clampGestureScale:");
    objc_msgSend(v6, "setScale:");

    objc_msgSend(v6, "scale");
    -[HUClipScrubberDataSource changeTimeScaleForNewScale:](self, "changeTimeScaleForNewScale:");
  }

}

- (void)changeTimeScaleForNewScale:(double)a3
{
  double v5;
  void *v6;
  void *v7;

  -[HUClipScrubberDataSource lastGestureScale](self, "lastGestureScale");
  if (vabdd_f64(v5, a3) >= 0.011)
  {
    -[HUClipScrubberDataSource timeController](self, "timeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTimeScaleForGestureScale:", a3);

    -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    -[HUClipScrubberDataSource setLastGestureScale:](self, "setLastGestureScale:", a3);
  }
}

- (double)offsetForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString **v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  NSObject *v37;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexForSectionIdentifier:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v8, "count"))
    {
LABEL_21:

LABEL_22:
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      v32 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v40 = 138412290;
        v41 = (uint64_t)v4;
        _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Offset not found for displayableEvent:%@.", (uint8_t *)&v40, 0xCu);
      }
      goto LABEL_24;
    }
    v9 = objc_msgSend(v4, "isComplete");

    if (!v9)
      goto LABEL_22;
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cameraClips");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v8 = objc_claimAutoreleasedReturnValue();

    -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueIdentifier](v8, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "indexForSectionIdentifier:", v13);

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v40 = 138412290;
        v41 = (uint64_t)v4;
        _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "Clip:%@ not found in current clips.", (uint8_t *)&v40, 0xCu);
      }

      goto LABEL_21;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 138412546;
      v41 = (uint64_t)v8;
      v42 = 2112;
      v43 = *(double *)&v4;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Jumping to the most recent clip in the timeline:%@ for requested event:%@", (uint8_t *)&v40, 0x16u);
    }

    v16 = (void *)MEMORY[0x1E0D31258];
    -[NSObject dateOfOccurrence](v8, "dateOfOccurrence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clipPositionWithDate:inClip:", v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPlaybackPosition:", v18);

    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "play");

  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7 != 0, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cellForItemAtIndexPath:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v23 = objc_msgSend(v4, "containerType");
    -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = &HUCameraEventRecordingCellIdentifier;
    if (v23 != 1)
      v26 = HUCameraEventReachabilityCellIdentifier;
    objc_msgSend(v24, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", *v26, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_21;
  }
  -[HUClipScrubberDataSource currentDate](self, "currentDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v28);
  v30 = v29;

  objc_msgSend(v22, "frame");
  v32 = v31;
  if (v30 >= 1.0)
  {
    objc_msgSend(v4, "hf_duration");
    v34 = fmin(v30 / v33, 1.0);
    objc_msgSend(v22, "frame");
    v35 = v34;
    v32 = v32 + v36 * v35;
    if (v32 == INFINITY)
    {
      HFLogForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "hf_duration");
        v40 = 134218752;
        v41 = 0x7FF0000000000000;
        v42 = 2048;
        v43 = v30;
        v44 = 2048;
        v45 = v39;
        v46 = 2048;
        v47 = v35;
        _os_log_error_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_ERROR, "Offset is invalid: %lf, elapsed: %lf, duration: %lf, percentWidth: %lf", (uint8_t *)&v40, 0x2Au);
      }

      v32 = INFINITY;
    }
  }

LABEL_24:
  return v32;
}

- (BOOL)isValidEventAtIndexPath:(id)a3
{
  return !-[HUClipScrubberDataSource isSpacerAtIndexPath:](self, "isSpacerAtIndexPath:", a3);
}

- (BOOL)isValidRecordingEventAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 0;
  if (v4 && v5 < v7)
  {
    -[HUClipScrubberDataSource eventForSection:](self, "eventForSection:", objc_msgSend(v4, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containerType") == 1;

  }
  return v8;
}

- (id)eventForSection:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= a3)
    objc_msgSend(v7, "lastObject");
  else
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)previousEventForSection:(unint64_t)a3
{
  if (!a3)
    return 0;
  -[HUClipScrubberDataSource eventForSection:](self, "eventForSection:", a3 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)startDateFromCell:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "frame");
  -[HUClipScrubberDataSource selectedDateFromCell:atCurrentOffset:](self, "selectedDateFromCell:atCurrentOffset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)selectedDateFromCell:(id)a3 atCurrentOffset:(double)a4
{
  id v6;
  float MaxX;
  float v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;

  v6 = a3;
  objc_msgSend(v6, "frame");
  MaxX = CGRectGetMaxX(v20);
  v8 = a4;
  v9 = (float)(MaxX - v8);
  objc_msgSend(v6, "frame");
  v11 = v10;

  v12 = 1.0 - v9 / v11;
  v13 = v12;
  -[HUClipScrubberDataSource currentEvent](self, "currentEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_duration");
  *(float *)&v13 = v15 * v13;

  -[HUClipScrubberDataSource currentEvent](self, "currentEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateOfOccurrence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateByAddingTimeInterval:", *(float *)&v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUClipScrubberDataSource setCurrentDate:](self, "setCurrentDate:", v18);
  return v18;
}

- (double)scrubbingResolutionForClip:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!a3)
    return 0.0;
  -[HUClipScrubberDataSource indexPathsForClip:](self, "indexPathsForClip:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bounds");
    v8 = v7;
    objc_msgSend(v6, "contentScaleFactor");
    v10 = v9 * v8;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  id v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  v9 = a5;
  v10 = objc_msgSend(a6, "count");
  v11 = -[HUClipScrubberDataSource isEditing](self, "isEditing");
  if (!v10)
  {
    if (v11)
      goto LABEL_11;
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isCameraPortraitMode");
    -[HUClipScrubberDataSource timeController](self, "timeController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPortraitMode:", v19);

    -[HUClipScrubberDataSource updateMostRecentClipIndex](self, "updateMostRecentClipIndex");
    -[HUClipScrubberDataSource timeController](self, "timeController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clipWithLongestDuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recalculateMaximumPosterFrameDuration:", v23);

LABEL_10:
    -[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:](self, "_updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:", v24, v9);
    goto LABEL_11;
  }
  if (!v11)
    goto LABEL_10;
  -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cameraClips");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    if (-[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex") >= v14)
      -[HUClipScrubberDataSource setLastSelectedClipIndex:](self, "setLastSelectedClipIndex:", v14 - 1);
    -[HUClipScrubberDataSource playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cameraClips");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberDataSource setCurrentEvent:](self, "setCurrentEvent:", v17);

  }
  -[HUClipScrubberDataSource _updateSnapshotForEditing](self, "_updateSnapshotForEditing");
LABEL_11:

}

- (id)indexPathsForClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUClipScrubberDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "indexPathForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateMostRecentClipIndex
{
  id v3;

  -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_mostRecentClipIndex = objc_msgSend(v3, "count") - 1;

}

- (void)setSelectionViewHidden:(BOOL)a3
{
  float v3;
  void *v4;
  double v5;
  id v6;

  v3 = (float)!a3;
  -[HUClipScrubberDataSource selectionView](self, "selectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setOpacity:", v5);

}

- (void)updateSelectionViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (-[HUClipScrubberDataSource isEditing](self, "isEditing"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__HUClipScrubberDataSource_updateSelectionViewIfNeeded__block_invoke;
    v8[3] = &unk_1E6F53608;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

    if (!*((_BYTE *)v10 + 24))
    {
      -[HUClipScrubberDataSource currentEvents](self, "currentEvents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v6 - 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUClipScrubberDataSource updateToClipAtIndexPath:](self, "updateToClipAtIndexPath:", v7);

      }
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __55__HUClipScrubberDataSource_updateSelectionViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clipCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForCell:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "section");
  if (v5 == objc_msgSend(*(id *)(a1 + 32), "lastSelectedClipIndex")
    && objc_msgSend(*(id *)(a1 + 32), "isValidEventAtIndexPath:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleSelectionStateForItemAtIndexPath:", v4);
    objc_msgSend(*(id *)(a1 + 32), "selectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateFrameToMatchView:", v15);

    objc_msgSend(*(id *)(a1 + 32), "setSelectionViewHidden:", 0);
    objc_msgSend(*(id *)(a1 + 32), "updateToClipAtIndexPath:", v4);
    objc_msgSend(*(id *)(a1 + 32), "clipCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "currentEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startDateFromCell:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatePlaybackPositionToDate:usingClip:", v13, v11);

    objc_msgSend(*(id *)(a1 + 32), "clipCollectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectItemAtIndexPath:animated:scrollPosition:", v4, 0, 0);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)expandToMaximumZoom
{
  void *v3;
  id v4;

  -[HUClipScrubberDataSource timeController](self, "timeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expandTimelineToMaximumZoom");

  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)shrinkToMinimumZoom
{
  void *v3;
  id v4;

  -[HUClipScrubberDataSource timeController](self, "timeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shrinkTimelineToMinimumZoom");

  -[HUClipScrubberDataSource clipCollectionView](self, "clipCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (HUClipScrubberTimeController)timeController
{
  return self->_timeController;
}

- (void)setTimeController:(id)a3
{
  objc_storeStrong((id *)&self->_timeController, a3);
}

- (HFCameraRecordingEvent)currentEvent
{
  return (HFCameraRecordingEvent *)objc_loadWeakRetained((id *)&self->_currentEvent);
}

- (UICollectionView)clipCollectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_clipCollectionView);
}

- (unint64_t)currentTimelineState
{
  return self->_currentTimelineState;
}

- (void)setCurrentTimelineState:(unint64_t)a3
{
  self->_currentTimelineState = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (unint64_t)mostRecentClipIndex
{
  return self->_mostRecentClipIndex;
}

- (int64_t)lastSelectedClipIndex
{
  return self->_lastSelectedClipIndex;
}

- (void)setLastSelectedClipIndex:(int64_t)a3
{
  self->_lastSelectedClipIndex = a3;
}

- (BOOL)selectionViewHidden
{
  return self->_selectionViewHidden;
}

- (void)setPosterFrameWidth:(double)a3
{
  self->_posterFrameWidth = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (double)startingPinchDeltaX
{
  return self->_startingPinchDeltaX;
}

- (void)setStartingPinchDeltaX:(double)a3
{
  self->_startingPinchDeltaX = a3;
}

- (HUClipScrubberSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (double)lastGestureScale
{
  return self->_lastGestureScale;
}

- (void)setLastGestureScale:(double)a3
{
  self->_lastGestureScale = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (HFCameraRecordingEvent)lastUpdatedEvent
{
  return (HFCameraRecordingEvent *)objc_loadWeakRetained((id *)&self->_lastUpdatedEvent);
}

- (void)setLastUpdatedEvent:(id)a3
{
  objc_storeWeak((id *)&self->_lastUpdatedEvent, a3);
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (void)setSnapshotQueue:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_destroyWeak((id *)&self->_lastUpdatedEvent);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_clipCollectionView);
  objc_destroyWeak((id *)&self->_currentEvent);
  objc_storeStrong((id *)&self->_timeController, 0);
}

@end
