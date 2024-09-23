@implementation HAP2AccessoryServerAccessoryCache

- (HAP2AccessoryServerAccessoryCache)initWithBLEPeripheralInfo:(id)a3 cachedAccessories:(id)a4 sleepInterval:(id)a5 metadataVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAP2AccessoryServerAccessoryCache *v15;
  HAP2AccessoryServerAccessoryCache *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerAccessoryCache;
  v15 = -[HAP2AccessoryServerAccessoryCache init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peripheralInfo, a3);
    objc_storeStrong((id *)&v16->_accessoryCache, a4);
    objc_storeStrong((id *)&v16->_sleepInterval, a5);
    objc_storeStrong((id *)&v16->_metadataVersion, a6);
  }

  return v16;
}

- (HAP2AccessoryServerAccessoryCache)initWithMetadata:(id)a3 discoveredAccessories:(id)a4 sleepInterval:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HAP2AccessoryServerAccessoryCache *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "peripheralInfoFromMetadata:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "accessoryCacheForAccessories:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HAPGetHAPMetadataVersion();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HAP2AccessoryServerAccessoryCache initWithBLEPeripheralInfo:cachedAccessories:sleepInterval:metadataVersion:](self, "initWithBLEPeripheralInfo:cachedAccessories:sleepInterval:metadataVersion:", v11, v12, v8, v13);

  return v14;
}

- (void)updateWithMetadata:(id)a3 discoveredAccessories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "accessoryCacheForAccessories:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerAccessoryCache setAccessoryCache:](self, "setAccessoryCache:", v8);
  objc_msgSend((id)objc_opt_class(), "peripheralInfoFromMetadata:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerAccessoryCache setPeripheralInfo:](self, "setPeripheralInfo:", v9);
}

- (void)invalidateAccessoryCache
{
  -[HAP2AccessoryServerAccessoryCache setAccessoryCache:](self, "setAccessoryCache:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerAccessoryCache peripheralInfo](self, "peripheralInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HAP2.pe"));

  -[HAP2AccessoryServerAccessoryCache accessoryCache](self, "accessoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HAP2.ac"));

  -[HAP2AccessoryServerAccessoryCache sleepInterval](self, "sleepInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HAP2.si"));

  -[HAP2AccessoryServerAccessoryCache metadataVersion](self, "metadataVersion");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HAP2.mv"));

}

- (HAP2AccessoryServerAccessoryCache)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HAP2AccessoryServerAccessoryCache *v13;
  NSObject *v14;
  uint8_t v16[16];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP2.pe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HAP2.ac"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP2.si"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP2.mv"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HAP2AccessoryServerAccessoryCache initWithBLEPeripheralInfo:cachedAccessories:sleepInterval:metadataVersion:](self, "initWithBLEPeripheralInfo:cachedAccessories:sleepInterval:metadataVersion:", v5, v10, v11, v12);

    v13 = self;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "AccessoryCache: Unable to decode objects", v16, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (void)setPeripheralInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralInfo, a3);
}

- (NSDictionary)accessoryCache
{
  return self->_accessoryCache;
}

- (void)setAccessoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCache, a3);
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(id)a3
{
  objc_storeStrong((id *)&self->_sleepInterval, a3);
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataVersion, 0);
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_peripheralInfo, 0);
}

+ (id)peripheralInfoFromMetadata:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HAPBLEPeripheralInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPBLEPeripheralInfo *v15;

  v3 = a3;
  objc_msgSend(v3, "protocolVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "majorVersion");
  objc_msgSend(v3, "protocolVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minorVersion") + 10 * v5;

  v8 = objc_msgSend(v3, "hasPairings") ^ 1;
  v9 = [HAPBLEPeripheralInfo alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v3, "stateNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v3, "configNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HAPBLEPeripheralInfo initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:](v9, "initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:", 0, v7, 0, 0, v10, v11, 0.0, v12, v13, v14);
  return v15;
}

+ (id)accessoryCacheForAccessories:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke;
  v9[3] = &unk_1E894D138;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HAPBLEAccessoryCache *v4;
  void *v5;
  HAPBLEAccessoryCache *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HAPBLEAccessoryCache *v11;
  _QWORD v12[4];
  HAPBLEAccessoryCache *v13;

  v3 = a2;
  v4 = [HAPBLEAccessoryCache alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPBLEAccessoryCache initWithPairingIdentifier:](v4, "initWithPairingIdentifier:", v5);

  objc_msgSend(v3, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_2;
  v12[3] = &unk_1E894C9C0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v3, "instanceID");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v10);

}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  HAPBLEServiceCache *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HAPBLEServiceCache *v13;
  void *v14;
  HAPBLEServiceCache *v15;
  id v16;
  _QWORD v17[4];
  HAPBLEServiceCache *v18;

  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v7, "initWithUUIDString:", v8);

  v9 = [HAPBLEServiceCache alloc];
  objc_msgSend(v6, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "serviceProperties");
  objc_msgSend(v6, "linkedServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HAPBLEServiceCache initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:](v9, "initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:", v16, v10, a3, v11, v12);

  objc_msgSend(v6, "characteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_3;
  v17[3] = &unk_1E894D098;
  v18 = v13;
  v15 = v13;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  objc_msgSend(*(id *)(a1 + 32), "updateWithService:", v15);
}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  HAPBLECharacteristicCache *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HAPBLECharacteristicCache *v11;
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v5, "initWithUUIDString:", v6);

  v7 = [HAPBLECharacteristicCache alloc];
  objc_msgSend(v4, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "properties");
  objc_msgSend(v4, "accessoryMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HAPBLECharacteristicCache initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:](v7, "initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:", v12, v8, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "updateWithCharacteristic:", v11);

}

@end
