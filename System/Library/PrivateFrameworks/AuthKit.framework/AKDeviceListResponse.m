@implementation AKDeviceListResponse

- (AKDeviceListResponse)initWithResponseBody:(id)a3
{
  id v4;
  AKDeviceListResponse *v5;
  id v6;
  NSString *v7;
  NSString *altDSID;
  id v9;
  NSString *v10;
  NSString *deviceListVersion;
  uint64_t v12;
  NSArray *deviceList;
  uint64_t v14;
  NSArray *deletedDeviceList;
  id v16;
  NSString *v17;
  NSString *deletedDevicesCacheExpiryOffset;
  id v19;
  NSString *v20;
  NSString *trustedDeviceHash;
  id v22;
  NSString *v23;
  NSString *deletedDeviceHash;
  id v25;
  NSNumber *v26;
  NSNumber *trustedDevicesUpdateTimestamp;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKDeviceListResponse;
  v5 = -[AKDeviceListResponse init](&v29, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adsid"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    altDSID = v5->_altDSID;
    v5->_altDSID = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceListVersion"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = (NSString *)v9;
    else
      v10 = 0;

    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = v10;

    -[AKDeviceListResponse _parseDevicesFromResponseBody:](v5, "_parseDevicesFromResponseBody:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    deviceList = v5->_deviceList;
    v5->_deviceList = (NSArray *)v12;

    -[AKDeviceListResponse _parseDeletedDevicesFromResponseBody:](v5, "_parseDeletedDevicesFromResponseBody:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    deletedDeviceList = v5->_deletedDeviceList;
    v5->_deletedDeviceList = (NSArray *)v14;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deletedDevicesCacheExpiryOffset"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = (NSString *)v16;
    else
      v17 = 0;

    deletedDevicesCacheExpiryOffset = v5->_deletedDevicesCacheExpiryOffset;
    v5->_deletedDevicesCacheExpiryOffset = v17;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trustedDeviceHash"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = (NSString *)v19;
    else
      v20 = 0;

    trustedDeviceHash = v5->_trustedDeviceHash;
    v5->_trustedDeviceHash = v20;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deletedDeviceHash"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = (NSString *)v22;
    else
      v23 = 0;

    deletedDeviceHash = v5->_deletedDeviceHash;
    v5->_deletedDeviceHash = v23;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trustedDevicesUpdateTimestamp"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = (NSNumber *)v25;
    else
      v26 = 0;

    trustedDevicesUpdateTimestamp = v5->_trustedDevicesUpdateTimestamp;
    v5->_trustedDevicesUpdateTimestamp = v26;

  }
  return v5;
}

- (AKDeviceListResponse)initWithCoder:(id)a3
{
  id v4;
  AKDeviceListResponse *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *deviceListVersion;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *deviceList;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *deletedDeviceList;
  uint64_t v20;
  NSString *deletedDevicesCacheExpiryOffset;
  uint64_t v22;
  NSString *trustedDeviceHash;
  uint64_t v24;
  NSString *deletedDeviceHash;
  uint64_t v26;
  NSNumber *trustedDevicesUpdateTimestamp;

  v4 = a3;
  v5 = -[AKDeviceListResponse init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceListVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_deviceList"));
    v13 = objc_claimAutoreleasedReturnValue();
    deviceList = v5->_deviceList;
    v5->_deviceList = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_deletedDeviceList"));
    v18 = objc_claimAutoreleasedReturnValue();
    deletedDeviceList = v5->_deletedDeviceList;
    v5->_deletedDeviceList = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deletedDevicesCacheExpiryOffset"));
    v20 = objc_claimAutoreleasedReturnValue();
    deletedDevicesCacheExpiryOffset = v5->_deletedDevicesCacheExpiryOffset;
    v5->_deletedDevicesCacheExpiryOffset = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trustedDeviceHash"));
    v22 = objc_claimAutoreleasedReturnValue();
    trustedDeviceHash = v5->_trustedDeviceHash;
    v5->_trustedDeviceHash = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deletedDeviceHash"));
    v24 = objc_claimAutoreleasedReturnValue();
    deletedDeviceHash = v5->_deletedDeviceHash;
    v5->_deletedDeviceHash = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trustedDevicesUpdateTimestamp"));
    v26 = objc_claimAutoreleasedReturnValue();
    trustedDevicesUpdateTimestamp = v5->_trustedDevicesUpdateTimestamp;
    v5->_trustedDevicesUpdateTimestamp = (NSNumber *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceListVersion, CFSTR("_deviceListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceList, CFSTR("_deviceList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedDeviceList, CFSTR("_deletedDeviceList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedDevicesCacheExpiryOffset, CFSTR("_deletedDevicesCacheExpiryOffset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trustedDeviceHash, CFSTR("_trustedDeviceHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedDeviceHash, CFSTR("_deletedDeviceHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trustedDevicesUpdateTimestamp, CFSTR("_trustedDevicesUpdateTimestamp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> altDSID: %@, deviceListVersion: %@, deviceList: %@, deletedDeviceList: %@, deletedDevicesCacheExpiryOffset: %@, trustedDeviceHash: %@, deletedDeviceHash: %@, trustedDevicesUpdateTimestamp: %@"), objc_opt_class(), self, self->_altDSID, self->_deviceListVersion, self->_deviceList, self->_deletedDeviceList, self->_deletedDevicesCacheExpiryOffset, self->_trustedDeviceHash, self->_deletedDeviceHash, self->_trustedDevicesUpdateTimestamp);
}

- (id)_parseDevicesFromResponseBody:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("devices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    objc_msgSend(v6, "aaf_map:", &__block_literal_global_40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

AKRemoteDevice *__54__AKDeviceListResponse__parseDevicesFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AKRemoteDevice *v3;

  v2 = a2;
  v3 = -[AKRemoteDevice initWithInfo:]([AKRemoteDevice alloc], "initWithInfo:", v2);

  return v3;
}

- (id)_parseDeletedDevicesFromResponseBody:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deletedDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    objc_msgSend(v6, "aaf_map:", &__block_literal_global_34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

AKRemoteDevice *__61__AKDeviceListResponse__parseDeletedDevicesFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AKRemoteDevice *v3;

  v2 = a2;
  v3 = -[AKRemoteDevice initWithInfo:]([AKRemoteDevice alloc], "initWithInfo:", v2);

  return v3;
}

+ (id)deviceMapFromResponseBody:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__AKDeviceListResponse_deviceMapFromResponseBody___block_invoke;
  v12[3] = &unk_1E2E611E8;
  v13 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

void __50__AKDeviceListResponse_deviceMapFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AKDeviceListResponse *v7;

  v3 = a2;
  v7 = -[AKDeviceListResponse initWithResponseBody:]([AKDeviceListResponse alloc], "initWithResponseBody:", v3);

  -[AKDeviceListResponse altDSID](v7, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    -[AKDeviceListResponse altDSID](v7, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (void)updateWithDeviceRestrictionState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AKDeviceListResponse deviceList](self, "deviceList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke;
  v9[3] = &unk_1E2E61210;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "aaf_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setDeviceRestrictionState:", v6);
  }
  else
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKDeviceListResponse updateWithDeviceRestrictionState:].cold.1(v6, v8);

  }
}

uint64_t __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if (v8)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_1(v5);
  }
  else
  {
    objc_msgSend(v3, "machineId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v5, "machineId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_9;
    }
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_2(v5);
  }

  v13 = 1;
LABEL_9:

  return v13;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceListVersion
{
  return self->_deviceListVersion;
}

- (void)setDeviceListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)deletedDeviceList
{
  return self->_deletedDeviceList;
}

- (void)setDeletedDeviceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)trustedDeviceHash
{
  return self->_trustedDeviceHash;
}

