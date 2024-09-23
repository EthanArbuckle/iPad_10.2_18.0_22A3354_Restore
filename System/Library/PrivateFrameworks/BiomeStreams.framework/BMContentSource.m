@implementation BMContentSource

- (void)sendEvent:(id)a3
{
  id v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  id v15;

  v4 = a3;
  v15 = 0;
  v5 = objc_msgSend(v4, "isValidWithContext:error:", 0, &v15);
  v6 = v15;
  if ((v5 & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)BMContentSource;
    -[BMStoreSource sendEvent:](&v14, sel_sendEvent_, v4);
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BMContentSource sendEvent:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  id v17;

  v6 = a3;
  v17 = 0;
  v7 = objc_msgSend(v6, "isValidWithContext:error:", 0, &v17);
  v8 = v17;
  if ((v7 & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)BMContentSource;
    -[BMStoreSource sendEvent:timestamp:](&v16, sel_sendEvent_timestamp_, v6, a4);
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMContentSource sendEvent:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)sendEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_8(&dword_18D810000, a2, a3, "BMContentSource: invalid event: %@", a5, a6, a7, a8, 2u);
}

@end
