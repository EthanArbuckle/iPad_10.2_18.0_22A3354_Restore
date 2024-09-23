@implementation FPUnionCollection

- (FPUnionCollection)initWithCollections:(id)a3
{
  id v4;
  FPUnionCollection *v5;
  uint64_t v6;
  NSArray *collections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUnionCollection;
  v5 = -[FPItemCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    collections = v5->_collections;
    v5->_collections = (NSArray *)v6;

  }
  return v5;
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  _FPUnionDataSource *v4;
  void *v5;
  _FPUnionDataSource *v6;

  v4 = [_FPUnionDataSource alloc];
  -[FPUnionCollection collections](self, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_FPUnionDataSource initWithCollections:](v4, "initWithCollections:", v5);

  return v6;
}

- (NSArray)collections
{
  FPUnionCollection *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_collections;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCollections:(id)a3
{
  FPUnionCollection *v4;
  uint64_t v5;
  NSArray *collections;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v9, "copy");
  collections = v4->_collections;
  v4->_collections = (NSArray *)v5;

  objc_sync_exit(v4);
  if (-[FPItemCollection observing](v4, "observing"))
  {
    -[FPItemCollection dataSource](v4, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1002, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItemCollection dataSource:wasInvalidatedWithError:](v4, "dataSource:wasInvalidatedWithError:", v7, v8);

  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPUnionCollection collections](self, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_map:", &__block_literal_global_24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __32__FPUnionCollection_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
}

@end
