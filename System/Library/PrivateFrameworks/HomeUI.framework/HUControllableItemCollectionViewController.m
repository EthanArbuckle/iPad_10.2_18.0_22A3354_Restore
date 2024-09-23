@implementation HUControllableItemCollectionViewController

- (void)setConstrainCellReorderingToBounds:(BOOL)a3
{
  self->_constrainCellReorderingToBounds = a3;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController configureCell:forItem:](&v25, sel_configureCell_forItem_, v6, v7);
  -[HUControllableItemCollectionViewController _updateEditingStateForCell:animate:](self, "_updateEditingStateForCell:animate:", v6, 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_opt_class();
    v9 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "homeKitObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HUControllableItemCollectionViewController actionSetExecutionFuturesKeyedByIdentifier](self, "actionSetExecutionFuturesKeyedByIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[HUControllableItemCollectionViewController actionSetExecutionFuturesKeyedByIdentifier](self, "actionSetExecutionFuturesKeyedByIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setExecuteActionSetFuture:", v17);

      }
    }

  }
  v18 = v6;
  if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF2424C8))
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad") & 1) == 0)
  {
    objc_msgSend(v20, "item");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v20, "item");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v7);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v20, "setItem:", v7);
        objc_msgSend(v20, "updateUIWithAnimation:", 1);
      }
    }
  }

}

- (void)_updateEditingStateForCell:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  id v16;

  v4 = a4;
  v16 = a3;
  v6 = -[HUControllableItemCollectionViewController alwaysAllowReordering](self, "alwaysAllowReordering");
  v7 = v16;
  if (!v6)
  {
    v8 = v16;
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF242760))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathForItem:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v14 = -[HUControllableItemCollectionViewController canReorderItemAtIndexPath:](self, "canReorderItemAtIndexPath:", v13);
      else
        v14 = 0;
      v15 = -[HUControllableItemCollectionViewController isEditing](self, "isEditing") & v4;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "setReorderable:", v14);
      else
        v15 = v14 & v15;
      objc_msgSend(v10, "setRearranging:", v15);

    }
    v7 = v16;
  }

}

- (BOOL)alwaysAllowReordering
{
  return objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
}

- (BOOL)_isMultiControllableServiceAccessory:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D30B60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_flatMap:", &__block_literal_global_21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (unint64_t)objc_msgSend(v9, "count") > 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_childItemsForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlItemsForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "childItemsForItem:ofClass:", v4, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUControllableItemCollectionViewController;
  v8 = a4;
  -[HUItemCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v9, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, a5);
  -[HUControllableItemCollectionViewController _updateEditingStateForCell:animate:](self, "_updateEditingStateForCell:animate:", v8, 1, v9.receiver, v9.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUControllableItemCollectionViewController setViewAppeared:](self, "setViewAppeared:", 1);
  -[HUControllableItemCollectionViewController refreshTileHelper](self, "refreshTileHelper");
}

- (void)setViewAppeared:(BOOL)a3
{
  self->_viewAppeared = a3;
}

- (void)refreshTileHelper
{
  HUControllableItemCollectionViewController *v2;

  v2 = self;
  HUControllableItemCollectionViewController.refreshTileHelper()();

}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  objc_super v13;

  v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)HUControllableItemCollectionViewController;
  v11 = a5;
  -[HUItemCollectionViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v13, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, a4, v11, v10);
  v12 = objc_msgSend(v11, "count", v13.receiver, v13.super_class);

  if (v12 || objc_msgSend(v10, "count"))
    -[HUControllableItemCollectionViewController _itemSetDidChange](self, "_itemSetDidChange");

}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUControllableItemCollectionViewController;
  v3 = -[HUItemCollectionViewController initUsingCompositionalLayoutWithItemManager:](&v6, sel_initUsingCompositionalLayoutWithItemManager_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;

  -[HUControllableItemCollectionViewController setInstallsStandardGestureForInteractiveMovement:](self, "setInstallsStandardGestureForInteractiveMovement:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUControllableItemCollectionViewController setActionSetExecutionFuturesKeyedByIdentifier:](self, "setActionSetExecutionFuturesKeyedByIdentifier:", v3);

}

- (void)setActionSetExecutionFuturesKeyedByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetExecutionFuturesKeyedByIdentifier, a3);
}

- (void)viewDidLoad
{
  HUQuickControlPresentationCoordinator *v3;
  void *v4;
  HUQuickControlPresentationCoordinator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = [HUQuickControlPresentationCoordinator alloc];
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlPresentationCoordinator initWithTargetView:delegate:](v3, "initWithTargetView:delegate:", v4, self);
  -[HUControllableItemCollectionViewController setQuickControlPresentationCoordinator:](self, "setQuickControlPresentationCoordinator:", v5);

  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 0);

  if (!-[HUControllableItemCollectionViewController useCustomDragAndDrop](self, "useCustomDragAndDrop"))
    -[HUControllableItemCollectionViewController _updateReorderingGestureRecognizer](self, "_updateReorderingGestureRecognizer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleApplicationWillResignActiveNotification_, *MEMORY[0x1E0CEB358], 0);

  if (-[HUControllableItemCollectionViewController useCustomDragAndDrop](self, "useCustomDragAndDrop"))
  {
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDragDelegate:", self);

    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDropDelegate:", self);

    v10 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDragInteractionEnabled:", v10);

  }
  -[HUControllableItemCollectionViewController _registerSectionDecorationViews](self, "_registerSectionDecorationViews");
}

- (BOOL)useCustomDragAndDrop
{
  return self->_useCustomDragAndDrop;
}

- (void)_itemSetDidChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allDisplayedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearAllOverrideAttributesForItems:", v6);

  }
}

- (void)setQuickControlPresentationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_quickControlPresentationCoordinator, a3);
}

- (void)setUseCustomDragAndDrop:(BOOL)a3
{
  self->_useCustomDragAndDrop = a3;
}

