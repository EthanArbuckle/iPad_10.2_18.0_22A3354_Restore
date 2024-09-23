@implementation MUPlaceEnrichmentAPIController

+ (id)sharedPlaceEnrichmentAPIController
{
  if (qword_1ED01B648 != -1)
    dispatch_once(&qword_1ED01B648, &__block_literal_global_38);
  return (id)_MergedGlobals_129;
}

void __68__MUPlaceEnrichmentAPIController_sharedPlaceEnrichmentAPIController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MUPlaceEnrichmentAPIController initInternal]([MUPlaceEnrichmentAPIController alloc], "initInternal");
  v1 = (void *)_MergedGlobals_129;
  _MergedGlobals_129 = (uint64_t)v0;

}

- (id)initInternal
{
  MUPlaceEnrichmentAPIController *v2;
  uint64_t v3;
  GEOObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceEnrichmentAPIController;
  v2 = -[MUPlaceEnrichmentAPIController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EE27B318, 0);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v3;

  }
  return v2;
}

- (void)configureWithMapItem:(id)a3 traits:(id)a4
{
  id v7;
  GEOMapServiceTraits *v8;
  NSObject *v9;
  void *v10;
  GEOMapServiceTraits *traits;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (GEOMapServiceTraits *)a4;
  if ((-[MKMapItem isEqual:](self->_mapItem, "isEqual:", v7) & 1) == 0)
  {
    MUGetMUPlaceEnrichmentAPIControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_DEBUG, "Configuring API Controller. Identifier: %@", (uint8_t *)&v12, 0xCu);

    }
    objc_storeStrong((id *)&self->_mapItem, a3);
  }
  traits = self->_traits;
  self->_traits = v8;

  self->_state = 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_muid");
  -[MUPlaceEnrichmentAPIController enrichmentData](self, "enrichmentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enrichmentEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("API Controller has mapItem: %llu and enrichment data: %@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)resetConfiguration
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  MKMapItem *mapItem;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MUGetMUPlaceEnrichmentAPIControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MKMapItem _identifier](self->_mapItem, "_identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = self->_state - 1;
    if (v6 > 3)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E2E038F0[v6];
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_DEBUG, "Resetting current state. Identifier: %@. State: %@", (uint8_t *)&v9, 0x16u);

  }
  mapItem = self->_mapItem;
  self->_mapItem = 0;

  self->_state = 1;
  -[MUPlaceEnrichmentAPIController setEnrichmentData:](self, "setEnrichmentData:", 0);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MUGetMUPlaceEnrichmentAPIControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentAPIController adding observer: %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", v4);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MUGetMUPlaceEnrichmentAPIControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentAPIController removing observer: %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);
}

- (void)fetchPlaceEnrichment:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  GEOObserverHashTable *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  GEOObserverHashTable *v27;
  NSObject *v28;
  GEOObserverHashTable *observers;
  void *v30;
  void *v31;
  GEOObserverHashTable *v32;
  void *v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  id v36[2];
  id location;
  uint8_t buf[4];
  GEOObserverHashTable *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (self->_state)
  {
    -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_enrichmentInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_enrichmentInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentAPIController traits](self, "traits");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ticketForPlaceEnrichmentWithEnrichmentInfo:mapsIdentifier:traits:", v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentAPIController setTicket:](self, "setTicket:", v13);

      objc_initWeak(&location, self);
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (char *)os_signpost_id_generate(v14);

      MUGetMUPlaceEnrichmentAPIControllerLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191DB8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "FetchingPlaceEnrichment", ", buf, 2u);
      }

      -[MUPlaceEnrichmentAPIController setState:](self, "setState:", 2);
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_identifier");
        v20 = (GEOObserverHashTable *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_enrichmentInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v20;
        v40 = 2112;
        v41 = v22;
        _os_log_impl(&dword_191DB8000, v18, OS_LOG_TYPE_DEBUG, "Fetching enrichment data for identifier: %@ using enrichment info: %@", buf, 0x16u);

      }
      -[MUPlaceEnrichmentAPIController ticket](self, "ticket");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke;
      v34[3] = &unk_1E2E038B0;
      v36[1] = v15;
      objc_copyWeak(v36, &location);
      v35 = v4;
      objc_msgSend(v23, "submitWithHandler:networkActivity:", v34, 0);

      objc_destroyWeak(v36);
      objc_destroyWeak(&location);
    }
    else
    {
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_identifier");
        v27 = (GEOObserverHashTable *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v27;
        _os_log_impl(&dword_191DB8000, v25, OS_LOG_TYPE_ERROR, "Enrichment Info missing for map item: %@", buf, 0xCu);

      }
      -[MUPlaceEnrichmentAPIController setState:](self, "setState:", 4);
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        observers = self->_observers;
        -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = observers;
        v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_191DB8000, v28, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ missing enrichment info for mapItem: %@", buf, 0x16u);

      }
      v32 = self->_observers;
      -[MUPlaceEnrichmentAPIController mapItem](self, "mapItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOObserverHashTable placeEnrichmentAPIContollerDidFetchEnrichmentData:forMapItem:](v32, "placeEnrichmentAPIContollerDidFetchEnrichmentData:forMapItem:", 0, v33);

      if (v4)
        v4[2](v4);
    }
  }
  else
  {
    MUGetMUPlaceEnrichmentAPIControllerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v24, OS_LOG_TYPE_ERROR, "Trying to fetch enrichment data without configuring", buf, 2u);
    }

  }
}

