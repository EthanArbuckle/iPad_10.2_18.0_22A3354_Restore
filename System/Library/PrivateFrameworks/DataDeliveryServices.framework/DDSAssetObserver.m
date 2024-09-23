@implementation DDSAssetObserver

- (DDSAssetObserver)init
{
  DDSAssetObserver *v2;
  NSMutableSet *v3;
  NSMutableSet *typesToObserve;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *autoAssetTypes;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)DDSAssetObserver;
  v2 = -[DDSAssetObserver init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    typesToObserve = v2->_typesToObserve;
    v2->_typesToObserve = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = CFSTR("com.apple.MobileAsset.LinguisticDataAuto");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    autoAssetTypes = v2->_autoAssetTypes;
    v2->_autoAssetTypes = (NSSet *)v7;

  }
  return v2;
}

- (void)observeAssetType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[DDSAssetObserver typesToObserve](self, "typesToObserve");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    DefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Adding observer for DDS asset update notification for asset type: (%{public}@)", (uint8_t *)&v9, 0xCu);
    }

    -[DDSAssetObserver typesToObserve](self, "typesToObserve");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

    -[DDSAssetObserver beginObservingType:](self, "beginObservingType:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSMutableSet)typesToObserve
{
  return self->_typesToObserve;
}

- (void)beginObservingType:(id)a3
{
  __CFString *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "stringByAppendingString:", CFSTR(".dds.assets-updated"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetObserver autoAssetTypes](self, "autoAssetTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4E068], "notifyRegistrationName:forAssetType:", CFSTR("ASSET_VERSION_DOWNLOADED"), v9);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v7;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)assetUpdatedNotificationCallback, v4, 0, CFNotificationSuspensionBehaviorCoalesce);

}

- (NSSet)autoAssetTypes
{
  return self->_autoAssetTypes;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)endObservingTypes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "End observing types: %@", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "stringByAppendingString:", CFSTR(".dds.assets-updated"), (_QWORD)v17);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[DDSAssetObserver autoAssetTypes](self, "autoAssetTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v11);

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0D4E068], "notifyRegistrationName:forAssetType:", CFSTR("ASSET_VERSION_DOWNLOADED"), v11);
          v15 = objc_claimAutoreleasedReturnValue();

          v12 = (__CFString *)v15;
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v12, 0);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)notifyObserversAssetsUpdatedForType:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR(".dds.assets-updated"));
  name = (__CFString *)objc_claimAutoreleasedReturnValue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected dealloc for asset observer", buf, 2u);
  }

  -[DDSAssetObserver setDelegate:](self, "setDelegate:", 0);
  -[DDSAssetObserver typesToObserve](self, "typesToObserve");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetObserver endObservingTypes:](self, "endObservingTypes:", v4);

  v5.receiver = self;
  v5.super_class = (Class)DDSAssetObserver;
  -[DDSAssetObserver dealloc](&v5, sel_dealloc);
}

- (DDSAssetObservingDelegate)delegate
{
  return (DDSAssetObservingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetTypes, 0);
  objc_storeStrong((id *)&self->_typesToObserve, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
