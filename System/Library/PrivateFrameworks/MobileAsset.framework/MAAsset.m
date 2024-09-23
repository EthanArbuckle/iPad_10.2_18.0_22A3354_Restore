@implementation MAAsset

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset assetId](self, "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (MAAsset)initWithAttributes:(id)a3
{
  id v4;
  MAAsset *v5;
  uint64_t v6;
  NSDictionary *attributes;
  uint64_t v8;
  NSString *purpose;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *assetType;
  uint64_t v16;
  NSString *assetId;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MAAsset;
  v5 = -[MAAsset init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AssetProperties"));
    v6 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v6;

    -[NSDictionary objectForKey:](v5->_attributes, "objectForKey:", CFSTR("AssetPurpose"));
    v8 = objc_claimAutoreleasedReturnValue();
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("AssetAddedProperties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("AssetState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v12 = (void *)objc_msgSend(v12, "integerValue");
      v5->_state = (int64_t)v12;
      objc_msgSend(v11, "objectForKey:", CFSTR("AssetType"));
      v14 = objc_claimAutoreleasedReturnValue();
      assetType = v5->_assetType;
      v5->_assetType = (NSString *)v14;

      objc_msgSend(v11, "objectForKey:", CFSTR("AssetId"));
      v16 = objc_claimAutoreleasedReturnValue();
      assetId = v5->_assetId;
      v5->_assetId = (NSString *)v16;

    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (BOOL)wasLocal
{
  return (self->_state < 7uLL) & (0x6Cu >> self->_state);
}

- (BOOL)wasPurgeable
{
  return (self->_state < 7uLL) & (0x5Cu >> self->_state);
}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MAAsset_startCatalogDownload_options_then___block_invoke;
  v9[3] = &unk_1E5D5DA40;
  v10 = v7;
  v8 = v7;
  +[MAAsset startCatalogDownload:options:completionWithError:](MAAsset, "startCatalogDownload:options:completionWithError:", a3, a4, v9);

}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1AF44EE58]();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 1;
  if (v8)
    v11 = v8;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;
  if (objc_msgSend(v11, "timeoutIntervalForResource") == -1)
    objc_msgSend(v12, "setTimeoutIntervalForResource:", 900);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke;
  v16[3] = &unk_1E5D5DB08;
  v20 = v21;
  v13 = v7;
  v17 = v13;
  v14 = v12;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  _MAsendDownloadMetaData(v13, v14, v16);

  _Block_object_dispose(v21, 8);
  objc_autoreleasePoolPop(v10);

}

- (id)getLocalFileUrl
{
  void *v2;
  void *v3;

  -[MAAsset getLocalFilePath](self, "getLocalFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)getLocalFilePath
{
  int64_t state;
  NSString *assetType;
  void *v5;
  void *v6;

  state = self->_state;
  assetType = self->_assetType;
  if (state == 5)
  {
    getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose(assetType, self->_assetId, 5, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _MAensureExtension(assetType);
    _MAsendUpdateClientAccessGetPathWithPurposeSync(self->_assetType, self->_assetId, self->_state, self->_purpose);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  NSObject *v27;
  id v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  _QWORD block[4];
  id v39;
  id v40;
  __int128 v41;

  v3 = a2;
  v4 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (v3)
  {
    if (MEMORY[0x1AF44F218](v3) == MEMORY[0x1E0C81310])
    {
      v16 = *(_QWORD *)(a1 + 32);
      stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", CFSTR("Error on the download meta data reply for %@, response: %ld (%@)"), v17, v18, v19, v20, v16);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = xpc_dictionary_get_int64(v4, "Result");
      v5 = *(_QWORD *)(a1 + 32);
      stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", CFSTR("Got the download meta data reply for %@, response: %ld (%@)"), v7, v8, v9, v10, v5);
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", CFSTR("Error on the download meta data reply for %@, response: %ld (%@) due to not having an xpc message"), v12, v13, v14, v15, v11);
  }

  v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v25 == 13)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", CFSTR("Will retry download meta data for %@, after %ld seconds"), v21, v22, v23, v24, *(_QWORD *)(a1 + 32));
    v26 = dispatch_time(0, 2000000000);
    if (getRetryXpcDelayQueue_onceToken_0 != -1)
      dispatch_once(&getRetryXpcDelayQueue_onceToken_0, &__block_literal_global_2);
    v27 = getRetryXpcDelayQueue_retryQueue_0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2;
    block[3] = &unk_1E5D5DAE0;
    v39 = *(id *)(a1 + 32);
    v40 = *(id *)(a1 + 40);
    v37 = *(_OWORD *)(a1 + 48);
    v28 = (id)v37;
    v41 = v37;
    dispatch_after(v26, v27, block);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    if (isDownloadResultFailure(v25))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      errorStringForMADownloadResult(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      MAErrorForDownloadResultWithUnderlying(v29, 0, CFSTR("%@ (Catalog download for %@)"), v31, v32, v33, v34, v35, (uint64_t)v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __45__MAAsset_startCatalogDownload_options_then___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)wasPreinstalled
{
  return (unint64_t)(self->_state - 5) < 2;
}

- (BOOL)wasInCatalog
{
  return (self->_state < 5uLL) & (0x16u >> self->_state);
}

- (BOOL)wasDownloadable
{
  int64_t state;

  state = self->_state;
  return state == 1 || state == 4;
}

+ (id)getLoadResultFromMessage:(id)a3
{
  id v3;
  const void *data;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  MAAsset *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  size_t length;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  length = 0;
  data = xpc_dictionary_get_data(v3, (const char *)objc_msgSend(CFSTR("xmlData"), "UTF8String"), &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", CFSTR("load rawData is null skipping"), v5, v6, v7, v8, v37);
    v24 = 0;
    v33 = 0;
    v14 = 0;
    v15 = 0;
    v13 = 0;
LABEL_24:
    v27 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", CFSTR("load data is null skipping"), v9, v10, v11, v12, v37);
    v24 = 0;
    v33 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_24;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v13, 0);
  objc_msgSend(v14, "decodePropertyListForKey:", *MEMORY[0x1E0CB2CD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "finishDecoding");
  if (!v15)
  {
    v34 = CFSTR("load allData is null skipping");
LABEL_21:
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", v34, v16, v17, v18, v19, v37);
    v24 = 0;
LABEL_23:
    v33 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = CFSTR("load allData is not a dictionary");
    goto LABEL_21;
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("assetsToFrameWork"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", CFSTR("attributes is nil"), v20, v21, v22, v23, v37);
    goto LABEL_23;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v24 = v24;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v38;
    while (2)
    {
      v29 = 0;
      v30 = v27;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v24);
        v27 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v29);

        v31 = [MAAsset alloc];
        v32 = -[MAAsset initWithAttributes:](v31, "initWithAttributes:", v27, (_QWORD)v37);
        if (v32)
        {
          v33 = (void *)v32;
          goto LABEL_27;
        }
        ++v29;
        v30 = v27;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v26)
        continue;
      break;
    }

  }
  v33 = 0;
  v27 = 0;
LABEL_27:

LABEL_25:
  v35 = v33;

  return v35;
}

+ (id)loadSync:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "loadSync:allowingDifferences:withPurpose:error:", a3, 0, 0, a4);
}

+ (id)loadSync:(id)a3 withPurpose:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "loadSync:allowingDifferences:withPurpose:error:", a3, 0, a4, a5);
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "loadSync:allowingDifferences:withPurpose:error:", a3, a4, 0, a5);
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 withPurpose:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFAllocator *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v10, "assetType");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v13, "AssetType", (const char *)objc_msgSend(v14, "UTF8String"));

  v74 = v12;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "encodeAsPlist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    addObjectToMessage(v19, v13, "loadAssetIdLength", "loadAssetId");
    xpc_dictionary_set_uint64(v13, "messageAction", 0x1BuLL);
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v71 = getprogname();
    v21 = objc_retainAutorelease((id)CFStringCreateWithFormat(v20, 0, CFSTR("%s")));
    xpc_dictionary_set_string(v13, "clientName", (const char *)-[__CFString UTF8String](v21, "UTF8String"));
    if (v12)
      xpc_dictionary_set_string(v13, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    if (!v11)
    {
      +[MAAssetDiff defaultAllowedDifferences](MAAssetDiff, "defaultAllowedDifferences");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v75 = v11;
    objc_msgSend(v11, "encodeAsPlist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = addObjectToMessage(v22, v13, "allowedDifferencesLength", "allowedDifferences");
    v76 = 12;
    _getCommsManager(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MAAsset loadSync:allowingDifferences:withPurpose:error:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v13, &v76, 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v76;
    if (v76 != 1)
    {
      objc_msgSend(a1, "getLoadResultFromMessage:", v33);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v52;
      if (v52)
      {
        objc_msgSend(v52, "absoluteAssetId");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "description");
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v45 = CFSTR("nothing");
      }
      if (v38 == 14)
      {
        objc_msgSend(v46, "absoluteAssetId");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "diffFrom:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", CFSTR("Asset load result for %@: %ld (MAQueryHasAllowedDifferences). Found match %@ within allowed differences %@ (actual differences were %@)"), v60, v61, v62, v63, (uint64_t)v10);
      }
      else
      {
        if (!v38)
        {
          _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", CFSTR("Asset load result for %@: %ld (MAQuerySuccessful). Found %@."), v53, v54, v55, v56, (uint64_t)v10);
          goto LABEL_24;
        }
        stringForMAQueryResult(v38);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", CFSTR("Asset load result for %@: %ld (%@)"), v64, v65, v66, v67, (uint64_t)v10);
      }

      goto LABEL_24;
    }
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", CFSTR("Asset load failed due to XPC"), v34, v35, v36, v37, (uint64_t)v71);
    if (!a6)
    {
      v45 = 0;
      v46 = 0;
      goto LABEL_24;
    }
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 1, CFSTR("Asset load failed due to an XPC error"), v39, v40, v41, v42, v43, v72);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = 0;
  }
  else
  {
    v75 = v11;
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", CFSTR("Asset load failed due to nil or invalid type"), v15, v16, v17, v18, v70);
    if (!a6)
    {
      v45 = 0;
      v21 = 0;
      v46 = 0;
      v33 = 0;
      v19 = 0;
      v22 = 0;
      goto LABEL_24;
    }
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 8, CFSTR("Asset load failed due to the absoluteId being nil or the wrong type"), v47, v48, v49, v50, v51, v73);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v21 = 0;
    v46 = 0;
    v33 = 0;
    v19 = 0;
    v22 = 0;
  }
  *a6 = v44;
