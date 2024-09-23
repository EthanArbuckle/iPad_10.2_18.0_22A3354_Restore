@implementation GEOPublisherViewResult

- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3 withPlaces:(id)a4
{
  id *v7;
  id v8;
  GEOPublisherViewResult *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  GEOPublisherViewResult *v13;
  objc_super v15;

  v7 = (id *)a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPublisherViewResult;
  v9 = -[GEOPublisherViewResult init](&v15, sel_init);
  if (!v9)
    goto LABEL_5;
  -[GEOPDPublisherViewResult collectionIds](v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

    goto LABEL_7;
  }
  -[GEOPDPublisherViewResult resultFilters](v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v9->_publisherViewResult, a3);
  objc_storeStrong((id *)&v9->_places, a4);
LABEL_5:
  v13 = v9;
LABEL_8:

  return v13;
}

- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3
{
  id *v5;
  GEOPublisherViewResult *v6;
  void *v7;
  uint64_t v8;
  GEOPublisherViewResult *v9;
  objc_super v11;

  v5 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPublisherViewResult;
  v6 = -[GEOPublisherViewResult init](&v11, sel_init);
  if (v6)
  {
    -[GEOPDPublisherViewResult collectionIds](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_publisherViewResult, a3);
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (NSArray)collectionIdentifiers
{
  void *v2;
  void *v3;

  -[GEOPDPublisherViewResult collectionIds]((id *)&self->_publisherViewResult->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)resultFilters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOPublisherViewResultFilter *v12;
  GEOPublisherViewResultFilter *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDPublisherViewResult resultFilters]((id *)&self->_publisherViewResult->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDPublisherViewResult resultFilters]((id *)&self->_publisherViewResult->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [GEOPublisherViewResultFilter alloc];
        v13 = -[GEOPublisherViewResultFilter initWithPublisherViewResultFilter:withPlaces:](v12, "initWithPublisherViewResultFilter:withPlaces:", v11, self->_places, (_QWORD)v16);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_publisherViewResult, 0);
}

@end
