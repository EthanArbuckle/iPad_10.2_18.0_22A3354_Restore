@implementation BMComputeSubscriptionMarkerManager

- (BMComputeSubscriptionMarkerManager)initWithUserStorage:(id)a3 systemStorage:(id)a4 domain:(unint64_t)a5
{
  id v9;
  id v10;
  BMComputeSubscriptionMarkerManager *v11;
  BMComputeSubscriptionMarkerManager *v12;
  NSCountedSet *v13;
  NSCountedSet *activelySubscribedStreams;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMComputeSubscriptionMarkerManager;
  v11 = -[BMComputeSubscriptionMarkerManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userStorage, a3);
    objc_storeStrong((id *)&v12->_systemStorage, a4);
    v12->_domain = a5;
    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    activelySubscribedStreams = v12->_activelySubscribedStreams;
    v12->_activelySubscribedStreams = v13;

  }
  return v12;
}

- (id)_subscriptionMarkerStorageForDomain:(unint64_t)a3
{
  return self->_userStorage;
}

- (void)addSubscriptionWithStreamIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR(":subscriptions")) & 1) == 0)
  {
    v5 = v4;
    if (objc_msgSend(v4, "hasSuffix:", CFSTR(":tombstones")))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    BiomeLibraryAndInternalLibraryNode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "streamWithIdentifier:error:", v5, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v9)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BMComputeSubscriptionMarkerManager addSubscriptionWithStreamIdentifier:].cold.1();
    }
    else
    {
      objc_msgSend(v8, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "storeConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "domain");

      -[BMComputeSubscriptionMarkerManager activelySubscribedStreams](self, "activelySubscribedStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countForObject:", v4);

      if (!v15)
      {
        -[BMComputeSubscriptionMarkerManager _subscriptionMarkerStorageForDomain:](self, "_subscriptionMarkerStorageForDomain:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writeActiveSubscriptionMarkerForStream:", v4);

      }
      -[BMComputeSubscriptionMarkerManager activelySubscribedStreams](self, "activelySubscribedStreams");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v10, "addObject:", v4);
    }

  }
}

- (void)removeSubscriptionWithStreamIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  v5 = v4;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR(":subscriptions")) & 1) == 0)
  {
    v5 = v4;
    if (objc_msgSend(v4, "hasSuffix:", CFSTR(":tombstones")))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    BiomeLibraryAndInternalLibraryNode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "streamWithIdentifier:error:", v5, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;

    if (v9)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BMComputeSubscriptionMarkerManager removeSubscriptionWithStreamIdentifier:].cold.2();
    }
    else
    {
      objc_msgSend(v8, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "storeConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "domain");

      -[BMComputeSubscriptionMarkerManager activelySubscribedStreams](self, "activelySubscribedStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countForObject:", v4);

      if (!v15)
      {
        __biome_log_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[BMComputeSubscriptionMarkerManager removeSubscriptionWithStreamIdentifier:].cold.1((uint64_t)v4, v16);

      }
      -[BMComputeSubscriptionMarkerManager activelySubscribedStreams](self, "activelySubscribedStreams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObject:", v4);

      -[BMComputeSubscriptionMarkerManager activelySubscribedStreams](self, "activelySubscribedStreams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countForObject:", v4);

      if (v19)
        goto LABEL_13;
      -[BMComputeSubscriptionMarkerManager _subscriptionMarkerStorageForDomain:](self, "_subscriptionMarkerStorageForDomain:", v13);
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeActiveSubscriptionMarkerForStream:](v10, "removeActiveSubscriptionMarkerForStream:", v4);
    }

LABEL_13:
  }

}

- (NSCountedSet)activelySubscribedStreams
{
  return self->_activelySubscribedStreams;
}

- (BMComputeXPCPublisherStorage)systemStorage
{
  return self->_systemStorage;
}

- (BMComputeXPCPublisherStorage)userStorage
{
  return self->_userStorage;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorage, 0);
  objc_storeStrong((id *)&self->_systemStorage, 0);
  objc_storeStrong((id *)&self->_activelySubscribedStreams, 0);
}

- (void)addSubscriptionWithStreamIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "addSubscriptionWithStreamIdentifier: could not find stream for streamIdentifier: %@, err: %@");
  OUTLINED_FUNCTION_5();
}

- (void)removeSubscriptionWithStreamIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "unexpected removal of stream %@ that currently has an active subscription count of 0", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)removeSubscriptionWithStreamIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "removeSubscriptionWithStreamIdentifier: could not find stream for streamIdentifier: %@, err: %@");
  OUTLINED_FUNCTION_5();
}

@end
