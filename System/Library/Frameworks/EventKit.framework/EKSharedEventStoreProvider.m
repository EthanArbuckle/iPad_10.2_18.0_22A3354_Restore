@implementation EKSharedEventStoreProvider

- (EKSharedEventStoreProvider)initWithEventStore:(id)a3
{
  id v5;
  EKSharedEventStoreProvider *v6;
  EKSharedEventStoreProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKSharedEventStoreProvider;
  v6 = -[EKSharedEventStoreProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedEventStore, a3);

  return v7;
}

- (EKEventStore)sharedEventStore
{
  return self->_sharedEventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEventStore, 0);
}

@end
