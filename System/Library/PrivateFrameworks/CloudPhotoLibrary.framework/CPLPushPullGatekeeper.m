@implementation CPLPushPullGatekeeper

- (CPLPushPullGatekeeper)initWithStore:(id)a3
{
  id v4;
  CPLPushPullGatekeeper *v5;
  CPLPushPullGatekeeper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPushPullGatekeeper;
  v5 = -[CPLPushPullGatekeeper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_store, v4);

  return v6;
}

- (int64_t)checkPushedChange:(id)a3
{
  return 0;
}

- (CPLEngineStore)store
{
  return (CPLEngineStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
}

@end
