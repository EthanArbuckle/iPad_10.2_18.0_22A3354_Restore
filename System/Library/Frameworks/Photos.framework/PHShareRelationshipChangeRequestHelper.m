@implementation PHShareRelationshipChangeRequestHelper

- (void)_prepareParticipantsWithFetchResult:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v6, "fetchedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self, "setOriginalObjectIDs:", v5);

  }
}

- (void)_prepareParticipantsHelperIfNeeded
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalShare);

  if (WeakRetained)
  {
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)&self->_originalShare);
    +[PHQuery queryForShareParticipantsInShare:options:](PHQuery, "queryForShareParticipantsInShare:options:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "executeQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHShareRelationshipChangeRequestHelper _prepareParticipantsWithFetchResult:](self, "_prepareParticipantsWithFetchResult:", v9);

  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_originalAsset);

    if (!v10)
      goto LABEL_7;
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)&self->_originalAsset);
    +[PHShareParticipant fetchContributorsForAsset:options:](PHShareParticipant, "fetchContributorsForAsset:options:", v12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHShareRelationshipChangeRequestHelper _prepareParticipantsWithFetchResult:](self, "_prepareParticipantsWithFetchResult:", v8);
  }

LABEL_7:
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
LABEL_9:
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](self, "setMutableObjectIDsAndUUIDs:", v15);

  }
}

- (id)_mutableParticipantsObjectIDsAndUUIDs
{
  -[PHShareRelationshipChangeRequestHelper _prepareParticipantsHelperIfNeeded](self, "_prepareParticipantsHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
}

- (void)addParticipants:(id)a3 toChangeRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        PLObjectIDOrUUIDFromPHObject(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14, (_QWORD)v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v7, "didMutate");
    -[PHShareRelationshipChangeRequestHelper _mutableParticipantsObjectIDsAndUUIDs](self, "_mutableParticipantsObjectIDsAndUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v8);

  }
}

- (void)removeParticipants:(id)a3 toChangeRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        PLObjectIDOrUUIDFromPHObject(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14, (_QWORD)v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v7, "didMutate");
    -[PHShareRelationshipChangeRequestHelper _mutableParticipantsObjectIDsAndUUIDs](self, "_mutableParticipantsObjectIDsAndUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectsInArray:", v8);

  }
}

- (void)setParticipants:(id)a3 toChangeRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHShareRelationshipChangeRequestHelper _mutableParticipantsObjectIDsAndUUIDs](self, "_mutableParticipantsObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PLObjectIDOrUUIDFromPHObject(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15, (_QWORD)v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "didMutate");
    -[PHShareRelationshipChangeRequestHelper _mutableParticipantsObjectIDsAndUUIDs](self, "_mutableParticipantsObjectIDsAndUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v9);

  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PHRelationshipChangeRequestHelper setAllowsInsert:](self, "setAllowsInsert:", 1);
    -[PHRelationshipChangeRequestHelper setAllowsMove:](self, "setAllowsMove:", 0);
    -[PHRelationshipChangeRequestHelper setAllowsRemove:](self, "setAllowsRemove:", 1);
    -[PHRelationshipChangeRequestHelper setDestinationEntityName:](self, "setDestinationEntityName:", CFSTR("ShareParticipant"));
    -[PHRelationshipChangeRequestHelper relationshipName](self, "relationshipName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mutableSetValueForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PHRelationshipChangeRequestHelper applyMutationsToManagedObject:unorderedMutableChildren:error:](self, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v6, v9, a4);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (PHShare)originalShare
{
  return (PHShare *)objc_loadWeakRetained((id *)&self->_originalShare);
}

- (void)setOriginalShare:(id)a3
{
  objc_storeWeak((id *)&self->_originalShare, a3);
}

- (PHObject)originalAsset
{
  return (PHObject *)objc_loadWeakRetained((id *)&self->_originalAsset);
}

- (void)setOriginalAsset:(id)a3
{
  objc_storeWeak((id *)&self->_originalAsset, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalAsset);
  objc_destroyWeak((id *)&self->_originalShare);
}

@end
