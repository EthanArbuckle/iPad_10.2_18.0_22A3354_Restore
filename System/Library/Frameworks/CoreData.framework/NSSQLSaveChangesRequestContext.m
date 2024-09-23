@implementation NSSQLSaveChangesRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)executePrologue
{
  NSSQLSavePlan *savePlan;

  savePlan = self->_savePlan;
  if (savePlan)
  {
    -[NSSQLSavePlan _createRowsForSave]((uint64_t)self->_savePlan);
    -[NSSQLSavePlan _computeUpdatedRowSplit](savePlan);
  }
}

- (BOOL)executeRequestCore:(id *)a3
{
  NSSQLiteConnection *connection;
  NSArray *v6;
  NSSQLiteConnection *v7;
  NSArray *v8;
  NSSQLiteConnection *v9;
  NSSet *v10;
  NSSQLiteConnection *v11;
  NSSQLiteConnection *v12;
  NSSQLiteConnection *v13;
  const char *v14;

  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeSaveChangesRequest((NSSQLObjectFaultRequestContext *)self));
  if (!self)
    goto LABEL_23;
  if (self->super._exception)
    goto LABEL_10;
  connection = self->super._connection;
  if (connection)
    v6 = (NSArray *)-[NSMutableArray copy](connection->_mObjectIDsInsertedByDATriggers, "copy");
  else
LABEL_23:
    v6 = 0;
  self->_objectIDsInsertUpdatedToPruneDATrigger = v6;
  v7 = self->super._connection;
  if (v7)
    v8 = (NSArray *)-[NSMutableArray copy](v7->_mObjectIDsUpdatededByDATriggers, "copy");
  else
    v8 = 0;
  self->_objectIDsUpdatedToPruneDATrigger = v8;
  v9 = self->super._connection;
  if (v9)
    v10 = (NSSet *)-[NSMutableSet copy](v9->_mObjectIDsUpdatedByTriggers, "copy");
  else
    v10 = 0;
  self->_objectIDsToPruneTrigger = v10;
LABEL_10:
  v11 = self->super._connection;
  if (v11)
  {
    -[NSMutableArray removeAllObjects](v11->_mObjectIDsInsertedByDATriggers, "removeAllObjects");
    v12 = self->super._connection;
    if (v12)
    {
      -[NSMutableArray removeAllObjects](v12->_mObjectIDsUpdatededByDATriggers, "removeAllObjects");
      v13 = self->super._connection;
      if (v13)
        -[NSMutableSet removeAllObjects](v13->_mObjectIDsUpdatedByTriggers, "removeAllObjects");
    }
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0);
  if (a3 && *a3)
    objc_setProperty_nonatomic(self, v14, *a3, 40);
  return !self->super._exception && !self->super._error && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (void)addDataMask:(uint64_t)a3 forEntityKey:
{
  void *v6;
  id v7;

  if (a1)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 144), "objectForKey:");
    if (v6)
    {
      v7 = +[_NSPersistentHistoryChange _mergeOldMask:andNewMask:]((uint64_t)_NSPersistentHistoryChange, v6, a2);
      objc_msgSend(*(id *)(a1 + 144), "setObject:forKey:", v7, a3);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 144), "setObject:forKey:", a2, a3);
    }
  }
}

