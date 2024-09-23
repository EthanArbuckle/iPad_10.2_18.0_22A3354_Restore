@implementation NTKComplicationProvider

- (NSIndexSet)disabledComplicationTypes
{
  os_unfair_lock_s *p_lock;
  NSIndexSet *lock_disabledComplicationTypes;
  void *v5;
  NSIndexSet *v6;
  NSIndexSet *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  if (!lock_disabledComplicationTypes)
  {
    +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disabledComplicationTypes");
    v6 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_lock_disabledComplicationTypes;
    self->_lock_disabledComplicationTypes = v6;

    lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  }
  v8 = (void *)-[NSIndexSet copy](lock_disabledComplicationTypes, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSIndexSet *)v8;
}

+ (id)providerForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&providerForDevice__lock);
  os_unfair_lock_lock((os_unfair_lock_t)&providerForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&providerForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&providerForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&providerForDevice____cachedDevice, v3);
    providerForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __45__NTKComplicationProvider_providerForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = providerForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&providerForDevice____lock);
  v11 = (id)providerForDevice____provider;
  os_unfair_lock_unlock((os_unfair_lock_t)&providerForDevice__lock);

  return v11;
}

void __62__NTKComplicationProvider__handleAvailableComplicationsChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "complicationProviderComplicationsDidChange:", *(_QWORD *)(a1 + 32));

}

void __59__NTKComplicationProvider_complicationsOfType_withOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[NTKComplicationController controllerClassForComplicationType:family:forDevice:](NTKComplicationController, "controllerClassForComplicationType:family:forDevice:", v7, v6, v8) != 0;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __52__NTKComplicationProvider_complicationsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "complicationsOfType:withOptions:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v3);

}

void __46__NTKComplicationProvider__resetDisabledTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "complicationProviderUpdatedDisabledComplicationTypes:", *(_QWORD *)(a1 + 32));

}

void __45__NTKComplicationProvider_providerForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NTKComplicationProvider *v3;
  void *v4;

  v2 = a2;
  v3 = -[NTKComplicationProvider initWithDevice:]([NTKComplicationProvider alloc], "initWithDevice:", v2);

  v4 = (void *)providerForDevice____provider;
  providerForDevice____provider = (uint64_t)v3;

}

