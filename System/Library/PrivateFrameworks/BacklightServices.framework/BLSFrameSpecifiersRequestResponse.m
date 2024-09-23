@implementation BLSFrameSpecifiersRequestResponse

- (BLSFrameSpecifiersRequestResponse)initWithDateSpecifiers:(id)a3
{
  id v4;
  id v5;
  xpc_object_t empty;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BLSFrameSpecifiersRequestResponse *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  empty = xpc_array_create_empty();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)BSCreateSerializedBSXPCEncodableObject();
        if (v12)
          xpc_array_append_value(empty, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "setObject:forSetting:", empty, 1);
  v15.receiver = self;
  v15.super_class = (Class)BLSFrameSpecifiersRequestResponse;
  v13 = -[BSActionResponse initWithInfo:error:](&v15, sel_initWithInfo_error_, v5, 0);

  return v13;
}

- (NSArray)dateSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  size_t count;
  void *v7;
  __int128 v8;
  size_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v14;
  uint8_t buf[4];
  BLSFrameSpecifiersRequestResponse *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[BSActionResponse info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && MEMORY[0x1B5E0F3AC](v4) == MEMORY[0x1E0C812C8])
  {
    count = xpc_array_get_count(v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", count);
    if (count)
    {
      v9 = 0;
      *(_QWORD *)&v8 = 134218498;
      v14 = v8;
      do
      {
        xpc_array_get_value(v4, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "addObject:", v11);
          }
          else
          {
            bls_scenes_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v14;
              v16 = self;
              v17 = 2114;
              v18 = v11;
              v19 = 2114;
              v20 = v10;
              _os_log_fault_impl(&dword_1B0C75000, v12, OS_LOG_TYPE_FAULT, "%p %{public}@ is not of type BLSAlwaysOnDateSpecifier from %{public}@", buf, 0x20u);
            }

          }
        }

        ++v9;
      }
      while (count != v9);
    }
    v5 = (void *)objc_msgSend(v7, "copy", v14);

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

@end
