@implementation AEPackageTransport

- (AEPackageTransport)init
{
  AEPackageTransport *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *allOrderedPackageIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *stagedPackagesByIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AEPackageTransport;
  v2 = -[AEPackageTransport init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    allOrderedPackageIdentifiers = v2->__allOrderedPackageIdentifiers;
    v2->__allOrderedPackageIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    stagedPackagesByIdentifier = v2->__stagedPackagesByIdentifier;
    v2->__stagedPackagesByIdentifier = v5;

  }
  return v2;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEPackageTransport;
  -[AEPackageTransport performChanges:](&v3, sel_performChanges_, a3);
}

- (void)_addPackageToStaging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v4, "sidecarNumberForKey:", CFSTR("AEPackageTransportSidecarProposedOrderKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v9)
    {
      v11 = v10;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v10 <= objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "insertObject:atIndex:", v7, v11);

        goto LABEL_9;
      }
      PLAssetExplorerGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543874;
        v15 = v7;
        v16 = 2050;
        v17 = v11;
        v18 = 2050;
        v19 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_21E23A000, v12, OS_LOG_TYPE_ERROR, "Package staging request index for %{public}@ is out of bounds (index: %{public}lu; package count: %{public}lu)",
          (uint8_t *)&v14,
          0x20u);
      }

    }
    objc_msgSend(v6, "addObject:", v7);
  }
LABEL_9:
  v13 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setObject:forKey:", v13, v7);

  -[AEPackageTransport signalChange:](self, "signalChange:", 1);
}

- (void)_removePackageFromStagingWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);
  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[AEPackageTransport signalChange:](self, "signalChange:", 1);
}

- (void)reportError:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  PLAssetExplorerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_21E23A000, v4, OS_LOG_TYPE_ERROR, "AssetExplorer reported error to transport: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)stagePackage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  AEPackageTransport *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __35__AEPackageTransport_stagePackage___block_invoke;
  v11 = &unk_24E23BD48;
  v12 = self;
  v5 = v4;
  v13 = v5;
  -[AEPackageTransport performChanges:](self, "performChanges:", &v8);
  -[AEPackageTransport delegate](self, "delegate", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "packageTransport:didStagePackages:", self, v7);

  }
}

- (void)stagePackages:(id)a3
{
  -[AEPackageTransport stagePackages:andNotify:](self, "stagePackages:andNotify:", a3, 1);
}

- (void)stagePackages:(id)a3 andNotify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  AEPackageTransport *v14;

  v4 = a4;
  v6 = a3;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __46__AEPackageTransport_stagePackages_andNotify___block_invoke;
  v12 = &unk_24E23BD48;
  v7 = v6;
  v13 = v7;
  v14 = self;
  -[AEPackageTransport performChanges:](self, "performChanges:", &v9);
  if (v4)
  {
    -[AEPackageTransport delegate](self, "delegate", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "packageTransport:didStagePackages:", self, v7);

  }
}

- (void)unstagePackageWithIdentifier:(id)a3
{
  -[AEPackageTransport unstagePackageWithIdentifier:andNotify:](self, "unstagePackageWithIdentifier:andNotify:", a3, 1);
}

- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  AEPackageTransport *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __61__AEPackageTransport_unstagePackageWithIdentifier_andNotify___block_invoke;
  v12 = &unk_24E23BD48;
  v13 = self;
  v7 = v6;
  v14 = v7;
  -[AEPackageTransport performChanges:](self, "performChanges:", &v9);
  if (v4)
  {
    -[AEPackageTransport delegate](self, "delegate", v9, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "packageTransport:didUnstagePackageWithIdentifier:", self, v7);

  }
}

- (void)unstagePackagesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  AEPackageTransport *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__AEPackageTransport_unstagePackagesWithIdentifiers___block_invoke;
  v16[3] = &unk_24E23BD48;
  v5 = v4;
  v17 = v5;
  v18 = self;
  -[AEPackageTransport performChanges:](self, "performChanges:", v16);
  -[AEPackageTransport delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "packageTransport:didUnstagePackageWithIdentifier:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
      }
      while (v9);
    }

  }
}

- (id)_orderedStagedIdentifiersIncludingPendingIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v8, "addObject:", v4);
  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "intersectSet:", v8);
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (id)orderedStagedIdentifiers
{
  void *v2;
  void *v3;

  -[AEPackageTransport _orderedStagedIdentifiersIncludingPendingIdentifier:](self, "_orderedStagedIdentifiersIncludingPendingIdentifier:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stagedPackageForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stagedPackages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)proposedStagedIndexForPendingIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[AEPackageTransport _orderedStagedIdentifiersIncludingPendingIdentifier:](self, "_orderedStagedIdentifiersIncludingPendingIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (int64_t)expectedPackageCount
{
  void *v2;
  int64_t v3;

  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSSet)expectedPackageIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)addPendingPackageIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePendingPackageIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", v7))
    goto LABEL_4;
  -[AEPackageTransport _stagedPackagesByIdentifier](self, "_stagedPackagesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AEPackageTransport _allOrderedPackageIdentifiers](self, "_allOrderedPackageIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v7);
LABEL_4:

  }
}

- (AEPackageTransportDelegate)delegate
{
  return (AEPackageTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHideReviewController
{
  return self->_shouldHideReviewController;
}

- (void)setShouldHideReviewController:(BOOL)a3
{
  self->_shouldHideReviewController = a3;
}

- (NSMutableOrderedSet)_allOrderedPackageIdentifiers
{
  return self->__allOrderedPackageIdentifiers;
}

- (NSMutableDictionary)_stagedPackagesByIdentifier
{
  return self->__stagedPackagesByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stagedPackagesByIdentifier, 0);
  objc_storeStrong((id *)&self->__allOrderedPackageIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__AEPackageTransport_unstagePackagesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_removePackageFromStagingWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __61__AEPackageTransport_unstagePackageWithIdentifier_andNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePackageFromStagingWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __46__AEPackageTransport_stagePackages_andNotify___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_addPackageToStaging:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __35__AEPackageTransport_stagePackage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPackageToStaging:", *(_QWORD *)(a1 + 40));
}

- (id)packagesWithLivePhotoContent
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[AEPackageTransport stagedPackages](self, "stagedPackages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsLivePhotoContent", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

@end
