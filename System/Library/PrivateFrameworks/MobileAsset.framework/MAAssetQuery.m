@implementation MAAssetQuery

- (MAAssetQuery)initWithType:(id)a3
{
  return -[MAAssetQuery initWithType:andPurpose:](self, "initWithType:andPurpose:", a3, 0);
}

- (void)returnTypes:(int64_t)a3
{
  self->_returnTypes = a3;
}

- (void)setDoNotBlockBeforeFirstUnlock:(BOOL)a3
{
  self->_doNotBlockBeforeFirstUnlock = a3;
}

- (void)queryMetaData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MAAssetQuery_queryMetaData___block_invoke;
  v6[3] = &unk_1E5D5DA40;
  v7 = v4;
  v5 = v4;
  -[MAAssetQuery queryMetaDataWithError:](self, "queryMetaDataWithError:", v6);

}

- (void)queryMetaDataWithError:(id)a3
{
  id v4;
  void *v5;
  NSString *assetType;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF44EE58]();
  self->_isDone = 0;
  assetType = self->_assetType;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MAAssetQuery_queryMetaDataWithError___block_invoke;
  v8[3] = &unk_1E5D5DA90;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  _MAsendQueryMetaData(assetType, self, v8);

  objc_autoreleasePoolPop(v5);
}

- (NSString)purpose
{
  return self->_purpose;
}

- (MAAssetQuery)initWithType:(id)a3 andPurpose:(id)a4
{
  id v7;
  id v8;
  MAAssetQuery *v9;
  MAAssetQuery *v10;
  uint64_t v11;
  NSMutableArray *queryParams;
  NSArray *results;
  NSDate *postedDate;
  NSDate *lastFetchDate;
  NSSet *assetIds;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MAAssetQuery;
  v9 = -[MAAssetQuery init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isDone = 0;
    v11 = objc_opt_new();
    queryParams = v10->_queryParams;
    v10->_queryParams = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_assetType, a3);
    results = v10->_results;
    v10->_results = 0;

    v10->_returnTypes = 0;
    postedDate = v10->_postedDate;
    v10->_resultCode = 12;
    v10->_postedDate = 0;

    lastFetchDate = v10->_lastFetchDate;
    v10->_lastFetchDate = 0;

    v10->_isPallasResult = 0;
    assetIds = v10->_assetIds;
    v10->_assetIds = 0;

    v10->_doNotBlockBeforeFirstUnlock = 0;
    objc_storeStrong((id *)&v10->_purpose, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_queryParams, 0);
  objc_storeStrong((id *)&self->_postedDate, 0);
}

