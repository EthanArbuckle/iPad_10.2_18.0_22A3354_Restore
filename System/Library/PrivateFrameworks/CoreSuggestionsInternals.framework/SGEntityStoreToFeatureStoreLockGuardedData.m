@implementation SGEntityStoreToFeatureStoreLockGuardedData

- (id)sgmiFeatureStore
{
  return self->_sgmiFeatureStore;
}

- (void)setSgmiFeatureStore:(id)a3
{
  objc_storeStrong((id *)&self->_sgmiFeatureStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sgmiFeatureStore, 0);
}

@end
