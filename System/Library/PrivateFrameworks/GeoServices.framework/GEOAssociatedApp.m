@implementation GEOAssociatedApp

- (GEOAssociatedApp)initWithGEOPDAssociatedApp:(id)a3
{
  id v5;
  GEOAssociatedApp *v6;
  GEOAssociatedApp *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAssociatedApp;
  v6 = -[GEOAssociatedApp init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geoAssociatedApp, a3);

  return v7;
}

- (BOOL)hasPreferredAppAdamId
{
  uint64_t v2;
  _QWORD *v3;
  BOOL v4;

  -[GEOAssociatedApp geoAssociatedApp](self, "geoAssociatedApp");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)v2;
  if (v2)
  {
    -[GEOPDAssociatedApp _readPreferredAppAdamId](v2);
    v4 = v3[4] != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)preferredAppAdamId
{
  id *v2;
  void *v3;

  -[GEOAssociatedApp geoAssociatedApp](self, "geoAssociatedApp");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAssociatedApp preferredAppAdamId](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)alternateAppAdamIds
{
  id *v2;
  void *v3;

  -[GEOAssociatedApp geoAssociatedApp](self, "geoAssociatedApp");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAssociatedApp alternateAppAdamIds](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOPDAssociatedApp)geoAssociatedApp
{
  return self->_geoAssociatedApp;
}

- (void)setGeoAssociatedApp:(id)a3
{
  objc_storeStrong((id *)&self->_geoAssociatedApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAssociatedApp, 0);
}

@end
