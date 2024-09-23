@implementation NTKFaceCollection

- (void)addObserver:(id)a3
{
  NTKFaceCollection *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_updateOrderedUUIDsFromReference:(id)a3 andNotifyReordered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[NSMutableArray copy](self->_orderedUUIDs, "copy");
  if (v6)
  {
    v16 = v4;
    v8 = (void *)-[NSMutableArray mutableCopy](self->_orderedUUIDs, "mutableCopy");
    objc_msgSend(v8, "removeObjectsInArray:", v6);
    -[NSMutableArray removeAllObjects](self->_orderedUUIDs, "removeAllObjects");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_facesByUUID, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            -[NSMutableArray addObject:](self->_orderedUUIDs, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[NSMutableArray addObjectsFromArray:](self->_orderedUUIDs, "addObjectsFromArray:", v8);
    v4 = v16;
  }
  if (v4 && (objc_msgSend(v7, "isEqualToArray:", self->_orderedUUIDs) & 1) == 0)
    -[NTKFaceCollection _notifyReorderedFacesOmittingObserver:](self, "_notifyReorderedFacesOmittingObserver:", 0);

}

- (id)facesByUUID
{
  return self->_facesByUUID;
}

- (NTKFace)selectedFace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NTKFaceCollection selectedUUID](self, "selectedUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NTKFaceCollection facesByUUID](self, "facesByUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceCollection selectedUUID](self, "selectedUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NTKFace *)v6;
}

- (id)selectedUUID
{
  return self->_selectedUUID;
}

- (id)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (id)observers
{
  NTKFaceCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSHashTable copy](v2->_observers, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)logIdentifier
{
  return self->_logIdentifier;
}

- (void)_setSelectedUUID:(id)a3 notify:(BOOL)a4 suppressingCallbackToObserver:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if ((NTKEqualObjects(v10, self->_selectedUUID) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedUUID, a3);
    -[NTKFaceCollection selectedUUID](self, "selectedUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[NTKFaceCollection _notifySelectedFaceOmittingObserver:](self, "_notifySelectedFaceOmittingObserver:", v8);
  }

}

- (void)_selectFaceUUID:(id)a3 notify:(BOOL)a4
{
  -[NTKFaceCollection _setSelectedUUID:notify:suppressingCallbackToObserver:](self, "_setSelectedUUID:notify:suppressingCallbackToObserver:", a3, a4, 0);
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NTKFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7;
  id v8;
  NTKFaceCollection *v9;
  NTKFaceCollection *v10;
  uint64_t v11;
  NSHashTable *observers;
  NSMutableArray *v13;
  NSMutableArray *orderedUUIDs;
  NSMutableDictionary *v15;
  NSMutableDictionary *facesByUUID;
  uint64_t v17;
  NSMapTable *UUIDsByFace;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKFaceCollection;
  v9 = -[NTKFaceCollection init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceUUID, a4);
    -[NTKFaceCollection _updateLogIdentifier](v10, "_updateLogIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedUUIDs = v10->_orderedUUIDs;
    v10->_orderedUUIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    facesByUUID = v10->_facesByUUID;
    v10->_facesByUUID = v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    UUIDsByFace = v10->_UUIDsByFace;
    v10->_UUIDsByFace = (NSMapTable *)v17;

  }
  return v10;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)_updateLogIdentifier
{
  NSString *debugName;
  NSUUID *deviceUUID;
  NSString *v5;
  NSString *logIdentifier;
  uint64_t v7;
  uint64_t v8;

  debugName = self->_debugName;
  deviceUUID = self->_deviceUUID;
  if (debugName)
  {
    if (deviceUUID)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%@), %@>"), self->_collectionIdentifier, debugName, deviceUUID);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%@)>"), self->_collectionIdentifier, debugName, v8);
  }
  else if (deviceUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@, %@>"), self->_collectionIdentifier, deviceUUID, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), self->_collectionIdentifier, v7, v8);
  }
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v5;

}

- (unint64_t)numberOfFaces
{
  return -[NSMutableArray count](self->_orderedUUIDs, "count");
}

- (unint64_t)indexOfFace:(id)a3
{
  void *v4;
  unint64_t v5;

  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSMutableArray indexOfObject:](self->_orderedUUIDs, "indexOfObject:", v4);
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)containsFace:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)faceAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_orderedUUIDs, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_orderedUUIDs, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_facesByUUID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)uuidForFace:(id)a3
{
  return -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", a3);
}