- (int64_t)queryMetaDataSync
{
  void *v3;
  xpc_object_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  uint64_t v32;
  id v33;

  self->_isDone = 0;
  v3 = (void *)MEMORY[0x1AF44EE58]();
  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    -[MAAssetQuery assetType](self, "assetType");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MAAssetQuery queryParams](self, "queryParams");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v10 = (void *)MEMORY[0x1E0CB36F8];
        -[MAAssetQuery queryParams](self, "queryParams");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v33);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v33;

        if (!v5 || v12)
        {
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryMetaDataSync]", CFSTR("Discarding params as they could not be encoded: %@"), v13, v14, v15, v16, (uint64_t)v12);
          v29 = 0;
          v27 = 0;
          v30 = 8;
          goto LABEL_17;
        }
        v17 = (const char *)objc_msgSend(CFSTR("QueryParams"), "UTF8String");
        v5 = objc_retainAutorelease(v5);
        xpc_dictionary_set_data(v4, v17, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
      }
      if (self->_purpose)
      {
        _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryMetaDataSync]", CFSTR("Querying with purpose: %@"), v6, v7, v8, v9, (uint64_t)self->_purpose);
        xpc_dictionary_set_string(v4, "Purpose", -[NSString UTF8String](self->_purpose, "UTF8String"));
      }
      -[MAAssetQuery assetType](self, "assetType");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v4, "AssetType", (const char *)objc_msgSend(v18, "UTF8String"));

      xpc_dictionary_set_uint64(v4, "messageAction", 1uLL);
      xpc_dictionary_set_uint64(v4, "returnAssetTypes", -[MAAssetQuery returnTypes](self, "returnTypes"));
      xpc_dictionary_set_BOOL(v4, "doNotBlockBeforeFirstUnlock", -[MAAssetQuery doNotBlockBeforeFirstUnlock](self, "doNotBlockBeforeFirstUnlock"));
      xpc_dictionary_set_BOOL(v4, "doNotBlockOnNetworkStatus", -[MAAssetQuery doNotBlockOnNetworkStatus](self, "doNotBlockOnNetworkStatus"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), getprogname());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v19;
      if (v19)
        xpc_dictionary_set_string(v4, "clientName", (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
      v32 = 12;
      _getCommsManager((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v32, 1, CFSTR("queryMetaDataSync"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v32;
      if (v29)
        -[MAAssetQuery getResultsFromMessage:](self, "getResultsFromMessage:", v29);
      v12 = 0;
    }
    else
    {
      v29 = 0;
      v12 = 0;
      v27 = 0;
      v30 = 7;
    }
  }
  else
  {
    v29 = 0;
    v5 = 0;
    v12 = 0;
    v27 = 0;
    v30 = 6;
  }
LABEL_17:
  self->_isDone = 1;

  objc_autoreleasePoolPop(v3);
  self->_resultCode = v30;
  return v30;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSMutableArray)queryParams
{
  return self->_queryParams;
}

- (int64_t)returnTypes
{
  return self->_returnTypes;
}

- (BOOL)doNotBlockBeforeFirstUnlock
{
  return self->_doNotBlockBeforeFirstUnlock;
}

- (void)getResultsFromMessage:(id)a3
{
  id v4;
  NSArray *results;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *data;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSDate *v40;
  NSDate *lastFetchDate;
  NSDate *v42;
  NSDate *postedDate;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  MAAsset *v61;
  void *v62;
  uint64_t v63;
  NSSet *assetIds;
  __CFString *v65;
  int v66;
  uint64_t v67;
  MAAssetQuery *v68;
  void *context;
  void *v70;
  id *location;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  size_t length;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_resultCode = xpc_dictionary_get_int64(v4, "Result");
  results = self->_results;
  self->_results = 0;

  -[MAAssetQuery assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", CFSTR("Got the query meta data reply for: %@, response: %ld"), v7, v8, v9, v10, (uint64_t)v6);

  length = 0;
  v11 = (void *)MEMORY[0x1AF44EE58]();
  data = xpc_dictionary_get_data(v4, (const char *)objc_msgSend(CFSTR("xmlData"), "UTF8String"), &length);
  if (!data)
  {
    v31 = CFSTR("rawData is null skipping");
LABEL_7:
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", v31, v13, v14, v15, v16, v67);
    objc_autoreleasePoolPop(v11);
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v31 = CFSTR("data is nil, skipping");
    goto LABEL_7;
  }
  v18 = (void *)v17;
  v77 = 0;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v17, &v77);
  v20 = v77;
  v25 = v20;
  if (v20)
  {
    objc_msgSend(v20, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 3, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", CFSTR("Unable to initialize keyed unarchiver, error: %@"), v27, v28, v29, v30, (uint64_t)v26);

LABEL_35:
    objc_autoreleasePoolPop(v11);

    goto LABEL_36;
  }
  if (!v19)
  {
    v65 = CFSTR("Keyed archive is nil, skipping.");
    v66 = 3;
LABEL_33:
    _MobileAssetLog(0, v66, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", v65, v21, v22, v23, v24, v67);
    goto LABEL_35;
  }
  objc_msgSend(v19, "decodePropertyListForKey:", *MEMORY[0x1E0CB2CD0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "finishDecoding");
  if (!v32)
  {
    v65 = CFSTR("allData is nil, skipping");
    v66 = 6;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", CFSTR("allData is not a dictionary, skipping"), v33, v34, v35, v36, v67);

    goto LABEL_35;
  }

  objc_autoreleasePoolPop(v11);
  v37 = (void *)MEMORY[0x1AF44EE58]();
  objc_msgSend(v32, "objectForKey:", CFSTR("metaToFrameWork"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    objc_msgSend(v38, "objectForKey:", CFSTR("lastTimeChecked"));
    v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastFetchDate = self->_lastFetchDate;
    self->_lastFetchDate = v40;

    objc_msgSend(v39, "objectForKey:", CFSTR("postedDate"));
    v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
    postedDate = self->_postedDate;
    self->_postedDate = v42;

  }
  objc_msgSend(v32, "objectForKey:", CFSTR("catalogInfoToFrameWork"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v44, "objectForKey:", CFSTR("isLiveServer"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v45, "BOOLValue"))
            self->_isPallasResult = 1;
        }
      }

    }
  }
  objc_msgSend(v32, "objectForKey:", CFSTR("assetsToFrameWork"));
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v51 = (void *)v46;
    v70 = v32;
    location = (id *)&self->_results;
    v72 = v4;
    v68 = self;

    objc_autoreleasePoolPop(v37);
    context = (void *)MEMORY[0x1AF44EE58]();
    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = (void *)objc_opt_new();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v54 = v51;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v74 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
          v60 = (void *)MEMORY[0x1AF44EE58]();
          v61 = -[MAAsset initWithAttributes:]([MAAsset alloc], "initWithAttributes:", v59);
          objc_msgSend(v53, "addObject:", v61);
          -[MAAsset assetId](v61, "assetId");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v62);

          objc_autoreleasePoolPop(v60);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v56);
    }

    if (v52)
    {
      v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v52);
      assetIds = v68->_assetIds;
      v68->_assetIds = (NSSet *)v63;

    }
    objc_storeStrong(location, v53);

    objc_autoreleasePoolPop(context);
    v4 = v72;
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", CFSTR("attributes is nil"), v47, v48, v49, v50, v67);

    objc_autoreleasePoolPop(v37);
  }
