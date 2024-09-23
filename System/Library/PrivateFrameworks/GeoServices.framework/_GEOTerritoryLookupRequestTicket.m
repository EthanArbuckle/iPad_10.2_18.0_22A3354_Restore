@implementation _GEOTerritoryLookupRequestTicket

- (_GEOTerritoryLookupRequestTicket)initWithLatLngs:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOLatLngE7 *v16;
  id v17;
  _GEOTerritoryLookupRequestTicket *v18;
  uint64_t v19;
  NSArray *originalLatLngs;
  uint64_t v21;
  NSArray *originalLatLngsE7;
  _GEOTerritoryLookupRequestTicket *v23;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = -[GEOLatLngE7 initWithLatLng:]([GEOLatLngE7 alloc], "initWithLatLng:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15));
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v17 = -[GEOPDPlaceRequest initForTerritoryForLatLngsE7:traits:]([GEOPDPlaceRequest alloc], "initForTerritoryForLatLngsE7:traits:", v10, v9);
  v25.receiver = self;
  v25.super_class = (Class)_GEOTerritoryLookupRequestTicket;
  v18 = -[_GEOPlaceRequestTicket initWithRequest:traits:](&v25, sel_initWithRequest_traits_, v17, v9);
  if (v18)
  {
    v19 = objc_msgSend(v11, "copy");
    originalLatLngs = v18->_originalLatLngs;
    v18->_originalLatLngs = (NSArray *)v19;

    v21 = objc_msgSend(v10, "copy");
    originalLatLngsE7 = v18->_originalLatLngsE7;
    v18->_originalLatLngsE7 = (NSArray *)v21;

    v18->_shiftLocationsIfNeeded = a4;
    v23 = v18;
  }

  return v18;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  NSArray *originalLatLngsE7;
  dispatch_group_t v19;
  GEOLocationShifter *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *global_queue;
  id v26;
  GEOLocationShifter *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  void (**v34)(_QWORD);
  _QWORD *v35;
  _QWORD v36[5];
  NSObject *v37;
  GEOLocationShifter *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    v12 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v54[3] = &unk_1E1C067D8;
    v54[4] = self;
    v13 = v10;
    v55 = v13;
    v14 = v9;
    v56 = v14;
    v15 = v11;
    v57 = v15;
    v16 = MEMORY[0x18D765024](v54);
    v17 = (void (**)(_QWORD))v16;
    if (self->_shiftLocationsIfNeeded)
    {
      v30 = v10;
      v48 = 0;
      v49 = &v48;
      v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__18;
      v52 = __Block_byref_object_dispose__18;
      v53 = 0;
      originalLatLngsE7 = self->_originalLatLngsE7;
      v47[0] = v12;
      v47[1] = 3221225472;
      v47[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_606;
      v47[3] = &unk_1E1C06800;
      v47[4] = self;
      v47[5] = &v48;
      -[NSArray enumerateObjectsUsingBlock:](originalLatLngsE7, "enumerateObjectsUsingBlock:", v47);
      if (objc_msgSend((id)v49[5], "count"))
      {
        v29 = (void *)geo_isolater_create();
        v28 = (void *)-[NSArray mutableCopy](self->_originalLatLngsE7, "mutableCopy");
        v45[0] = 0;
        v45[1] = v45;
        v45[2] = 0x3032000000;
        v45[3] = __Block_byref_object_copy__18;
        v45[4] = __Block_byref_object_dispose__18;
        v46 = 0;
        v19 = dispatch_group_create();
        v20 = objc_alloc_init(GEOLocationShifter);
        v21 = (void *)v49[5];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2_611;
        v36[3] = &unk_1E1C068C8;
        v36[4] = self;
        v22 = v19;
        v37 = v22;
        v27 = v20;
        v38 = v27;
        v39 = v13;
        v23 = v29;
        v40 = v23;
        v24 = v28;
        v41 = v24;
        v42 = v15;
        v43 = v45;
        v44 = &v48;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v36);
        global_queue = geo_get_global_queue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_613;
        block[3] = &unk_1E1C068F0;
        v35 = v45;
        v32 = v24;
        v33 = v14;
        block[4] = self;
        v34 = v17;
        v26 = v24;
        dispatch_group_notify(v22, global_queue, block);

        _Block_object_dispose(v45, 8);
      }
      else
      {
        v17[2](v17);
      }
      _Block_object_dispose(&v48, 8);

      v10 = v30;
    }
    else
    {
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLatLngsE7, 0);
  objc_storeStrong((id *)&self->_originalLatLngs, 0);
}

@end
