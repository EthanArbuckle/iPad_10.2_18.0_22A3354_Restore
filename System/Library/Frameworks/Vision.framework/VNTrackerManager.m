@implementation VNTrackerManager

- (VNTrackerManager)init
{
  VNTrackerManager *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *liveTrackerCounter;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *trackersCollectionManagementQueue;
  uint64_t v11;
  NSDictionary *liveTrackerCounterLimit;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *trackingProcessingQueue;
  NSMutableDictionary *v18;
  NSMutableDictionary *trackers;
  VNTrackerManager *v20;
  objc_super v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)VNTrackerManager;
  v2 = -[VNTrackerManager init](&v22, sel_init);
  if (v2)
  {
    v25[0] = CFSTR("VNObjectTrackerRevision1Type");
    v25[1] = CFSTR("VNObjectTrackerRevision2Type");
    v26[0] = &unk_1E459C970;
    v26[1] = &unk_1E459C970;
    v25[2] = CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType");
    v25[3] = CFSTR("VNRectangleTrackerType");
    v26[2] = &unk_1E459C970;
    v26[3] = &unk_1E459C970;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");
    liveTrackerCounter = v2->_liveTrackerCounter;
    v2->_liveTrackerCounter = (NSMutableDictionary *)v4;

    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.trackersCollectionManagementQueue_%lu"), v2));
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    trackersCollectionManagementQueue = v2->_trackersCollectionManagementQueue;
    v2->_trackersCollectionManagementQueue = (OS_dispatch_queue *)v9;

    v23[0] = CFSTR("VNObjectTrackerRevision1Type");
    v23[1] = CFSTR("VNObjectTrackerRevision2Type");
    v24[0] = &unk_1E459C988;
    v24[1] = &unk_1E459C988;
    v23[2] = CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType");
    v23[3] = CFSTR("VNRectangleTrackerType");
    v24[2] = &unk_1E459C988;
    v24[3] = &unk_1E459C988;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v11 = objc_claimAutoreleasedReturnValue();
    liveTrackerCounterLimit = v2->_liveTrackerCounterLimit;
    v2->_liveTrackerCounterLimit = (NSDictionary *)v11;

    v13 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.trackingProcessingQueue_%lu"), v2));
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    trackingProcessingQueue = v2->_trackingProcessingQueue;
    v2->_trackingProcessingQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackers = v2->_trackers;
    v2->_trackers = v18;

    v20 = v2;
  }

  return v2;
}

- (id)_supportedComputeDeviceTypesForTrackerType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_trackerTypeToClassDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  if (v10)
  {
    objc_msgSend(v10, "supportedComputeDevicesForOptions:error:", v8, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown tracker type %@"), v7);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (int64_t)_maximumTrackersOfType:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_liveTrackerCounterLimit, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_getTracker:(id)a3
{
  id v4;
  NSObject *trackersCollectionManagementQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11341;
  v16 = __Block_byref_object_dispose__11342;
  v17 = 0;
  trackersCollectionManagementQueue = self->_trackersCollectionManagementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__VNTrackerManager__getTracker___block_invoke;
  block[3] = &unk_1E45453E0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(trackersCollectionManagementQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_createTracker:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *trackersCollectionManagementQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a4;
  v10 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__11341;
  v35 = __Block_byref_object_dispose__11342;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11341;
  v29 = __Block_byref_object_dispose__11342;
  v30 = 0;
  objc_msgSend((id)objc_opt_class(), "_trackerTypeToClassDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  trackersCollectionManagementQueue = self->_trackersCollectionManagementQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__VNTrackerManager__createTracker_type_options_error___block_invoke;
  v19[3] = &unk_1E4545410;
  v19[4] = self;
  v13 = v9;
  v20 = v13;
  v23 = &v25;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v24 = &v31;
  dispatch_sync(trackersCollectionManagementQueue, v19);
  v16 = (void *)v32[5];
  if (a6 && !v16)
  {
    *a6 = objc_retainAutorelease((id)v26[5]);
    v16 = (void *)v32[5];
  }
  v17 = v16;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (void)_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:(id)a3
{
  id v4;
  NSMutableDictionary *trackers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    trackers = self->_trackers;
    v12 = v4;
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](trackers, "removeObjectForKey:", v6);

    v7 = (void *)objc_opt_class();
    objc_msgSend(v7, "_trackerClassToNameMapTableObjectForKey:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_liveTrackerCounter, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_liveTrackerCounter, "setObject:forKeyedSubscript:", v11, v8);

    v4 = v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_liveTrackerCounterLimit, 0);
  objc_storeStrong((id *)&self->_trackersCollectionManagementQueue, 0);
  objc_storeStrong((id *)&self->_trackingProcessingQueue, 0);
  objc_storeStrong((id *)&self->_liveTrackerCounter, 0);
}

void __54__VNTrackerManager__createTracker_type_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 < objc_msgSend(*(id *)(a1 + 32), "_maximumTrackersOfType:", *(_QWORD *)(a1 + 40)))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("VNObjectTrackerRevision2Type")))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v5 + 40);
      +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v4, &obj);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v5 + 40), obj);
      if (!v6)
        goto LABEL_9;
      +[VNObjectTrackerRevision2 rpnTrackerInitModelName](VNObjectTrackerRevision2, "rpnTrackerInitModelName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("VNObjectTrackerRevision2Type_RPNTrackerInitModelName"));

      +[VNObjectTrackerRevision2 rpnTrackerTrackModelName](VNObjectTrackerRevision2, "rpnTrackerTrackModelName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("VNObjectTrackerRevision2Type_RPNTrackerTrackModelName"));

      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v24 = *(id *)(v9 + 40);
      objc_msgSend(v6, "trackerResourcesConfiguredWithOptions:error:", v4, &v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v9 + 40), v24);
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("VNTrackerOption_RPNEspressoResources"));

    }
    v11 = objc_alloc((Class)(id)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "initWithOptions:error:", v4, &v23);
    objc_storeStrong((id *)(v12 + 40), v23);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 40));

      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackerKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, v6);
      goto LABEL_8;
    }
LABEL_9:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal error: Exceeded maximum allowed number of Trackers for a tracker type: %@"), *(_QWORD *)(a1 + 40));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __32__VNTrackerManager__getTracker___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_trackerTypeToClassDictionary
{
  if (+[VNTrackerManager _trackerTypeToClassDictionary]::onceToken != -1)
    dispatch_once(&+[VNTrackerManager _trackerTypeToClassDictionary]::onceToken, &__block_literal_global_11370);
  return (id)+[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary;
}

+ (id)_trackerClassToNameMapTableObjectForKey:(Class)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::onceToken != -1)
    dispatch_once(&+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::onceToken, block);
  objc_msgSend((id)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_trackerTypeToClassDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable;
  +[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable = v1;

  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_36_11368);
}

uint64_t __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable, "setObject:forKey:", a2, a3);
}

void __49__VNTrackerManager__trackerTypeToClassDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNObjectTrackerRevision1Type");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("VNObjectTrackerRevision2Type");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("VNRectangleTrackerType");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary;
  +[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary = v0;

}

+ (id)trackerClassForOptions:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a2;
  objc_opt_self();
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNTrackingOption_TrackerType"), v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_trackerTypeToClassDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else if (a3)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown tracker type \"%@\"), v5);
      +[VNError errorForInvalidOptionWithLocalizedDescription:](VNError, "errorForInvalidOptionWithLocalizedDescription:", v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __35__VNTrackerManager_releaseTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:", *(_QWORD *)(a1 + 40));
}

void __38__VNTrackerManager_releaseAllTrackers__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5++), (_QWORD)v9);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