- (void)setTrustedDeviceHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deletedDeviceHash
{
  return self->_deletedDeviceHash;
}

- (void)setDeletedDeviceHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)trustedDevicesUpdateTimestamp
{
  return self->_trustedDevicesUpdateTimestamp;
}

- (void)setTrustedDevicesUpdateTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deletedDevicesCacheExpiryOffset
{
  return self->_deletedDevicesCacheExpiryOffset;
}

- (void)setDeletedDevicesCacheExpiryOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDevicesCacheExpiryOffset, 0);
  objc_storeStrong((id *)&self->_trustedDevicesUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_deletedDeviceHash, 0);
  objc_storeStrong((id *)&self->_trustedDeviceHash, 0);
  objc_storeStrong((id *)&self->_deletedDeviceList, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_deviceListVersion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)updateWithDeviceRestrictionState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "machineId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 141558786;
  v7 = 1752392040;
  v8 = 2112;
  v9 = v4;
  v10 = 2160;
  v11 = 1752392040;
  v12 = 2112;
  v13 = v5;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to find device for serial number %{mask.hash}@ or mid %{mask.hash}@", (uint8_t *)&v6, 0x2Au);

}

void __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "serialNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_4(&dword_19202F000, v2, v3, "Found device for serial number %{mask.hash}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "machineId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_4(&dword_19202F000, v2, v3, "Found device for machineId %{mask.hash}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
