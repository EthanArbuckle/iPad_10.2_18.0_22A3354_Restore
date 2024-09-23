@implementation PHPerformChangesRequest

- (PHPerformChangesRequest)init
{
  PHPerformChangesRequest *v2;
  PHPerformChangesRequest *v3;
  PHPerformChangesRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHPerformChangesRequest;
  v2 = -[PHPerformChangesRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_libraryRole = 0;
    v4 = v2;
  }

  return v3;
}

- (PHPerformChangesRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PHPerformChangesRequest *v11;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PLHelperExtension.h"), 76, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  v11 = -[PHPerformChangesRequest initWithXPCCoder:](self, "initWithXPCCoder:", v8);
  return v11;
}

- (PHPerformChangesRequest)initWithXPCCoder:(id)a3
{
  id v4;
  void *v5;
  PHPerformChangesRequest *v6;
  PHPerformChangesRequest *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *otherChanges;
  PHPerformChangesRequest *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", objc_msgSend((id)objc_opt_class(), "type"), CFSTR("_xpcObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLXPCObject initWithXPCObject:](self, "initWithXPCObject:", v5);
  v7 = v6;
  if (v6)
  {
    v6->_inService = 1;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "otherChanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    otherChanges = v7->_otherChanges;
    v7->_otherChanges = (NSArray *)v12;

    v7->_libraryRole = 0;
    v14 = v7;
  }

  return v7;
}

- (BOOL)hasChangeRequests
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSMutableOrderedSet count](self->_inserts, "count");
  v4 = -[NSMutableOrderedSet count](self->_updates, "count") + v3;
  v5 = v4 + -[NSMutableOrderedSet count](self->_deletes, "count");
  return v5 + -[NSMutableOrderedSet count](self->_otherChangeRequests, "count") != 0;
}

- (BOOL)hasObjectChangeRequests
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableOrderedSet count](self->_inserts, "count");
  v4 = -[NSMutableOrderedSet count](self->_updates, "count") + v3;
  return v4 + -[NSMutableOrderedSet count](self->_deletes, "count") != 0;
}

- (NSArray)requestSets
{
  id v3;
  void *v4;

  if (self->_inserts || self->_updates || self->_deletes || self->_otherChangeRequests)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    if (self->_inserts)
      objc_msgSend(v3, "addObject:");
    if (self->_updates)
      objc_msgSend(v4, "addObject:");
    if (self->_deletes)
      objc_msgSend(v4, "addObject:");
    if (self->_otherChangeRequests)
      objc_msgSend(v4, "addObject:");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (void)recordInsertRequest:(id)a3
{
  id v4;
  NSMutableOrderedSet *inserts;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  inserts = self->_inserts;
  v8 = v4;
  if (!inserts)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_inserts;
    self->_inserts = v6;

    v4 = v8;
    inserts = self->_inserts;
  }
  -[NSMutableOrderedSet addObject:](inserts, "addObject:", v4);
  -[NSMutableOrderedSet removeObject:](self->_updates, "removeObject:", v8);
  -[PHPerformChangesRequest recordFailedOnDemandRequest:](self, "recordFailedOnDemandRequest:", v8);

}

- (void)recordUpdateRequest:(id)a3
{
  id v4;
  NSMutableOrderedSet *inserts;
  char v6;
  void *v7;
  NSMutableOrderedSet *updates;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *v10;
  id v11;

  v4 = a3;
  inserts = self->_inserts;
  v11 = v4;
  if (!inserts
    || (v6 = -[NSMutableOrderedSet containsObject:](inserts, "containsObject:", v4), v7 = v11, (v6 & 1) == 0))
  {
    updates = self->_updates;
    if (!updates)
    {
      v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v10 = self->_updates;
      self->_updates = v9;

      updates = self->_updates;
    }
    -[NSMutableOrderedSet addObject:](updates, "addObject:", v11);
    -[PHPerformChangesRequest recordFailedOnDemandRequest:](self, "recordFailedOnDemandRequest:", v11);
    v7 = v11;
  }

}

- (void)recordDeleteRequest:(id)a3
{
  id v4;
  NSMutableOrderedSet *deletes;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  deletes = self->_deletes;
  v8 = v4;
  if (!deletes)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_deletes;
    self->_deletes = v6;

    v4 = v8;
    deletes = self->_deletes;
  }
  -[NSMutableOrderedSet addObject:](deletes, "addObject:", v4);
  -[NSMutableOrderedSet removeObject:](self->_inserts, "removeObject:", v8);
  -[NSMutableOrderedSet removeObject:](self->_updates, "removeObject:", v8);
  -[PHPerformChangesRequest recordFailedOnDemandRequest:](self, "recordFailedOnDemandRequest:", v8);

}