LABEL_24:
  v68 = v46;

  return v68;
}

- (BOOL)nonUserInitiatedDownloadsAllowed
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_assetId, "hash");
}

- (id)assetServerUrl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("__RelativePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = 0;
    goto LABEL_5;
  }
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("__BaseURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v7 = v6;

  return v7;
}

- (void)attachProgressCallBack:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  _getCommsManager((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachProgressHandler:assetId:callBack:withPurpose:", self->_assetType, self->_assetId, v4, self->_purpose);

}

- (id)assetProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assetType: \"%@\"; assetId: %@ State: %ld"),
               self->_assetType,
               self->_assetId,
               self->_state);
}

- (void)logAsset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12[2];
  void *v13;

  *(_OWORD *)v12 = *(_OWORD *)&self->_assetId;
  purposeDirectoryName(self->_purpose);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset logAsset]", CFSTR("assetId: %@ State: %ld attributes: %@ purpose: %@"), v3, v4, v5, v6, (uint64_t)v12[0]);

  if (-[MAAsset wasLocal](self, "wasLocal"))
  {
    -[MAAsset getLocalUrl](self, "getLocalUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset logAsset]", CFSTR("The asset is installed at: %@"), v7, v8, v9, v10, (uint64_t)v13);

  }
}

- (id)absoluteAssetId
{
  MAAbsoluteAssetId *v3;
  void *v4;
  void *v5;
  void *v6;
  MAAbsoluteAssetId *v7;

  v3 = [MAAbsoluteAssetId alloc];
  -[MAAsset assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:](v3, "initWithAssetId:forAssetType:attributes:", v4, v5, v6);

  return v7;
}

