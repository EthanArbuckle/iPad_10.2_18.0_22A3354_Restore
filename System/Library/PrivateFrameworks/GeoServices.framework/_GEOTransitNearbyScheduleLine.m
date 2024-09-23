@implementation _GEOTransitNearbyScheduleLine

- (_GEOTransitNearbyScheduleLine)initWithDepartureSequenceContainer:(id)a3 departureSequences:(id)a4
{
  id v7;
  id v8;
  _GEOTransitNearbyScheduleLine *v9;
  _GEOTransitNearbyScheduleLine *v10;
  uint64_t v11;
  NSArray *departureSequences;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOTransitNearbyScheduleLine;
  v9 = -[_GEOTransitNearbyScheduleLine init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_departureSequenceContainer, a3);
    v11 = objc_msgSend(v8, "copy");
    departureSequences = v10->_departureSequences;
    v10->_departureSequences = (NSArray *)v11;

  }
  return v10;
}

- (NSArray)artworks
{
  void *v2;
  void *v3;

  -[GEOPDDepartureSequenceContainer labels]((id *)&self->_departureSequenceContainer->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_609);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)displayName
{
  GEOPDDepartureSequenceContainer *departureSequenceContainer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  departureSequenceContainer = self->_departureSequenceContainer;
  if (departureSequenceContainer
    && (-[GEOPDDepartureSequenceContainer _readDisplayName]((uint64_t)self->_departureSequenceContainer),
        departureSequenceContainer->_displayName))
  {
    -[GEOPDDepartureSequenceContainer displayName]((id *)&self->_departureSequenceContainer->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray firstObject](self->_departureSequences, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "line");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    objc_msgSend(v5, "line");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "system");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v4;
}

- (BOOL)isSignificant
{
  GEOPDDepartureSequenceContainer *departureSequenceContainer;

  departureSequenceContainer = self->_departureSequenceContainer;
  return departureSequenceContainer && departureSequenceContainer->_isSignificant;
}

- (NSArray)departureSequences
{
  return self->_departureSequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_departureSequenceContainer, 0);
}

@end