- (void)recordOtherChangeRequest:(id)a3
{
  id v4;
  NSMutableOrderedSet *otherChangeRequests;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  otherChangeRequests = self->_otherChangeRequests;
  v8 = v4;
  if (!otherChangeRequests)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_otherChangeRequests;
    self->_otherChangeRequests = v6;

    v4 = v8;
    otherChangeRequests = self->_otherChangeRequests;
  }
  -[NSMutableOrderedSet addObject:](otherChangeRequests, "addObject:", v4);
  -[PHPerformChangesRequest recordFailedOnDemandRequest:](self, "recordFailedOnDemandRequest:", v8);

}

- (id)changeRequestForUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_changeRequestsByUUID, "objectForKey:", a3);
}

- (void)setChangeRequest:(id)a3 forUUID:(id)a4
{
  id v6;
  NSMutableDictionary *changeRequestsByUUID;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  changeRequestsByUUID = self->_changeRequestsByUUID;
  if (!changeRequestsByUUID)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_changeRequestsByUUID;
    self->_changeRequestsByUUID = v8;

    changeRequestsByUUID = self->_changeRequestsByUUID;
  }
  -[NSMutableDictionary setObject:forKey:](changeRequestsByUUID, "setObject:forKey:", v10, v6);

}

- (void)recordFailedOnDemandRequest:(id)a3
{
  NSMutableOrderedSet *failedOnDemandRequests;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    failedOnDemandRequests = self->_failedOnDemandRequests;
    if (!failedOnDemandRequests)
    {
      v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v6 = self->_failedOnDemandRequests;
      self->_failedOnDemandRequests = v5;

      failedOnDemandRequests = self->_failedOnDemandRequests;
    }
    -[NSMutableOrderedSet addObject:](failedOnDemandRequests, "addObject:", v7);
  }

}

- (void)notifyChangesTransactionFailedWithLazyPhotoLibrary:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *failedOnDemandRequests;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  failedOnDemandRequests = self->_failedOnDemandRequests;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PHPerformChangesRequest_notifyChangesTransactionFailedWithLazyPhotoLibrary_error___block_invoke;
  v11[3] = &unk_1E35D6D08;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](failedOnDemandRequests, "enumerateObjectsUsingBlock:", v11);

}