- (void)startDownloadWithExtractor:(id)a3 completion:(id)a4
{
  -[MAAsset startDownloadWithExtractor:options:completion:](self, "startDownloadWithExtractor:options:completion:", a3, 0, a4);
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke;
  v10[3] = &unk_1E5D5DA40;
  v11 = v8;
  v9 = v8;
  -[MAAsset startDownloadWithExtractor:options:completionWithError:](self, "startDownloadWithExtractor:options:completionWithError:", a3, a4, v10);

}

uint64_t __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1AF44EE58]();
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("_Measurement"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset hashToString:](self, "hashToString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("_UnarchivedSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("_LengthOfDataRange"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12 && v14 && v13)
  {
    (*((void (**)(id, _QWORD, uint64_t, void *, _QWORD, _QWORD))v17 + 2))(v17, 0, 2, v12, (int)objc_msgSend(v14, "intValue"), (int)objc_msgSend(v13, "intValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAsset commonAssetDownload:options:then:](self, "commonAssetDownload:options:then:", v16, v8, v9);

  }
  else
  {
    -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:](self, "invokeClientDownloadCompletion:asset:completionBlockWithError:", 3, self, v9);
  }

  objc_autoreleasePoolPop(v10);
}

- (id)hashToString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v4 + v6++));
    while (objc_msgSend(v3, "length") > v6);
  }

  return v5;
}

