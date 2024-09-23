@implementation SGServiceContext

- (SGServiceContext)initWithStore:(id)a3
{
  id v5;
  SGServiceContext *v6;
  SGServiceContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGServiceContext;
  v6 = -[SGServiceContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (SGSqlEntityStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