LABEL_36:

}

- (int64_t)addKeyValuePair:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "addObject:", v7);
    v9 = -[MAAssetQuery addKeyValueArray:with:](self, "addKeyValueArray:with:", v6, v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (int64_t)addKeyValueArray:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  uint64_t v24;
  MAAssetQuery *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v25 = self;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v13 == (void *)v14)
          {

          }
          else
          {
            v15 = (void *)v14;
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery addKeyValueArray:with:]", CFSTR("Skipping due to bad value in array"), v17, v18, v19, v20, v24);
              v22 = 1;
              goto LABEL_16;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setValue:forKey:", v8, CFSTR("queryValue"));
    objc_msgSend(v21, "setValue:forKey:", v6, CFSTR("queryKey"));
    -[NSMutableArray addObject:](v25->_queryParams, "addObject:", v21);
    v22 = 0;
    v8 = v21;
LABEL_16:

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (BOOL)doNotBlockOnNetworkStatus
{
  return self->_doNotBlockOnNetworkStatus;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setDoNotBlockOnNetworkStatus:(BOOL)a3
{
  self->_doNotBlockOnNetworkStatus = a3;
}

void __39__MAAssetQuery_queryMetaDataWithError___block_invoke(uint64_t a1, void *a2)
{
  int64_t int64;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    int64 = 1;
    errorStringForMAQueryResult(1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 1, CFSTR("%@ due to XPC_TYPE_ERROR"), v10, v11, v12, v13, v14, (uint64_t)v4);
    goto LABEL_5;
  }
  int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (isQueryResultFailure(int64))
  {
    errorStringForMAQueryResult(int64);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Query"), int64, CFSTR("%@"), v5, v6, v7, v8, v9, (uint64_t)v4);
LABEL_5:
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "getResultsFromMessage:", xdict);
  v15 = 0;
LABEL_7:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, int64_t, void *))(v16 + 16))(v16, int64, v15);

}

