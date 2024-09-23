@implementation ATXAssetsABHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[ATXAssetsABHelper setDefaultDeviceIndexPolicy](ATXAssetsABHelper, "setDefaultDeviceIndexPolicy");
}

+ (unsigned)indexForDevice
{
  unsigned __int8 v2;

  pthread_mutex_lock(&getIndexForDeviceLock);
  if (getIndexForDevice)
    v2 = (*(uint64_t (**)(void))(getIndexForDevice + 16))();
  else
    v2 = -1;
  pthread_mutex_unlock(&getIndexForDeviceLock);
  return v2;
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3
{
  id v4;
  ATXAssetsABHelper *v5;

  v4 = a3;
  v5 = -[ATXAssetsABHelper initWithAssetContents:indexForDevice:](self, "initWithAssetContents:indexForDevice:", v4, +[ATXAssetsABHelper indexForDevice](ATXAssetsABHelper, "indexForDevice"));

  return v5;
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3 indexForDevice:(unsigned __int8)a4
{
  return -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:](self, "initWithAssetContents:specifiedABGroup:indexForDevice:", a3, 0, a4);
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3 specifiedABGroup:(id)a4 indexForDevice:(unsigned __int8)a5
{
  unsigned int v5;
  id v7;
  id v9;
  id v10;
  ATXAssetsABHelper *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSString *v29;
  NSRange v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  BOOL v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSRange v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSDictionary *abGroupContents;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  NSDictionary *v53;
  NSString *groupIdentifier;
  NSString *v55;
  ATXAssetsABHelper *v56;
  void *v58;
  id v59;
  id v60;
  NSUInteger v61;
  ATXAssetsABHelper *v62;
  void *v63;
  NSString *v64;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  uint8_t v72[4];
  uint64_t v73;
  uint8_t buf[4];
  NSString *v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v5 = a5;
  v7 = a3;
  v79 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v71.receiver = self;
  v71.super_class = (Class)ATXAssetsABHelper;
  v11 = -[ATXAssetsABHelper init](&v71, sel_init);
  if (v11)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    v63 = v12;
    if (v13)
    {
      v14 = v13;
      v59 = v7;
      v60 = v9;
      v15 = 0;
      v66 = 0;
      v16 = *(_QWORD *)v68;
      v61 = v5;
      v17 = MEMORY[0x1E0C81028];
      v18 = v12;
      v62 = v11;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v68 != v16)
          objc_enumerationMutation(v18);
        v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
        if (v10 && objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v19)))
        {
          v21 = v20;

          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v21;
            _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_INFO, "Found specifiedABGroup of %@", buf, 0xCu);
          }
          v15 = v21;
          goto LABEL_30;
        }
        if (objc_msgSend((id)objc_opt_class(), "isDefaultGroupIdentifier:", v20))
        {
          if (v66)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("ATXAssetsABHelper.m"), 99, CFSTR("Detected more than one Default* ABGroup. Second was %@"), v20);

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v75 = (NSString *)v20;
              v76 = 2112;
              v77 = v66;
              _os_log_error_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_ERROR, "Detected more than one Default* ABGroup, skipping %@ and keeping %@", buf, 0x16u);
            }
          }
          else
          {
            v66 = v20;
          }
          goto LABEL_30;
        }
        objc_msgSend(v18, "objectForKeyedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_30;
        }
        v24 = v23;
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Activation"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
          goto LABEL_28;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = v15;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("ATXAssetsABHelper.m"), 118, CFSTR("ABGroup %@ contains unsupported activation criterion: %@"), v20, v24);

          v15 = v37;
          v18 = v63;
LABEL_28:

LABEL_29:
          v17 = MEMORY[0x1E0C81028];
          goto LABEL_30;
        }
        v64 = v15;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:].cold.3(v72, (uint64_t)v20, &v73);
        v26 = v25;
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SaltedIndexCriterion"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          break;
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("UUIDLastByteRange"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("UUIDLastByteRange"));
          v40 = (NSString *)objc_claimAutoreleasedReturnValue();
          v41 = NSRangeFromString(v40);

          v18 = v63;
          v36 = v61 < v41.location || v61 - v41.location >= v41.length;
LABEL_36:
          v42 = !v36;
          v11 = v62;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v62;
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("ATXAssetsABHelper.m"), 138, CFSTR("ABGroup %@ contains no supported activation criteria: %@"), v20, v24);

        v42 = 0;
