@implementation MSPMutableHistoryEntryPlaceDisplay

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1EF0838B8;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntryPlaceDisplay)initWithStorage:(id)a3
{
  MSPHistoryEntryStorage *v4;
  MSPPlaceDisplay *v5;
  MSPMutableHistoryEntryPlaceDisplay *v6;
  MSPMutableHistoryEntryPlaceDisplay *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  MSPMutableHistoryEntryPlaceDisplay *v12;
  objc_super v14;

  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    -[MSPHistoryEntryStorage setSearchType:](v4, "setSearchType:", 3);
    v5 = objc_alloc_init(MSPPlaceDisplay);
    -[MSPHistoryEntryStorage setPlaceDisplay:](v4, "setPlaceDisplay:", v5);

  }
  v14.receiver = self;
  v14.super_class = (Class)MSPMutableHistoryEntryPlaceDisplay;
  v6 = -[MSPMutableHistoryEntry initWithStorage:](&v14, sel_initWithStorage_, v4);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  -[MSPMutableHistoryEntry storage](v6, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "searchType");

  if (v9 != 3)
    goto LABEL_7;
  -[MSPMutableHistoryEntry storage](v7, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placeDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
LABEL_6:
    v12 = v7;
  else
LABEL_7:
    v12 = 0;

  return v12;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MSPMutableHistoryEntryPlaceDisplay geoMapItem](self, "geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v5, "addObject:", CFSTR("geoMapItem"));
  -[MSPMutableHistoryEntryPlaceDisplay geoMapItem](self, "geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isValid");

  if ((v8 & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("geoMapItem"));
  if (objc_msgSend(v5, "count"))
  {
    if (a3)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12[0] = CFSTR("MSPContainerUntransferableObject");
      v12[1] = CFSTR("MSPContainerUnavailableKeys");
      v13[0] = self;
      v13[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 1, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
    }
  }
  else
  {
    -[MSPMutableHistoryEntry _markImmutable](self, "_markImmutable");
    a3 = self;
  }

  return a3;
}

- (GEOMapItem)geoMapItem
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeMapItemStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItem *)v4;
}

- (void)setGeoMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForGEOMapItem:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceMapItemStorage:", v7);

}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSPMutableHistoryEntryPlaceDisplay geoMapItem](self, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = GEOMapItemIsEqualToMapItemForPurpose();
  return (char)v4;
}

- (NSUUID)supersededSearchStorageIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supersededSearchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_maps_UUIDWithUUIDString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (void)setSupersededSearchStorageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  objc_msgSend(v4, "UUIDString");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v8, "copy");
  -[MSPMutableHistoryEntry storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSupersededSearchIdentifier:", v5);

}

@end
