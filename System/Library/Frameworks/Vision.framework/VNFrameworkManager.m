@implementation VNFrameworkManager

+ (id)manager
{
  if (+[VNFrameworkManager manager]::onceToken != -1)
    dispatch_once(&+[VNFrameworkManager manager]::onceToken, &__block_literal_global_4783);
  return (id)+[VNFrameworkManager manager]::ourManager;
}

- (NSLocking)detectorAccessingLock
{
  return (NSLocking *)self->_detectorAccessingLock;
}

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 forSession:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v10 = a4;
  v11 = a5;
  -[VNFrameworkManager allSessions](self, "allSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFrameworkManager _locateDetectorOfClass:configuredWithOptions:inSessions:excludingSession:](self, "_locateDetectorOfClass:configuredWithOptions:inSessions:excludingSession:", a3, v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(v11, "_releaseDetectorsThatCanBeReplacedByDetectorOfClass:withConfiguration:", a3, v10);
    -[objc_class VNClassCode](a3, "VNClassCode");
    kdebug_trace();
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", a3, CFSTR("VNDetectorNotificationDetectorClass"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("VNDetectorNotificationConfiguration"));
    -[NSNotificationCenter postNotificationName:object:userInfo:](self->_notificationCenter, "postNotificationName:object:userInfo:", CFSTR("VNDetectorWillLoadNotification"), 0, v15);
    -[objc_class detectorWithConfigurationOptions:forSession:error:](a3, "detectorWithConfigurationOptions:forSession:error:", v10, v11, a6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signPostAdditionalParameter");
    kdebug_trace();
    if (v14)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorNotificationDetector"));
      -[NSNotificationCenter postNotificationName:object:userInfo:](self->_notificationCenter, "postNotificationName:object:userInfo:", CFSTR("VNDetectorDidLoadNotification"), v14, v15);
      v16 = v14;
    }

  }
  return v14;
}

- (NSArray)allSessions
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1A1B0B060](self, a2);
  -[VNWeakTypeWrapperCollection allObjectsDroppingWeakZeroedObjects:](self->_sessions, "allObjectsDroppingWeakZeroedObjects:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v4;
}

