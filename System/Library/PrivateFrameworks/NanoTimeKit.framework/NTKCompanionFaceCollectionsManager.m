@implementation NTKCompanionFaceCollectionsManager

- (id)sharedFaceCollectionForDevice:(id)a3 forCollectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NTKPersistentFaceCollection *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nrDeviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", self->_activeDeviceUUID) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeDeviceUUID, v8);
    -[NSMutableDictionary removeAllObjects](self->_faceCollectionsForCollectionIdentifier, "removeAllObjects");
  }
  objc_msgSend(v6, "nrDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(MEMORY[0x1E0C944B0], "NRDeviceIsRunningDaytonaOrLater:", v9) & 1) != 0)
  {

  }
  else
  {
    v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("LibraryFaces"));

    if ((v10 & 1) != 0)
    {
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_faceCollectionsForCollectionIdentifier, "objectForKeyedSubscript:", v7);
  v11 = (NTKPersistentFaceCollection *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[NTKPersistentFaceCollection initWithCollectionIdentifier:deviceUUID:]([NTKPersistentFaceCollection alloc], "initWithCollectionIdentifier:deviceUUID:", v7, self->_activeDeviceUUID);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_faceCollectionsForCollectionIdentifier, "setObject:forKeyedSubscript:", v11, v7);
  }
LABEL_10:

  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_26 != -1)
    dispatch_once(&sharedInstance_onceToken_26, &__block_literal_global_168);
  return (id)sharedInstance_singleton_0;
}

void __52__NTKCompanionFaceCollectionsManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = v0;

}

- (NTKCompanionFaceCollectionsManager)init
{
  NTKCompanionFaceCollectionsManager *v2;
  uint64_t v3;
  NSMutableDictionary *faceCollectionsForCollectionIdentifier;
  const char *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCompanionFaceCollectionsManager;
  v2 = -[NTKCompanionFaceCollectionsManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    faceCollectionsForCollectionIdentifier = v2->_faceCollectionsForCollectionIdentifier;
    v2->_faceCollectionsForCollectionIdentifier = (NSMutableDictionary *)v3;

    objc_initWeak(&location, v2);
    v5 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D517F8], "UTF8String");
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__NTKCompanionFaceCollectionsManager_init__block_invoke;
    v9[3] = &unk_1E6BCE7B0;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v5, &v2->_pairedDeviceVersionChangeNotificationToken, v6, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__NTKCompanionFaceCollectionsManager_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v4 = WeakRetained;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.nanotimekit.CompanionFaceCollectionsDidChangeNotification"), 0);

    WeakRetained = v4;
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_pairedDeviceVersionChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionFaceCollectionsManager;
  -[NTKCompanionFaceCollectionsManager dealloc](&v3, sel_dealloc);
}

- (id)sharedLibraryFaceCollectionsForAllDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NTKPersistentFaceCollection *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getPairedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C944B0], "CLKDeviceUUIDForNRDevice:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && objc_msgSend(MEMORY[0x1E0C944B0], "NRDeviceIsRunningDaytonaOrLater:", v9))
        {
          v11 = -[NTKPersistentFaceCollection initWithCollectionIdentifier:deviceUUID:]([NTKPersistentFaceCollection alloc], "initWithCollectionIdentifier:deviceUUID:", CFSTR("LibraryFaces"), v10);
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCollectionsForCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeDeviceUUID, 0);
}

@end
