@implementation HAP2AccessoryServerControllerAttributeRequestOperation

- (void)main
{
  NSObject *v3;
  void *v4;
  id *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[2];
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  HAP2AccessoryServerControllerAttributeRequestOperation *v20;
  __int128 buf;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id *v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&buf, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerController setReadingAttributeDatabase:]((uint64_t)v4, 1);

  -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = __62__HAP2AccessoryServerControllerAttributeRequestOperation_main__block_invoke;
  v19 = &unk_1E894BCC8;
  v20 = self;
  v7 = v17;
  if (v5)
  {
    objc_msgSend(v5[10], "assertCurrentQueue");
    v8 = v5[8];
    if (v8)
    {
      objc_msgSend(v8, "metadataVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v18((uint64_t)v7, v5[8]);
        goto LABEL_22;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%@ Invalidating accessory cache due to missing metadata version", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v5[8], "invalidateAccessoryCache");
    }
    objc_msgSend(v5, "accessoryServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "browser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "controllerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      cacheFileIdentifierForAccessoryServer(v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = v6;
      *((_QWORD *)&buf + 1) = 3221225472;
      v22 = __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke;
      v23 = &unk_1E894CAD8;
      v24 = v5;
      v26 = v7;
      v25 = v11;
      objc_msgSend(v13, "fetchCacheForIdentifier:completion:", v15, &buf);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v16 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%@ Unable to get to the storage", (uint8_t *)&buf, 0xCu);
      }
      v18((uint64_t)v7, 0);
    }

  }
LABEL_22:

}

- (void)_cleanUp
{
  void *v3;
  objc_super v4;

  -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerController setReadingAttributeDatabase:]((uint64_t)v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerControllerAttributeRequestOperation;
  -[HAP2AccessoryServerControllerOperation _cleanUp](&v4, sel__cleanUp);
}

- (void)_sendRequest
{
  HAP2AccessoryServerControllerAttributeRequestOperation *v2;
  void *v3;
  void *v4;
  HAP2AccessoryServerAccessoryCache *cache;
  void *v6;
  void *v7;
  NSObject *v8;
  HAP2EncodedAttributeDatabaseResponseCached *v9;
  objc_super v10;
  uint8_t buf[4];
  HAP2AccessoryServerControllerAttributeRequestOperation *v12;
  uint64_t v13;

  v2 = self;
  v13 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (HAP2AccessoryServerControllerAttributeRequestOperation *)self->_cache;
  -[HAP2AccessoryServerControllerAttributeRequestOperation accessoryCache](self, "accessoryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_14;
  v4 = (void *)objc_opt_class();
  if (v2)
    cache = v2->_cache;
  else
    cache = 0;
  -[HAP2AccessoryServerAccessoryCache accessoryCache](cache, "accessoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_parseCache:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v2;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to deserialize the cache falling back to the accessory", buf, 0xCu);
    }
LABEL_14:
    v10.receiver = v2;
    v10.super_class = (Class)HAP2AccessoryServerControllerAttributeRequestOperation;
    -[HAP2AccessoryServerControllerOperation _sendRequest](&v10, sel__sendRequest);
    return;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v2;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Attempting to use the accessory cache", buf, 0xCu);
  }
  v9 = -[HAP2EncodedAttributeDatabaseResponseCached initWithAttributeDatabase:]([HAP2EncodedAttributeDatabaseResponseCached alloc], "initWithAttributeDatabase:", v7);
  -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)v2, v9);

  -[HAP2AccessoryServerControllerOperation finish](v2, "finish");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

uint64_t __62__HAP2AccessoryServerControllerAttributeRequestOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 368), a2);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v4, "_openTransport:", 0);
}

+ (id)_parseCache:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke;
  v13 = &unk_1E894BD18;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)_characteristicsFromCachedCharacteristics:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__HAP2AccessoryServerControllerAttributeRequestOperation__characteristicsFromCachedCharacteristics___block_invoke;
  v9[3] = &unk_1E894BD40;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __100__HAP2AccessoryServerControllerAttributeRequestOperation__characteristicsFromCachedCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HAPCharacteristic *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HAPCharacteristic *v12;

  v3 = a2;
  v4 = [HAPCharacteristic alloc];
  objc_msgSend(v3, "characteristicUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicInstanceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "characteristicProperties");
  objc_msgSend(v3, "characteristicMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = 1;
  v12 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v4, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v6, v7, 0, 0, v8, 0, v11, v9);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic setValueUpdatedTime:](v12, "setValueUpdatedTime:", v10);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
}

void __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = a2;
  objc_msgSend(a3, "cachedServices");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke_2;
  v11[3] = &unk_1E894BCF0;
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);

}

void __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  HAPService *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HAPService *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "cachedCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_characteristicsFromCachedCharacteristics:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [HAPService alloc];
  objc_msgSend(v4, "serviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceInstanceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "serviceProperties");
  objc_msgSend(v4, "linkedServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v6, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v8, v9, v14, v10, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v6, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v8, v9, v14, v10, v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

}

@end
