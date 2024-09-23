@implementation NTKCompanionComplicationCollectionManager

+ (id)sharedComplicationCollectionWithIdentifier:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NTKComplicationCollection *v20;
  int v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (sharedComplicationCollectionWithIdentifier_forDevice__onceToken != -1)
    dispatch_once(&sharedComplicationCollectionWithIdentifier_forDevice__onceToken, &__block_literal_global_145);
  objc_msgSend(v6, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sharedComplicationCollectionWithIdentifier_forDevice__lock);
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nrDeviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    objc_msgSend((id)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID, "setObject:forKey:", v11, v7);
    }
    if (v7 == (void *)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceUUID)
      v12 = 0;
    else
      v12 = v10;
    if (v12 == 1)
    {
      v22 = v10;
      v23 = v6;
      objc_storeStrong((id *)&sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceUUID, v7);
      objc_msgSend((id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections, "removeAllObjects");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v11, "keyEnumerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections, "setObject:forKey:", v19, v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    objc_msgSend(v11, "objectForKey:", v5);
    v20 = (NTKComplicationCollection *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = -[NTKComplicationCollection initWithCollectionIdentifier:deviceUUID:]([NTKComplicationCollection alloc], "initWithCollectionIdentifier:deviceUUID:", v5, v7);
      objc_msgSend(v11, "setObject:forKey:", v20, v5);
      if (v10)
        objc_msgSend((id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections, "setObject:forKey:", v20, v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sharedComplicationCollectionWithIdentifier_forDevice__lock);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)sharedComplicationCollectionForDevice:(id)a3
{
  return (id)objc_msgSend(a1, "sharedComplicationCollectionWithIdentifier:forDevice:", CFSTR("RemoteComplicationsV2"), a3);
}

+ (id)sharedBundleComplicationCollectionForDevice:(id)a3
{
  return (id)objc_msgSend(a1, "sharedComplicationCollectionWithIdentifier:forDevice:", CFSTR("BundleComplications"), a3);
}

void __98__NTKCompanionComplicationCollectionManager_sharedComplicationCollectionWithIdentifier_forDevice___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID;
  sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID = v0;

  v2 = objc_opt_new();
  v3 = (void *)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections;
  sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections = v2;

}

+ (id)sharedWidgetComplicationCollectionForDevice:(id)a3
{
  return (id)objc_msgSend(a1, "sharedComplicationCollectionWithIdentifier:forDevice:", CFSTR("WidgetComplications"), a3);
}

@end
