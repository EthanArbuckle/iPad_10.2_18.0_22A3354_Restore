@implementation GDSubgraphViewContext

- (id)context
{
  return self->subgraphViewContext;
}

- (GDSubgraphViewContext)initWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  GDSubgraphViewContext *v16;

  v8 = a4;
  v9 = a3;
  objc_msgSend_clientService(GDSwiftViewService, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gdSwiftSubgraphViewContextWithName_tableName_error_(v12, v13, (uint64_t)v9, v8, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    self = (GDSubgraphViewContext *)(id)objc_msgSend_initWithInner_(self, v15, (uint64_t)v14);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GDSubgraphViewContext)initWithInner:(id)a3
{
  id v5;
  GDSubgraphViewContext *v6;
  GDSubgraphViewContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDSubgraphViewContext;
  v6 = -[GDSubgraphViewContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->subgraphViewContext, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->subgraphViewContext, 0);
}

@end
