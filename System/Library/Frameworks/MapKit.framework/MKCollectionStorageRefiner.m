@implementation MKCollectionStorageRefiner

- (MKCollectionStorageRefiner)initWithCollectionURL:(id)a3
{
  id v4;
  _MKURLParser *v5;
  MKCollectionStorageRefiner *v6;
  MKCollectionStorageRefiner *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[_MKURLParser initWithURL:]([_MKURLParser alloc], "initWithURL:", v4);

  -[_MKURLParser parseIncludingCustomParameters:](v5, "parseIncludingCustomParameters:", 1);
  -[_MKURLParser collectionStorage](v5, "collectionStorage");
  v6 = (MKCollectionStorageRefiner *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKCollectionStorageRefiner;
    v7 = -[MKCollectionStorageRefiner init](&v10, sel_init);
    if (v7)
    {
      -[_MKURLParser collectionStorage](v5, "collectionStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKCollectionStorageRefiner _sharedInitWithCollectionStorage:](v7, "_sharedInitWithCollectionStorage:", v8);

    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (MKCollectionStorageRefiner)initWithCollectionStorage:(id)a3
{
  id v4;
  MKCollectionStorageRefiner *v5;
  MKCollectionStorageRefiner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKCollectionStorageRefiner;
  v5 = -[MKCollectionStorageRefiner init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MKCollectionStorageRefiner _sharedInitWithCollectionStorage:](v5, "_sharedInitWithCollectionStorage:", v4);

  return v6;
}

- (void)_sharedInitWithCollectionStorage:(id)a3
{
  GEOURLCollectionStorage *v4;
  GEOURLCollectionStorage *collectionStorage;

  self->_lock._os_unfair_lock_opaque = 0;
  v4 = (GEOURLCollectionStorage *)objc_msgSend(a3, "copy");
  collectionStorage = self->_collectionStorage;
  self->_collectionStorage = v4;

}

- (void)fetchMapItems:(id)a3
{
  -[MKCollectionStorageRefiner fetchMapItems:traits:](self, "fetchMapItems:traits:", a3, 0);
}

- (void)fetchMapItems:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MKMapItemIdentifier *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CLLocationDegrees v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _UNKNOWN **v29;
  id v30;
  void *v31;
  void *v32;
  CLLocationDegrees v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  NSObject *group;
  id v47;
  MKCollectionStorageRefiner *v48;
  void *v49;
  uint64_t v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  NSObject *v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  CLLocationCoordinate2D v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v47 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = self;
  -[GEOURLCollectionStorage places](self->_collectionStorage, "places");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  v9 = &off_1E20D4000;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v70 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:coordinate:", objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "muid"), -180.0, -180.0);
        v14 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:]([MKMapItemIdentifier alloc], "initWithGEOMapItemIdentifier:", v13);
        objc_msgSend(v6, "addObject:", v14);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[GEOURLCollectionStorage places](v48->_collectionStorage, "places");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v18)
  {
    v19 = v18;
    v50 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v66 != v50)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        if (objc_msgSend(v21, "hasMuid"))
        {
          v22 = (void *)objc_msgSend(objc_alloc((Class)v9[447]), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v21, "muid"), objc_msgSend(v21, "providerId"), -180.0, -180.0);
          objc_msgSend(v16, "addObject:", v22);
        }
        else
        {
          if (!objc_msgSend(v21, "hasCoordinate"))
            continue;
          objc_msgSend(v21, "name");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v64.latitude = 0.0;
          v64.longitude = 0.0;
          objc_msgSend(v21, "coordinate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lat");
          v25 = v24;
          objc_msgSend(v21, "coordinate");
          v26 = v19;
          v27 = v17;
          v28 = v15;
          v29 = v9;
          v30 = v6;
          v31 = v16;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "lng");
          v64 = CLLocationCoordinate2DMake(v25, v33);

          +[MKMapService sharedService](MKMapService, "sharedService");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "address");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", &v64, v35, 0, v47);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v31;
          v6 = v30;
          v9 = v29;
          v15 = v28;
          v17 = v27;
          v19 = v26;

          dispatch_group_enter(group);
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke;
          v59[3] = &unk_1E20D8DF0;
          v59[4] = v48;
          v60 = v49;
          v61 = v45;
          v62 = v15;
          v63 = group;
          v36 = v49;
          objc_msgSend(v22, "submitWithHandler:networkActivity:", v59, 0);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v19);
  }

  v37 = objc_msgSend(v16, "count");
  v38 = MEMORY[0x1E0C809B0];
  if (v37)
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "ticketForIdentifiers:traits:", v16, v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_group_enter(group);
    v55[0] = v38;
    v55[1] = 3221225472;
    v55[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_2;
    v55[3] = &unk_1E20D8E18;
    v55[4] = v48;
    v56 = v45;
    v57 = v15;
    v58 = group;
    objc_msgSend(v40, "submitWithHandler:networkActivity:", v55, 0);

  }
  block[0] = v38;
  block[1] = 3221225472;
  block[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_3;
  block[3] = &unk_1E20D7F48;
  v53 = v45;
  v54 = v44;
  v52 = v15;
  v41 = v45;
  v42 = v44;
  v43 = v15;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }
  else if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v6, "setName:");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 48);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  if (v2)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);

  }
  else
  {
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v5, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStorage, 0);
}

@end