- (id)faceForUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_facesByUUID, "objectForKey:", a3);
}

- (void)enumerateFacesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NTKFaceCollection_enumerateFacesUsingBlock___block_invoke;
  v7[3] = &unk_1E6BD2B80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __46__NTKFaceCollection_enumerateFacesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "facesByUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v8, a4);
}

- (void)enumerateFacesWithIndexesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NTKFaceCollection_enumerateFacesWithIndexesUsingBlock___block_invoke;
  v7[3] = &unk_1E6BD2B80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __57__NTKFaceCollection_enumerateFacesWithIndexesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v7, "facesByUUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 16))(v6, v9, a3, a4);
}

- (void)enumerateFaceNamesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NTKFaceCollection facesByUUID](self, "facesByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__NTKFaceCollection_enumerateFaceNamesUsingBlock___block_invoke;
  v7[3] = &unk_1E6BD2BA8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __50__NTKFaceCollection_enumerateFaceNamesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (unint64_t)selectedFaceIndex
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[NTKFaceCollection selectedUUID](self, "selectedUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceCollection selectedUUID](self, "selectedUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)hasLoaded
{
  return 0;
}

- (void)setSelectedFaceIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4
{
  id v7;
  NSObject *v8;
  NSString *logIdentifier;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = logIdentifier;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "%@ set selected face index %@, observer = %@", (uint8_t *)&v13, 0x20u);

  }
  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  if (-[NSMutableArray count](self->_orderedUUIDs, "count") <= a3)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NTKFaceCollection setSelectedFaceIndex:suppressingCallbackToObserver:].cold.1((id *)&self->_orderedUUIDs);
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_orderedUUIDs, "objectAtIndex:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_facesByUUID, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceCollection setSelectedFace:suppressingCallbackToObserver:](self, "setSelectedFace:suppressingCallbackToObserver:", v12, v7);

  }
}

- (void)setSelectedFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *logIdentifier;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v12 = 138412802;
    v13 = logIdentifier;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "%@ set selected face %@, observer = %@", (uint8_t *)&v12, 0x20u);
  }

  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NTKFaceCollection _setSelectedUUID:notify:suppressingCallbackToObserver:](self, "_setSelectedUUID:notify:suppressingCallbackToObserver:", v11, 1, v8);
    -[NTKFaceCollection _didSelectFaceUUID:suppressingCallback:](self, "_didSelectFaceUUID:suppressingCallback:", v11, 1);
  }

}

- (void)appendFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *logIdentifier;
  int v11;
  NSString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v11 = 138412802;
    v12 = logIdentifier;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "%@ append face %@, observer = %@", (uint8_t *)&v11, 0x20u);
  }

  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  -[NTKFaceCollection addFace:atIndex:suppressingCallbackToObserver:](self, "addFace:atIndex:suppressingCallbackToObserver:", v7, -[NTKFaceCollection numberOfFaces](self, "numberOfFaces"), v8);

}

- (void)addFace:(id)a3 atIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSString *logIdentifier;
  void *v13;
  void *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = logIdentifier;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "%@ add face %@, at index %@, observer = %@", (uint8_t *)&v15, 0x2Au);

  }
  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection _addFace:forUUID:atIndex:suppressingCallbackToObserver:](self, "_addFace:forUUID:atIndex:suppressingCallbackToObserver:", v9, v14, a4, v10);

}

- (void)moveFace:(id)a3 toIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSString *logIdentifier;
  void *v13;
  void *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = logIdentifier;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "%@ move face %@, to index %@, observer = %@", (uint8_t *)&v15, 0x2Au);

  }
  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSMutableArray removeObject:](self->_orderedUUIDs, "removeObject:", v14);
    -[NSMutableArray insertObject:atIndex:](self->_orderedUUIDs, "insertObject:atIndex:", v14, a4);
    -[NTKFaceCollection _didMoveFace:withUUID:toIndex:](self, "_didMoveFace:withUUID:toIndex:", v9, v14, a4);
    -[NTKFaceCollection _notifyReorderedFacesOmittingObserver:](self, "_notifyReorderedFacesOmittingObserver:", v10);
  }

}

