@implementation BMComputeXPCSubscription

- (BMDSLSubscriber)subscriber
{
  return self->_subscriber;
}

- (BMDSL)graph
{
  return self->_graph;
}

- (BOOL)waking
{
  return self->_waking;
}

- (unint64_t)token
{
  return self->_token;
}

- (id)block
{
  return self->_block;
}

- (id)fetchBookmarkFromStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v6 = a3;
  -[BMComputeXPCSubscription identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCSubscription client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "checkExistenceOfBookmarkForSubscriptionWithIdentifier:client:", v7, v8);

  if (v9)
  {
    -[BMComputeXPCSubscription identifier](self, "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCSubscription client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readBookmarkForSubscriptionWithIdentifier:client:error:", v10, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[BMComputeXPCSubscription graph](self, "graph");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCSubscription initialBookmarkTimestamp](self, "initialBookmarkTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    BMDSLGetBookmarkForDate(v13, v14, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    -[BMComputeXPCSubscription identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCSubscription client](self, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeBookmark:forSubscriptionWithIdentifier:client:", v12, v15, v16);

    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)client
{
  return self->_client;
}

- (NSSet)postMigrationStreamIdentifiers
{
  return self->_postMigrationStreamIdentifiers;
}

- (id)startEvent
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D024F0]);
    objc_msgSend(v1, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "useCase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)objc_msgSend(v2, "initWithClient:identifier:useCase:starting:", v3, v4, v5, 1);

  }
  return v1;
}

- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 waking:(BOOL)a5 DSLGraph:(id)a6 block:(id)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  BMComputeXPCSubscription *v18;

  v8 = a5;
  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:](self, "initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:", v16, v15, v17, v8, v14, 0, v13);

  return v18;
}

- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 createdAt:(id)a5 waking:(BOOL)a6 DSLGraph:(id)a7 subscriber:(id)a8 block:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMComputeXPCSubscription *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *client;
  void *v25;
  uint64_t v26;
  NSString *uniqueIdentifier;
  uint64_t v28;
  NSSet *streamIdentifiers;
  id v30;
  NSSet *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id block;
  NSXPCConnection *connection;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSString *useCase;
  BMComputeXPCSubscription *v50;
  NSObject *v51;
  void *aBlock;
  void *v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v57 = a8;
  v19 = a9;
  if ((BMIdentifierIsPathSafe() & 1) != 0)
  {
    v62.receiver = self;
    v62.super_class = (Class)BMComputeXPCSubscription;
    v20 = -[BMComputeXPCSubscription init](&v62, sel_init);
    if (v20)
    {
      aBlock = v19;
      v55 = v17;
      v21 = objc_msgSend(v15, "copy");
      identifier = v20->_identifier;
      v20->_identifier = (NSString *)v21;

      v56 = v16;
      v23 = objc_msgSend(v16, "copy");
      client = v20->_client;
      v20->_client = (NSString *)v23;

      -[NSString stringByAppendingString:](v20->_client, "stringByAppendingString:", CFSTR(":"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingString:", v15);
      v26 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v20->_uniqueIdentifier;
      v20->_uniqueIdentifier = (NSString *)v26;

      v20->_waking = a6;
      objc_storeStrong((id *)&v20->_graph, a7);
      objc_storeStrong((id *)&v20->_subscriber, a8);
      v54 = v18;
      objc_msgSend(v18, "rootStreamIdentifiers");
      v28 = objc_claimAutoreleasedReturnValue();
      streamIdentifiers = v20->_streamIdentifiers;
      v20->_streamIdentifiers = (NSSet *)v28;

      v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v31 = v20->_streamIdentifiers;
      v32 = -[NSSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v59 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier();
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            if (v37)
              v39 = (void *)v37;
            else
              v39 = v36;
            v40 = v39;

            objc_msgSend(v30, "addObject:", v40);
          }
          v33 = -[NSSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        }
        while (v33);
      }

      objc_storeStrong((id *)&v20->_postMigrationStreamIdentifiers, v30);
      v19 = aBlock;
      v41 = _Block_copy(aBlock);
      block = v20->_block;
      v20->_block = v41;

      objc_storeStrong((id *)&v20->_createdAt, a5);
      objc_storeStrong((id *)&v20->_initialBookmarkTimestamp, a5);
      connection = v20->_connection;
      v20->_connection = 0;

      v20->_pendingDemand = 0;
      v20->_token = 0;
      v18 = v54;
      objc_msgSend(v54, "streamPublishers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v44, "count") >= 2)
      {
        __biome_log_for_category();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:].cold.1(v45);

      }
      objc_msgSend(v44, "allObjects");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "useCase");
      v48 = objc_claimAutoreleasedReturnValue();
      useCase = v20->_useCase;
      v20->_useCase = (NSString *)v48;

      v17 = v55;
      v16 = v56;
    }
    self = v20;
    v50 = self;
  }
  else
  {
    __biome_log_for_category();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:].cold.2();

    v50 = 0;
  }

  return v50;
}

