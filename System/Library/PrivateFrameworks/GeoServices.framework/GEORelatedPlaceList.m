@implementation GEORelatedPlaceList

- (NSArray)mapIdentifiers
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_placeTemplates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "mapItemIdentifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "mapItemIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (int)type
{
  if ((self->_type - 1) >= 4)
    return 0;
  else
    return self->_type;
}

- (GEORelatedPlaceList)initWithTemplates:(id)a3 type:(int)a4 hasInitialData:(BOOL)a5 numberOfInlineItem:(unint64_t)a6 followUpRequestMetadata:(id)a7
{
  id v12;
  id v13;
  GEORelatedPlaceList *v14;
  GEORelatedPlaceList *v15;
  uint64_t v16;
  NSArray *placeTemplates;
  objc_super v19;

  v12 = a3;
  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEORelatedPlaceList;
  v14 = -[GEORelatedPlaceList init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_hasInitialData = a5;
    v16 = objc_msgSend(v12, "copy");
    placeTemplates = v15->_placeTemplates;
    v15->_placeTemplates = (NSArray *)v16;

    v15->_type = a4;
    v15->_numberOfInlineItems = a6;
    objc_storeStrong((id *)&v15->_followUpRequestMetadata, a7);
  }

  return v15;
}

- (GEORelatedPlaceList)initWithRelatedPlace:(id)a3
{
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOPlaceTemplate *v12;
  GEOPlaceTemplate *v13;
  void *v14;
  GEORelatedPlaceList *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[GEOPDRelatedPlace mapsIds](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [GEOPlaceTemplate alloc];
        v13 = -[GEOPlaceTemplate initWithIdentifier:supportsAreaHighlight:](v12, "initWithIdentifier:supportsAreaHighlight:", v11, 0, (_QWORD)v17);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  v15 = -[GEORelatedPlaceList initWithTemplates:type:hasInitialData:numberOfInlineItem:followUpRequestMetadata:](self, "initWithTemplates:type:hasInitialData:numberOfInlineItem:followUpRequestMetadata:", v14, -[GEOPDRelatedPlace type]((uint64_t)v4), 0, objc_msgSend(v5, "count"), 0);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpRequestMetadata, 0);
  objc_storeStrong((id *)&self->_placeTemplates, 0);
}

- (GEORelatedPlaceList)initWithTemplatePlace:(id)a3 attributedMap:(id)a4
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t i;
  id *v14;
  GEOPlaceTemplate *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  GEOFollowUpRequestMetadata *v19;
  GEOFollowUpRequestMetadata *v20;
  void *v21;
  void *v22;
  GEORelatedPlaceList *v23;
  id v26;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = v5;
  -[GEOPDTemplatePlace templateDatas](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    LOBYTE(v12) = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v14 = *(id **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v15 = -[GEOPlaceTemplate initWithPlaceTemplate:attributionMap:]([GEOPlaceTemplate alloc], "initWithPlaceTemplate:attributionMap:", v14, v6);
        objc_msgSend(v7, "addObject:", v15);
        if (v12)
        {
          -[GEOPDTemplateData footer](v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[GEOPDDataItem type]((uint64_t)v16) != 6;

        }
        else
        {
          v12 = 0;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  v17 = objc_msgSend(v7, "count");
  if (v27)
  {
    if (((_BYTE)v27[7] & 1) != 0)
    {
      v18 = *((unsigned int *)v27 + 13);
      if (objc_msgSend(v7, "count") >= v18)
        v17 = *((unsigned int *)v27 + 13);
    }
  }
  -[GEOPDTemplatePlace followUpRequestMetadata](v27);
  v19 = (GEOFollowUpRequestMetadata *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = [GEOFollowUpRequestMetadata alloc];
    -[GEOPDTemplatePlace followUpRequestMetadata](v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[GEOFollowUpRequestMetadata initWithGEOPDFollowUpRequestMetadata:](v20, "initWithGEOPDFollowUpRequestMetadata:", v21);

  }
  v22 = (void *)objc_msgSend(v7, "copy", self);
  v23 = (GEORelatedPlaceList *)objc_msgSend(v26, "initWithTemplates:type:hasInitialData:numberOfInlineItem:followUpRequestMetadata:", v22, 4, v12, v17, v19);

  return v23;
}

- (NSArray)placeTemplates
{
  return self->_placeTemplates;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (unint64_t)numberOfInlineItems
{
  return self->_numberOfInlineItems;
}

- (GEOFollowUpRequestMetadata)followUpRequestMetadata
{
  return self->_followUpRequestMetadata;
}

@end