- (void)startDownload:(id)a3
{
  -[MAAsset startDownload:then:](self, "startDownload:then:", 0, a3);
}

- (void)startDownload:(id)a3 then:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__MAAsset_startDownload_then___block_invoke;
  v8[3] = &unk_1E5D5DA40;
  v9 = v6;
  v7 = v6;
  -[MAAsset startDownload:completionWithError:](self, "startDownload:completionWithError:", a3, v8);

}

uint64_t __30__MAAsset_startDownload_then___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startDownload:(id)a3 completionWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1AF44EE58]();
  -[MAAsset commonAssetDownload:options:then:](self, "commonAssetDownload:options:then:", 0, v8, v6);
  objc_autoreleasePoolPop(v7);

}

- (int64_t)calculateTimeout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("_DownloadSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return calculateTimeout(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)_invokeClientDownloadCompletionAlreadyOnQueue:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  void (**v7)(id, int64_t, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v7 = (void (**)(id, int64_t, void *))a5;
  _getClientCallbackQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (isDownloadResultFailure(a3))
  {
    errorStringForMADownloadResult(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying(a3, 0, CFSTR("%@ (Asset download for %@ %@)"), v11, v12, v13, v14, v15, (uint64_t)v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v7[2](v7, a3, v16);

}

- (void)invokeClientDownloadCompletion:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  _getClientCallbackQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke;
  v13[3] = &unk_1E5D5DA68;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeClientDownloadCompletionAlreadyOnQueue:asset:completionBlockWithError:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)commonAssetDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t state;
  MAAsset *v16;
  uint64_t v17;
  MAAsset *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *assetId;
  NSString *assetType;
  NSString *purpose;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_assetId && self->_assetType)
  {
    if (!self->_purpose || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MAAsset assetProperty:](self, "assetProperty:", CFSTR("__BaseURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAsset assetProperty:](self, "assetProperty:", CFSTR("__RelativePath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("_DownloadSize"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "longLongValue");

      state = self->_state;
      if (state == 6)
      {
        v16 = self;
        v17 = 29;
      }
      else
      {
        if (state != 5)
        {
          if (v9)
            v20 = v9;
          else
            v20 = (id)objc_opt_new();
          v21 = v20;
          suAssetTypes();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", self->_assetType);

          if (v23)
            objc_msgSend(v9, "setAllowDaemonConnectionRetries:", 1);
          if (objc_msgSend(v9, "discretionary")
            && !-[MAAsset nonUserInitiatedDownloadsAllowed](self, "nonUserInitiatedDownloadsAllowed"))
          {
            _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]", CFSTR("Cannot download %@ %@ unless the download is user-initiated (non-discretionary) as the user has turned off background system file updates (check first if nonUserInitiatedDownloadsAllowed)."), v24, v25, v26, v27, (uint64_t)self->_assetType);
            -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:](self, "invokeClientDownloadCompletion:asset:completionBlockWithError:", 34, self, v10);

            goto LABEL_27;
          }
          if (objc_msgSend(v21, "timeoutIntervalForResource") == -1)
            objc_msgSend(v21, "setTimeoutIntervalForResource:", -[MAAsset calculateTimeout](self, "calculateTimeout"));
          v38 = v14;
          v39 = v11;
          -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("__CanUseLocalCacheServer"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_opt_respondsToSelector();
          if (v9 && (v29 & 1) != 0)
          {
            objc_msgSend(v21, "setCanUseLocalCacheServer:", objc_msgSend(v28, "BOOLValue"));
            v30 = objc_msgSend(v21, "canUseLocalCacheServer");
            _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]", CFSTR("The cache server is: %d"), v31, v32, v33, v34, v30);
          }
          assetType = self->_assetType;
          assetId = self->_assetId;
          v11 = v21;
          purpose = self->_purpose;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __44__MAAsset_commonAssetDownload_options_then___block_invoke;
          v40[3] = &unk_1E5D5DA90;
          v40[4] = self;
          v41 = v10;
          _MAsendDownloadAsset(v11, assetType, assetId, v38, v39, v12, 0, v8, purpose, v40);

          goto LABEL_26;
        }
        v16 = self;
        v17 = 15;
      }
      -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:](v16, "invokeClientDownloadCompletion:asset:completionBlockWithError:", v17, self, v10);

LABEL_26:
      goto LABEL_27;
    }
    v18 = self;
    v19 = 74;
  }
  else
  {
    v18 = self;
    v19 = 23;
  }
  -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:](v18, "invokeClientDownloadCompletion:asset:completionBlockWithError:", v19, self, v10);
