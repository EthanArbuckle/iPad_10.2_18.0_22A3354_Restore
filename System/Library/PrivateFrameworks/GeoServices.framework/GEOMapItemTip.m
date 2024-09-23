@implementation GEOMapItemTip

- (GEOMapItemTip)initWithGEOPDTip:(id)a3
{
  id v5;
  GEOMapItemTip *v6;
  GEOMapItemTip *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemTip;
  v6 = -[GEOMapItemTip init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geoTip, a3);

  return v7;
}

- (NSString)localizedSnippet
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOMapItemTip geoTip](self, "geoTip");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTip snippets](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasTipTime
{
  _BYTE *v2;
  BOOL v3;

  -[GEOMapItemTip geoTip](self, "geoTip");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[68] & 1;
  else
    v3 = 0;

  return v3;
}

- (double)tipTime
{
  double *v2;
  double v3;

  -[GEOMapItemTip geoTip](self, "geoTip");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[5];
  else
    v3 = 0.0;

  return v3;
}

- (NSString)name
{
  id *v2;
  void *v3;

  -[GEOPDTip tipster]((id *)&self->_geoTip->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTipUser name](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bestImageURL
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOPDTip tipster]((id *)&self->_geoTip->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTipUser image](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasTipId
{
  uint64_t v2;
  _QWORD *v3;
  BOOL v4;

  -[GEOMapItemTip geoTip](self, "geoTip");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)v2;
  if (v2)
  {
    -[GEOPDTip _readTipId](v2);
    v4 = v3[4] != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)tipId
{
  id *v2;
  void *v3;

  -[GEOMapItemTip geoTip](self, "geoTip");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTip tipId](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOPDTip)geoTip
{
  return self->_geoTip;
}

- (void)setGeoTip:(id)a3
{
  objc_storeStrong((id *)&self->_geoTip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoTip, 0);
}

@end