- (id)_allChangeRequests
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PHPerformChangesRequest requestSets](self, "requestSets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)didSendChangesToServiceWithResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[PHPerformChangesRequest _allChangeRequests](self, "_allChangeRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "didSendChangeToServiceHandlerWithResult:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  void *v3;
  id v4;
  void (**v5)(void *, NSMutableOrderedSet *, const __CFString *);
  id v6;
  _QWORD aBlock[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PHPerformChangesRequest_description__block_invoke;
  aBlock[3] = &unk_1E35D6D30;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(void *, NSMutableOrderedSet *, const __CFString *))_Block_copy(aBlock);
  v5[2](v5, self->_deletes, CFSTR("deletes"));
  v5[2](v5, self->_inserts, CFSTR("inserts"));
  v5[2](v5, self->_updates, CFSTR("updates"));
  v5[2](v5, self->_otherChangeRequests, CFSTR("other"));
  v6 = v4;

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableOrderedSet *inserts;
  NSObject *v12;
  NSMutableOrderedSet *updates;
  NSObject *v14;
  NSMutableOrderedSet *deletes;
  NSObject *v16;
  NSMutableOrderedSet *otherChangeRequests;
  NSObject *v18;
  const char *v19;
  void *instrumentation;
  id v21;
  void *v22;
  NSMutableOrderedSet *v23;
  id v24;
  void *v25;
  NSMutableOrderedSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableOrderedSet *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint8_t buf[4];
  NSMutableOrderedSet *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v43 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."));
  v5 = -[NSMutableOrderedSet count](self->_inserts, "count");
  v6 = -[NSMutableOrderedSet count](self->_updates, "count");
  v7 = -[NSMutableOrderedSet count](self->_deletes, "count");
  v8 = -[NSMutableOrderedSet count](self->_otherChangeRequests, "count");
  PLPhotoKitGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "##### PHPerformChangesRequest encodeToXPCObject:", buf, 2u);
  }

  if (v5)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      inserts = self->_inserts;
      *(_DWORD *)buf = 138412290;
      v53 = inserts;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "##### inserts: %@", buf, 0xCu);
    }

  }
  if (v6)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      updates = self->_updates;
      *(_DWORD *)buf = 138412290;
      v53 = updates;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "##### updates: %@", buf, 0xCu);
    }

  }
  if (v7)
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      deletes = self->_deletes;
      *(_DWORD *)buf = 138412290;
      v53 = deletes;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "##### deletes: %@", buf, 0xCu);
    }

  }
  if (v8)
  {
    PLPhotoKitGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      otherChangeRequests = self->_otherChangeRequests;
      *(_DWORD *)buf = 138412290;
      v53 = otherChangeRequests;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "##### otherChanges: %@", buf, 0xCu);
    }

  }
  if (v6 | v5 | v7 | v8)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    addObjectChangeRequests(self->_inserts, v18, "inserts");
    addObjectChangeRequests(self->_updates, v18, "updates");
    addObjectChangeRequests(self->_deletes, v18, "deletes");
    instrumentation = self->_instrumentation;
    if (instrumentation)
      instrumentation = objc_getProperty(instrumentation, v19, 40, 1);
    v21 = instrumentation;
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetString();

    objc_msgSend(v43, "encodeXPCObject:forKey:", v18, CFSTR("_xpcObject"));
    v23 = self->_otherChangeRequests;
    v24 = v43;
    if (-[NSMutableOrderedSet count](v23, "count"))
    {
      v41 = v24;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v42 = v23;
      v26 = v23;
      v27 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
      if (!v27)
        goto LABEL_43;
      v28 = v27;
      v29 = *(_QWORD *)v45;
      while (1)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v31, "changesForServiceHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v32, "hasChanges"))
          {
            PLPhotoKitGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
            if (v32)
            {
              if (v35)
              {
                *(_DWORD *)v48 = 138412546;
                v49 = v32;
                v50 = 2112;
                v51 = v31;
                v36 = v34;
                v37 = "No changes in %@ requested for change request %@";
                v38 = 22;
                goto LABEL_39;
              }
            }
            else if (v35)
            {
              *(_DWORD *)v48 = 138412290;
              v49 = v31;
              v36 = v34;
              v37 = "Missing expected changes for service handler for change request %@";
              v38 = 12;
LABEL_39:
              _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, v37, v48, v38);
            }

            goto LABEL_41;
          }
          PLPhotoKitGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v48 = 138412546;
            v49 = v32;
            v50 = 2112;
            v51 = v31;
            _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEBUG, "Adding changes %@ for change request %@", v48, 0x16u);
          }

          objc_msgSend(v25, "addObject:", v32);
LABEL_41:

        }
        v28 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
        if (!v28)
        {
LABEL_43:

          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v25);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "otherChanges");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v41;
          objc_msgSend(v41, "encodeObject:forKey:", v39, v40);

          v23 = v42;
          break;
        }
      }
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "empty PHPerformChangesRequest", buf, 2u);
    }
  }

}