uint64_t __30__MAAssetQuery_queryMetaData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)addKeyValueNull:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = -[MAAssetQuery addKeyValueArray:with:](self, "addKeyValueArray:with:", v4, v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)queryInstalledAssetIds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  const void *data;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSSet *v51;
  NSSet *assetIds;
  __CFString *v53;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  size_t length;

  v3 = (void *)MEMORY[0x1AF44EE58](self, a2);
  v8 = xpc_dictionary_create(0, 0, 0);
  length = 0;
  if (!v8)
  {
    v32 = 6;
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", CFSTR("Could not create message for queryInstalledAssetIds"), v4, v5, v6, v7, v55);
    goto LABEL_21;
  }
  -[MAAssetQuery assetType](self, "assetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", CFSTR("queryInstalledAssetIds failure due to nil asset type"), v10, v11, v12, v13, v55);
    v32 = 7;
    goto LABEL_21;
  }
  -[MAAssetQuery assetType](self, "assetType");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v8, "AssetType", (const char *)objc_msgSend(v14, "UTF8String"));

  xpc_dictionary_set_uint64(v8, "messageAction", 0x12uLL);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v56 = getprogname();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%s"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  if (v16)
    xpc_dictionary_set_string(v8, "clientName", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
  v57 = 12;
  _getCommsManager((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAssetQuery queryInstalledAssetIds]");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v8, &v57, 1, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!MAIsQueryResultFailure(v57))
  {
    data = xpc_dictionary_get_data(v27, (const char *)objc_msgSend(CFSTR("QueryAssetIdsResponse"), "UTF8String"), &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v39 = (void *)v38;
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v38, 0);
        queryDecodeClasses();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "decodeObjectOfClasses:forKey:", v41, *MEMORY[0x1E0CB2CD0]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "finishDecoding");
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v42, "objectForKey:", CFSTR("QueryAssetIds"));
            v51 = (NSSet *)objc_claimAutoreleasedReturnValue();
            assetIds = self->_assetIds;
            self->_assetIds = v51;

            v32 = 0;
            goto LABEL_21;
          }
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", CFSTR("queryInstalledAssetIds allData is not a dictionary skipping"), v47, v48, v49, v50, (uint64_t)v56);

        }
        else
        {
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", CFSTR("queryInstalledAssetIds allData is null skipping"), v43, v44, v45, v46, (uint64_t)v56);
        }

LABEL_20:
        v32 = 3;
        goto LABEL_21;
      }
      v53 = CFSTR("queryInstalledAssetIds data is null skipping");
    }
    else
    {
      v53 = CFSTR("queryInstalledAssetIds rawData is null skipping");
    }
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", v53, v34, v35, v36, v37, (uint64_t)v56);
    goto LABEL_20;
  }
  v32 = 3;
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", CFSTR("queryInstalledAssetIds failure server side: %ld"), v28, v29, v30, v31, 3);

LABEL_21:
  objc_autoreleasePoolPop(v3);
  return v32;
}

- (BOOL)isCatalogFetchedWithinThePastFewDays:(int)a3
{
  BOOL v3;
  void *v6;
  NSDate *lastFetchDate;
  void *v8;
  void *v9;

  v3 = 0;
  if (a3 >= 1 && self->_lastFetchDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lastFetchDate = self->_lastFetchDate;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:toDate:options:", 16, lastFetchDate, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v9 && objc_msgSend(v9, "day") < a3 && objc_msgSend(v9, "day") > -a3;
  }
  return v3;
}

- (BOOL)isCatalogFetchedFromLiveServer
{
  return self->_isPallasResult;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSUInteger v7;
  __CFString *v8;
  void *v9;
  unint64_t returnTypes;
  __CFString *v11;
  void *v12;
  unint64_t resultCode;
  void *v14;
  void *v15;

  -[NSSet anyObject](self->_assetIds, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1E5D5F930;
  v6 = v5;

  v7 = -[NSSet count](self->_assetIds, "count");
  v8 = CFSTR("...");
  if (v7 <= 1)
    v8 = &stru_1E5D5F930;
  v9 = (void *)MEMORY[0x1E0CB3940];
  returnTypes = self->_returnTypes;
  v11 = v8;
  stringForMAQueryReturnTypes(returnTypes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  resultCode = self->_resultCode;
  stringForMAQueryResult(resultCode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("query returnTypes: %ld (%@) result: %ld (%@) count: %ld (%@%@)"), returnTypes, v12, resultCode, v14, -[NSArray count](self->_results, "count"), v6, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (NSDate)postedDate
{
  return self->_postedDate;
}

- (NSSet)assetIds
{
  return self->_assetIds;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (void)setPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_purpose, a3);
}

@end