- (void)_updateReorderingGestureRecognizer
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((-[HUControllableItemCollectionViewController isEditing](self, "isEditing") & 1) != 0
    || -[HUControllableItemCollectionViewController alwaysAllowReordering](self, "alwaysAllowReordering"))
  {
    -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleReorderGesture_);
      -[HUControllableItemCollectionViewController setReorderGestureRecognizer:](self, "setReorderGestureRecognizer:", v4);

      if (-[HUControllableItemCollectionViewController alwaysAllowReordering](self, "alwaysAllowReordering"))
        v5 = 0.15;
      else
        v5 = 0.1;
      -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMinimumPressDuration:", v5);

      -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addGestureRecognizer:", v8);

    }
  }
  else
  {
    -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeGestureRecognizer:", v11);

      -[HUControllableItemCollectionViewController setReorderGestureRecognizer:](self, "setReorderGestureRecognizer:", 0);
    }
  }
}

- (UILongPressGestureRecognizer)reorderGestureRecognizer
{
  return self->_reorderGestureRecognizer;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v5, "gestureRecognizers", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addMutuallyExclusiveGestureRecognizer:", v11);

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v8);
      }

      objc_msgSend(v5, "superview");
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }
    while (v13);
  }
}

- (HUQuickControlPresentationCoordinator)quickControlPresentationCoordinator
{
  return self->_quickControlPresentationCoordinator;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)presentAccessorySettingsForItem:(id)a3
{
  return -[HUControllableItemCollectionViewController presentAccessorySettingsForItem:secondaryDestination:](self, sel_presentAccessorySettingsForItem_secondaryDestination_, a3, 0);
}

- (id)presentAccessorySettingsForItem:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6;
  HUControllableItemCollectionViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = HUControllableItemCollectionViewController.presentAccessorySettings(for:secondaryDestination:)(v6, a4);

  return v8;
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4;
  HUControllableItemCollectionViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = HUControllableItemCollectionViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  id v4;
  HUControllableItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  HUControllableItemCollectionViewController.configure(accessoryControlViewController:)(v4);

}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HFAccessoryRepresentableItem *v17;
  HFItem *v18;
  HUControllableItemCollectionViewController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF20E0A8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF209370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20E5B0, (uint64_t)v16);
  swift_release();
}

- (id)unwrappedItemForAccessoryControls:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  HUControllableItemCollectionViewController *v8;
  id v9;
  HUControllableItemCollectionViewController *v10;
  void *v11;

  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = self;
    v9 = objc_msgSend(v5, sel_sourceItem);
  }
  else
  {
    v9 = v6;
    v10 = self;
  }
  v11 = (void *)swift_dynamicCastObjCProtocolConditional();

  if (!v11)
  return v11;
}

- (BOOL)hasCustomControlPresentationAnimations
{
  return 0;
}

- (BOOL)controlsWantSystemPresentationAnimations
{
  HUControllableItemCollectionViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  if (-[HUControllableItemCollectionViewController hasCustomControlPresentationAnimations](v2, sel_hasCustomControlPresentationAnimations))
  {
    if ((objc_msgSend((id)objc_opt_self(), sel_isAnIPhone) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend((id)objc_opt_self(), sel_isHomeControlService);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)itemForAccessoryControlsWithItem:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  HUControllableItemCollectionViewController *v8;
  id v9;
  HUControllableItemCollectionViewController *v10;
  void *v11;

  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = self;
    v9 = objc_msgSend(v5, sel_sourceItem);
  }
  else
  {
    v9 = v6;
    v10 = self;
  }
  v11 = (void *)swift_dynamicCastObjCProtocolConditional();

  if (!v11)
  return v11;
}

- (BOOL)shouldShowAccessoryControlForItem:(id)a3
{
  HFItem *v4;
  HUControllableItemCollectionViewController *v5;

  v4 = (HFItem *)a3;
  v5 = self;
  LOBYTE(self) = HUControllableItemCollectionViewController.shouldShowAccessoryControl(for:)(v4);

  return self & 1;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  HUControllableItemCollectionViewController *v9;
  id v10;

  v4 = a4;
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v7 = a3;
  else
    v7 = 0;
  if (v7)
  {
    v8 = a3;
    v9 = self;
    v10 = objc_msgSend(v8, sel_hu_dismissViewControllerAnimated_, -[HUControllableItemCollectionViewController controlsWantSystemPresentationAnimations](v9, sel_controlsWantSystemPresentationAnimations));

  }
  else
  {
    v10 = objc_msgSend(a3, sel_hu_dismissViewControllerAnimated_, v4);
  }
  return v10;
}

- (void)enableRefresh
{
  sub_1B8F70800(self, (uint64_t)a2, (SEL *)&selRef_endDisableExternalUpdatesWithReason_);
}

- (void)disableRefresh
{
  sub_1B8F70800(self, (uint64_t)a2, (SEL *)&selRef_disableExternalUpdatesWithReason_);
}

- (HUControllableItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v7;
  id v8;
  HUControllableItemCollectionViewController *v9;
  HUControllableItemCollectionViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EF279DD8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUControllableItemCollectionViewController.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collectionViewLayout conformsToProtocol:@protocol(HUControllableCollectionViewLayout)]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUControllableItemCollectionViewController;
  v9 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v13, sel_initWithItemManager_collectionViewLayout_, v7, v8);
  v10 = v9;
  if (v9)
    -[HUControllableItemCollectionViewController _commonInit](v9, "_commonInit");

  return v10;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[HUControllableItemCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  -[HUControllableItemCollectionViewController setViewAppeared:](self, "setViewAppeared:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD aBlock[5];
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = _Block_copy(a5);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HUControllableItemCollectionViewController_presentViewController_animated_completion___block_invoke;
  aBlock[3] = &unk_1E6F4D3E8;
  aBlock[4] = self;
  v14 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);
  v12.receiver = self;
  v12.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUControllableItemCollectionViewController presentViewController:animated:completion:](&v12, sel_presentViewController_animated_completion_, v8, v6, v11);

}