- (NSSQLSaveChangesRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLSaveChangesRequestContext *v7;
  void *v8;
  void *v9;
  NSSQLCore *sqlCore;
  _QWORD *v11;
  NSSQLRowCache *primaryRowCache;
  NSSQLCore *v13;
  NSSQLRowCache *v14;
  NSString *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NSSQLSaveChangesRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v17, sel_initWithRequest_context_sqlCore_, a3);
  if (!v7)
    return v7;
  if (a5 && !*((_BYTE *)a5 + 188))
    v8 = (void *)objc_msgSend(a5, "metadata");
  else
    v8 = 0;
  v7->_metadataToWrite = (NSDictionary *)v8;
  v7->_savePlan = (NSSQLSavePlan *)-[NSSQLSavePlan initForRequestContext:]([NSSQLSavePlan alloc], "initForRequestContext:", v7);
  v7->_faultHandler = (NSFaultHandler *)(id)-[NSPersistentStore faultHandler]((unint64_t)a5);
  v7->_objectIDsInsertUpdatedToPruneDATrigger = 0;
  v7->_objectIDsUpdatedToPruneDATrigger = 0;
  v7->_objectIDsToPruneTrigger = 0;
  v7->_originalCachedRows = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7->_updateMasksForHistoryTracking = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!a5)
  {
    v16 = (NSString *)(id)objc_msgSend(0, "externalDataReferencesDirectory");
    v9 = 0;
    v7->_externalDataReferencesDirectory = v16;
LABEL_11:
    v7->_externalDataLinksDirectory = (NSString *)v9;
    goto LABEL_12;
  }
  if ((*((_BYTE *)a5 + 193) & 0x40) == 0)
  {
    v7->_externalDataReferencesDirectory = (NSString *)(id)objc_msgSend(a5, "externalDataReferencesDirectory");
    if (!*((_QWORD *)a5 + 20))
      objc_msgSend(a5, "externalDataReferencesDirectory");
    v9 = (void *)*((_QWORD *)a5 + 21);
    goto LABEL_11;
  }
LABEL_12:
  v7->_fileBackedFuturesDirectory = (NSString *)(id)objc_msgSend(a5, "fileBackedFuturesDirectory");
  sqlCore = v7->super._sqlCore;
  if (sqlCore)
    v11 = -[NSSQLCore rowCacheForGeneration:](sqlCore, (void *)objc_msgSend(0, "_queryGenerationToken"));
  else
    v11 = 0;
  primaryRowCache = v11;
  v7->_primaryRowCache = primaryRowCache;
  v13 = v7->super._sqlCore;
  if (v13)
  {
    v14 = (NSSQLRowCache *)-[NSSQLCore rowCacheForGeneration:](v13, (void *)objc_msgSend(a4, "_queryGenerationToken"));
    primaryRowCache = v7->_primaryRowCache;
  }
  else
  {
    v14 = 0;
  }
  if (v14 != primaryRowCache)
    v7->_contextGenerationRowCache = v14;
  return v7;
}

- (os_unfair_lock_s)originalRowForObjectID:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)objc_msgSend(*(id *)(a1 + 136), "objectForKey:", a2);
  if (v4)
    return v4;
  v5 = (os_unfair_lock_s *)objc_msgSend((id)a1, "rowCache");
  if (v5)
  {
    v4 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v5, a2, *(double *)&NSSQLDistantPastTimeInterval);
    if (v4)
      goto LABEL_7;
  }
  v6 = *(os_unfair_lock_s **)(a1 + 184);
  if (!v6)
    return 0;
  v4 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v6, a2, *(double *)&NSSQLDistantPastTimeInterval);
  if (v4)
LABEL_7:
    objc_msgSend(*(id *)(a1 + 136), "setObject:forKey:", v4, a2);
  return v4;
}

- (id)rowCache
{
  return self->_primaryRowCache;
}

