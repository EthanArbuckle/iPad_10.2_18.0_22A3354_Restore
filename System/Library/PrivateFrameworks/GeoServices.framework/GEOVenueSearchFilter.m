@implementation GEOVenueSearchFilter

- (GEOVenueSearchFilter)init
{
  GEOVenueSearchFilter *result;

  result = (GEOVenueSearchFilter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOVenueSearchFilter)initWithIdentifier:(id)a3
{
  id v5;
  GEOVenueSearchFilter *v6;
  GEOVenueSearchFilter *v7;
  GEOVenueSearchFilter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOVenueSearchFilter;
  v6 = -[GEOVenueSearchFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  GEOPDSSearchFilter *v7;
  GEOPDSSearchVenueFilter *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (uint64_t)v5;
  if (!v5 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v5), !*(_QWORD *)(v6 + 240)))
  {
    v7 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v6, v7);

  }
  v8 = objc_alloc_init(GEOPDSSearchVenueFilter);
  -[GEOVenueIdentifier placeDataVenueIdentifier](self->_identifier, "placeDataVenueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchVenueFilter setVenueFilter:]((uint64_t)v8, v9);

  if (v8)
  {
    *(_BYTE *)&v8->_flags |= 1u;
    v8->_venueSearchType = 1;
  }
  -[GEOPDSearchParameters searchFilter]((id *)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchFilter setVenueFilter:]((uint64_t)v10, v8);

  return 1;
}

- (GEOVenueIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
