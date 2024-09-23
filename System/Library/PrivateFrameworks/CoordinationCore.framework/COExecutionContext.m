@implementation COExecutionContext

- (COExecutionContext)initWithDispatchQueue:(id)a3
{
  NSObject *v4;
  COExecutionContext *v5;
  uint64_t v6;
  NSDictionary *metadata;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COExecutionContext;
  v5 = -[COExecutionContext init](&v9, sel_init);
  if (v5)
  {
    dispatch_queue_set_specific(v4, "queueSpecificInfo", v4, 0);
    v10 = CFSTR("dispatchQueue");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;

  }
  return v5;
}

- (COExecutionContext)init
{
  return -[COExecutionContext initWithDispatchQueue:](self, "initWithDispatchQueue:", MEMORY[0x24BDAC9B8]);
}

- (COExecutionContext)initWithMetadata:(id)a3
{
  id v4;
  COExecutionContext *v5;
  COExecutionContext *v6;
  uint64_t v7;
  NSDictionary *metadata;

  v4 = a3;
  v5 = -[COExecutionContext init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "copy");
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v7;

  }
  return v6;
}

- (void)dispatchSync:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  void (**block)(void);

  block = (void (**)(void))a3;
  dispatch_get_specific("queueSpecificInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("dispatchQueue"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
  }
  if (v5 == v4)
    block[2]();
  else
    dispatch_sync(v5, block);

}

- (void)dispatchAsync:(id)a3
{
  NSDictionary *metadata;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *queue;

  metadata = self->_metadata;
  v4 = a3;
  -[NSDictionary objectForKey:](metadata, "objectForKey:", CFSTR("dispatchQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    queue = v5;
  }
  else
  {
    queue = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
  }

  dispatch_async(queue, v4);
}

- (void)assertDispatchQueue
{
  NSObject *v2;

  -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("dispatchQueue"));
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

}

- (id)constituentForMe
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextMeshMeConstituentKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)leaderElectionConfigured
{
  void *v2;
  void *v3;
  char v4;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextClusterOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4 & 1;
}

- (id)analyticsRecorder
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("analyticsEventRecorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)networkActivityFactory
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextNetworkActivityFactoryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dispatchQueue
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("dispatchQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)label
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextMeshLabelKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meshName
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextMeshNameKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meshControllerDescription
{
  void *v2;
  void *v3;

  -[COExecutionContext metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COExecutionContextMeshControllerKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COExecutionContext metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  COMutableExecutionContext *v4;
  void *v5;
  void *v6;

  v4 = -[COExecutionContext init](+[COMutableExecutionContext allocWithZone:](COMutableExecutionContext, "allocWithZone:", a3), "init");
  -[COExecutionContext metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[COExecutionContext setMetadata:](v4, "setMetadata:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  COExecutionContext *v4;
  COExecutionContext *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (COExecutionContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[COExecutionContext metadata](self, "metadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[COExecutionContext metadata](v5, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