- (void)dealloc
{
  objc_super v3;

  self->_metadataToWrite = 0;
  self->_faultHandler = 0;

  self->_savePlan = 0;
  self->_objectIDsInsertUpdatedToPruneDATrigger = 0;

  self->_objectIDsUpdatedToPruneDATrigger = 0;
  self->_objectIDsToPruneTrigger = 0;

  self->_originalCachedRows = 0;
  self->_updateMasksForHistoryTracking = 0;

  self->_externalDataReferencesDirectory = 0;
  self->_externalDataLinksDirectory = 0;

  self->_fileBackedFuturesDirectory = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSaveChangesRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (void)executeEpilogue
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  char *v18;
  double v19;
  char *v20;
  CFStringRef v21;
  Class Class;
  int v23;
  char *v24;
  float v25;
  uint64_t v26;
  NSArray *objectIDsUpdatedToPruneDATrigger;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  os_unfair_lock_s *v35;
  os_unfair_lock_s *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unsigned int v40;
  void *v41;
  char *v42;
  double v43;
  char *v44;
  CFStringRef v45;
  Class v46;
  int v47;
  char *v48;
  float v49;
  uint64_t v50;
  id v51;
  NSSet *objectIDsToPruneTrigger;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  id v58;
  NSArray *obj;
  id obja;
  NSSQLSaveChangesRequestContext *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = -[NSSQLSaveChangesRequestContext rowCache](self, "rowCache");
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  obj = self->_objectIDsInsertUpdatedToPruneDATrigger;
  v61 = self;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v71;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v71 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(v8, "firstObject");
        if (v3)
        {
          v10 = v9;
          v11 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v3, v9, *(double *)&NSSQLDistantPastTimeInterval);
          if (v11)
          {
            v12 = v11;
            v13 = -[NSSQLCore entityForObjectID:]((uint64_t)v61->super._sqlCore, v10);
            v14 = objc_msgSend(v8, "objectAtIndex:", 1);
            if (v13)
              v15 = (void *)objc_msgSend(*(id *)(v13 + 40), "objectForKey:", v14);
            else
              v15 = 0;
            v16 = objc_msgSend(v15, "slot");
            v17 = (void *)objc_msgSend(v8, "lastObject");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              snapshot_set_null((char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16);
            }
            else if (objc_msgSend(v17, "isNSDate"))
            {
              v18 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
LABEL_14:
              objc_msgSend(v17, "timeIntervalSinceReferenceDate");
LABEL_15:
              snapshot_set_double(v18, v16, v19);
            }
            else if (objc_msgSend(v17, "isNSString"))
            {
              v20 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
              v21 = CFStringCreateWithCString(0, (const char *)objc_msgSend(v17, "UTF8String"), 0x8000100u);
              snapshot_set_object(v20, v16, (uint64_t)v21);
            }
            else if (objc_msgSend(v17, "isNSNumber"))
            {
              Class = object_getClass((id)-[os_unfair_lock_s _snapshot](v12, "_snapshot"));
              v23 = *(char *)(*((_QWORD *)object_getIndexedIvars(Class) + 7) + v16);
              switch(v23)
              {
                case 'c':
                  snapshot_set_int8((void *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16, objc_msgSend(v17, "charValue"));
                  break;
                case 'd':
                  v18 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
                  if (!objc_msgSend(v17, "isNSNumber"))
                    goto LABEL_14;
                  objc_msgSend(v17, "doubleValue");
                  goto LABEL_15;
                case 'e':
                case 'g':
                case 'h':
                  break;
                case 'f':
                  v24 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
                  objc_msgSend(v17, "floatValue");
                  snapshot_set_float(v24, v16, v25);
                  break;
                case 'i':
                  snapshot_set_int32((char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16, objc_msgSend(v17, "intValue"));
                  break;
                default:
                  if (v23 == 113)
                  {
                    snapshot_set_int64((char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16, objc_msgSend(v17, "longLongValue"));
                  }
                  else if (v23 == 115)
                  {
                    snapshot_set_int16((char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16, objc_msgSend(v17, "shortValue"));
                  }
                  break;
              }
            }
            if (v10 != (void *)NSKeyValueCoding_NullValue)
              objc_msgSend(v58, "addObject:", v8);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      v5 = v26;
    }
    while (v26);
  }
  -[NSManagedObjectContext _addObjectIDsInsertUpdatedByDATriggers:]((uint64_t)v61->super._context, v58);
  obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  objectIDsUpdatedToPruneDATrigger = v61->_objectIDsUpdatedToPruneDATrigger;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](objectIDsUpdatedToPruneDATrigger, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v67;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v67 != v30)
          objc_enumerationMutation(objectIDsUpdatedToPruneDATrigger);
        v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v31);
        v33 = (void *)objc_msgSend(v32, "firstObject");
        if (v3)
        {
          v34 = v33;
          v35 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v3, v33, *(double *)&NSSQLDistantPastTimeInterval);
          if (v35)
          {
            v36 = v35;
            v37 = -[NSSQLCore entityForObjectID:]((uint64_t)v61->super._sqlCore, v34);
            v38 = objc_msgSend(v32, "objectAtIndex:", 1);
            if (v37)
              v39 = (void *)objc_msgSend(*(id *)(v37 + 40), "objectForKey:", v38);
            else
              v39 = 0;
            v40 = objc_msgSend(v39, "slot");
            v41 = (void *)objc_msgSend(v32, "lastObject");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              snapshot_set_null((char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40);
            }
            else if (objc_msgSend(v41, "isNSDate"))
            {
              v42 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
LABEL_48:
              objc_msgSend(v41, "timeIntervalSinceReferenceDate");
LABEL_49:
              snapshot_set_double(v42, v40, v43);
            }
            else if (objc_msgSend(v41, "isNSString"))
            {
              v44 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
              v45 = CFStringCreateWithCString(0, (const char *)objc_msgSend(v41, "UTF8String"), 0x8000100u);
              snapshot_set_object(v44, v40, (uint64_t)v45);
            }
            else if (objc_msgSend(v41, "isNSNumber"))
            {
              v46 = object_getClass((id)-[os_unfair_lock_s _snapshot](v36, "_snapshot"));
              v47 = *(char *)(*((_QWORD *)object_getIndexedIvars(v46) + 7) + v40);
              switch(v47)
              {
                case 'c':
                  snapshot_set_int8((void *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40, objc_msgSend(v41, "charValue"));
                  break;
                case 'd':
                  v42 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
                  if (!objc_msgSend(v41, "isNSNumber"))
                    goto LABEL_48;
                  objc_msgSend(v41, "doubleValue");
                  goto LABEL_49;
                case 'e':
                case 'g':
                case 'h':
                  break;
                case 'f':
                  v48 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
                  objc_msgSend(v41, "floatValue");
                  snapshot_set_float(v48, v40, v49);
                  break;
                case 'i':
                  snapshot_set_int32((char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40, objc_msgSend(v41, "intValue"));
                  break;
                default:
                  if (v47 == 113)
                  {
                    snapshot_set_int64((char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40, objc_msgSend(v41, "longLongValue"));
                  }
                  else if (v47 == 115)
                  {
                    snapshot_set_int16((char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40, objc_msgSend(v41, "shortValue"));
                  }
                  break;
              }
            }
            if (v34 != (void *)NSKeyValueCoding_NullValue)
              objc_msgSend(obja, "addObject:", v32);
          }
        }
        ++v31;
      }
      while (v29 != v31);
      v50 = -[NSArray countByEnumeratingWithState:objects:count:](objectIDsUpdatedToPruneDATrigger, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      v29 = v50;
    }
    while (v50);
  }
  -[NSManagedObjectContext _addObjectIDsUpdatedByDATriggers:]((uint64_t)v61->super._context, obja);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objectIDsToPruneTrigger = v61->_objectIDsToPruneTrigger;
  v53 = -[NSSet countByEnumeratingWithState:objects:count:](objectIDsToPruneTrigger, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v63 != v55)
          objc_enumerationMutation(objectIDsToPruneTrigger);
        v57 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        if (v57 != NSKeyValueCoding_NullValue)
        {
          -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v3, *(const void **)(*((_QWORD *)&v62 + 1) + 8 * i));
          objc_msgSend(v51, "addObject:", v57);
        }
      }
      v54 = -[NSSet countByEnumeratingWithState:objects:count:](objectIDsToPruneTrigger, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v54);
  }
  -[NSManagedObjectContext _addObjectIDsUpdatedByTriggers:]((uint64_t)v61->super._context, v51);

  v61->_objectIDsInsertUpdatedToPruneDATrigger = 0;
  v61->_objectIDsToPruneTrigger = 0;
  -[NSMutableDictionary removeAllObjects](v61->_originalCachedRows, "removeAllObjects");
}

@end