void __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id *WeakRetained;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MUGetMUPlaceEnrichmentAPIControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FetchingPlaceEnrichment", ", buf, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke_53;
  v27 = &unk_1E2E02648;
  v28 = WeakRetained;
  v29 = *(id *)(a1 + 32);
  v11 = (void (**)(_QWORD))_Block_copy(&v24);
  if (!v5 || v6)
  {
    MUGetMUPlaceEnrichmentAPIControllerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_impl(&dword_191DB8000, v22, OS_LOG_TYPE_ERROR, "API Response for Place Enrichment is invalid. Error: %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "setEnrichmentData:", 0, v24, v25, v26, v27, v28);
    objc_msgSend(WeakRetained, "setState:", 4);
    v11[2](v11);
  }
  else
  {
    objc_msgSend(WeakRetained, "mapItem", v24, v25, v26, v27, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_enrichmentInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "enrichmentEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enrichmentInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEqual:", v13) & 1) != 0)
    {
      objc_msgSend(WeakRetained, "setState:", 3);
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v5;
        _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_DEBUG, "Received enrichment data: %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "setEnrichmentData:", v5);
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = WeakRetained[1];
        objc_msgSend(WeakRetained[2], "_identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v19;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v20;
        _os_log_impl(&dword_191DB8000, v18, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ with this enrichment data: %@ for mapItem: %@", buf, 0x20u);

      }
      objc_msgSend(WeakRetained[1], "placeEnrichmentAPIContollerDidFetchEnrichmentData:forMapItem:", WeakRetained[5], WeakRetained[2]);
      v21 = *(_QWORD *)(a1 + 32);
      if (v21)
        (*(void (**)(uint64_t))(v21 + 16))(v21);
    }
    else
    {
      MUGetMUPlaceEnrichmentAPIControllerLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v13;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_191DB8000, v23, OS_LOG_TYPE_ERROR, "Enrichment Info mismatch. Requested : %@. Received: %@", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "setEnrichmentData:", 0);
      objc_msgSend(WeakRetained, "setState:", 4);
      v11[2](v11);
    }

  }
}

uint64_t __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MUGetMUPlaceEnrichmentAPIControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    objc_msgSend(*(id *)(v3 + 16), "_identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ for mapItem: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "placeEnrichmentAPIContollerDidFetchEnrichmentData:forMapItem:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancelFetchingPlaceEnrichment
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MUGetMUPlaceEnrichmentAPIControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_DEBUG, "Cancelling ticket to fetch enrichnment data.", v5, 2u);
  }

  -[MUPlaceEnrichmentAPIController ticket](self, "ticket");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (id)placeEnrichmentData
{
  void *v2;
  void *v3;

  -[MUPlaceEnrichmentAPIController enrichmentData](self, "enrichmentData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (MKMapServicePlaceEnrichmentTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (GEOEnrichmentData)enrichmentData
{
  return self->_enrichmentData;
}

- (void)setEnrichmentData:(id)a3
{
  objc_storeStrong((id *)&self->_enrichmentData, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentData, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
