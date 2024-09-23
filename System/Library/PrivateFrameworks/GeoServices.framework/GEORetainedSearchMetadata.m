@implementation GEORetainedSearchMetadata

- (GEORetainedSearchMetadata)initWithRetainedSearchMetadata:(id)a3
{
  id v5;
  GEORetainedSearchMetadata *v6;
  GEORetainedSearchMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORetainedSearchMetadata;
  v6 = -[GEORetainedSearchMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_retainedSearchMetadata, a3);

  return v7;
}

- (NSString)_query
{
  id *v2;
  void *v3;

  -[GEORetainedSearchMetadata _retainedSearchMetadata](self, "_retainedSearchMetadata");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRetainedSearchMetadata query](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (NSString)sourceAppID
{
  return -[GEOPDRetainedSearchMetadata sourceAppId]((id *)&self->_retainedSearchMetadata->super.super.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[GEORetainedSearchMetadata _retainedSearchMetadata](self, "_retainedSearchMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithRetainedSearchMetadata:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
}

@end
