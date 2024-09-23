@implementation GEOResultRefinementSortElement

- (GEOResultRefinementSortElement)initWithDisplayName:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  GEOResultRefinementSortElement *v8;
  uint64_t v9;
  NSString *displayName;
  GEOResultRefinementSortElement *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOResultRefinementSortElement;
    v8 = -[GEOResultRefinementSortElement init](&v13, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v9;

      objc_storeStrong((id *)&v8->_metadata, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GEOResultRefinementSortElement)initWithResultRefinementSortElement:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  GEOResultRefinementSortElement *v7;

  v4 = (id *)a3;
  -[GEOPDResultRefinementSortElement displayName](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSortElement metadata](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEOResultRefinementSortElement initWithDisplayName:metadata:](self, "initWithDisplayName:metadata:", v5, v6);
  return v7;
}

- (id)convertToGEOPDResultRefinementSortElement
{
  GEOPDResultRefinementSortElement *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(GEOPDResultRefinementSortElement);
  -[GEOResultRefinementSortElement displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSortElement setDisplayName:]((uint64_t)v3, v4);

  -[GEOResultRefinementSortElement metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSortElement setMetadata:]((uint64_t)v3, v5);

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