LABEL_27:

}

void __44__MAAsset_commonAssetDownload_options_then___block_invoke(uint64_t a1, void *a2)
{
  int64_t int64;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict)
  {
    if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      int64 = 1;
      stringForMADownloadResult(1uLL);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", CFSTR("Error on the download asset reply for %@, response: %ld (%@)"), v16, v17, v18, v19, v15);
    }
    else
    {
      int64 = xpc_dictionary_get_int64(xdict, "Result");
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      stringForMADownloadResult(int64);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", CFSTR("Got the download asset reply for %@, response: %ld (%@)"), v6, v7, v8, v9, v4);
    }
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    int64 = 1;
    stringForMADownloadResult(1uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", CFSTR("Error on the download asset reply for %@, response: %ld (%@) due to no xpc message"), v11, v12, v13, v14, v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invokeClientDownloadCompletionAlreadyOnQueue:asset:completionBlockWithError:", int64, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)startCatalogDownload:(id)a3 then:(id)a4
{
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", a3, 0, a4);
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3;
  v4[3] = &unk_1E5D5DAB8;
  v7 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  _MAsendDownloadMetaData(v5, v3, v4);

}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  xpc_object_t xdict;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  xdict = v3;
  if (v3)
  {
    if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = xpc_dictionary_get_int64(xdict, "Result");
      if (!isDownloadResultFailure(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)))
      {
        v4 = a1[4];
        stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", CFSTR("Got the retry download meta data reply for %@, response: %ld (%@)"), v6, v7, v8, v9, v4);
        v10 = 0;
        goto LABEL_8;
      }
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    errorStringForMADownloadResult(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying(v23, 0, CFSTR("%@ (Catalog download for %@)"), v25, v26, v27, v28, v29, (uint64_t)v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = a1[4];
    stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", CFSTR("Error on the retry download meta data reply for %@, response: %ld (%@)"), v31, v32, v33, v34, v30);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 24;
    v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    errorStringForMADownloadResult(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying(v11, 0, CFSTR("%@ (Catalog download for %@)"), v13, v14, v15, v16, v17, (uint64_t)v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = a1[4];
    stringForMADownloadResult(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", CFSTR("Error on the retry download meta data reply for %@, response: %ld (%@) due to not having an xpc message"), v19, v20, v21, v22, v18);
  }
LABEL_8:

  v35 = a1[5];
  if (v35)
    (*(void (**)(uint64_t, _QWORD, void *))(v35 + 16))(v35, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), v10);

}

- (void)purge:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __17__MAAsset_purge___block_invoke;
  v6[3] = &unk_1E5D5DA40;
  v7 = v4;
  v5 = v4;
  -[MAAsset purgeWithError:](self, "purgeWithError:", v6);

}

uint64_t __17__MAAsset_purge___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)purgeWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t state;
  NSObject *v7;
  void *v8;
  NSString *assetType;
  NSString *assetId;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF44EE58]();
  state = self->_state;
  if (state != 5)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__MAAsset_purgeWithError___block_invoke_2;
    v11[3] = &unk_1E5D5DA90;
    v11[4] = self;
    v12 = v4;
    _MAsendPurgeAsset(assetType, assetId, state, v11);
    v8 = v12;
    goto LABEL_5;
  }
  if (v4)
  {
    _getClientCallbackQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__MAAsset_purgeWithError___block_invoke;
    block[3] = &unk_1E5D5DB30;
    v14 = v4;
    dispatch_async(v7, block);

    v8 = v14;
LABEL_5:

  }
  objc_autoreleasePoolPop(v5);

}

