@implementation MSPMutableHistoryEntry

+ (Class)immutableObjectClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)immutableObjectProtocol
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (Class)mutableObjectClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)mutableObjectProtocol
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (MSPMutableHistoryEntry)init
{
  return -[MSPMutableHistoryEntry initWithStorage:](self, "initWithStorage:", 0);
}

- (MSPMutableHistoryEntry)initWithStorage:(id)a3
{
  id v4;
  MSPMutableHistoryEntry *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSUUID *storageIdentifier;
  uint64_t v12;
  NSUUID *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSDate *usageDate;
  uint64_t v18;
  NSDate *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSPMutableHistoryEntry;
  v5 = -[MSPMutableHistoryEntry init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithUUIDString:", v9);
      storageIdentifier = v5->_storageIdentifier;
      v5->_storageIdentifier = (NSUUID *)v10;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_storageIdentifier;
      v5->_storageIdentifier = (NSUUID *)v12;

      -[NSUUID UUIDString](v5->_storageIdentifier, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v9);
    }

    v14 = objc_msgSend(v6, "hasTimestamp");
    v15 = (void *)MEMORY[0x1E0C99D68];
    if (v14)
    {
      objc_msgSend(v6, "timestamp");
      objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      v16 = objc_claimAutoreleasedReturnValue();
      usageDate = v5->_usageDate;
      v5->_usageDate = (NSDate *)v16;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_usageDate;
      v5->_usageDate = (NSDate *)v18;

      -[NSDate timeIntervalSinceReferenceDate](v5->_usageDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "setTimestamp:");
    }
    objc_storeStrong((id *)&v5->_storage, v6);
  }
  else
  {
    v6 = v4;
  }

  return v5;
}

