@implementation BMStreamSyncPolicy

- (BMStreamSyncPolicy)initWithPolicyDictionary:(id)a3 syncUUID:(id)a4 legacySyncID:(id)a5 eventClass:(Class)a6
{
  return -[BMStreamSyncPolicy initWithLegacyDescriptor:platformPolicies:](self, "initWithLegacyDescriptor:platformPolicies:", a5, a3);
}

- (BMStreamSyncPolicy)initWithLegacyDescriptor:(id)a3 platformPolicies:(id)a4
{
  id v6;
  id v7;
  BMStreamSyncPolicy *v8;
  uint64_t v9;
  NSString *legacyDescriptor;
  uint64_t v11;
  NSDictionary *platformPolicies;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMStreamSyncPolicy;
  v8 = -[BMStreamSyncPolicy init](&v14, sel_init);
  if (v8)
  {
    v8->_currentPlatform = objc_msgSend(MEMORY[0x1E0D01CF8], "platform");
    v9 = objc_msgSend(v6, "copy");
    legacyDescriptor = v8->_legacyDescriptor;
    v8->_legacyDescriptor = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    platformPolicies = v8->_platformPolicies;
    v8->_platformPolicies = (NSDictionary *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformPolicies, 0);
  objc_storeStrong((id *)&self->_legacyDescriptor, 0);
}

- (BOOL)supportsSharedDeviceSync
{
  if ((-[BMStreamSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:", 2, 5) & 1) != 0)return 1;
  else
    return -[BMStreamSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:", 2, 7) & 1;
}

- (unint64_t)directionsSupportedForTransport:(unint64_t)a3
{
  return -[BMStreamSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:", a3, self->_currentPlatform);
}

- (unint64_t)directionsSupportedForTransport:(unint64_t)a3 fromPlatform:(int64_t)a4
{
  NSDictionary *platformPolicies;
  const __CFString *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return 0;
  platformPolicies = self->_platformPolicies;
  if ((unint64_t)(a4 - 1) > 7)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E2647EF8[a4 - 1];
  -[NSDictionary objectForKeyedSubscript:](platformPolicies, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "transportType", (_QWORD)v17) == a3)
          {
            v7 = objc_msgSend(v15, "direction");
            goto LABEL_17;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_17:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4
{
  return -[BMStreamSyncPolicy supportsTransport:direction:fromPlatform:](self, "supportsTransport:direction:fromPlatform:", a3, a4, self->_currentPlatform);
}

- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4 fromPlatform:(int64_t)a5
{
  unint64_t v6;
  BOOL v7;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return 0;
  v6 = -[BMStreamSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:");
  v7 = (v6 & 3) != 0;
  if (a4 != 3)
    v7 = 0;
  if (a4 - 1 >= 2)
    return v7;
  else
    return (a4 & ~v6) == 0;
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5
{
  return -[BMStreamSyncPolicy supportsSyncingWithPlatform:overTransport:inDirection:fromPlatform:](self, "supportsSyncingWithPlatform:overTransport:inDirection:fromPlatform:", a3, a4, a5, self->_currentPlatform);
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5 fromPlatform:(int64_t)a6
{
  unint64_t v12;
  _BOOL4 v13;
  uint64_t v14;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || a5 == 0)
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    v12 = -[BMStreamSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:", a4, a6);
    v13 = -[BMStreamSyncPolicy supportsTransport:direction:fromPlatform:](self, "supportsTransport:direction:fromPlatform:", a4, a5, a6);
    if (v13)
    {
      if (a4 == 3)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        if (a5 == 1)
        {
          v14 = 2;
        }
        else if (a5 == 2)
        {
          v14 = 1;
        }
        else if (a5 == 3 && v12 - 1 < 3)
        {
          v14 = qword_18DC0B290[v12 - 1];
        }
        else
        {
          v14 = 0;
        }
        LOBYTE(v13) = -[BMStreamSyncPolicy supportsTransport:direction:fromPlatform:](self, "supportsTransport:direction:fromPlatform:", a4, v14, a3);
      }
    }
  }
  return v13;
}

+ (id)syncableStreams
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  BiomeLibraryNodeBridge();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "allStreams", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "syncPolicy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "platformPolicies");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
            objc_msgSend(v3, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)syncableStreamConfigurations
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  BiomeLibraryNodeBridge();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "allStreams", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "syncPolicy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "platformPolicies");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
            objc_msgSend(v3, "addObject:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setSupportsSharedDeviceSync:(BOOL)a3
{
  self->_supportsSharedDeviceSync = a3;
}

- (NSString)legacyDescriptor
{
  return self->_legacyDescriptor;
}

- (NSDictionary)platformPolicies
{
  return self->_platformPolicies;
}

@end