- (void)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NTKComplicationProvider)initWithDevice:(id)a3
{
  id v5;
  NTKComplicationProvider *v6;
  NTKComplicationProvider *v7;
  uint64_t v8;
  NSHashTable *lock_observers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKComplicationProvider;
  v6 = -[NTKComplicationProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v8;

    objc_storeStrong((id *)&v7->_device, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__resetDisabledTypes, CFSTR("NTKSystemAppStateChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__handleAvailableComplicationsChange, CFSTR("NTKRemoteComplicationProviderComplicationsDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__handleAvailableComplicationsChange, CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__handleAvailableComplicationsChange, CFSTR("NTKComplicationDidChangeNotification"), 0);

  }
  return v7;
}

- (CLKDevice)device
{
  return self->_device;
}

- (id)complicationsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  -[NTKComplicationProvider disabledComplicationTypes](self, "disabledComplicationTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  if ((objc_msgSend(v4, "includeDisabledTypes") & 1) == 0)
  {
    objc_msgSend(v4, "allowedComplicationTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeIndexes:", v5);
    v9 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v9, "setAllowedComplicationTypes:", v8);
    v4 = v9;
  }
  objc_msgSend(v4, "allowedComplicationTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__NTKComplicationProvider_complicationsWithOptions___block_invoke;
  v16[3] = &unk_1E6BD4E00;
  v16[4] = self;
  v17 = v4;
  v11 = v6;
  v18 = v11;
  v12 = v4;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

- (id)complicationsOfType:(unint64_t)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  if ((uint64_t)a3 <= 30)
  {
    if (!a3)
    {
      +[NTKComplication nullComplication](NTKComplication, "nullComplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);
      goto LABEL_17;
    }
    if (a3 == 1)
    {
      -[NTKComplicationProvider _dateComplicationsWithOptions:](self, "_dateComplicationsWithOptions:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v9);

      if ((objc_msgSend(v6, "allowGenericDateComplication") & 1) == 0)
        goto LABEL_18;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1FuLL:
        -[NTKComplicationProvider _remoteComplicationsWithOptions:](self, "_remoteComplicationsWithOptions:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 0x30uLL:
        -[NTKComplicationProvider _bundleComplicationsWithOptions:](self, "_bundleComplicationsWithOptions:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v11);

        break;
      case 0x38uLL:
        -[NTKComplicationProvider _widgetComplicationsWithOptions:](self, "_widgetComplicationsWithOptions:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v10 = (void *)v8;
        objc_msgSend(v7, "addObjectsFromArray:", v8);
LABEL_17:

LABEL_18:
        v15 = v7;
        goto LABEL_19;
    }
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v6, "rankedFamilies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__NTKComplicationProvider_complicationsOfType_withOptions___block_invoke;
  v17[3] = &unk_1E6BD5488;
  v17[5] = &v18;
  v17[6] = a3;
  v17[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

  if (*((_BYTE *)v19 + 24))
  {
    +[NTKComplication allComplicationsOfType:](NTKComplication, "allComplicationsOfType:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v13);

  }
  v14 = v7;
  _Block_object_dispose(&v18, 8);
LABEL_19:

  return v7;
}

- (void)_resetDisabledTypes
{
  NSIndexSet *lock_disabledComplicationTypes;
  id v4;
  _QWORD v5[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  self->_lock_disabledComplicationTypes = 0;

  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NTKComplicationProvider__resetDisabledTypes__block_invoke;
  v5[3] = &unk_1E6BD55A0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  -[NTKComplicationProvider _handleAvailableComplicationsChange](self, "_handleAvailableComplicationsChange");

}

- (void)_handleAvailableComplicationsChange
{
  os_unfair_lock_s *p_lock;
  NSIndexSet *lock_disabledComplicationTypes;
  id v5;
  _QWORD v6[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  self->_lock_disabledComplicationTypes = 0;

  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__NTKComplicationProvider__handleAvailableComplicationsChange__block_invoke;
  v6[3] = &unk_1E6BD55A0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_dateComplicationsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedDateStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NTKComplicationProvider__dateComplicationsWithOptions___block_invoke;
  v9[3] = &unk_1E6BD54B0;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __57__NTKComplicationProvider__dateComplicationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = *(void **)(a1 + 32);
  +[NTKDateComplication complicationWithDateStyle:](NTKDateComplication, "complicationWithDateStyle:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)_remoteComplicationsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke;
  v9[3] = &unk_1E6BD54B0;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  uint64_t v11;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_2;
  v9 = &unk_1E6BD5500;
  v11 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = _Block_copy(&v6);
  NTKSharedRemoteComplicationProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateEnabledVendorsForComplicationFamily:withBlock:", v3, v4, v6, v7, v8, v9);

}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  NTKSharedRemoteComplicationProvider();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_3;
  v11[3] = &unk_1E6BD54D8;
  v12 = v5;
  v13 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "enumerateComplicationDescriptorsForClientIdentifier:family:withBlock:", v10, v8, v11);

}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  +[NTKRemoteComplication complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:](NTKRemoteComplication, "complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

- (id)_bundleComplicationsWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  void *v16;
  _QWORD aBlock[4];
  id v18;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke;
  aBlock[3] = &unk_1E6BD5528;
  v8 = v6;
  v18 = v8;
  v9 = _Block_copy(aBlock);
  objc_msgSend(v5, "rankedFamilies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke_2;
  v15[3] = &unk_1E6BD5550;
  v15[4] = self;
  v16 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  v12 = v16;
  v13 = v8;

  return v13;
}

void __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (!a4 && (!objc_msgSend(v8, "length") || (NTKIsSystemAppRestrictedOrRemoved(v9) & 1) == 0))
  {
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleComplicationsForBundleIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          +[NTKBundleComplication bundledComplicationWithComplication:](NTKBundleComplication, "bundledComplicationWithComplication:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v17) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

void __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateBundlesForComplicationFamily:device:withBlock:", v3, v4, *(_QWORD *)(a1 + 40));

}

- (id)_widgetComplicationsWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationProvider device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKSharedWidgetComplicationProvider((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankedFamilies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__NTKComplicationProvider__widgetComplicationsWithOptions___block_invoke;
  v13[3] = &unk_1E6BD5578;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v8, "enumerateDescriptorsCompatibleWithFamilies:withBlock:", v9, v13);

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

void __59__NTKComplicationProvider__widgetComplicationsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  char v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  char v18;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v11 = v6;
    NTKSharedRemoteComplicationProvider();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = objc_msgSend(v12, "isComplicationAvailable:forFamilies:", v11, v7);

LABEL_5:
    goto LABEL_6;
  }
  if ((v9 & 1) != 0)
  {
    v13 = v6;
    -[NTKComplicationProvider device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NTKSharedWidgetComplicationProvider((uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = objc_msgSend(v14, "isComplicationAvailable:forFamilies:", v13, v7);

    goto LABEL_5;
  }
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v6, "complication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
      LODWORD(self) = NTKIsSystemAppRestrictedOrRemoved(v17) ^ 1;
    else
      LOBYTE(self) = 1;

  }
  else
  {
    -[NTKComplicationProvider disabledComplicationTypes](self, "disabledComplicationTypes");
    self = (NTKComplicationProvider *)objc_claimAutoreleasedReturnValue();
    v18 = -[NTKComplicationProvider containsIndex:](self, "containsIndex:", objc_msgSend(v6, "complicationType"));

    LOBYTE(self) = v18 ^ 1;
  }
LABEL_6:

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lock_disabledComplicationTypes, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end
