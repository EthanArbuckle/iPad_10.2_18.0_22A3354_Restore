@implementation GEOMapItemVenueInfo

- (GEOMapItemVenueInfo)init
{
  GEOMapItemVenueInfo *result;

  result = (GEOMapItemVenueInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapItemVenueInfo)initWithIdentifier:(id)a3 featureType:(int)a4 filters:(id)a5 parent:(id)a6 contents:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GEOMapItemVenueInfo *v17;
  GEOMapItemVenueInfo *v18;
  uint64_t v19;
  NSArray *filters;
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GEOMapItemVenueInfo;
  v17 = -[GEOMapItemVenueInfo init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_venueIdentifier, a3);
    v18->_venueFeatureType = a4;
    v19 = objc_msgSend(v14, "copy");
    filters = v18->_filters;
    v18->_filters = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_parent, a6);
    objc_storeStrong((id *)&v18->_contents, a7);
  }

  return v18;
}

- (GEOMapItemVenueInfo)initWithVenueInfo:(id)a3
{
  id *v4;
  id *v5;
  GEOMapItemVenueContents *v6;
  void *v7;
  GEOMapItemVenueContents *v8;
  GEOMapItemParentVenue *v9;
  void *v10;
  GEOMapItemParentVenue *v11;
  GEOVenueIdentifier *v12;
  void *v13;
  GEOVenueIdentifier *v14;
  uint64_t v15;
  void *v16;
  GEOMapItemVenueInfo *v17;

  v4 = (id *)a3;
  v5 = v4;
  if (v4
    && (*((_BYTE *)v4 + 76) & 1) != 0
    && (-[GEOPDVenueInfo _readVenueFeatureIds]((uint64_t)v4), objc_msgSend(v5[6], "count")))
  {
    v6 = [GEOMapItemVenueContents alloc];
    -[GEOPDVenueInfo itemList](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GEOMapItemVenueContents initWithItemList:](v6, "initWithItemList:", v7);

    v9 = [GEOMapItemParentVenue alloc];
    -[GEOPDVenueInfo locatedInside](v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOMapItemParentVenue initWithLocatedInsideInfo:](v9, "initWithLocatedInsideInfo:", v10);

    v12 = [GEOVenueIdentifier alloc];
    -[GEOPDVenueInfo venueFeatureIds](v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOVenueIdentifier initWithVenueIdentifiers:](v12, "initWithVenueIdentifiers:", v13);
    v15 = -[GEOPDVenueInfo featureType]((uint64_t)v5);
    -[GEOMapItemVenueInfo _filtersFromVenueInfo:](self, "_filtersFromVenueInfo:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEOMapItemVenueInfo initWithIdentifier:featureType:filters:parent:contents:](self, "initWithIdentifier:featureType:filters:parent:contents:", v14, v15, v16, v11, v8);

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_filtersFromVenueInfo:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[GEOPDVenueInfo filterElements]((id *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__GEOMapItemVenueInfo__filtersFromVenueInfo___block_invoke;
  v7[3] = &unk_1E1C20C08;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __45__GEOMapItemVenueInfo__filtersFromVenueInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOVenueFilterItem *v4;
  GEOVenueFilterItem *v5;

  v3 = a2;
  v5 = -[GEOVenueFilterItem initWithFilterElementInfo:]([GEOVenueFilterItem alloc], "initWithFilterElementInfo:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (NSArray)filters
{
  return self->_filters;
}

- (GEOMapItemVenueContents)contents
{
  return self->_contents;
}

- (GEOMapItemParentVenue)parent
{
  return self->_parent;
}

- (int)venueFeatureType
{
  return self->_venueFeatureType;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
}

@end