uint64_t __88__HUControllableItemCollectionViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  -[HUControllableItemCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUControllableItemCollectionViewController;
  v4 = a3;
  -[HUControllableItemCollectionViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollectionDidChange:", v4);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = -[HUControllableItemCollectionViewController isEditing](self, "isEditing");
  v22.receiver = self;
  v22.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUCollectionViewController setEditing:animated:](&v22, sel_setEditing_animated_, v5, v4);
  if (v7 != v5)
  {
    if (-[HUControllableItemCollectionViewController useCustomDragAndDrop](self, "useCustomDragAndDrop"))
    {
      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIsEditing:", v5);

      v9 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") | v5;
      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDragInteractionEnabled:", v9);

      -[HUControllableItemCollectionViewController splitViewController](self, "splitViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEditing:animated:", v5, v4);

    }
    else
    {
      -[HUControllableItemCollectionViewController _updateReorderingGestureRecognizer](self, "_updateReorderingGestureRecognizer");
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visibleCells");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[HUControllableItemCollectionViewController _updateEditingStateForCell:animate:](self, "_updateEditingStateForCell:animate:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), 1);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)setContentColorStyle:(unint64_t)a3
{
  self->_contentColorStyle = a3;
}

- (void)setExecutionFuture:(id)a3 forActionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  BOOL v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v33 = v6;
  if (v6 && v7 && (objc_msgSend(v6, "isFinished") & 1) == 0)
  {
    v32 = v8;
    -[HUControllableItemCollectionViewController actionSetExecutionFuturesKeyedByIdentifier](self, "actionSetExecutionFuturesKeyedByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

    objc_initWeak(&location, self);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __78__HUControllableItemCollectionViewController_setExecutionFuture_forActionSet___block_invoke;
    v38[3] = &unk_1E6F4DB40;
    objc_copyWeak(&v40, &location);
    v11 = v8;
    v39 = v11;
    v12 = (id)objc_msgSend(v6, "addCompletionBlock:", v38);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visibleCells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          v19 = v18;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
          v21 = v20;

          objc_opt_class();
          v22 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
          v24 = v23;

          if (v24)
            v25 = 1;
          else
            v25 = v21 == 0;
          if (!v25)
          {
            v26 = v21;
            v24 = v22;
          }
          objc_opt_class();
          objc_msgSend(v24, "item");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
          v29 = v28;

          objc_msgSend(v29, "actionSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqual:", v11);

          if (v31)
          {
            objc_msgSend(v24, "setExecuteActionSetFuture:", v33);

            goto LABEL_28;
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_28:

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    v8 = v32;
  }

}

void __78__HUControllableItemCollectionViewController_setExecutionFuture_forActionSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "actionSetExecutionFuturesKeyedByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (void)_handleReorderGesture:(id)a3
{
  HUControllableItemCollectionViewController *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  switch(objc_msgSend(v7, "state"))
  {
    case 1:
      -[HUControllableItemCollectionViewController _reorderGestureDidBegin:](self, "_reorderGestureDidBegin:", v7);
      break;
    case 2:
      -[HUControllableItemCollectionViewController _reorderGestureDidChange:](self, "_reorderGestureDidChange:", v7);
      break;
    case 3:
      v4 = self;
      v5 = v7;
      v6 = 1;
      goto LABEL_6;
    case 4:
      v4 = self;
      v5 = v7;
      v6 = 0;
LABEL_6:
      -[HUControllableItemCollectionViewController _reorderGestureDidEnd:finished:](v4, "_reorderGestureDidEnd:finished:", v5, v6);
      break;
    default:
      break;
  }

}

- (void)_reorderGestureDidBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "indexPathForItemAtPoint:", v8, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginInteractiveMovementForItemAtIndexPath:", v14);

    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForItemAtIndexPath:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControllableItemCollectionViewController setCellBeingReordered:](self, "setCellBeingReordered:", v13);

  }
}

- (void)_reorderGestureDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v4 = a3;
  -[HUControllableItemCollectionViewController cellBeingReordered](self, "cellBeingReordered");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentSize");
  v15 = v14;
  v17 = v16;

  if (-[HUControllableItemCollectionViewController constrainCellReorderingToBounds](self, "constrainCellReorderingToBounds"))
  {
    v18 = v7 * 0.5;
    v19 = fmax(v10, 0.0);
    if (v19 >= v15)
      v10 = v15;
    else
      v10 = v19;
    v20 = v18 + 0.0;
    if (v18 + 0.0 < v12)
      v20 = v12;
    v21 = v17 - v18;
    if (v21 < 0.0)
      v21 = -v21;
    if (v20 >= v21)
      v12 = v21;
    else
      v12 = v20;
  }
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateInteractiveMovementTargetPosition:", v10, v12);

}

- (void)_reorderGestureDidEnd:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[HUControllableItemCollectionViewController setCellBeingReordered:](self, "setCellBeingReordered:", 0);
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "endInteractiveMovement");
  else
    objc_msgSend(v6, "cancelInteractiveMovement");

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[HUControllableItemCollectionViewController reorderGestureRecognizer](self, "reorderGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v11);
    objc_msgSend(v10, "indexPathForItemAtPoint:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v9 = -[HUControllableItemCollectionViewController canReorderItemAtIndexPath:](self, "canReorderItemAtIndexPath:", v12);
    else
      v9 = 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  NSLog(CFSTR("If a subclass returns YES from -canReorderItemAtIndexPath:, it must also implement reorderableItemListForSection:"), a2, a3);
  return 0;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
  NSLog(CFSTR("If a subclass returns YES from -canReorderItemAtIndexPath:, it must also implement setReorderableItemList:forSection:"), a2, a3, a4);
}

- (id)_visibleCellForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayedItemAtIndexPath:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cellForItemAtIndexPath:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  unsigned int v12;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
    {
      v14 = v5;
      if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC470))
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v14, "latestResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (objc_msgSend(v18, "integerValue") & 8) == 0;
        if (!v7)
        {
LABEL_16:
          -[HUControllableItemCollectionViewController _childItemsForItem:](self, "_childItemsForItem:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredToggleableControlItemInControlItems:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v16, "accessories");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "anyObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "hf_siriEndpointProfile");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
              v19 = 0;

            if (v19)
            {

              goto LABEL_21;
            }
            v11 = 1;
          }
          else
          {
            objc_msgSend(v14, "latestResults");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "latestResults");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = 0;
            if (!v26 && v28)
              v11 = objc_msgSend(v28, "category") == 1;

          }
          goto LABEL_7;
        }
      }
      else
      {
        v19 = 1;
        if (!v7)
          goto LABEL_16;
      }