- (int64_t)accessScopeOptionsRequiredForRequestedChanges
{
  void (**v3)(void *, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  _QWORD aBlock[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  PHPerformChangesRequest *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHPerformChangesRequest_accessScopeOptionsRequiredForRequestedChanges__block_invoke;
  aBlock[3] = &unk_1E35D6D58;
  aBlock[4] = &v12;
  v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PHPerformChangesRequest inserts](self, "inserts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4);

  -[PHPerformChangesRequest updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  -[PHPerformChangesRequest deletes](self, "deletes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6);

  if (self->_inService)
  {
    v3[2](v3, self->_otherChangeHandlers);
  }
  else
  {
    -[PHPerformChangesRequest otherChangeRequests](self, "otherChangeRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v7);

  }
  v8 = v13[3];
  if (!v8)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "No photos access scope requirements declared for changes %{public}@", buf, 0xCu);
    }

    v8 = 7;
    v13[3] = 7;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (int64_t)accessLevel
{
  if (-[PHPerformChangesRequest accessScopeOptionsRequiredForRequestedChanges](self, "accessScopeOptionsRequiredForRequestedChanges") == 1)return 1;
  else
    return 2;
}

- (int64_t)determineAuthorizationStatusForChanges
{
  int64_t v2;
  void *v3;
  unint64_t v4;

  v2 = -[PHPerformChangesRequest accessScopeOptionsRequiredForRequestedChanges](self, "accessScopeOptionsRequiredForRequestedChanges");
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkPhotosAccessAllowedWithScope:", v2);

  if (v4 > 4)
    return 0;
  else
    return qword_19944A9F0[v4];
}

- (id)persistentStoreCoordinator
{
  return (id)-[PLPerformChangesRequestService persistentStoreCoordinator](self->_service, "persistentStoreCoordinator");
}

- (id)libraryServicesManager
{
  return (id)-[PLPerformChangesRequestService libraryServicesManager](self->_service, "libraryServicesManager");
}

- (id)clientDescription
{
  return (id)-[PLPerformChangesRequestService clientDescription](self->_service, "clientDescription");
}

- (id)clientBundleID
{
  return (id)-[PLPerformChangesRequestService clientBundleID](self->_service, "clientBundleID");
}

- (id)clientDisplayName
{
  return (id)-[PLPerformChangesRequestService clientDisplayName](self->_service, "clientDisplayName");
}

- (id)serviceHandlerForChanges:(id)a3 clientAuthorization:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D719B0]), "initWithPhotoLibraryAttributesChanges:clientAuthorization:", v5, v6);
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2114;
      v13 = objc_opt_class();
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_FAULT, "Failed to resolve service handler for changes %@, unknown class %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)decodeWithService:(id)a3 clientAuthorization:(id)a4
{
  PLPerformChangesRequestService *v6;
  id v7;
  PHPerformChangesInstrumentation *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  PHPerformChangesInstrumentation *v14;
  NSObject *v15;
  char *v16;
  int v17;
  NSArray *otherChanges;
  PHPerformChangesRequest *v19;
  NSArray *v20;
  id v21;
  NSObject *v22;
  NSMutableOrderedSet *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSMutableOrderedSet *otherChangeHandlers;
  NSArray *v33;
  void *v34;
  id v35;
  PHPerformChangesRequest *v36;
  PLPerformChangesRequestService *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  NSArray *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = (PLPerformChangesRequestService *)a3;
  v7 = a4;
  PLPhotoKitGetLog();
  v8 = (PHPerformChangesInstrumentation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, &v8->super, OS_LOG_TYPE_DEBUG, "PLPhotoKitChangeRequest queued", buf, 2u);
  }

  -[PLXPCObject object](self, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self->_service = v6;
    PLStringFromXPCDictionary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = [PHPerformChangesInstrumentation alloc];
      if (v8)
      {
        v11 = (objc_class *)MEMORY[0x1E0CB3A28];
        v12 = v10;
        v13 = (void *)objc_msgSend([v11 alloc], "initWithUUIDString:", v12);

        v8 = -[PHPerformChangesInstrumentation initWithUUID:](v8, v13);
        v14 = v8;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    objc_storeStrong((id *)&self->_instrumentation, v14);
    if (v10)

    if (createObjectChangeRequestsFromXPCObject(self, v9, "deletes", v7))
    {
      PLPhotosStatusGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "trustedCallerBundleID");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v7, "clientProcessIdentifier");
        *(_DWORD *)buf = 138412546;
        v48 = v16;
        v49 = 1024;
        LODWORD(v50) = v17;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Deletion from PhotoKit triggered by %@ (%d)", buf, 0x12u);

      }
    }
    v38 = v10;
    createObjectChangeRequestsFromXPCObject(self, v9, "inserts", v7);
    createObjectChangeRequestsFromXPCObject(self, v9, "updates", v7);
    otherChanges = self->_otherChanges;
    v19 = self;
    v20 = otherChanges;
    v21 = v7;
    if (v20)
    {
      v34 = v9;
      v35 = v7;
      v36 = self;
      v37 = v6;
      PLPhotoKitGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "otherChanges";
        v49 = 2112;
        v50 = v20;
        _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEBUG, "##### %s: %@", buf, 0x16u);
      }

      v23 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v33 = v20;
      v24 = v20;
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            -[PHPerformChangesRequest serviceHandlerForChanges:clientAuthorization:](v19, "serviceHandlerForChanges:clientAuthorization:", v29, v21);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              -[NSMutableOrderedSet addObject:](v23, "addObject:", v30);
            }
            else
            {
              PLPhotoKitGetLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v43 = 136315394;
                v44 = "otherChanges";
                v45 = 2112;
                v46 = v29;
                _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "Failed to create change service handler from '%s' changes %@", v43, 0x16u);
              }

            }
          }
          v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
        }
        while (v26);
      }

      self = v36;
      v6 = v37;
      v9 = v34;
      v7 = v35;
      v20 = v33;
    }
    else
    {
      v23 = 0;
    }

    otherChangeHandlers = v19->_otherChangeHandlers;
    v19->_otherChangeHandlers = v23;

    self->_service = 0;
  }

}

- (BOOL)_isSupportedLimitedLibraryChangeRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[PHAsset managedEntityName](PHAsset, "managedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    +[PHAlbum managedEntityName](PHAlbum, "managedEntityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedEntityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v7;
}