void __26__MAAsset_purgeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  errorStringForMAPurgeResult(7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MAError(CFSTR("com.apple.MobileAssetError.Purge"), 7, CFSTR("%@"), v3, v4, v5, v6, v7, (uint64_t)v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __26__MAAsset_purgeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t int64;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    int64 = 5;
    stringForMAPurgeResult(5uLL);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2", CFSTR("Error on the purge asset reply for %@, response: %ld (%@) due to XPC_TYPE_ERROR"), v16, v17, v18, v19, v15);

    errorStringForMAPurgeResult(5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Purge"), 5, CFSTR("%@"), v20, v21, v22, v23, v24, (uint64_t)v9);
    goto LABEL_5;
  }
  int64 = xpc_dictionary_get_int64(xdict, "Result");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  stringForMAPurgeResult(int64);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2", CFSTR("Got the purge asset reply for %@, response: %ld (%@)"), v5, v6, v7, v8, v4);

  if (int64)
  {
    errorStringForMAPurgeResult(int64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Purge"), int64, CFSTR("%@"), v10, v11, v12, v13, v14, (uint64_t)v9);
LABEL_5:
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v25 = 0;
LABEL_7:
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
    (*(void (**)(uint64_t, int64_t, void *))(v26 + 16))(v26, int64, v25);

}

- (int64_t)purgeSync
{
  uint64_t v2;
  xpc_object_t v4;
  NSString *purpose;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  unint64_t v29;

  if (self->_state == 5)
    return 7;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v4, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  purpose = self->_purpose;
  if (purpose)
    xpc_dictionary_set_string(v4, "Purpose", -[NSString UTF8String](purpose, "UTF8String"));
  xpc_dictionary_set_uint64(v4, "messageAction", 5uLL);
  xpc_dictionary_set_uint64(v4, "assetState", self->_state);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), getprogname());
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v4, "clientName", (const char *)objc_msgSend(v6, "UTF8String"));
  v29 = 5;
  _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset purgeSync]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v29, 5, v16);

  v2 = v29;
  stringForMAPurgeResult(v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeSync]", CFSTR("Result from purge sync: %ld (%@)"), v18, v19, v20, v21, v2);

  if (v2)
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeSync]", CFSTR("Purge sync check failure server side"), v22, v23, v24, v25, v27);

  return v2;
}

+ (void)cancelCatalogDownload:(id)a3 withPurpose:(id)a4 then:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1AF44EE58]();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke;
  v13[3] = &unk_1E5D5DA90;
  v11 = v7;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  _MAsendCancelDownloadMetaData(v11, (uint64_t)v8, v13);

  objc_autoreleasePoolPop(v10);
}

void __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke", CFSTR("Error on the cancel catalog asset reply"), v3, v4, v5, v6, v11);
  }
  else
  {
    xpc_dictionary_get_int64(xdict, "Result");
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke", CFSTR("Got the cancel catalog reply for %@, response: %ld"), v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)cancelCatalogDownload:(id)a3 then:(id)a4
{
  +[MAAsset cancelCatalogDownload:withPurpose:then:](MAAsset, "cancelCatalogDownload:withPurpose:then:", a3, 0, a4);
}

- (void)cancelDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSString *assetType;
  NSString *assetId;
  NSString *purpose;
  _QWORD v15[5];
  id v16;
  _QWORD block[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF44EE58]();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]", CFSTR("the current state is: %ld"), v6, v7, v8, v9, self->_state);
  if ((unint64_t)(self->_state - 5) > 1)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    purpose = self->_purpose;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __26__MAAsset_cancelDownload___block_invoke_2;
    v15[3] = &unk_1E5D5DA90;
    v15[4] = self;
    v16 = v4;
    _MAsendCancelDownload(assetType, assetId, purpose, v15);
    v11 = v16;
  }
  else
  {
    _getClientCallbackQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__MAAsset_cancelDownload___block_invoke;
    block[3] = &unk_1E5D5CD38;
    block[4] = self;
    v18 = v4;
    dispatch_async(v10, block);

    v11 = v18;
  }

  objc_autoreleasePoolPop(v5);
}