LABEL_21:

      LOBYTE(v12) = 0;
      goto LABEL_8;
    }
  }
  v11 = 1;
LABEL_7:
  v12 = v11 & ~-[HUControllableItemCollectionViewController isEditing](self, "isEditing");
LABEL_8:

  return v12;
}

- (id)_performTapActionForItem:(id)a3
{
  return -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](self, "_performTapActionForItem:tappedArea:", a3, CFSTR("HUTileCellTappableAreaGeneralToggleArea"));
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  int v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  HUControllableItemCollectionViewController *v49;
  _QWORD v50[4];
  void (**v51)(_QWORD);
  _QWORD v52[4];
  id v53;
  objc_super v54;
  _QWORD v55[5];
  id v56;
  SEL v57;
  _QWORD v58[5];
  _QWORD aBlock[4];
  id v60;
  HUControllableItemCollectionViewController *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke;
    aBlock[3] = &unk_1E6F4DB68;
    v60 = v7;
    v61 = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    v9 = 1;
    v10 = v60;
  }
  else
  {
    objc_msgSend(v6, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(v10, "unsignedIntegerValue") & 0x10) != 0)
    {
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2;
      v58[3] = &unk_1E6F4C518;
      v58[4] = self;
      v8 = (void (**)(_QWORD))_Block_copy(v58);
      v9 = 1;
      v7 = v6;
    }
    else
    {
      objc_msgSend(v6, "latestResults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "latestResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v16 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      if (v16 && !v18)
      {
        v19 = objc_opt_class();
        NSLog(CFSTR("HFResultUnderlyingCharacteristicValueDisplayErrorKey should only be used for HFCharacteristicValueDisplayErrors. Not a %p: %@!"), v16, v19);
      }
      v20 = v13;
      v49 = self;
      v21 = v18;
      if (objc_msgSend(v13, "integerValue"))
        v22 = objc_msgSend(v18, "category") == 1;
      else
        v22 = 1;
      objc_msgSend(v6, "latestResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F10]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");

      if (v22 && (objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_isSuspendedStateSupported:", v25) & 1) == 0)
      {
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_3;
        v55[3] = &unk_1E6F4DB90;
        self = v49;
        v55[4] = v49;
        v7 = v6;
        v56 = v7;
        v57 = a2;
        v8 = (void (**)(_QWORD))_Block_copy(v55);
        if (((_os_feature_enabled_impl() & 1) != 0
           || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v21, "isThreadNetworkError"))
        {
          v48 = v21;
          v33 = objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard");
          HFLogForCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          v36 = v20;
          if (v33)
          {
            if (v35)
            {
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v63 = v38;
              v64 = 2112;
              v65 = v7;
              _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@+Controls: presenting alert popup due to no thread network for item: %@", buf, 0x16u);

            }
            v39 = (void *)MEMORY[0x1E0CEA2E8];
            _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterErrorAccessoryUnavailable"), CFSTR("HUControlCenterErrorAccessoryUnavailable"), 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterLongFormErrorNoThreadNetworkLocal"), CFSTR("HUControlCenterLongFormErrorNoThreadNetworkLocal"), 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "alertControllerWithTitle:message:preferredStyle:", v40, v41, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = (void *)MEMORY[0x1E0CEA2E0];
            _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterOkAction"), CFSTR("HUControlCenterOkAction"), 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 0, 0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "addAction:", v45);
            objc_msgSend(v42, "setPreferredAction:", v45);
            v54.receiver = v49;
            v54.super_class = (Class)HUControllableItemCollectionViewController;
            -[HUControllableItemCollectionViewController presentViewController:animated:completion:](&v54, sel_presentViewController_animated_completion_, v42, 1, 0);
            objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
            v31 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (v35)
            {
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v63 = v47;
              v64 = 2112;
              v65 = v7;
              _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@+Controls: navigating to accessory settings due to no thread network for item: %@", buf, 0x16u);

            }
            -[HUControllableItemCollectionViewController presentAccessorySettingsForItem:](v49, "presentAccessorySettingsForItem:", v7);
            v31 = objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_26;
        }

        v9 = 0;
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0D31328];
        self = v49;
        -[HUControllableItemCollectionViewController _childItemsForItem:](v49, "_childItemsForItem:", v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hu_preferredToggleableControlItemInControlItems:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_200;
          v52[3] = &unk_1E6F4C518;
          v29 = v28;
          v53 = v29;
          v8 = (void (**)(_QWORD))_Block_copy(v52);
          v7 = v29;

        }
        else
        {
          v8 = 0;
          v7 = v6;
        }

        v9 = 1;
      }

    }
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v9)
    {
      -[HUControllableItemCollectionViewController prepareToPerformToggleActionForItem:sourceItem:](self, "prepareToPerformToggleActionForItem:sourceItem:", v7, v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2_201;
      v50[3] = &unk_1E6F4DBB8;
      v8 = v8;
      v51 = v8;
      objc_msgSend(v30, "flatMap:", v50);
      v31 = objc_claimAutoreleasedReturnValue();

      v10 = v51;
    }
    else
    {
      v8[2](v8);
      v31 = objc_claimAutoreleasedReturnValue();
    }
LABEL_26:

    v10 = (void *)v31;
  }

  return v10;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v5 = *(void **)(a1 + 32);
  if (v4 == 2)
    objc_msgSend(v5, "turnOffActionSet");
  else
    objc_msgSend(v5, "executeActionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExecutionFuture:forActionSet:", v6, v8);

  return v6;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentQuickControlWithContext:animated:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateResultsForItems:senderSelector:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleValue");
}

