@implementation CADFetchedObjectSerializer

- (id)_properties:(id)a3 forEntityIfNotSeen:(void *)a4 objectExists:(BOOL *)a5
{
  id v8;
  void *v9;
  uint64_t DatabaseForRecord;
  uint64_t Type;
  uint64_t ID;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  CFTypeID v26;
  const void *v27;
  CFTypeID v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  const void *v36;
  const void *v37;
  void *v38;
  CFTypeRef v39;
  void *v41;
  void *v42;
  void *v43;
  BOOL *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CFTypeRef cf;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  _BYTE v59[10];
  int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 1;
  if (!objc_msgSend(v8, "count"))
    goto LABEL_9;
  DatabaseForRecord = CalGetDatabaseForRecord();
  Type = CalEntityGetType();
  ID = CalEntityGetID();
  if ((int)Type <= 0)
  {
    v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v59 = ID;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = Type;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_INFO, "Can't fetch properties for entity with rowID = %d and unexpected entity type = %d.", buf, 0xEu);
    }
LABEL_9:
    v16 = 0;
    goto LABEL_49;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", Type, ID, CalDatabaseGetAuxilliaryDatabaseID());
  -[CADFetchedObjectSerializer seenObjectIDs](self, "seenObjectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if ((v15 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    -[CADFetchedObjectSerializer seenObjectIDs](self, "seenObjectIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v13;
    objc_msgSend(v18, "addObject:", v13);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v42 = v9;
    obj = v9;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v55;
      v43 = a4;
      v44 = a5;
      v45 = v19;
      while (2)
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          cf = 0;
          v22 = CalEntityCopyProperty(self->_connection, (uint64_t)a4, v21, &cf);
          if (v22)
          {
            v23 = v22;
            if ((CalEntityIsDeleted() & 1) != 0)
            {
              if (a5)
                *a5 = 0;

              v16 = 0;
              goto LABEL_47;
            }
            v24 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)v59 = v21;
              *(_WORD *)&v59[8] = 1024;
              v60 = v23;
              _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_ERROR, "Unable to fetch property with name %{public}@, %d", buf, 0x12u);
            }
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v25);
          }
          else
          {
            if (!cf)
              goto LABEL_38;
            v26 = CFGetTypeID(cf);
            if (v26 == CPRecordGetTypeID())
            {
              -[CADFetchedObjectSerializer _fetchedObjectDictionaryForEntity:](self, "_fetchedObjectDictionaryForEntity:", cf);
              v27 = (const void *)objc_claimAutoreleasedReturnValue();
              CFRelease(cf);
              cf = v27;
            }
            else
            {
              v28 = CFGetTypeID(cf);
              if (v28 == CFSetGetTypeID())
              {
                v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
                v30 = (void *)objc_msgSend(v29, "initWithCapacity:", CFSetGetCount((CFSetRef)cf));
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v31 = (id)cf;
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v50;
                  do
                  {
                    for (j = 0; j != v33; ++j)
                    {
                      if (*(_QWORD *)v50 != v34)
                        objc_enumerationMutation(v31);
                      v36 = CADCopyEntityInDatabase(DatabaseForRecord, *(void **)(*((_QWORD *)&v49 + 1) + 8 * j));
                      if (v36)
                      {
                        v37 = v36;
                        -[CADFetchedObjectSerializer _fetchedObjectDictionaryForEntity:](self, "_fetchedObjectDictionaryForEntity:", v36);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        CFRelease(v37);
                        if (v38)
                          objc_msgSend(v30, "addObject:", v38);

                      }
                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                  }
                  while (v33);
                }

                CFRelease(cf);
                cf = v30;
                a4 = v43;
                a5 = v44;
              }
            }
            v19 = v45;
            if (cf)
            {
              v39 = (id)cf;
            }
            else
            {
LABEL_38:
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v39 = (CFTypeRef)objc_claimAutoreleasedReturnValue();
            }
            v25 = (void *)v39;
            objc_msgSend(v19, "addObject:", v39);
            if (cf)
              CFRelease(cf);
          }

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v48)
          continue;
        break;
      }
    }

    v16 = v19;
LABEL_47:
    v13 = v41;
    v9 = v42;

  }
LABEL_49:

  return v16;
}

- (NSMutableSet)seenObjectIDs
{
  return self->_seenObjectIDs;
}

- (id)_fetchedObjectDictionaryForEntity:(void *)a3
{
  uint64_t Type;
  uint64_t ID;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t AuxilliaryDatabaseID;
  char v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Type = CalEntityGetType();
  ID = CalEntityGetID();
  if ((int)Type <= 0)
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v21 = ID;
      v22 = 1024;
      v23 = Type;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_INFO, "Can't fetch object dictionary for related entity with rowID = %d and unexpected entity type = %d.", buf, 0xEu);
    }
    return 0;
  }
  else
  {
    -[CADFetchedObjectSerializer relatedObjectPropertiesToLoad](self, "relatedObjectPropertiesToLoad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Type);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    -[CADFetchedObjectSerializer _properties:forEntityIfNotSeen:objectExists:](self, "_properties:forEntityIfNotSeen:objectExists:", v9, a3, &v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v19)
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      CADEntityCopyObjectID();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isVirtual") & 1) != 0)
      {
        AuxilliaryDatabaseID = 0;
      }
      else
      {
        CalGetDatabaseForRecord();
        AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
      }
      CalFetchedObjectDictionary(Type, ID, AuxilliaryDatabaseID, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v21 = ID;
        _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_INFO, "Can't fetch object dictionary for related entity with rowID = %d because it appears to be deleted", buf, 8u);
      }
      v16 = 0;
    }

    return v16;
  }
}