- (void)setUsageDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *usageDate;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[MSPHistoryEntryStorage setTimestamp:](self->_storage, "setTimestamp:");
  v5 = (NSDate *)objc_msgSend(v4, "copy");

  usageDate = self->_usageDate;
  self->_usageDate = v5;

}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  id *v6;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  id *v18;
  id *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke;
    v27[3] = &unk_1E66533B8;
    v15 = v27;
    v19 = &v28;
    v28 = v10;
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if (v11)
    {
LABEL_3:
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_2;
      v25[3] = &unk_1E66533E0;
      v16 = v25;
      v18 = &v26;
      v26 = v11;
      if (v12)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  v16 = 0;
  if (v12)
  {
LABEL_4:
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_3;
    v23[3] = &unk_1E6653408;
    v17 = v23;
    v6 = &v24;
    v24 = v12;
    if (v13)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v17 = 0;
  if (v13)
  {
LABEL_5:
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_4;
    v21[3] = &unk_1E6653430;
    v22 = v13;
    -[MSPMutableHistoryEntry ifMutableSearch:ifMutableRoute:ifMutablePlaceDisplay:ifMutableTransitLineItem:](self, "ifMutableSearch:ifMutableRoute:ifMutablePlaceDisplay:ifMutableTransitLineItem:", v15, v16, v17, v21);

    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  -[MSPMutableHistoryEntry ifMutableSearch:ifMutableRoute:ifMutablePlaceDisplay:ifMutableTransitLineItem:](self, "ifMutableSearch:ifMutableRoute:ifMutablePlaceDisplay:ifMutableTransitLineItem:", v15, v16, v17, 0, v18, v19);
  if (v12)
LABEL_6:

LABEL_7:
  if (v11)

  if (v10)
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ifMutableSearch:(id)a3 ifMutableRoute:(id)a4 ifMutablePlaceDisplay:(id)a5 ifMutableTransitLineItem:(id)a6
{
  void (**v10)(id, MSPMutableHistoryEntry *);
  void (**v11)(id, MSPMutableHistoryEntry *);
  void (**v12)(id, MSPMutableHistoryEntry *);
  char isKindOfClass;
  void (**v14)(id, MSPMutableHistoryEntry *);
  char v15;
  char v16;
  char v17;
  void (**v18)(id, MSPMutableHistoryEntry *);

  v18 = (void (**)(id, MSPMutableHistoryEntry *))a3;
  v10 = (void (**)(id, MSPMutableHistoryEntry *))a4;
  v11 = (void (**)(id, MSPMutableHistoryEntry *))a5;
  v12 = (void (**)(id, MSPMutableHistoryEntry *))a6;
  if (v18)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = v18;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;
  }
  if (v10)
  {
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();
    v14 = v10;
    if ((v15 & 1) != 0)
      goto LABEL_9;
  }
  if (v11 && (objc_opt_class(), v16 = objc_opt_isKindOfClass(), v14 = v11, (v16 & 1) != 0)
    || v12 && (objc_opt_class(), v17 = objc_opt_isKindOfClass(), v14 = v12, (v17 & 1) != 0))
  {
LABEL_9:
    v14[2](v14, self);
  }

}

+ (id)mutableHistoryEntryForStorage:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasSearchType") && (v5 = objc_msgSend(v4, "searchType") - 1, v5 <= 4))
    v6 = (void *)objc_msgSend(objc_alloc(*off_1E6653450[v5]), "initWithStorage:", v4);
  else
    v6 = 0;

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutableHistoryEntryForStorage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)copyIfValidWithError:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[MSPMutableHistoryEntry mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "transferToImmutableIfValidWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3
{
  MSPMutableHistoryEntry *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = (MSPMutableHistoryEntry *)a3;
  if (self != v4)
  {
    if (!-[MSPMutableHistoryEntry isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[MSPMutableHistoryEntry storageIdentifier](self, "storageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPMutableHistoryEntry storageIdentifier](v4, "storageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = -[MSPMutableHistoryEntry _isUserVisibleDuplicateOfSameClassObject:](self, "_isUserVisibleDuplicateOfSameClassObject:", v4);
      goto LABEL_7;
    }
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  return 0;
}

- (BOOL)tracksRAPReportingOnly
{
  return -[MSPHistoryEntryStorage tracksRAPRecordingOnly](self->_storage, "tracksRAPRecordingOnly");
}

- (void)setTracksRAPReportingOnly:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  -[MSPHistoryEntryStorage setTracksRAPRecordingOnly:](self->_storage, "setTracksRAPRecordingOnly:", v3);
}

- (void)_markImmutable
{
  self->_immutable = 1;
}

- (void)_noteWillMutate
{
  +[MSPContainer mutableObjectContentDidUpdate:](MSPContainer, "mutableObjectContentDidUpdate:", self);
}

- (id)debugTitle
{
  MSPMutableHistoryEntry *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self;
    -[MSPMutableHistoryEntry routeInformationSource](v3, "routeInformationSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifRidesharingInformationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSPMutableHistoryEntry routeInformationSource](v3, "routeInformationSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "ifGEOStorageRouteRequestStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "_startWaypoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "latLng");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_endWaypoint");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString latLng](v11, "latLng");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Route (ride sharing) from %@ to %@"), v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    if (v7)
    {
      objc_msgSend(v7, "waypoints");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "waypoints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_msgSend(v7, "transportType");
      if (v17 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E6653478[(int)v17];
      }
      objc_msgSend(v9, "latLng");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "latLng");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Route (%@) with waypoints: [ %@ ... %@ ]"), v11, v12, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MSPMutableHistoryEntry geoMapItem](self, "geoMapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        return v13;
      }
      -[MSPMutableHistoryEntry lineItem](self, "lineItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v18;
    objc_msgSend(v18, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    return v13;
  }
  -[MSPMutableHistoryEntry query](self, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPMutableHistoryEntry;
  -[MSPMutableHistoryEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMutableHistoryEntry debugTitle](self, "debugTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@ }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)storageIdentifier
{
  return self->_storageIdentifier;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (BOOL)_isImmutable
{
  return self->_immutable;
}

- (MSPHistoryEntryStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_usageDate, 0);
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
}

@end
