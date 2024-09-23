@implementation BMStreamSyncPlatformPolicy

- (BMStreamSyncPlatformPolicy)initWithTransportType:(unint64_t)a3 direction:(unint64_t)a4
{
  BMStreamSyncPlatformPolicy *v5;
  BMStreamSyncPlatformPolicy *v7;
  BMStreamSyncPlatformPolicy *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v5 = self;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v17.receiver = self;
    v17.super_class = (Class)BMStreamSyncPlatformPolicy;
    v7 = -[BMStreamSyncPlatformPolicy init](&v17, sel_init);
    if (v7)
    {
      v7->_platform = 0;
      v7->_transportType = a3;
      v7->_direction = a4;
    }
    v5 = v7;
    v8 = v5;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMStreamSyncPlatformPolicy initWithPlatform:transportType:direction:].cold.1(a3, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

- (BMStreamSyncPlatformPolicy)initWithPlatform:(int64_t)a3 transportType:(unint64_t)a4 direction:(unint64_t)a5
{
  BMStreamSyncPlatformPolicy *v6;
  BMStreamSyncPlatformPolicy *v9;
  BMStreamSyncPlatformPolicy *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v6 = self;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v19.receiver = self;
    v19.super_class = (Class)BMStreamSyncPlatformPolicy;
    v9 = -[BMStreamSyncPlatformPolicy init](&v19, sel_init);
    if (v9)
    {
      v9->_platform = a3;
      v9->_transportType = a4;
      v9->_direction = a5;
    }
    v6 = v9;
    v10 = v6;
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BMStreamSyncPlatformPolicy initWithPlatform:transportType:direction:].cold.1(a4, v11, v12, v13, v14, v15, v16, v17);

    v10 = 0;
  }

  return v10;
}

- (int64_t)platform
{
  return self->_platform;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)initWithPlatform:(uint64_t)a3 transportType:(uint64_t)a4 direction:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_8(&dword_18D810000, a2, a3, "Invalid transport type %lu.", a5, a6, a7, a8, 0);
}

@end