- (void)discardUnsupportedLimitedLibraryChangeRequests
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD aBlock[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5129;
  v18 = __Block_byref_object_dispose__5130;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke;
  aBlock[3] = &unk_1E35D6D80;
  aBlock[4] = self;
  aBlock[5] = &v10;
  aBlock[6] = &v14;
  v3 = _Block_copy(aBlock);
  -[NSMutableOrderedSet pl_removeObjectsPassingTest:](self->_inserts, "pl_removeObjectsPassingTest:", v3);
  -[NSMutableOrderedSet pl_removeObjectsPassingTest:](self->_updates, "pl_removeObjectsPassingTest:", v3);
  -[NSMutableOrderedSet pl_removeObjectsPassingTest:](self->_deletes, "pl_removeObjectsPassingTest:", v3);
  -[NSMutableOrderedSet pl_removeObjectsPassingTest:](self->_otherChangeHandlers, "pl_removeObjectsPassingTest:", &__block_literal_global_5160);
  if (*((_BYTE *)v11 + 24))
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Removed unsupported change requests in limited library mode:", buf, 2u);
    }

    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)v15[5];
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "BEFORE: %{public}@", buf, 0xCu);
    }

    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PHPerformChangesRequest description](self, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "AFTER: %{public}@", buf, 0xCu);

    }
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

- (void)executeWithService:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  PHPerformChangesInstrumentation *instrumentation;
  PHPerformChangesRequest *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpostId;
  NSUUID *uuid;
  void *v16;
  void *v17;
  NSObject *v18;
  NSUUID *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  NSUUID *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  PHPerformChangesRequest *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  instrumentation = self->_instrumentation;
  v9 = self;
  v10 = v6;
  if (instrumentation)
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    instrumentation->_signpostId = os_signpost_id_generate(v11);
    v12 = v11;
    v13 = v12;
    signpostId = instrumentation->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uuid = instrumentation->_uuid;
      objc_msgSend(v10, "clientDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = uuid;
      v37 = 2114;
      v38 = v16;
      v39 = 2114;
      v40 = v17;
      v41 = 2114;
      v42 = v9;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "PhotoKit request [service]", "PhotoKit changes: [%{public}@] Request received from client: %{public}@ at %{public}@, %{public}@", buf, 0x2Au);

    }
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = instrumentation->_uuid;
      objc_msgSend(v10, "clientDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v19;
      v37 = 2114;
      v38 = v20;
      v39 = 2114;
      v40 = v21;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request received from client: %{public}@ at %{public}@, %{public}@", buf, 0x2Au);

    }
  }

  -[PHPerformChangesRequest setLibraryRole:](v9, "setLibraryRole:", objc_msgSend(v10, "libraryRole"));
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "clientBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientDisplayName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("PhotoKit changes: %@ (%@)"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x1E0D715B0]);
  objc_msgSend(v10, "libraryServicesManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_retainAutorelease(v25);
  v29 = objc_msgSend(v28, "UTF8String");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__PHPerformChangesRequest_executeWithService_reply___block_invoke;
  v32[3] = &unk_1E35D9878;
  v32[4] = v9;
  v33 = v10;
  v34 = v7;
  v30 = v7;
  v31 = v10;
  -[PHPerformChangesRequest executeWithLibraryServicesManager:libraryName:executionContext:reply:](v9, "executeWithLibraryServicesManager:libraryName:executionContext:reply:", v27, v29, v26, v32);

}

- (void)executeWithLibraryServicesManager:(id)a3 libraryName:(const char *)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  PHChangeValidationController *v16;
  void *v17;
  void *v18;
  void *v19;
  PHChangeValidationController *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PHPerformChangesInstrumentation *instrumentation;
  double v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, _QWORD, void *);
  _BYTE *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _BYTE *v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(v10, "databaseContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newShortLivedLibraryWithName:libraryRole:", a4, -[PHPerformChangesRequest libraryRole](self, "libraryRole"));

  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHPerformChangesRequest hasObjectChangeRequests](self, "hasObjectChangeRequests"))
  {
    v16 = [PHChangeValidationController alloc];
    -[PHPerformChangesRequest inserts](self, "inserts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPerformChangesRequest updates](self, "updates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPerformChangesRequest deletes](self, "deletes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PHChangeValidationController initWithInsertRequests:updateRequests:deleteRequests:context:photoLibrary:](v16, "initWithInsertRequests:updateRequests:deleteRequests:context:photoLibrary:", v17, v18, v19, v15, v14);

    -[PHChangeValidationController validate](v20, "validate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isFailure"))
    {
      PLPhotoKitGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "PhotoKit validation failed for %@ %@", buf, 0x16u);

      }
      objc_msgSend(v21, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v24);

      goto LABEL_10;
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__5129;
  v42 = __Block_byref_object_dispose__5130;
  v25 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "successWithResult:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v27;
  instrumentation = self->_instrumentation;
  if (instrumentation)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    instrumentation->_serviceWillExecuteTimestamp = v29;
  }
  v30 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke;
  v35[3] = &unk_1E35DF9A0;
  v35[4] = self;
  v36 = v15;
  v37 = v14;
  v39 = buf;
  v38 = v10;
  v31[0] = v30;
  v31[1] = 3221225472;
  v31[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2_94;
  v31[3] = &unk_1E35D9F30;
  v34 = buf;
  v31[4] = self;
  v32 = v37;
  v33 = v12;
  objc_msgSend(v11, "performTransactionOnLibrary:transaction:completionHandler:", v32, v35, v31);

  _Block_object_dispose(buf, 8);
LABEL_10:

}

