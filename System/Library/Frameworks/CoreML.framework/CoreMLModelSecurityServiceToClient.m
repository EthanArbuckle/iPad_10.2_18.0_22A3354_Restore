@implementation CoreMLModelSecurityServiceToClient

- (CoreMLModelSecurityServiceToClient)init
{
  CoreMLModelSecurityServiceToClient *v2;
  uint64_t v3;
  NSMutableDictionary *featureProviderMap;
  uint64_t v5;
  NSCountedSet *featureProviderCount;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CoreMLModelSecurityServiceToClient;
  v2 = -[CoreMLModelSecurityServiceToClient init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    featureProviderMap = v2->_featureProviderMap;
    v2->_featureProviderMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    featureProviderCount = v2->_featureProviderCount;
    v2->_featureProviderCount = (NSCountedSet *)v5;

  }
  return v2;
}

- (void)clientFeatureValueForName:(id)a3 uniqueKeyForProvider:(id)a4 withReply:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a4;
  v10 = a3;
  -[CoreMLModelSecurityServiceToClient featureProviderMap](self, "featureProviderMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "featureValueForName:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v12, 0);
}

- (void)clientFeatureNames:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  -[CoreMLModelSecurityServiceToClient featureProviderMap](self, "featureProviderMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "featureNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9, 0);

}

- (NSMutableDictionary)featureProviderMap
{
  return self->_featureProviderMap;
}

- (void)setFeatureProviderMap:(id)a3
{
  objc_storeStrong((id *)&self->_featureProviderMap, a3);
}

- (NSCountedSet)featureProviderCount
{
  return self->_featureProviderCount;
}

- (void)setFeatureProviderCount:(id)a3
{
  objc_storeStrong((id *)&self->_featureProviderCount, a3);
}

- (OS_dispatch_queue)serviceToClientQueue
{
  return self->_serviceToClientQueue;
}

- (void)setServiceToClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToClientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToClientQueue, 0);
  objc_storeStrong((id *)&self->_featureProviderCount, 0);
  objc_storeStrong((id *)&self->_featureProviderMap, 0);
}

@end