- (NSDictionary)relatedObjectPropertiesToLoad
{
  return self->_relatedObjectPropertiesToLoad;
}

- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4 relatedObjectPropertiesToLoad:(id)a5
{
  id v9;
  id v10;
  id v11;
  CADFetchedObjectSerializer *v12;
  CADFetchedObjectSerializer *v13;
  uint64_t v14;
  NSArray *defaultPropertiesToLoad;
  uint64_t v16;
  NSDictionary *relatedObjectPropertiesToLoad;
  uint64_t v18;
  NSMutableArray *wrappers;
  uint64_t v20;
  NSMutableSet *seenObjectIDs;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CADFetchedObjectSerializer;
  v12 = -[CADFetchedObjectSerializer init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    v14 = objc_msgSend(v10, "copy");
    defaultPropertiesToLoad = v13->_defaultPropertiesToLoad;
    v13->_defaultPropertiesToLoad = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    relatedObjectPropertiesToLoad = v13->_relatedObjectPropertiesToLoad;
    v13->_relatedObjectPropertiesToLoad = (NSDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    wrappers = v13->_wrappers;
    v13->_wrappers = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    seenObjectIDs = v13->_seenObjectIDs;
    v13->_seenObjectIDs = (NSMutableSet *)v20;

  }
  return v13;
}

- (NSArray)fetchedObjectWrappers
{
  void *v2;
  void *v3;

  -[CADFetchedObjectSerializer wrappers](self, "wrappers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)addEntity:(void *)a3
{
  CFTypeID v5;
  uint64_t TypeID;
  const void *v7;
  uint64_t Event;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CADEventEntityWrapper *v13;
  void *v14;
  void *v15;
  CADEventEntityWrapper *v16;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = CFGetTypeID(a3);
  TypeID = CalEventOccurrenceGetTypeID();
  if (v5 == TypeID)
  {
    v7 = 0;
  }
  else if (CalEntityGetType() != 2
         || (v7 = (const void *)CalEventOccurrenceCreateForInitialOccurrence()) == 0)
  {
    LOBYTE(v25) = 0;
    -[CADFetchedObjectSerializer defaultPropertiesToLoad](self, "defaultPropertiesToLoad", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADFetchedObjectSerializer _properties:forEntityIfNotSeen:objectExists:](self, "_properties:forEntityIfNotSeen:objectExists:", v14, a3, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v25)
      v13 = -[CADEntityWrapper initWithCalEntity:loadedValues:]([CADEntityWrapper alloc], "initWithCalEntity:loadedValues:", a3, v15);
    else
      v13 = 0;

    if (!v13)
      goto LABEL_17;
    goto LABEL_16;
  }
  Event = CalEventOccurrenceGetEvent();
  CalEventOccurrenceGetDate();
  v10 = v9;
  LOBYTE(v25) = 0;
  -[CADFetchedObjectSerializer defaultPropertiesToLoad](self, "defaultPropertiesToLoad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADFetchedObjectSerializer _properties:forEntityIfNotSeen:objectExists:](self, "_properties:forEntityIfNotSeen:objectExists:", v11, Event, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v25)
    v13 = -[CADEventEntityWrapper initWithCalEntity:loadedValues:occurrenceDate:]([CADEventEntityWrapper alloc], "initWithCalEntity:loadedValues:occurrenceDate:", Event, v12, v10);
  else
    v13 = 0;
  if (v5 != TypeID)
    CFRelease(v7);

  if (!v13)
    goto LABEL_17;
LABEL_16:
  if ((CalEntityIsDeleted() & 1) == 0)
  {
    -[CADEntityWrapper objectID](v13, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "entityType");

    if ((v19 + 1) > 1)
    {
      -[CADFetchedObjectSerializer wrappers](self, "wrappers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v13);

      v16 = v13;
      goto LABEL_18;
    }
    v20 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      -[CADEntityWrapper objectID](v13, "objectID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "entityID");
      LODWORD(v25) = 67109376;
      HIDWORD(v25) = v23;
      v26 = 1024;
      v27 = v19;
      _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Entity with rowID = %d has unexpected entity type = %d. Filtering out of search results.", (uint8_t *)&v25, 0xEu);

    }
  }
LABEL_17:
  v16 = 0;
LABEL_18:

  return v16;
}

- (NSMutableArray)wrappers
{
  return self->_wrappers;
}

- (NSArray)defaultPropertiesToLoad
{
  return self->_defaultPropertiesToLoad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenObjectIDs, 0);
  objc_storeStrong((id *)&self->_wrappers, 0);
  objc_storeStrong((id *)&self->_relatedObjectPropertiesToLoad, 0);
  objc_storeStrong((id *)&self->_defaultPropertiesToLoad, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4
{
  return -[CADFetchedObjectSerializer initWithConnection:defaultPropertiesToLoad:relatedObjectPropertiesToLoad:](self, "initWithConnection:defaultPropertiesToLoad:relatedObjectPropertiesToLoad:", a3, a4, 0);
}

- (ClientConnection)connection
{
  return self->_connection;
}

@end