- (id)_failureWithError:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "PHPerformChangesRequest failed to execute with error: %@", (uint8_t *)&v7, 0xCu);
  }

  +[PHChangeRequest sanitizedFailureWithError:](PHChangeRequest, "sanitizedFailureWithError:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)errorWithLocalizedDescription:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("%@"), a3);
}

- (PHPerformChangesInstrumentation)instrumentation
{
  return self->_instrumentation;
}

- (void)setInstrumentation:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentation, a3);
}

- (NSOrderedSet)inserts
{
  return &self->_inserts->super;
}

- (NSOrderedSet)updates
{
  return &self->_updates->super;
}

- (NSOrderedSet)deletes
{
  return &self->_deletes->super;
}

- (NSOrderedSet)otherChangeRequests
{
  return &self->_otherChangeRequests->super;
}

- (unint64_t)libraryRole
{
  return self->_libraryRole;
}

- (void)setLibraryRole:(unint64_t)a3
{
  self->_libraryRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestsByUUID, 0);
  objc_storeStrong((id *)&self->_failedOnDemandRequests, 0);
  objc_storeStrong((id *)&self->_otherChangeHandlers, 0);
  objc_storeStrong((id *)&self->_otherChanges, 0);
  objc_storeStrong((id *)&self->_otherChangeRequests, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_instrumentation, 0);
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  int v38;
  id v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  char v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  _QWORD v78[4];
  id v79;
  id v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t *v98;
  _QWORD block[4];
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  _QWORD v112[4];
  id v113;
  id v114;
  _QWORD v115[5];
  id v116;
  uint8_t buf[4];
  id v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(v2 + 32) = v3;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x3032000000;
  v115[3] = __Block_byref_object_copy__5129;
  v115[4] = __Block_byref_object_dispose__5130;
  v116 = 0;
  objc_msgSend(*(id *)(a1 + 32), "deletes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2;
  v112[3] = &unk_1E35D6DE8;
  v113 = *(id *)(a1 + 40);
  v114 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v112);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E10]);
  objc_msgSend(*(id *)(a1 + 32), "inserts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  objc_msgSend(*(id *)(a1 + 32), "inserts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3;
  v105[3] = &unk_1E35D6E10;
  v106 = *(id *)(a1 + 48);
  v110 = v115;
  v10 = v5;
  v107 = v10;
  v11 = v8;
  v111 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 32);
  v108 = v11;
  v109 = v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v105);

  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isSuccess"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v13 = objc_msgSend(v11, "count");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4;
      block[3] = &unk_1E35D8CD0;
      v100 = v11;
      dispatch_apply(v13, 0, block);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inserts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_5;
    v89[3] = &unk_1E35D6E38;
    v90 = v10;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 64);
    v96 = v115;
    v97 = v17;
    v18 = *(_QWORD *)(a1 + 32);
    v91 = v16;
    v92 = v18;
    v19 = v14;
    v93 = v19;
    v94 = v66;
    v95 = v65;
    v98 = &v101;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v89);

    if (objc_msgSend(v19, "count"))
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v119, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v86 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(MEMORY[0x1E0D715B8], "assetsWithAvalancheUUID:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i), *(_QWORD *)(a1 + 40));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (id)objc_msgSend(MEMORY[0x1E0D715B8], "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v24, *(_QWORD *)(a1 + 48), 0, 1);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v119, 16);
        }
        while (v21);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "inserts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_6;
  v84[3] = &unk_1E35D6E60;
  v84[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v84);

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "updates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_7;
    v78[3] = &unk_1E35D6E88;
    v79 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 48);
    v29 = *(_QWORD *)(a1 + 64);
    v82 = v115;
    v83 = v29;
    v30 = *(_QWORD *)(a1 + 32);
    v80 = v28;
    v81 = v30;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v78);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isSuccess"))
  {
    v31 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_8;
    v73[3] = &unk_1E35D6EB0;
    v32 = *(id *)(a1 + 48);
    v33 = *(_QWORD *)(a1 + 64);
    v76 = v115;
    v77 = v33;
    v34 = *(_QWORD *)(a1 + 32);
    v74 = v32;
    v75 = v34;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v73);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v66, "count"))
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v66, &unk_1E3654F40);
    if (objc_msgSend(v65, "count"))
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v65, &unk_1E3654F58);
    if (!*((_BYTE *)v102 + 24))
      goto LABEL_34;
    objc_msgSend(*(id *)(a1 + 56), "pairingManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v37 = *(_QWORD *)(a1 + 40);
    v71 = 0;
    v38 = objc_msgSend(v36, "processPairingForGroupIDs:inContext:deferredProcessingNeeded:error:", v35, v37, &v72, &v71);
    v39 = v71;
    if (v38)
    {
      if (!v72)
      {
LABEL_33:

LABEL_34:
        PLBackendGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = os_signpost_id_make_with_pointer(v42, *(const void **)(a1 + 32));
        v44 = v42;
        v45 = v44;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "Ingest-Save", "START: save", buf, 2u);
        }

        v46 = *(void **)(a1 + 40);
        v70 = 0;
        v47 = objc_msgSend(v46, "save:", &v70);
        v48 = v70;
        v49 = v45;
        v50 = v49;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v50, OS_SIGNPOST_INTERVAL_END, v43, "Ingest-Save", "END: save", buf, 2u);
        }

        if ((v47 & 1) == 0)
        {
          PLPhotoKitGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v48;
            _os_log_impl(&dword_1991EC000, v51, OS_LOG_TYPE_ERROR, "PhotoKit save failed with error: %@", buf, 0xCu);
          }

          v52 = *(void **)(a1 + 32);
          v53 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v48, "localizedDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "ph_genericErrorWithLocalizedDescription:", CFSTR("Save failed with error %@"), v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "_failureWithError:", v55);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v58 = *(void **)(v57 + 40);
          *(_QWORD *)(v57 + 40) = v56;

        }
        goto LABEL_45;
      }
      objc_msgSend(*(id *)(a1 + 48), "libraryServicesManager");
      v40 = objc_claimAutoreleasedReturnValue();
      -[NSObject backgroundJobService](v40, "backgroundJobService");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "signalBackgroundProcessingNeededOnLibrary:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      PLPhotoKitGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v118 = v39;
        _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_ERROR, "Error while attempting to pair CTM assets in the library: %@", buf, 0xCu);
      }
    }

    goto LABEL_33;
  }
