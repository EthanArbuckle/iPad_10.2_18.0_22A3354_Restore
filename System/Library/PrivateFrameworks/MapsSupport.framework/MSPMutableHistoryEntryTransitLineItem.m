@implementation MSPMutableHistoryEntryTransitLineItem

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1EF083980;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntryTransitLineItem)initWithStorage:(id)a3
{
  MSPHistoryEntryStorage *v4;
  MSPTransitStorageLineItem *v5;
  MSPMutableHistoryEntryTransitLineItem *v6;
  MSPMutableHistoryEntryTransitLineItem *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  MSPMutableHistoryEntryTransitLineItem *v12;
  objc_super v14;

  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    -[MSPHistoryEntryStorage setSearchType:](v4, "setSearchType:", 4);
    v5 = objc_alloc_init(MSPTransitStorageLineItem);
    -[MSPHistoryEntryStorage setTransitLineItem:](v4, "setTransitLineItem:", v5);

  }
  v14.receiver = self;
  v14.super_class = (Class)MSPMutableHistoryEntryTransitLineItem;
  v6 = -[MSPMutableHistoryEntry initWithStorage:](&v14, sel_initWithStorage_, v4);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  -[MSPMutableHistoryEntry storage](v6, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "searchType");

  if (v9 != 4)
    goto LABEL_7;
  -[MSPMutableHistoryEntry storage](v7, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitLineItem");
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MSPMutableHistoryEntryTransitLineItem lineItem](self, "lineItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[MSPMutableHistoryEntryTransitLineItem lineItem](self, "lineItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      -[MSPMutableHistoryEntryTransitLineItem lineItem](self, "lineItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "muid");

      if (v11)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_msgSend(v5, "addObject:", CFSTR("lineItem"));
LABEL_7:
  if (objc_msgSend(v5, "count"))
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15[0] = CFSTR("MSPContainerUntransferableObject");
      v15[1] = CFSTR("MSPContainerUnavailableKeys");
      v16[0] = self;
      v16[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 1, v13);
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

- (GEOTransitLineItem)lineItem
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitLineItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitLineItem *)v3;
}

- (void)setLineItem:(id)a3
{
  id v4;
  void *v5;
  MSPTransitStorageLineItem *v6;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v6 = -[MSPTransitStorageLineItem initWithLineItem:]([MSPTransitStorageLineItem alloc], "initWithLineItem:", v4);

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransitLineItem:", v6);

}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v4, "lineItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPMutableHistoryEntryTransitLineItem lineItem](self, "lineItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "muid");
    v8 = v7 == objc_msgSend(v5, "muid");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