uint64_t __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __CFString *v19;
  __CFString *v20;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertPoint:fromView:", v14, x, y);
    v16 = v15;
    v18 = v17;

    objc_msgSend(v13, "tappableAreaForPoint:", v16, v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("HUTileCellTappableAreaGeneralToggleArea");
  }
  v20 = v19;

  return v20;
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService")
    || !-[HUControllableItemCollectionViewController requiresUnlockToPerformActionForItem:](self, "requiresUnlockToPerformActionForItem:", v5)|| (-[HUControllableItemCollectionViewController lockAuthorizationDelegate](self, "lockAuthorizationDelegate"), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "authorizeIfLockedForViewController:", self), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __83__HUControllableItemCollectionViewController__isMultiControllableServiceAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_232);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __83__HUControllableItemCollectionViewController__isMultiControllableServiceAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_parentService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)itemSupportsToggleInteraction:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUControllableItemCollectionViewController controlItemSupprtingToggleInteractionForItem:](self, "controlItemSupprtingToggleInteractionForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)controlItemSupprtingToggleInteractionForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;

  v4 = a3;
  if (-[HUControllableItemCollectionViewController _isMultiControllableServiceAccessory:](self, "_isMultiControllableServiceAccessory:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v8, "sourceItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        -[HUControllableItemCollectionViewController _childItemsForItem:](self, "_childItemsForItem:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredToggleableControlItemInControlItems:", v11);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v5;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return -[HUControllableItemCollectionViewController canReorderItemAtIndexPath:](self, "canReorderItemAtIndexPath:", a4);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v8 = a4;
  v9 = a6;
  v10 = objc_msgSend(v9, "section");
  if (v10 < objc_msgSend(v8, "section"))
  {
    v11 = (void *)MEMORY[0x1E0CB36B0];
    v12 = objc_msgSend(v8, "section");
    v13 = v11;
    v14 = 0;
LABEL_5:
    objc_msgSend(v13, "indexPathForItem:inSection:", v14, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v15 = objc_msgSend(v9, "section");
  v16 = v9;
  if (v15 > objc_msgSend(v8, "section"))
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayedItemsInSection:", objc_msgSend(v8, "section"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = (void *)MEMORY[0x1E0CB36B0];
    v12 = objc_msgSend(v8, "section");
    v13 = v20;
    v14 = v19 - 1;
    goto LABEL_5;
  }
LABEL_6:

  return v16;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewController;
  -[HUItemCollectionViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v5, sel_collectionView_didEndDisplayingCell_forItemAtIndexPath_, a3, a4, a5);
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  HUControllableItemCollectionViewController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "[%@:%@]: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke;
  v8[3] = &unk_1E6F4DC40;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v5, "na_each:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sectionIndexForDisplayedSectionIdentifier:", v5);

  objc_msgSend(WeakRetained, "reorderableItemListForSection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "mutableCopy");

    v9 = (void *)v10;
  }
  objc_msgSend(v9, "setSortedItems:", v14);
  objc_msgSend(WeakRetained, "setReorderableItemList:forSection:", v9, v8);
  objc_msgSend(WeakRetained, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveWithSender:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "addFailureBlock:", &__block_literal_global_241);

}

void __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, CFSTR("ReorderItems"));

}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUControllableItemCollectionViewController;
  v6 = a4;
  -[HUItemCollectionViewController itemManager:performUpdateRequest:](&v9, sel_itemManager_performUpdateRequest_, a3, v6);
  objc_msgSend(v6, "changes", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "na_any:", &__block_literal_global_252);

  if ((_DWORD)v6)
    -[HUControllableItemCollectionViewController _itemSetDidChange](self, "_itemSetDidChange");
}

BOOL __79__HUControllableItemCollectionViewController_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 0;
}

- (id)_itemForServiceControlPresentationAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EF254560) & 1) == 0)
  {

LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4
{
  return -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](self, "quickControlPresentationContextForItem:atIndexPath:point:", a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  HUQuickControlPresentationContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HUQuickControlPresentationContext);
  -[HUQuickControlPresentationContext setColorStyle:](v11, "setColorStyle:", -[HUControllableItemCollectionViewController contentColorStyle](self, "contentColorStyle"));
  -[HUQuickControlPresentationContext setItem:](v11, "setItem:", v10);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childItemsForItem:ofClass:", v10, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationContext setControlItems:](v11, "setControlItems:", v13);

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationContext setHome:](v11, "setHome:", v15);

  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  -[HUQuickControlPresentationContext setSourceRect:](v11, "setSourceRect:");

  -[HUControllableItemCollectionViewController tappableAreaForPoint:inItem:atIndexPath:](self, "tappableAreaForPoint:inItem:atIndexPath:", v10, v9, x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationContext setTappedArea:](v11, "setTappedArea:", v18);
  -[HUQuickControlPresentationContext setPrefersSystemTransitions:](v11, "setPrefersSystemTransitions:", 0);
  -[HUQuickControlPresentationContext setShouldIncludeRoomNameInHeaderTitle:](v11, "setShouldIncludeRoomNameInHeaderTitle:", 0);
  -[HUControllableItemCollectionViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HUControllableItemCollectionViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationContext setSourceViewController:](v11, "setSourceViewController:", v20);

  }
  else
  {
    -[HUQuickControlPresentationContext setSourceViewController:](v11, "setSourceViewController:", self);
  }
  return v11;
}