LABEL_45:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isFailure"))
  {
    objc_msgSend(*(id *)(a1 + 40), "rollback");
    v59 = *(void **)(a1 + 32);
    v60 = objc_initWeak((id *)buf, v59);

    v61 = objc_alloc(MEMORY[0x1E0D73248]);
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_91;
    v67[3] = &unk_1E35D94C8;
    objc_copyWeak(&v69, (id *)buf);
    v68 = *(id *)(a1 + 48);
    v62 = (void *)objc_msgSend(v61, "initWithBlock:", v67);

    objc_destroyWeak(&v69);
    objc_destroyWeak((id *)buf);
    v63 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "error");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "notifyChangesTransactionFailedWithLazyPhotoLibrary:error:", v62, v64);

  }
  _Block_object_dispose(&v101, 8);

  _Block_object_dispose(v115, 8);
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2_94(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "inserts");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3_95;
    v10[3] = &unk_1E35D6ED8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v10);

    objc_msgSend(*(id *)(a1 + 32), "updates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4_96;
    v8[3] = &unk_1E35D6F00;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isSuccess");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

uint64_t __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3_95(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performTransactionCompletionHandlingInPhotoLibrary:", *(_QWORD *)(a1 + 32));
}

uint64_t __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4_96(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performTransactionCompletionHandlingInPhotoLibrary:", *(_QWORD *)(a1 + 32));
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingObjectWithID:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "deleteManagedObject:photoLibrary:", v6, *(_QWORD *)(a1 + 40));

}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "createManagedObjectForInsertIntoPhotoLibrary:error:", v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v6);
    if (objc_msgSend(v6, "shouldPerformConcurrentWork"))
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performConcurrentWork");

}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id obj;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v6, "applyMutationsToManagedObject:photoLibrary:error:", v7, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    objc_msgSend(v14, "avalancheUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(void **)(a1 + 56);
      objc_msgSend(v14, "avalancheUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
    objc_msgSend(v14, "mediaGroupUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = *(void **)(a1 + 64);
      objc_msgSend(v14, "mediaGroupUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

    }
    objc_msgSend(v14, "additionalAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "spatialOverCaptureGroupIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = *(void **)(a1 + 72);
      objc_msgSend(v14, "additionalAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "spatialOverCaptureGroupIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v25);

    }
    v26 = objc_msgSend(v14, "importedBy") == 5
       || objc_msgSend(v14, "importedBy") == 4
       || objc_msgSend(v14, "importedBy") == 1
       || objc_msgSend(v14, "importedBy") == 2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v26;

  }
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "finalizeRequestWithBatchSuccess:", objc_msgSend(v2, "isSuccess"));

}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingObjectWithID:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    v12 = objc_msgSend(v6, "applyMutationsToManagedObject:photoLibrary:error:", v9, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    if ((v12 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }

}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(a2, "applyChangesWithLibrary:error:", v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

id __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = *(id *)(a1 + 32);
  else
    v3 = 0;

  return v3;
}

void __52__PHPerformChangesRequest_executeWithService_reply___block_invoke(_QWORD *a1, int a2, void *a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  id v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  double v40;
  __int16 v41;
  _QWORD *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)a1[4];
  v6 = (void *)a1[5];
  v7 = v5[2];
  v8 = a3;
  v9 = v5;
  v10 = v6;
  v28 = v8;
  if (v7)
  {
    v11 = *(double *)(v7 + 32) - *(double *)(v7 + 24);
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(v7 + 40);
      objc_msgSend(v10, "clientDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      *(_DWORD *)buf = 138544898;
      v17 = CFSTR("NO");
      v30 = v13;
      v31 = 2114;
      if (a2)
        v17 = CFSTR("YES");
      v32 = v14;
      v33 = 2114;
      v34 = v15;
      v35 = 2114;
      v36 = v17;
      v37 = 2112;
      v38 = v28;
      v39 = 2048;
      v40 = v11;
      v41 = 2114;
      v42 = v9;
      v18 = v17;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Reply sent to client %{public}@ at %{public}@, success: %{public}@, error: %@, wait time: %f, %{public}@", buf, 0x48u);

    }
    PLPhotoKitGetLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = *(_QWORD *)(v7 + 16);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v22 = *(_QWORD *)(v7 + 40);
      objc_msgSend(v10, "clientDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      *(_DWORD *)buf = 138544898;
      v26 = CFSTR("NO");
      v30 = v22;
      v31 = 2114;
      if (a2)
        v26 = CFSTR("YES");
      v32 = v23;
      v33 = 2114;
      v34 = v24;
      v35 = 2114;
      v36 = v26;
      v37 = 2112;
      v38 = v28;
      v39 = 2048;
      v40 = v11;
      v41 = 2114;
      v42 = v9;
      v27 = v26;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PhotoKit request [service]", "PhotoKit changes: [%{public}@] Reply sent to client %{public}@ at %{public}@, success: %{public}@, error: %@, wait time: %f, %{public}@", buf, 0x48u);

    }
    *(_QWORD *)(v7 + 16) = 0;

  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_isSupportedLimitedLibraryChangeRequest:", a2);
  if ((v3 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 ^ 1u;
}

uint64_t __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke_2()
{
  return 0;
}

void __72__PHPerformChangesRequest_accessScopeOptionsRequiredForRequestedChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
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
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "accessScopeOptionsRequirement") | v8;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __38__PHPerformChangesRequest_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "changeTypeForSummary");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
          v15 = (__CFString *)v14;
        else
          v15 = CFSTR("(nil)");
        objc_msgSend(v8, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        if (objc_msgSend(v7, "length"))
          objc_msgSend(v7, "appendString:", CFSTR(", "));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@: %lu"), v21, objc_msgSend(v16, "countForObject:", v21));
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v7, "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: [%@] "), v5, v7);

}

void __84__PHPerformChangesRequest_notifyChangesTransactionFailedWithLazyPhotoLibrary_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[5];
  v4 = *(unsigned __int8 *)(a1[4] + 72);
  v5 = a2;
  objc_msgSend(v3, "objectValue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a1[6];
  v8 = (id)v6;
  if (v4)
    objc_msgSend(v5, "changeFailedOnDaemonWithLibrary:error:", v6, v7);
  else
    objc_msgSend(v5, "changeFailedOnClientWithLibrary:error:", v6, v7);

}

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E0C812F8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
