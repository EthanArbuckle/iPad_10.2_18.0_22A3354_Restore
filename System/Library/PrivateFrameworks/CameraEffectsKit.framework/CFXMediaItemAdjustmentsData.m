@implementation CFXMediaItemAdjustmentsData

+ (NSSet)secureCodingClassWhitelist
{
  if (secureCodingClassWhitelist_onceToken != -1)
    dispatch_once(&secureCodingClassWhitelist_onceToken, &__block_literal_global_34);
  return (NSSet *)(id)secureCodingClassWhitelist_secureCodingClassWhitelist;
}

void __57__CFXMediaItemAdjustmentsData_secureCodingClassWhitelist__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodingClassWhitelist_secureCodingClassWhitelist;
  secureCodingClassWhitelist_secureCodingClassWhitelist = v2;

}

- (CFXMediaItemAdjustmentsData)initWithCameraMode:(int64_t)a3 metadataURL:(id)a4 cameraPosition:(int64_t)a5 effectStack:(id)a6
{
  id v11;
  id v12;
  CFXMediaItemAdjustmentsData *v13;
  CFXMediaItemAdjustmentsData *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CFXMediaItemAdjustmentsData;
  v13 = -[CFXMediaItemAdjustmentsData init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_cameraMode = a3;
    objc_storeStrong((id *)&v13->_metadataURL, a4);
    objc_storeStrong((id *)&v14->_effectStack, a6);
    v14->_cameraPosition = a5;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CFXMediaItemAdjustmentsData cameraMode](self, "cameraMode"), CFSTR("cameraMode"));
  -[CFXMediaItemAdjustmentsData metadataURL](self, "metadataURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CFXMediaItemAdjustmentsData metadataURL](self, "metadataURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadata"));

  }
  if (-[CFXMediaItemAdjustmentsData cameraPosition](self, "cameraPosition"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[CFXMediaItemAdjustmentsData cameraPosition](self, "cameraPosition"), CFSTR("cameraPosition"));
  -[CFXMediaItemAdjustmentsData effectStack](self, "effectStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[CFXMediaItemAdjustmentsData effectStack](self, "effectStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CFXMediaItemAdjustmentsData effectStack](self, "effectStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        v18 = v15;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
          v22 = v18;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 0, &v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v22;

          if (v20)
          {
            objc_msgSend(v11, "addObject:", v20);
          }
          else
          {
            JFXLog_core();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v28 = v15;
              _os_log_debug_impl(&dword_2269A9000, v21, OS_LOG_TYPE_DEBUG, "Error encoding effect: %{public}@", buf, 0xCu);
            }

          }
          ++v17;
          v18 = v15;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v14);

    }
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("effectStack"));

  }
}

- (CFXMediaItemAdjustmentsData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  CFXMediaItemAdjustmentsData *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CFXMediaItemAdjustmentsData *v34;
  id v35;
  id obj;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cameraMode"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cameraPosition"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v10, CFSTR("effectStack"), &v43);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v43;

  v13 = 0;
  if (v11 && !v12)
  {
    v31 = v6;
    v32 = v5;
    v33 = v7;
    v34 = self;
    v35 = v4;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v11;
    obj = v11;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      v17 = *MEMORY[0x24BDD0E88];
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v18);
          v20 = objc_alloc(MEMORY[0x24BDD1620]);
          v38 = 0;
          v21 = (void *)objc_msgSend(v20, "initForReadingFromData:error:", v19, &v38);
          v22 = v38;
          +[CFXMediaItemAdjustmentsData secureCodingClassWhitelist](CFXMediaItemAdjustmentsData, "secureCodingClassWhitelist");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v22;
          objc_msgSend(v21, "decodeTopLevelObjectOfClasses:forKey:error:", v23, v17, &v37);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v37;

          objc_msgSend(v21, "finishDecoding");
          if (v24)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = v24;
              objc_msgSend(v26, "setImageSequencePathToBundledAssets");
              objc_msgSend(v26, "setBuildInAnimation:", 1);

            }
            objc_msgSend(v13, "addObject:", v24);
          }
          else
          {
            JFXLog_core();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v45 = v25;
              _os_log_debug_impl(&dword_2269A9000, v27, OS_LOG_TYPE_DEBUG, "Error decoding effects: %{public}@", buf, 0xCu);
            }

          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v15);
    }

    self = v34;
    v4 = v35;
    v5 = v32;
    v7 = v33;
    v11 = v30;
    v6 = v31;
    v12 = 0;
  }
  v28 = -[CFXMediaItemAdjustmentsData initWithCameraMode:metadataURL:cameraPosition:effectStack:](self, "initWithCameraMode:metadataURL:cameraPosition:effectStack:", v5, v7, v6, v13);

  return v28;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (NSArray)effectStack
{
  return self->_effectStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectStack, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
}

@end