- (id)quickControlPresentationContextForUUID:(id)a3 type:(unint64_t)a4
{
  id v6;
  HUQuickControlPresentationContext *v7;
  HUQuickControlPresentationItemManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_alloc_init(HUQuickControlPresentationContext);
  -[HUQuickControlPresentationContext setColorStyle:](v7, "setColorStyle:", -[HUControllableItemCollectionViewController contentColorStyle](self, "contentColorStyle"));
  v8 = -[HUQuickControlPresentationItemManager initWithHomeKitObjectUUID:type:]([HUQuickControlPresentationItemManager alloc], "initWithHomeKitObjectUUID:type:", v6, a4);

  -[HUQuickControlPresentationContext setItemManager:](v7, "setItemManager:", v8);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationContext setHome:](v7, "setHome:", v10);

  -[HUQuickControlPresentationContext setPrefersSystemTransitions:](v7, "setPrefersSystemTransitions:", 1);
  -[HUQuickControlPresentationContext setShouldIncludeRoomNameInHeaderTitle:](v7, "setShouldIncludeRoomNameInHeaderTitle:", 0);
  -[HUControllableItemCollectionViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUControllableItemCollectionViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationContext setSourceViewController:](v7, "setSourceViewController:", v12);

  }
  else
  {
    -[HUQuickControlPresentationContext setSourceViewController:](v7, "setSourceViewController:", self);
  }
  return v7;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  void *v6;
  int v7;

  -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", a3, a5, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[HUControllableItemCollectionViewController isEditing](self, "isEditing") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  BOOL v37;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    goto LABEL_5;
  if ((objc_msgSend(v7, "didAuthenticate") & 1) != 0)
    goto LABEL_5;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childItemsForItem:ofClass:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke;
  v42[3] = &unk_1E6F4DAD8;
  v42[4] = self;
  v12 = objc_msgSend(v10, "na_any:", v42);

  if (v12)
  {
    v13 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v7, "controlItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setControlItems:", v14);

    -[HUControllableItemCollectionViewController lockAuthorizationDelegate](self, "lockAuthorizationDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "authorizeIfLockedForViewController:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v39[0] = v11;
    v39[1] = 3221225472;
    v39[2] = __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2;
    v39[3] = &unk_1E6F4D188;
    v40 = v13;
    v41 = v6;
    v17 = v13;
    v18 = (id)objc_msgSend(v16, "addSuccessBlock:", v39);

  }
  else
  {
LABEL_5:
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "item");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v21;
      v45 = 2112;
      v46 = v22;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@+Controls: checking about presenting accessory controls instead of quick controls for item %@", buf, 0x16u);

    }
    objc_msgSend(v7, "item");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HUControllableItemCollectionViewController shouldShowAccessoryControlForItem:](self, "shouldShowAccessoryControlForItem:", v23);

    if (!v24)
      goto LABEL_15;
    HFLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v44 = v27;
      v45 = 2112;
      v46 = v28;
      v47 = 1024;
      v48 = 0;
      _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@+Controls: confirming control items %@, shouldShowWithNoControlItems: %{BOOL}d", buf, 0x1Cu);

    }
    objc_msgSend(v7, "controlItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (!v30)
    {
LABEL_15:
      v37 = 1;
      goto LABEL_16;
    }
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "item");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v33;
      v45 = 2112;
      v46 = v34;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@+Controls presenting accessory controls for item %@", buf, 0x16u);

    }
    objc_msgSend(v7, "item");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HUControllableItemCollectionViewController presentAccessoryControlsForItem:](self, "presentAccessoryControlsForItem:", v35);

  }
  v37 = 0;
LABEL_16:

  return v37;
}

uint64_t __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requiresUnlockToPerformActionForItem:", a2);
}

id __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidAuthenticate:", 1);
  return (id)objc_msgSend(*(id *)(a1 + 40), "presentQuickControlWithContext:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (id)presentationCoordinator:(id)a3 contextForPresentationAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGPoint v14;
  CGPoint v15;

  y = a4.y;
  x = a4.x;
  -[HUControllableItemCollectionViewController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v14.x = x;
    v14.y = y;
    NSStringFromCGPoint(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not find index path for any item at the requested point: %@"), v9);

  }
  -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15.x = x;
    v15.y = y;
    NSStringFromCGPoint(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not find any item at the requested point: %@"), v11);

  }
  -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](self, "quickControlPresentationContextForItem:atIndexPath:point:", v10, v8, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)presentationCoordinator:(id)a3 applyOverrideAttributes:(id)a4 toItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applyOverrideAttributes:toItem:atIndexPath:", v13, v7, v9);

    }
  }

}

- (void)presentationCoordinator:(id)a3 clearOverrideAttributesForItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HUControllableItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clearOverrideAttributesForItem:atIndexPath:", v10, v6);

    }
  }

}

- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v20 = a4;
  v7 = a5;
  objc_msgSend(v20, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if ((!objc_msgSend(v7, "isEqualToString:", CFSTR("HUTileCellTappableAreaDetail"))
     || objc_msgSend(v12, "isThreadNetworkError"))
    && -[HUControllableItemCollectionViewController _hasTapActionForItem:](self, "_hasTapActionForItem:", v20)
    && !-[HUControllableItemCollectionViewController _isMultiControllableServiceAccessory:](self, "_isMultiControllableServiceAccessory:", v20))
  {
    v19 = -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](self, "_performTapActionForItem:tappedArea:", v20, v7);
  }
  else
  {
    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v15, "presentQuickControlWithContext:animated:", v17, 1);

    }
  }

}

- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4
{
  id v5;

  -[HUControllableItemCollectionViewController childViewController:willBeginQuickControlsPresentation:](self, "childViewController:willBeginQuickControlsPresentation:", self, a3);
  -[HUControllableItemCollectionViewController quickControlPresentationDelegate](self, "quickControlPresentationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickControlsPresentationDidUpdate:", 1);

}

- (void)presentationCoordinator:(id)a3 willEndPresentationWithContext:(id)a4
{
  id v4;

  -[HUControllableItemCollectionViewController quickControlPresentationDelegate](self, "quickControlPresentationDelegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickControlsPresentationDidUpdate:", 0);

}

- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4
{
  -[HUControllableItemCollectionViewController childViewController:didEndQuickControlsPresentation:](self, "childViewController:didEndQuickControlsPresentation:", self, a3);
}

- (id)_ancestorQuickControlPresentationHost
{
  void *v2;
  uint64_t v3;

  -[HUControllableItemCollectionViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EF23F0A0) & 1) != 0)
        break;
      objc_msgSend(v2, "parentViewController");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)childViewController:(id)a3 willBeginQuickControlsPresentation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[HUControllableItemCollectionViewController viewAppeared](self, "viewAppeared"))
    NSLog(CFSTR("The quick control presentation (%@) started on view controller: %@, but we aren't visible"), v6, v9);
  if (-[HUControllableItemCollectionViewController viewAppeared](self, "viewAppeared"))
  {
    -[HUControllableItemCollectionViewController _ancestorQuickControlPresentationHost](self, "_ancestorQuickControlPresentationHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HUControllableItemCollectionViewController setAncestorQuickControlHostAtPresentationTime:](self, "setAncestorQuickControlHostAtPresentationTime:", v7);
      -[HUControllableItemCollectionViewController ancestorQuickControlHostAtPresentationTime](self, "ancestorQuickControlHostAtPresentationTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "childViewController:willBeginQuickControlsPresentation:", self, v6);

    }
    else
    {
      -[HUItemCollectionViewController recursivelyDisableItemUpdates:withReason:](self, "recursivelyDisableItemUpdates:withReason:", 1, CFSTR("HUControllableItemCollectionViewController_QuickControls"));
    }

  }
}

- (void)childViewController:(id)a3 didEndQuickControlsPresentation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[HUControllableItemCollectionViewController ancestorQuickControlHostAtPresentationTime](self, "ancestorQuickControlHostAtPresentationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUControllableItemCollectionViewController _ancestorQuickControlPresentationHost](self, "_ancestorQuickControlPresentationHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControllableItemCollectionViewController ancestorQuickControlHostAtPresentationTime](self, "ancestorQuickControlHostAtPresentationTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      -[HUControllableItemCollectionViewController ancestorQuickControlHostAtPresentationTime](self, "ancestorQuickControlHostAtPresentationTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("The ancestor quick control host at presentation time (%@) is not the same as the current ancestor (%@)"), v8, v6);

    }
    -[HUControllableItemCollectionViewController ancestorQuickControlHostAtPresentationTime](self, "ancestorQuickControlHostAtPresentationTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childViewController:didEndQuickControlsPresentation:", self, v10);

    -[HUControllableItemCollectionViewController setAncestorQuickControlHostAtPresentationTime:](self, "setAncestorQuickControlHostAtPresentationTime:", 0);
  }
  else
  {
    -[HUItemCollectionViewController recursivelyDisableItemUpdates:withReason:](self, "recursivelyDisableItemUpdates:withReason:", 0, CFSTR("HUControllableItemCollectionViewController_QuickControls"));
  }

}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (void)_handleContextualGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  v27 = a3;
  if (objc_msgSend(v27, "state") == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "locationInView:", v4);
      v6 = v5;
      v8 = v7;

      -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_17:

        goto LABEL_18;
      }
      v10 = (void *)objc_opt_new();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();
      -[HUControllableItemCollectionViewController _childItemsForItem:](self, "_childItemsForItem:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](self, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", v15, v16, v6, v8)&& (isKindOfClass & 1) == 0)
      {

        if (!(v12 & 1 | (v14 != 0)))
        {
LABEL_12:
          -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[HUControllableItemCollectionViewController hasDetailsActionForPresentationCoordinator:item:](self, "hasDetailsActionForPresentationCoordinator:item:", v18, v9);

          if (v19)
          {
            v20 = objc_alloc(MEMORY[0x1E0CEA758]);
            _HULocalizedStringWithDefaultValue(CFSTR("HUContextualMenuItemSettings"), CFSTR("HUContextualMenuItemSettings"), 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v20, "initWithTitle:action:", v21, sel__showSettingsForSelectedMenuItem);
            objc_msgSend(v10, "addObject:", v22);

          }
          if (objc_msgSend(v10, "count"))
          {
            -[HUControllableItemCollectionViewController setSelectedContextualMenuItem:](self, "setSelectedContextualMenuItem:", v9);
            objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setMenuItems:", v10);
            -[HUControllableItemCollectionViewController becomeFirstResponder](self, "becomeFirstResponder");
            v24 = *MEMORY[0x1E0C9D820];
            v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
            -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "showMenuFromView:rect:", v26, v6, v8, v24, v25);

          }
          goto LABEL_17;
        }
        if ((v12 & 1) != 0)
          v17 = CFSTR("HUContextualMenuItemStatusDetails");
        else
          v17 = CFSTR("HUContextualMenuItemQuickControls");
        _HULocalizedStringWithDefaultValue(v17, v17, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA758]), "initWithTitle:action:", v15, sel__showQuickControlsForSelectedMenuItem);
        objc_msgSend(v10, "addObject:", v16);
      }

      goto LABEL_12;
    }
  }
LABEL_18:

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  objc_super v12;
  _QWORD v13[5];

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HUControllableItemCollectionViewController_canPerformAction_withSender___block_invoke;
  v13[3] = &__block_descriptor_40_e20_B16__0__UIMenuItem_8l;
  v13[4] = a3;
  v9 = objc_msgSend(v8, "na_any:", v13);

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUControllableItemCollectionViewController;
    v10 = -[HUControllableItemCollectionViewController canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
  }

  return v10;
}