LABEL_40:

        if (v10)
        {
          v15 = v64;
          goto LABEL_29;
        }
        v17 = MEMORY[0x1E0C81028];
        if ((v42 & 1) != 0)
        {
          v45 = v66;
          v48 = v20;

          v7 = v59;
          v9 = v60;
          v15 = v64;
          if (v48)
            goto LABEL_57;
          if (v66)
            goto LABEL_56;
          goto LABEL_63;
        }
        v15 = v64;
LABEL_30:
        if (v14 == ++v19)
        {
          v44 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
          v14 = v44;
          if (v44)
            goto LABEL_4;

          if (v10)
          {
            v45 = v66;
            if (v15)
            {
              objc_storeStrong((id *)&v11->_groupIdentifier, v15);
              objc_msgSend(v18, "objectForKeyedSubscript:", v11->_groupIdentifier);
              v46 = objc_claimAutoreleasedReturnValue();
              abGroupContents = v11->_abGroupContents;
              v11->_abGroupContents = (NSDictionary *)v46;

              v48 = 0;
              v9 = v60;
              goto LABEL_66;
            }
            v7 = v59;
            v9 = v60;
            goto LABEL_53;
          }
          v45 = v66;
          v7 = v59;
          v9 = v60;
          if (v66)
            goto LABEL_56;
          goto LABEL_63;
        }
      }
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SaltedIndexCriterion"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("range"));
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = NSRangeFromString(v29);

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SaltedIndexCriterion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("salt"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

      v34 = v33;
      v18 = v63;
      v35 = +[ATXAssetsABHelper cachedSaltedIndex:](ATXAssetsABHelper, "cachedSaltedIndex:", v34);
      v36 = v35 < v30.location || v35 - v30.location >= v30.length;
      goto LABEL_36;
    }

    v45 = 0;
    v15 = 0;
    if (!v10)
      goto LABEL_63;
LABEL_53:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:].cold.2((uint64_t)v10, v49, v50);
    v15 = 0;
    if (v45)
    {
LABEL_56:
      v48 = v45;
      v45 = v48;
LABEL_57:
      v51 = v15;
      objc_storeStrong((id *)&v11->_groupIdentifier, v48);
      objc_msgSend(v63, "objectForKeyedSubscript:", v11->_groupIdentifier);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v11->_abGroupContents;
      v11->_abGroupContents = (NSDictionary *)v52;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("ATXAssetsABHelper.m"), 176, CFSTR("Content of ABGroup %@ in asset is not an NSDictionary: %@"), v48, v11->_abGroupContents);

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        groupIdentifier = v11->_groupIdentifier;
        *(_DWORD *)buf = 138412290;
        v75 = groupIdentifier;
        _os_log_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "ABGroup identifier: %@", buf, 0xCu);
      }
      v15 = v51;
    }
    else
    {
LABEL_63:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:].cold.1();
      v55 = v11->_groupIdentifier;
      v11->_groupIdentifier = 0;

      objc_storeStrong((id *)&v11->_abGroupContents, v7);
      v45 = 0;
      v48 = 0;
    }
LABEL_66:
    v56 = v11;

  }
  return v11;
}

- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4
{
  return -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:](self, "initWithAssetsForResource:ofType:specifiedABGroup:", a3, a4, 0);
}

- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5
{
  id v8;
  void *v9;
  ATXAssetsABHelper *v10;

  v8 = a5;
  +[ATXAssets2 rawDictionaryForResource:ofType:](ATXAssets2, "rawDictionaryForResource:ofType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:](self, "initWithAssetContents:specifiedABGroup:indexForDevice:", v9, v8, +[ATXAssetsABHelper indexForDevice](ATXAssetsABHelper, "indexForDevice"));
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unint64_t)cachedSaltedIndex:(unint64_t)a3
{
  unint64_t result;
  void *v4;

  result = cachedSaltedIndex__index;
  if ((unint64_t)cachedSaltedIndex__index >= 0x3E8)
  {
    cachedSaltedIndex__index = +[ATXAssetsABHelper saltedIndex:](ATXAssetsABHelper, "saltedIndex:", a3);
    +[ATXAggregateKeys keyWithSubkey:](ATXAggregateKeys, "keyWithSubkey:", CFSTR("ab.salted_index"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAssetsAggregateLogger logKey:replaceScalarValueWith:](ATXAssetsAggregateLogger, "logKey:replaceScalarValueWith:", v4, cachedSaltedIndex__index);

    return cachedSaltedIndex__index;
  }
  return result;
}

+ (unint64_t)saltedIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD v13[2];

  +[ATXAssetsABHelper decDeviceId](ATXAssetsABHelper, "decDeviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v13[0] = 0;
    v13[1] = 0;
    objc_msgSend(v4, "getUUIDBytes:", v13);
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = v8;
      v10 = 0xFF51AFD7ED558CCDLL * (v13[v6] ^ a3 ^ ((v13[v6] ^ a3) >> 33));
      v7 += (0xC4CEB9FE1A85EC53 * (v10 ^ (v10 >> 33))) ^ ((0xC4CEB9FE1A85EC53 * (v10 ^ (v10 >> 33))) >> 33);
      v6 = 1;
      v8 = 0;
    }
    while ((v9 & 1) != 0);
    v11 = v7 % 0x3E8;
  }
  else
  {
    v11 = 1000;
  }

  return v11;
}