uint64_t __26__MAAsset_cancelDownload___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 5)
    v1 = 6;
  else
    v1 = 7;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v1);
}

void __26__MAAsset_cancelDownload___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t int64;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    stringForMACancelDownloadResult(4uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2", CFSTR("Error on the cancel download asset reply for %@, response: %ld (%@)"), v11, v12, v13, v14, v10);
  }
  else
  {
    int64 = xpc_dictionary_get_int64(xdict, "Result");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    stringForMACancelDownloadResult(int64);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2", CFSTR("Got the cancel download asset reply for %@, response: %ld (%@)"), v6, v7, v8, v9, v4);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)cancelDownloadSync
{
  int64_t state;
  int64_t v3;
  xpc_object_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v24;
  uint64_t v25;

  state = self->_state;
  if ((unint64_t)(state - 5) > 1)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
    xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
    xpc_dictionary_set_uint64(v5, "messageAction", 6uLL);
    v6 = (void *)MEMORY[0x1E0CB3940];
    v24 = getprogname();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%s"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "clientName", (const char *)objc_msgSend(v7, "UTF8String"));
    v25 = 4;
    _getCommsManager(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset cancelDownloadSync]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v16, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v5, &v25, 4, v17);

    v3 = v25;
    if (v25)
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownloadSync]", CFSTR("Cancel sync check failure server side"), v19, v20, v21, v22, (uint64_t)v24);

  }
  else if (state == 5)
  {
    return 6;
  }
  else
  {
    return 7;
  }
  return v3;
}

- (void)configDownload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *assetType;
  NSString *assetId;
  NSString *purpose;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF44EE58]();
  assetType = self->_assetType;
  assetId = self->_assetId;
  purpose = self->_purpose;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__MAAsset_configDownload_completion___block_invoke;
  v13[3] = &unk_1E5D5DA90;
  v13[4] = self;
  v12 = v7;
  v14 = v12;
  _MAsendConfigDownload(assetType, assetId, purpose, v6, v13);

  objc_autoreleasePoolPop(v8);
}

void __37__MAAsset_configDownload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t int64;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke", CFSTR("Error on the cancel download asset reply"), v3, v4, v5, v6, v14);
    int64 = 2;
  }
  else
  {
    int64 = xpc_dictionary_get_int64(xdict, "Result");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    stringForMAOperationResult(int64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke", CFSTR("Got the config download reply for %@, response: %ld (%@)"), v9, v10, v11, v12, v8);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, int64_t))(v13 + 16))(v13, int64);

}

- (int64_t)configDownloadSync:(id)a3
{
  id v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void *v31;
  unint64_t v32;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  if (isWellFormedPurpose(self->_purpose))
  {
    v10 = -[NSString UTF8String](self->_purpose, "UTF8String");
    if (v10)
      xpc_dictionary_set_string(v5, "Purpose", v10);
    xpc_dictionary_set_uint64(v5, "messageAction", 0x13uLL);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), getprogname());
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "clientName", (const char *)objc_msgSend(v11, "UTF8String"));
    objc_msgSend(v4, "encodeAsPlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = addObjectToMessage(v12, v5, "downloadConfigLength", "downloadConfig");
    v32 = 4;
    _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset configDownloadSync:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v21, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v5, &v32, 1, v22);

    v24 = v32;
    if (v32)
    {
      stringForMAOperationResult(v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownloadSync:]", CFSTR("Config download sync check failure server side: %lld (%@)"), v25, v26, v27, v28, v24);

    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownloadSync:]", CFSTR("Config download failure due to invalid purpose"), v6, v7, v8, v9, v30);
    v11 = 0;
    v12 = 0;
    v24 = 2;
  }

  return v24;
}

