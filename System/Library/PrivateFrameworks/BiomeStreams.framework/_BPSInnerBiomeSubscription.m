@implementation _BPSInnerBiomeSubscription

- (_BPSInnerBiomeSubscription)initWithStreamEnumerator:(id)a3 downstream:(id)a4 streamId:(id)a5 accessClient:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BPSInnerBiomeSubscription *v15;
  _BPSInnerBiomeSubscription *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_BPSInnerBiomeSubscription;
  v15 = -[_BPSInnerBiomeSubscription init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_enumerator, a3);
    objc_storeStrong((id *)&v16->_downstream, a4);
    v16->_pendingDemand = 0;
    objc_storeStrong((id *)&v16->_streamId, a5);
    v16->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_accessClient, a6);
  }

  return v16;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSInnerBiomeSubscription *v4;
  os_unfair_lock_s *p_lock;
  BPSSubscriber *v6;
  BMStoreEnumerator *enumerator;
  int64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSString *streamId;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BPSSubscriber *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  BPSSubscriber *downstream;
  void *v30;
  BMStoreEnumerator *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  BPSSubscriber *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  NSString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  v6 = v4->_downstream;
  if (!v6)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      streamId = v4->_streamId;
      *(_DWORD *)buf = 138412546;
      v44 = v11;
      v45 = 2112;
      v46 = streamId;
      _os_log_impl(&dword_18D810000, v9, OS_LOG_TYPE_DEFAULT, "%@ - Downstream is nil. StreamId: %@", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ - Downstream is nil. StreamId: %@"), v16, v4->_streamId);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStreams"), -1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x1E0D02440], "failureWithError:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_16;
  }
  enumerator = v4->_enumerator;
  if (!enumerator)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[_BPSInnerBiomeSubscription requestDemand:].cold.1();

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Can't form store enumerator. Going to complete this source");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = -1;
    goto LABEL_15;
  }
  if ((-[BMStoreEnumerator isDataAccessible](enumerator, "isDataAccessible") & 1) == 0)
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[_BPSInnerBiomeSubscription requestDemand:].cold.3();

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Enumerator doesn't have access to data. Going to complete this source");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v28;
    v26 = 1;
LABEL_15:
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStreams"), v26, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    downstream = v4->_downstream;
    v4->_downstream = 0;

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x1E0D02440], "failureWithError:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
LABEL_16:
    -[BPSSubscriber receiveCompletion:](v21, "receiveCompletion:", v20);

    goto LABEL_17;
  }
  v8 = v4->_pendingDemand + a3;
  v4->_pendingDemand = v8;
  if (v4->_recursion || v8 < 1)
  {
LABEL_5:
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    while (1)
    {
      v30 = (void *)MEMORY[0x193FECFB4]();
      v31 = v4->_enumerator;
      if (!v31)
        break;
      -[BMStoreEnumerator nextEvent](v31, "nextEvent");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v36 = v4->_downstream;
        v4->_downstream = 0;

        os_unfair_lock_unlock(p_lock);
        objc_msgSend(MEMORY[0x1E0D02440], "success");
        v35 = objc_claimAutoreleasedReturnValue();
        -[BPSSubscriber receiveCompletion:](v6, "receiveCompletion:", v35);
        goto LABEL_26;
      }
      v33 = (void *)v32;
      --v4->_pendingDemand;
      v4->_recursion = 1;
      os_unfair_lock_unlock(p_lock);
      v34 = -[BPSSubscriber receiveInput:](v6, "receiveInput:", v33);
      os_unfair_lock_lock(p_lock);
      v4->_pendingDemand += v34;
      v4->_recursion = 0;

      objc_autoreleasePoolPop(v30);
      if (v4->_pendingDemand <= 0)
        goto LABEL_5;
    }
    __biome_log_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[_BPSInnerBiomeSubscription requestDemand:].cold.2();
LABEL_26:

    objc_autoreleasePoolPop(v30);
  }
LABEL_17:

}

- (void)cancel
{
  _BPSInnerBiomeSubscription *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  BPSSubscriber *downstream;
  BMStoreEnumerator *enumerator;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = self;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_INFO, "%@ - cancel", (uint8_t *)&v8, 0xCu);

  }
  os_unfair_lock_lock(&v2->_lock);
  downstream = v2->_downstream;
  v2->_downstream = 0;

  enumerator = v2->_enumerator;
  v2->_enumerator = 0;

  os_unfair_lock_unlock(&v2->_lock);
}

- (id)upstreamSubscriptions
{
  return 0;
}

- (id)newBookmark
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSString *streamId;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    streamId = self->_streamId;
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = streamId;
    _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_INFO, "%@ - get new store bookmark for stream: %@", (uint8_t *)&v8, 0x16u);

  }
  -[BMStoreEnumerator bookmark](self->_enumerator, "bookmark");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (void)requestDemand:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v2, v3, "%@ - Can't form store enumerator. Going to early return and tell downstream to complete. StreamId: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)requestDemand:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v2, v3, "%@ - Enumerator shouldn't become nil during enumeration. StreamId: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)requestDemand:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "%@ - Can't access data for stream: %@. Going to early return and tell downstream to complete.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