+ (void)setStaticIndexForDevice:(unsigned __int8)a3
{
  _QWORD v3[4];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__ATXAssetsABHelper_setStaticIndexForDevice___block_invoke;
  v3[3] = &__block_descriptor_33_e5_C8__0l;
  v4 = a3;
  +[ATXAssetsABHelper setIndexProviderForDevice:](ATXAssetsABHelper, "setIndexProviderForDevice:", v3);
}

uint64_t __45__ATXAssetsABHelper_setStaticIndexForDevice___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

+ (id)decDeviceId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v2 = (void *)_deviceId;
  if (!_deviceId)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("duetexpertd")))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.proactive.abGroupDeviceId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v5, "removeObjectForKey:", CFSTR("com.apple.proactive.abGroupDeviceId"));

    }
    v7 = objc_alloc(MEMORY[0x1E0D81580]);
    +[ATXAssetsPaths decDirectoryFile:](ATXAssetsPaths, "decDirectoryFile:", CFSTR("com.apple.proactive.abGroupDeviceId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithBasePath:", v8);

    objc_msgSend(v9, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)_deviceId;
    _deviceId = (uint64_t)v12;

    v2 = (void *)_deviceId;
  }
  return v2;
}

+ (BOOL)isDefaultGroupIdentifier:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 1;
  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("default"));

  return v4;
}

+ (void)setDefaultDeviceIndexPolicy
{
  +[ATXAssetsABHelper setIndexProviderForDevice:](ATXAssetsABHelper, "setIndexProviderForDevice:", &__block_literal_global_76);
}

uint64_t __48__ATXAssetsABHelper_setDefaultDeviceIndexPolicy__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  unint64_t v6;
  void *v7;
  _QWORD v9[2];

  +[ATXAssetsABHelper decDeviceId](ATXAssetsABHelper, "decDeviceId");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v9[0] = 0;
    v9[1] = 0;
    objc_msgSend(v0, "getUUIDBytes:", v9);
    v2 = 0;
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = v4;
      v6 = 0xFF51AFD7ED558CCDLL * (v9[v2] ^ (v9[v2] >> 33));
      v3 += (0xC4CEB9FE1A85EC53 * (v6 ^ (v6 >> 33))) ^ ((0xC4CEB9FE1A85EC53 * (v6 ^ (v6 >> 33))) >> 33);
      v2 = 1;
      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else
  {
    LOBYTE(v3) = -1;
  }
  +[ATXAggregateKeys keyWithSubkey:](ATXAggregateKeys, "keyWithSubkey:", CFSTR("ab.index.vendor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAssetsAggregateLogger logKey:replaceScalarValueWith:](ATXAssetsAggregateLogger, "logKey:replaceScalarValueWith:", v7, v3);

  return v3;
}

+ (void)setIndexProviderForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  pthread_mutex_lock(&getIndexForDeviceLock);
  v4 = MEMORY[0x1A85A511C](v3);

  v5 = (void *)getIndexForDevice;
  getIndexForDevice = v4;

  pthread_mutex_unlock(&getIndexForDeviceLock);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSDictionary)abGroupContents
{
  return self->_abGroupContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroupContents, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (void)initWithAssetContents:specifiedABGroup:indexForDevice:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Asset does not contain ABGroup information", v0, 2u);
}

- (void)initWithAssetContents:(uint64_t)a1 specifiedABGroup:(uint64_t)a2 indexForDevice:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_16(&dword_1A49EF000, MEMORY[0x1E0C81028], a3, "Asset does not contain the specifiedABGroup of %@", (uint8_t *)&v3);
}

- (void)initWithAssetContents:(uint8_t *)a1 specifiedABGroup:(uint64_t)a2 indexForDevice:(_QWORD *)a3 .cold.3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_16(&dword_1A49EF000, MEMORY[0x1E0C81028], (uint64_t)a3, "ABGroup key: %@", a1);
}

@end