- (BOOL)overrideGarbageCollectionThreshold:(unint64_t)a3
{
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  unint64_t v29;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  xpc_dictionary_set_uint64(v5, "GCOverrideDays", a3);
  xpc_dictionary_set_uint64(v5, "messageAction", 0x19uLL);
  v29 = 4;
  _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset overrideGarbageCollectionThreshold:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v5, &v29, 1, v15);

  v17 = v29;
  stringForMAOperationResult(v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]", CFSTR("Result from overrideGarbageCollectionThreshold: %ld (%@)"), v18, v19, v20, v21, v17);

  if (v17)
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]", CFSTR("overrideGarbageCollectionThreshold failure server side"), v22, v23, v24, v25, v27);

  return v17 == 0;
}

- (BOOL)spaceCheck:(int64_t *)a3
{
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  BOOL v36;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  int64_t v41;

  v5 = xpc_dictionary_create(0, 0, 0);
  v41 = 0;
  if (determineUnarchiveSizeFromAttributes(self->_attributes, &v41))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend(CFSTR("_UnarchivedSize"), "UTF8String");
    v12 = objc_retainAutorelease(v10);
    xpc_dictionary_set_string(v5, v11, (const char *)objc_msgSend(v12, "UTF8String"));
    xpc_dictionary_set_uint64(v5, "messageAction", 0x11uLL);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), getprogname());
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "clientName", (const char *)objc_msgSend(v13, "UTF8String"));
    v40 = 4;
    _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset spaceCheck:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v22, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v5, &v40, 1, v23);

    v25 = v40;
    stringForMAOperationResult(v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", CFSTR("Result from space check: %ld (%@)"), v26, v27, v28, v29, v25);

    if (v25)
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", CFSTR("Space check failure server side"), v30, v31, v32, v33, v38);
      v34 = 1;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v34 = 0;
      if (!a3)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  v41 = 1000000;
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", CFSTR("Unable to get unarchived size for asset. Using default of %lld for non-local asset."), v6, v7, v8, v9, 1000000);
  v35 = -[MAAsset wasLocal](self, "wasLocal");
  v12 = 0;
  v13 = 0;
  v34 = 2;
  if (v35)
    v34 = 0;
  if (a3)
LABEL_8:
    *a3 = v41;
LABEL_9:
  v36 = v34 == 0;

  return v36;
}

- (BOOL)refreshState
{
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *purpose;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int64_t int64;
  unint64_t v23;
  int64_t state;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *assetType;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v3, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  xpc_dictionary_set_uint64(v3, "messageAction", 8uLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), getprogname());
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v3, "clientName", (const char *)objc_msgSend(v4, "UTF8String"));
  purpose = self->_purpose;
  if (purpose)
  {
    xpc_dictionary_set_string(v3, "Purpose", -[NSString UTF8String](purpose, "UTF8String"));
    if (self->_purpose)
      _MobileAssetLog(0, 7, (uint64_t)"-[MAAsset refreshState]", CFSTR("Refreshing with purpose: %@"), v8, v9, v10, v11, (uint64_t)self->_purpose);
  }
  v43 = 4;
  _getCommsManager((uint64_t)purpose, v5, v6, v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MAAsset refreshState]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v3, &v43, 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v43;
  if (v43)
  {
    stringForMAOperationResult(v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", CFSTR("State refresh failure server side: %ld (%@)"), v17, v18, v19, v20, v16);

  }
  else
  {
    int64 = xpc_dictionary_get_int64(v15, "StateResult");
    if (int64)
    {
      v23 = int64;
      state = self->_state;
      stringForMAAssetState(state);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      stringForMAAssetState(v23);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", CFSTR("Old state: %ld (%@) --> new state: %lld (%@)"), v26, v27, v28, v29, state);

      self->_state = v23;
      _MobileAssetLog(0, 7, (uint64_t)"-[MAAsset refreshState]", CFSTR("Refresh state completed with result:%ld success:%@"), v30, v31, v32, v33, 0);
      v21 = 1;
      goto LABEL_9;
    }
    assetType = self->_assetType;
    stringForMAAssetState(self->_state);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", CFSTR("Could not determine state for %@ asset %@; leaving state the same %ld (%@)."),
      v36,
      v37,
      v38,
      v39,
      (uint64_t)assetType);

  }
  v21 = 0;
LABEL_9:

  return v21;
}

- (NSString)purpose
{
  return self->_purpose;
}

@end
