@implementation MADEmbeddingStoreServiceProxy

- (MADEmbeddingStoreServiceProxy)initWithService:(id)a3
{
  id v4;
  MADEmbeddingStoreServiceProxy *v5;
  MADEmbeddingStoreServiceProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADEmbeddingStoreServiceProxy;
  v5 = -[MADEmbeddingStoreServiceProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end