- (void)removeFaceAtIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4
{
  id v7;
  NSObject *v8;
  NSString *logIdentifier;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  int v15;
  NSString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = logIdentifier;
    v17 = 2112;
    v18 = (unint64_t)v10;
    v19 = 2112;
    v20 = (uint64_t)v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "%@ remove face at index %@, observer = %@", (uint8_t *)&v15, 0x20u);

  }
  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  -[NTKFaceCollection faceAtIndex:](self, "faceAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NTKFaceCollection removeFace:suppressingCallbackToObserver:](self, "removeFace:suppressingCallbackToObserver:", v11, v7);
  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_logIdentifier;
      v14 = -[NSMutableArray count](self->_orderedUUIDs, "count");
      v15 = 138543874;
      v16 = v13;
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = v14;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove face because there is no face at index %lu. count: %lu", (uint8_t *)&v15, 0x20u);
    }

  }
}

- (void)removeFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *logIdentifier;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v12 = 138412802;
    v13 = logIdentifier;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "%@ remove face %@, observer = %@", (uint8_t *)&v12, 0x20u);
  }

  -[NTKFaceCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NTKFaceCollection _removeFaceForUUID:suppressingCallbackToObserver:](self, "_removeFaceForUUID:suppressingCallbackToObserver:", v11, v8);
    -[NTKFaceCollection _didRemoveFace:withUUID:](self, "_didRemoveFace:withUUID:", v7, v11);
  }

}

- (void)_setContentWithFaces:(id)a3 order:(id)a4 selection:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *facesByUUID;
  NSMutableArray *v13;
  NSMutableArray *orderedUUIDs;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSMapTable *UUIDsByFace;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
  facesByUUID = self->_facesByUUID;
  self->_facesByUUID = v11;

  v13 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
  orderedUUIDs = self->_orderedUUIDs;
  self->_orderedUUIDs = v13;

  objc_storeStrong((id *)&self->_selectedUUID, a5);
  -[NSMapTable removeAllObjects](self->_UUIDsByFace, "removeAllObjects");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        UUIDsByFace = self->_UUIDsByFace;
        objc_msgSend(v15, "objectForKey:", v20, (_QWORD)v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](UUIDsByFace, "setObject:forKey:", v20, v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
  -[NTKFaceCollection _addFace:forUUID:atIndex:suppressingCallbackToObserver:](self, "_addFace:forUUID:atIndex:suppressingCallbackToObserver:", a3, a4, a5, 0);
}

- (void)_removeFaceForUUID:(id)a3
{
  -[NTKFaceCollection _removeFaceForUUID:suppressingCallbackToObserver:](self, "_removeFaceForUUID:suppressingCallbackToObserver:", a3, 0);
}

- (void)_upgradeFace:(id)a3 forUUID:(id)a4
{
  NSMutableDictionary *facesByUUID;
  id v7;
  id v8;
  id v9;

  facesByUUID = self->_facesByUUID;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](facesByUUID, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_UUIDsByFace, "removeObjectForKey:", v9);
  -[NSMutableDictionary setObject:forKey:](self->_facesByUUID, "setObject:forKey:", v8, v7);
  -[NSMapTable setObject:forKey:](self->_UUIDsByFace, "setObject:forKey:", v7, v8);

}

- (void)_removeFaceForUUID:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSUUID *v11;
  NSUUID *selectedUUID;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v15);

  -[NTKFaceCollection selectedUUID](self, "selectedUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v15, "isEqual:", v9);

  if (v10)
  {
    -[NTKFaceCollection _chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:](self, "_chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:", v8);
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    selectedUUID = self->_selectedUUID;
    self->_selectedUUID = v11;

  }
  -[NTKFaceCollection facesByUUID](self, "facesByUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "removeObserver:", self);
  -[NSMutableDictionary removeObjectForKey:](self->_facesByUUID, "removeObjectForKey:", v15);
  -[NSMapTable removeObjectForKey:](self->_UUIDsByFace, "removeObjectForKey:", v14);
  -[NSMutableArray removeObject:](self->_orderedUUIDs, "removeObject:", v15);
  -[NTKFaceCollection _notifyRemovedFace:atIndex:omitObserver:](self, "_notifyRemovedFace:atIndex:omitObserver:", v14, v8, v6);
  if (v10)
    -[NTKFaceCollection _notifySelectedFaceOmittingObserver:](self, "_notifySelectedFaceOmittingObserver:", v6);

}

- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5 suppressingCallbackToObserver:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "addObserver:", self);
  if (v10)
  {
    -[NSMutableArray insertObject:atIndex:](self->_orderedUUIDs, "insertObject:atIndex:", v11, a5);
    -[NSMutableDictionary setObject:forKey:](self->_facesByUUID, "setObject:forKey:", v10, v11);
    -[NSMapTable setObject:forKey:](self->_UUIDsByFace, "setObject:forKey:", v11, v10);
    -[NTKFaceCollection _notifyAddedFace:atIndex:omitObserver:](self, "_notifyAddedFace:atIndex:omitObserver:", v10, a5, v12);
    -[NTKFaceCollection _didAddFace:withUUID:atIndex:](self, "_didAddFace:withUUID:atIndex:", v10, v11, a5);
  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NTKFaceCollection _addFace:forUUID:atIndex:suppressingCallbackToObserver:].cold.1(v11);

  }
}