- (BMComputeXPCSubscription)initWithToken:(unint64_t)a3 descriptor:(id)a4
{
  id v6;
  const char *string;
  const char *v8;
  void *v9;
  char IsPathSafe;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  BMComputeXPCSubscription *v27;
  void *v28;
  NSObject *v29;
  const void *data;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  const void *v36;
  const void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  BMComputeXPCSubscription *v48;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  string = xpc_dictionary_get_string(v6, "identifier");
  if (string)
  {
    v8 = string;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsPathSafe = BMIdentifierIsPathSafe();

    if ((IsPathSafe & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = xpc_dictionary_get_string(v6, "client");
      if (!v12)
      {
        v28 = (void *)MEMORY[0x193FED914](v6);
        __biome_log_for_category();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCSubscription initWithToken:descriptor:].cold.2();

        free(v28);
        v27 = 0;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_double(v6, "createdAt");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_dictionary(v6, "graph");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __biome_log_for_category();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCSubscription initWithToken:descriptor:].cold.6();

          v27 = 0;
          goto LABEL_44;
        }
        v17 = v14;
        v51 = v13;
        v55 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 0, &v55);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v55;
        v20 = v19;
        if (!v18
          || v19
          || (objc_msgSend(MEMORY[0x1E0D01BB0], "unarchiveDSLFromData:", v18),
              (v21 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          __biome_log_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v11;
            v57 = 2112;
            v58 = v20;
            _os_log_impl(&dword_18D810000, v22, OS_LOG_TYPE_DEFAULT, "BMComputeXPCSubscription unable to unarchive BMDSL as JSON archived object, falling back to legacy dictionary-based format. Subscription: %@; error: %@",
              buf,
              0x16u);
          }

          v54 = 0;
          v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01B78]), "initWithDictionary:error:", v16, &v54);
          v23 = v54;
          v24 = v23;
          if (!v21 || v23)
          {
            __biome_log_for_category();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              -[BMComputeXPCSubscription initWithToken:descriptor:].cold.4();

            v27 = 0;
            v16 = (void *)v21;
            v13 = v51;
            v14 = v17;
            goto LABEL_44;
          }
        }

        v16 = (void *)v21;
      }
      else
      {
        v17 = v14;
        v51 = v13;
        *(_QWORD *)buf = 0;
        data = xpc_dictionary_get_data(v6, "graphData", (size_t *)buf);
        v31 = objc_alloc(MEMORY[0x1E0C99D50]);
        v32 = (void *)objc_msgSend(v31, "initWithBytes:length:", data, *(_QWORD *)buf);
        v33 = (void *)MEMORY[0x1E0CB3710];
        objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        objc_msgSend(v33, "unarchivedObjectOfClasses:fromData:error:", v34, v32, &v53);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v53;

        if (!v16 || v35)
        {
          __biome_log_for_category();
          v46 = objc_claimAutoreleasedReturnValue();
          v14 = v17;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCSubscription initWithToken:descriptor:].cold.4();

          v27 = 0;
          goto LABEL_43;
        }

      }
      v14 = v17;
      *(_QWORD *)buf = 0;
      v36 = xpc_dictionary_get_data(v6, "subscriber", (size_t *)buf);
      if (v36)
      {
        v37 = v36;
        v50 = v17;
        v38 = objc_alloc(MEMORY[0x1E0C99D50]);
        v39 = (void *)objc_msgSend(v38, "initWithBytes:length:", v37, *(_QWORD *)buf);
        v40 = (void *)MEMORY[0x1E0CB3710];
        objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        objc_msgSend(v40, "unarchivedObjectOfClasses:fromData:error:", v41, v39, &v52);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v52;

        if (v43)
        {
          __biome_log_for_category();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCSubscription initWithToken:descriptor:].cold.3();

          v27 = 0;
          v14 = v50;
LABEL_42:

LABEL_43:
          v13 = v51;
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }

        v14 = v50;
      }
      else
      {
        v42 = 0;
      }
      v48 = -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:](self, "initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:", v11, v51, v14, 1, v16, v42, 0);
      if (v48)
        v48->_token = a3;
      self = v48;
      v27 = self;
      goto LABEL_42;
    }
  }
  v25 = (void *)MEMORY[0x193FED914](v6);
  __biome_log_for_category();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[BMComputeXPCSubscription initWithToken:descriptor:].cold.1();

  free(v25);
  v27 = 0;
LABEL_46:

  return v27;
}