- (id)_locateDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4 inSessions:(id)a5 excludingSession:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v12);
      v16 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v15);
      if (v16 != v11)
      {
        objc_msgSend(v16, "_cachedDetectorOfClass:configuredWithOptions:", a3, v9, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          break;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (void)registerSession:(id)a3
{
  -[VNWeakTypeWrapperCollection addObject:droppingWeakZeroedObjects:](self->_sessions, "addObject:droppingWeakZeroedObjects:", a3, 1);
}

void __29__VNFrameworkManager_manager__block_invoke()
{
  VNFrameworkManager *v0;
  void *v1;

  v0 = objc_alloc_init(VNFrameworkManager);
  v1 = (void *)+[VNFrameworkManager manager]::ourManager;
  +[VNFrameworkManager manager]::ourManager = (uint64_t)v0;

}

- (VNFrameworkManager)init
{
  VNFrameworkManager *v2;
  NSNotificationCenter *v3;
  NSNotificationCenter *notificationCenter;
  VisionCoreObjectCache *v5;
  VisionCoreObjectCache *detectorDescriptorsCache;
  NSRecursiveLock *v7;
  NSRecursiveLock *detectorAccessingLock;
  NSRecursiveLock *v9;
  NSRecursiveLock *trackerResourcesAccessingLock;
  VNWeakTypeWrapperCollection *v11;
  VNWeakTypeWrapperCollection *sessions;
  VNMTLDeviceWisdomParameters *v13;
  VNMTLDeviceWisdomParameters *wisdomParameters;
  NSRecursiveLock *v15;
  NSRecursiveLock *sessionResourcesAccessingLock;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VNFrameworkManager;
  v2 = -[VNFrameworkManager init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E0CB37D0]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    v5 = (VisionCoreObjectCache *)objc_alloc_init(MEMORY[0x1E0DC6CA0]);
    detectorDescriptorsCache = v2->_detectorDescriptorsCache;
    v2->_detectorDescriptorsCache = v5;

    v7 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    detectorAccessingLock = v2->_detectorAccessingLock;
    v2->_detectorAccessingLock = v7;

    v9 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    trackerResourcesAccessingLock = v2->_trackerResourcesAccessingLock;
    v2->_trackerResourcesAccessingLock = v9;

    v11 = objc_alloc_init(VNWeakTypeWrapperCollection);
    sessions = v2->_sessions;
    v2->_sessions = v11;

    v13 = objc_alloc_init(VNMTLDeviceWisdomParameters);
    wisdomParameters = v2->_wisdomParameters;
    v2->_wisdomParameters = v13;

    v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    sessionResourcesAccessingLock = v2->_sessionResourcesAccessingLock;
    v2->_sessionResourcesAccessingLock = v15;

  }
  return v2;
}

- (id)_locateTrackerResourcesConfiguredWithOptions:(id)a3 inSessions:(id)a4 excludingSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v10);
      v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v13);
      if (v14 != v9)
      {
        objc_msgSend(v14, "_cachedTrackerResourcesConfiguredWithOptions:", v7, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSLocking)sessionResourcesAccessingLock
{
  return (NSLocking *)self->_sessionResourcesAccessingLock;
}

- (NSLocking)trackerResourcesAccessingLock
{
  return (NSLocking *)self->_trackerResourcesAccessingLock;
}

- (id)_locateResourceObjectForIdentifier:(id)a3 requestingSession:(id)a4 creationBlock:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void (**v12)(id, id *);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id *))a5;
  -[VNFrameworkManager allSessions](self, "allSessions");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if (v17 != v11)
        {
          objc_msgSend(v17, "cachedResourceObjectForIdentifier:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v13;
            goto LABEL_13;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (v12)
  {
    v12[2](v12, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("could not locate resource object %@"), v10);
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v19);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)trackerResourcesConfiguredWithOptions:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[VNFrameworkManager allSessions](self, "allSessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFrameworkManager _locateTrackerResourcesConfiguredWithOptions:inSessions:excludingSession:](self, "_locateTrackerResourcesConfiguredWithOptions:inSessions:excludingSession:", v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "createRPNTrackerResourcesConfiguredWithOptions:error:", v8, a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (id)loadedDetectors
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1B0B060](self, a2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[VNFrameworkManager allSessions](self, "allSessions");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "loadedDetectors", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (void)releaseMetalDeviceWisdomParameters
{
  -[VNMTLDeviceWisdomParameters flushMetalDeviceWisdomParametersCache](self->_wisdomParameters, "flushMetalDeviceWisdomParametersCache");
}

- (id)wisdomParameterForMTLDevice:(id)a3 error:(id *)a4
{
  -[VNMTLDeviceWisdomParameters wisdomParameterForMTLDevice:error:](self->_wisdomParameters, "wisdomParameterForMTLDevice:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wisdomParameterForMTLDeviceWithName:(id)a3 error:(id *)a4
{
  -[VNMTLDeviceWisdomParameters wisdomParameterForMTLDeviceWithName:error:](self->_wisdomParameters, "wisdomParameterForMTLDeviceWithName:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)legacyForcedCleanupWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VNFrameworkManager allSessions](self, "allSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "legacyForcedCleanupWithOptions:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VNFrameworkManager allSessions](self, "allSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "legacyForcedCleanupOfFacePipelineWithLevel:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VNFrameworkManager allSessions](self, "allSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "legacyForcedCleanupOfFacePipelineWithLevel:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VNFrameworkManager allSessions](self, "allSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "legacyForcedCleanupOfSmartCamPipelineWithLevel:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VNFrameworkManager allSessions](self, "allSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "legacyForcedCleanupOfJunkPipelineWithLevel:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (VisionCoreObjectCache)detectorDescriptorsCache
{
  return (VisionCoreObjectCache *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wisdomParameters, 0);
  objc_storeStrong((id *)&self->_sessionResourcesAccessingLock, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_trackerResourcesAccessingLock, 0);
  objc_storeStrong((id *)&self->_detectorAccessingLock, 0);
  objc_storeStrong((id *)&self->_detectorDescriptorsCache, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

+ (int)linktimeVersion
{
  int result;

  result = +[VNRuntimeUtilities linkTimeVersion](VNRuntimeUtilities, "linkTimeVersion");
  if (result == -1)
    return +[VNRuntimeUtilities runTimeVersion](VNRuntimeUtilities, "runTimeVersion");
  return result;
}

+ (int)runtimeVersion
{
  return +[VNRuntimeUtilities runTimeVersion](VNRuntimeUtilities, "runTimeVersion");
}

@end