- (id)_chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[NSMutableArray mutableCopy](self->_orderedUUIDs, "mutableCopy");
  objc_msgSend(v4, "removeObjectAtIndex:", a3);
  if (objc_msgSend(v4, "count") <= a3)
    objc_msgSend(v4, "lastObject");
  else
    objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)replaceFaceLocallyByCopy:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *logIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v13 = 138412802;
    v14 = logIdentifier;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "%@ replace face locally by copy %@, observer = %@", (uint8_t *)&v13, 0x20u);
  }

  -[NSMapTable objectForKey:](self->_UUIDsByFace, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[NSMutableArray indexOfObject:](self->_orderedUUIDs, "indexOfObject:", v10);
    v12 = (void *)objc_msgSend(v6, "copy");
    -[NTKFaceCollection _removeFaceForUUID:suppressingCallbackToObserver:](self, "_removeFaceForUUID:suppressingCallbackToObserver:", v10, v7);
    -[NTKFaceCollection _addFace:forUUID:atIndex:suppressingCallbackToObserver:](self, "_addFace:forUUID:atIndex:suppressingCallbackToObserver:", v12, v10, v11, v7);

  }
}

- (void)removeObserver:(id)a3
{
  NTKFaceCollection *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_notifyAddedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[NTKFaceCollection hasLoaded](self, "hasLoaded"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NTKFaceCollection observers](self, "observers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if (v15 != v9 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "faceCollection:didAddFace:atIndex:", self, v8, a4);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)_notifyRemovedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[NTKFaceCollection hasLoaded](self, "hasLoaded"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NTKFaceCollection observers](self, "observers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if (v15 != v9 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "faceCollection:didRemoveFace:atIndex:", self, v8, a4);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)_notifySelectedFaceOmittingObserver:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NTKFaceCollection hasLoaded](self, "hasLoaded"))
  {
    -[NTKFaceCollection selectedFace](self, "selectedFace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKFaceCollection selectedFaceIndex](self, "selectedFaceIndex");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NTKFaceCollection observers](self, "observers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if (v13 != v4 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "faceCollection:didSelectFace:atIndex:", self, v5, v6);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)_notifyReorderedFacesOmittingObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NTKFaceCollection hasLoaded](self, "hasLoaded"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NTKFaceCollection observers](self, "observers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if (v11 != v4 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "faceCollectionDidReorderFaces:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (id)UUIDsByFace
{
  return self->_UUIDsByFace;
}

- (void)_throwIfNotLoaded:(SEL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!-[NTKFaceCollection hasLoaded](self, "hasLoaded"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    -[NTKFaceCollection collectionIdentifier](self, "collectionIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Attempt to modify face collection (%@) before it has loaded (sel = %@)"), v8, v7);

  }
}

- (void)setDebugName:(id)a3
{
  objc_storeStrong((id *)&self->_debugName, a3);
  -[NTKFaceCollection _updateLogIdentifier](self, "_updateLogIdentifier");
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_UUIDsByFace, 0);
  objc_storeStrong((id *)&self->_facesByUUID, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_selectedUUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setSelectedFaceIndex:(id *)a1 suppressingCallbackToObserver:.cold.1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v1, v2, "Attempting to select face at index %lu is out of bounds [0...%lu).", v3, v4, v5, v6, 0);
}

- (void)_addFace:(void *)a1 forUUID:atIndex:suppressingCallbackToObserver:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "Attempted to add a nil NTKFace with uuid %@ at index %lu", v4, v5, v6, v7, 2u);

}

@end