- (BOOL)isUnclaimed
{
  BOOL v3;
  void *v4;

  if (-[BMComputeXPCSubscription waking](self, "waking"))
    return 0;
  -[BMComputeXPCSubscription connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (id)XPCEvent
{
  xpc_object_t empty;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v32;
  id v33;

  empty = xpc_dictionary_create_empty();
  -[BMComputeXPCSubscription identifier](self, "identifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  if (v5)
    xpc_dictionary_set_string(empty, "identifier", v5);
  -[BMComputeXPCSubscription client](self, "client");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  if (v7)
    xpc_dictionary_set_string(empty, "client", v7);
  -[BMComputeXPCSubscription createdAt](self, "createdAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  xpc_dictionary_set_double(empty, "createdAt", v9);

  v10 = (void *)MEMORY[0x1E0CB36F8];
  -[BMComputeXPCSubscription graph](self, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v33;

  if (!v13)
  {
    v16 = objc_retainAutorelease(v12);
    xpc_dictionary_set_data(empty, "graphData", (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
    -[BMComputeXPCSubscription subscriber](self, "subscriber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB36F8];
      -[BMComputeXPCSubscription subscriber](self, "subscriber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v32;

      if (v21)
      {
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCSubscription XPCEvent].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

        goto LABEL_9;
      }
      v30 = objc_retainAutorelease(v20);
      xpc_dictionary_set_data(empty, "subscriber", (const void *)objc_msgSend(v30, "bytes"), objc_msgSend(v30, "length"));

    }
    v15 = empty;
    goto LABEL_17;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[BMComputeXPCSubscription XPCEvent].cold.2();

LABEL_9:
  v15 = 0;
LABEL_17:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMComputeXPCSubscription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BMComputeXPCSubscription *v12;
  BMComputeXPCSubscription *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("createdAt"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("waking"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("graphData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("token"));

  v12 = -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:](self, "initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:", v5, v6, v7, v8, v9, v10, 0);
  v13 = v12;
  if (v12)
    v12->_token = v11;

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[BMComputeXPCSubscription identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[BMComputeXPCSubscription client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("client"));

  -[BMComputeXPCSubscription createdAt](self, "createdAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("createdAt"));

  objc_msgSend(v10, "encodeBool:forKey:", -[BMComputeXPCSubscription waking](self, "waking"), CFSTR("waking"));
  -[BMComputeXPCSubscription graph](self, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("graphData"));

  objc_msgSend(v10, "encodeInt64:forKey:", -[BMComputeXPCSubscription token](self, "token"), CFSTR("token"));
  -[BMComputeXPCSubscription subscriber](self, "subscriber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMComputeXPCSubscription subscriber](self, "subscriber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("subscriber"));

  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BMComputeXPCSubscription client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCSubscription identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMComputeXPCSubscription waking](self, "waking"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCSubscription streamIdentifiers](self, "streamIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCSubscription graph](self, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCSubscription subscriber](self, "subscriber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMComputeXPCSubscription token](self, "token"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> client: %@, identifier: %@, waking: %@, streams: %@, graph: %@, subscriber:%@, token: %@"), v4, self, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)storageForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BMSimpleKeyValueStorage *v11;
  NSObject *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMComputeXPCSubscription.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if ((BMIdentifierIsPathSafe() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "localComputeDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "persistent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BMSimpleKeyValueStorage initWithURL:]([BMSimpleKeyValueStorage alloc], "initWithURL:", v10);

  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[BMComputeXPCSubscription storageForIdentifier:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)streamIdentifiers
{
  return self->_streamIdentifiers;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)initialBookmarkTimestamp
{
  return self->_initialBookmarkTimestamp;
}

- (void)setInitialBookmarkTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_initialBookmarkTimestamp, a3);
}

- (BOOL)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(BOOL)a3
{
  self->_pendingDemand = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_initialBookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_postMigrationStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_streamIdentifiers, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log client:createdAt:waking:DSLGraph:subscriber:block:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Error: received DSL graph with multiple upstreams, using the useCase on the first upstream", v1, 2u);
}

- (void)initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMComputeXPCSubscription error: provided identifier '%@' is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error: xpc_event subscription has invalid identifier: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error: xpc_event subscription is missing client identifier: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL Subscriber for subscription: %@; error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL graph for subscription: %@; error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL graph for subscription: %@, provided graph is not a dictionary and was not able to be parsed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithToken:descriptor:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "xpc_event subscription %@ is missing createdAt date - and could not fetch boot time, defaulting to 30 days ago %@");
  OUTLINED_FUNCTION_5();
}

- (void)XPCEvent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMComputeXPCSubscription error archiving graph while converting subscription to xpc event %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)storageForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMComputeXPCSubscription unable to locate storage, invalid identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
