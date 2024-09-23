@implementation DKReportingConcurrentRequestGroup

- (DKReportingConcurrentRequestGroup)init
{
  DKReportingConcurrentRequestGroup *v2;
  uint64_t v3;
  NSMutableSet *resources;
  uint64_t v5;
  NSMutableSet *requests;
  uint64_t v7;
  NSMutableDictionary *requestLookupByGenerator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DKReportingConcurrentRequestGroup;
  v2 = -[DKReportingConcurrentRequestGroup init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    resources = v2->_resources;
    v2->_resources = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    requests = v2->_requests;
    v2->_requests = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    requestLookupByGenerator = v2->_requestLookupByGenerator;
    v2->_requestLookupByGenerator = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (BOOL)addComponentIdentity:(id)a3 usingGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  -[DKReportingConcurrentRequestGroup resources](self, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "intersectsSet:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[DKReportingConcurrentRequestGroup requestLookupByGenerator](self, "requestLookupByGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[DKReportingConcurrentRequest concurrentRequestWithGenerator:](DKReportingConcurrentRequest, "concurrentRequestWithGenerator:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKReportingConcurrentRequestGroup requestLookupByGenerator](self, "requestLookupByGenerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extensionAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    }
    objc_msgSend(v14, "manifest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v11 = v18 == 0;

    if (!v18)
    {
      objc_msgSend(v14, "manifest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v6);

      -[DKReportingConcurrentRequestGroup requests](self, "requests");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v14);

      -[DKReportingConcurrentRequestGroup resources](self, "resources");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resources");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "unionSet:", v22);

    }
  }

  return v11;
}

- (NSMutableSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSMutableDictionary)requestLookupByGenerator
{
  return self->_requestLookupByGenerator;
}

- (void)setRequestLookupByGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_requestLookupByGenerator, a3);
}

- (NSMutableSet)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_requestLookupByGenerator, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