BOOL __74__HUControllableItemCollectionViewController_canPerformAction_withSender___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "action") == *(_QWORD *)(a1 + 32);
}

- (void)_showSettingsForSelectedMenuItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  id v20;

  -[HUControllableItemCollectionViewController selectedContextualMenuItem](self, "selectedContextualMenuItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    -[HUControllableItemCollectionViewController selectedContextualMenuItem](self, "selectedContextualMenuItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v20 = v5;

    -[HUControllableItemCollectionViewController selectedContextualMenuItem](self, "selectedContextualMenuItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v20, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hf_isMultiServiceAccessory");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(v20, "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hf_primaryService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serviceItemForService:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }
    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControllableItemCollectionViewController detailsViewControllerForPresentationCoordinator:item:](self, "detailsViewControllerForPresentationCoordinator:item:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIViewController hu_delegateForModalPresentation](self, "hu_delegateForModalPresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPresentationDelegate:", v14);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v13);
      objc_msgSend(v15, "setModalPresentationStyle:", 2);
      objc_msgSend(v15, "presentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v15, "presentationController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setPreferredCornerRadius:", 20.0);

      }
      v19 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v15, 1);

    }
  }
}

- (void)_showQuickControlsForSelectedMenuItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[HUControllableItemCollectionViewController selectedContextualMenuItem](self, "selectedContextualMenuItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUControllableItemCollectionViewController selectedContextualMenuItem](self, "selectedContextualMenuItem");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForItem:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:](self, "quickControlPresentationContextForItem:atIndexPath:", v17, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    {
      objc_opt_class();
      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForItemAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPressedTile_legacy:", v10);
    }
    else
    {
      -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForItemAtIndexPath:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF253B20))
        v14 = v13;
      else
        v14 = 0;
      v10 = v14;

      -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPressedTile:", v10);
    }

    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "presentQuickControlWithContext:animated:", v6, 1);

  }
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  objc_msgSend(a3, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || !-[HUControllableItemCollectionViewController canReorderItemAtIndexPath:](self, "canReorderItemAtIndexPath:", v7))
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUControllableItemCollectionViewController dragItemForItem:atIndexPath:](self, "dragItemForItem:atIndexPath:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)dragItemForItem:(id)a3 atIndexPath:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0CB36C8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "registerItemForTypeIdentifier:loadHandler:", *MEMORY[0x1E0CA5C88], &__block_literal_global_347);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v9);
  objc_msgSend(v10, "setLocalObject:", v8);

  -[HUControllableItemCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "configureDragItem:", v10);

  return v10;
}

uint64_t __74__HUControllableItemCollectionViewController_dragItemForItem_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  void *v4;

  objc_msgSend(a4, "localDragSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(a3, "hasActiveDrag"))
    goto LABEL_5;
  objc_msgSend(v8, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathForItem:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "section");
  if (v15 != objc_msgSend(v9, "section"))
  {

LABEL_5:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:", 0);
    goto LABEL_6;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 3, 1);

LABEL_6:
  return v16;
}

- (BOOL)requiresUnlockToPerformActionForItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

- (BOOL)constrainCellReorderingToBounds
{
  return self->_constrainCellReorderingToBounds;
}

- (HULockAuthorizationDelegate)lockAuthorizationDelegate
{
  return (HULockAuthorizationDelegate *)objc_loadWeakRetained((id *)&self->_lockAuthorizationDelegate);
}

- (void)setLockAuthorizationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lockAuthorizationDelegate, a3);
}

- (HUQuickControlPresentationDelegate)quickControlPresentationDelegate
{
  return (HUQuickControlPresentationDelegate *)objc_loadWeakRetained((id *)&self->_quickControlPresentationDelegate);
}

- (void)setQuickControlPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quickControlPresentationDelegate, a3);
}

- (HUQuickControlPresentationHost)ancestorQuickControlHostAtPresentationTime
{
  return (HUQuickControlPresentationHost *)objc_loadWeakRetained((id *)&self->_ancestorQuickControlHostAtPresentationTime);
}

- (void)setAncestorQuickControlHostAtPresentationTime:(id)a3
{
  objc_storeWeak((id *)&self->_ancestorQuickControlHostAtPresentationTime, a3);
}

- (BOOL)viewAppeared
{
  return self->_viewAppeared;
}

- (void)setReorderGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_reorderGestureRecognizer, a3);
}

- (UICollectionViewCell)cellBeingReordered
{
  return self->_cellBeingReordered;
}

- (void)setCellBeingReordered:(id)a3
{
  objc_storeStrong((id *)&self->_cellBeingReordered, a3);
}

- (NSMutableDictionary)actionSetExecutionFuturesKeyedByIdentifier
{
  return self->_actionSetExecutionFuturesKeyedByIdentifier;
}

- (UIGestureRecognizer)contextualTapGestureRecognizer
{
  return self->_contextualTapGestureRecognizer;
}

- (void)setContextualTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_contextualTapGestureRecognizer, a3);
}

- (NSCopying)selectedContextualMenuItem
{
  return self->_selectedContextualMenuItem;
}

- (void)setSelectedContextualMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContextualMenuItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedContextualMenuItem, 0);
  objc_storeStrong((id *)&self->_contextualTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionSetExecutionFuturesKeyedByIdentifier, 0);
  objc_storeStrong((id *)&self->_cellBeingReordered, 0);
  objc_storeStrong((id *)&self->_reorderGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_ancestorQuickControlHostAtPresentationTime);
  objc_storeStrong((id *)&self->_quickControlPresentationCoordinator, 0);
  objc_destroyWeak((id *)&self->_quickControlPresentationDelegate);
  objc_destroyWeak((id *)&self->_lockAuthorizationDelegate);
}

@end
