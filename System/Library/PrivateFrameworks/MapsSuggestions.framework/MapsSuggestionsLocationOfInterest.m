@implementation MapsSuggestionsLocationOfInterest

- (char)hydrateMapItemWithNetworkRequester:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSString *identifierString;
  NSString *preferredName;
  NSObject *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v27 = 1024;
      *(_DWORD *)v28 = 106;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:]";
      v29 = 2082;
      v30 = "nil == (completion)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completionHandler", buf, 0x26u);
    }

    goto LABEL_11;
  }
  if (!self->_mapItemHandle)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      identifierString = self->_identifierString;
      preferredName = self->_preferredName;
      *(_DWORD *)buf = 138412546;
      v26 = (const char *)identifierString;
      v27 = 2112;
      *(_QWORD *)v28 = preferredName;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "LOI with ID: %@, name:%@ has no mapItemHandle. Returning.", buf, 0x16u);
    }

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (self->_mapItem)
  {
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke;
    block[3] = &unk_1E4BCE348;
    v24 = v7;
    dispatch_async(v8, block);

    v9 = 1;
  }
  else
  {
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_identifierString;
      v16 = self->_preferredName;
      *(_DWORD *)buf = 138412546;
      v26 = (const char *)v16;
      v27 = 2112;
      *(_QWORD *)v28 = v17;
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "About to hydrate the mapItem for an LOI with name: %@, identifier: %@", buf, 0x16u);
    }

    -[MapsSuggestionsLocationOfInterest mapItemHandle](self, "mapItemHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_140;
    v19[3] = &unk_1E4BCF048;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    v9 = objc_msgSend(v6, "resolveMapItemHandleData:completion:", v18, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
LABEL_12:

  return v9;
}

uint64_t __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Calling back with a pre-existing mapItem. No need to rehydrate again.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_2;
  v10[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v11 = v6;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = *(char **)(a1 + 32);
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "LOI: Could not resolve mapItemHandle, error: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (objc_msgSend(WeakRetained, "isHomeOrWork")
        && MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
      {
        dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
      }
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsMapItemConvertIfNeeded(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setMapItem:", v7);

      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Successfully retrieved a mapItem on the LOI", (uint8_t *)&v8, 2u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRoutine.mm";
      v10 = 1026;
      v11 = 126;
      v12 = 2082;
      v13 = "-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (NSData)mapItemHandle
{
  return self->_mapItemHandle;
}

- (GEOMapItemStorage)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (NSString)identifierString
{
  return self->_identifierString;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (BOOL)isLOIFromMeCard
{
  return self->_isLOIFromMeCard;
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_identifierString, 0);
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_mapItemHandle, 0);
}

- (MapsSuggestionsLocationOfInterest)initWithLOI:(id)a3
{
  id v4;
  MapsSuggestionsLocationOfInterest *v5;
  void *v6;
  uint64_t v7;
  NSData *mapItemHandle;
  uint64_t v9;
  NSUUID *identifierUUID;
  void *v11;
  uint64_t v12;
  NSString *identifierString;
  uint64_t v14;
  NSString *preferredName;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *addressIdentifier;
  void *v20;
  MapsSuggestionsLocationOfInterest *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsLocationOfInterest;
  v5 = -[MapsSuggestionsLocationOfInterest init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geoMapItemHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    mapItemHandle = v5->_mapItemHandle;
    v5->_mapItemHandle = (NSData *)v7;

    objc_msgSend(v4, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    identifierUUID = v5->_identifierUUID;
    v5->_identifierUUID = (NSUUID *)v9;

    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    identifierString = v5->_identifierString;
    v5->_identifierString = (NSString *)v12;

    objc_msgSend(v4, "preferredName");
    v14 = objc_claimAutoreleasedReturnValue();
    preferredName = v5->_preferredName;
    v5->_preferredName = (NSString *)v14;

    objc_msgSend(v4, "mapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extendedAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addressIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    addressIdentifier = v5->_addressIdentifier;
    v5->_addressIdentifier = (NSString *)v18;

    v5->_isLOIFromMeCard = objc_msgSend(v4, "typeSource") & 1;
    v5->_type = shortcutTypeForRTLOIType(objc_msgSend(v4, "type"));
    objc_msgSend(v4, "visits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visitCount = objc_msgSend(v20, "count");

    v21 = v5;
  }

  return v5;
}

- (BOOL)isHomeOrWork
{
  return -[MapsSuggestionsLocationOfInterest type](self, "type") == 2
      || -[MapsSuggestionsLocationOfInterest type](self, "type") == 3;
}

@end
