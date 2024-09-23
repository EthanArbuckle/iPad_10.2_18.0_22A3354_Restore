@implementation HAPService

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (BOOL)_validateServiceCharacteristics
{
  void *v3;
  uint64_t v4;
  void *v5;
  HAPService *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  HAPService *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HAPService characteristics](self, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      v9 = "%{public}@One or more characteristics are required";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v5);
    return v4 != 0;
  }
  if (!-[HAPService _validateMandatoryCharacteristics](self, "_validateMandatoryCharacteristics"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      v9 = "%{public}@Invalid mandatory characteristics";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1CCE01000, v10, v11, v9, (uint8_t *)&v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return v4 != 0;
}

- (BOOL)updateAndValidateCharacteristics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  void *v16;
  HAPService *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HAPService *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  HAPService *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[HAPService _validateServiceCharacteristics](self, "_validateServiceCharacteristics"))
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate characteristics", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    return 0;
  }
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HAPService characteristics](self, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HAPService characteristics](self, "characteristics", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
  {
    v15 = 1;
    goto LABEL_22;
  }
  v8 = v7;
  v9 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v11, "instanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "containsObject:", v12);

      if (v13)
      {
        v20 = (void *)MEMORY[0x1D17B7244]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v23;
          v24 = "%{public}@Duplicate characteristic instance IDs";
LABEL_20:
          _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);

        }
LABEL_21:

        objc_autoreleasePoolPop(v20);
        v15 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v11, "instanceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

      if (!-[HAPService _updateCharacteristic:](self, "_updateCharacteristic:", v11))
      {
        v20 = (void *)MEMORY[0x1D17B7244]();
        v25 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v23;
          v24 = "%{public}@Failed to update characteristic";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v15 = 1;
    if (v8)
      continue;
    break;
  }
LABEL_22:

  return v15;
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (BOOL)_updateCharacteristic:(id)a3
{
  if (a3)
    objc_msgSend(a3, "setService:", self);
  return 1;
}

- (BOOL)_validateMandatoryCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HAPService characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[HAPService type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "validateMandatoryCharacteristics:forService:", v4, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HAPService *v4;
  HAPService *v5;
  HAPService *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (HAPService *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_7;
    -[HAPService instanceID](self, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPService instanceID](v6, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = numbersAreNotEqualNilSafe(v7, v8);

    if ((v9 & 1) != 0)
      goto LABEL_7;
    -[HAPService type](self, "type");
    v12 = objc_claimAutoreleasedReturnValue();
    -[HAPService type](v6, "type");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!(v12 | v13))
      goto LABEL_13;
    v14 = (void *)v13;
    v15 = objc_msgSend((id)v12, "isEqualToString:", v13);

    if (!v15)
    {
LABEL_7:
      v10 = 0;
    }
    else
    {
LABEL_13:
      -[HAPService accessory](self, "accessory");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HAPService accessory](v6, "accessory");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[HAPService accessory](self, "accessory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPService accessory](v6, "accessory");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v20, "isEqual:", v21);

        }
        else
        {
          v10 = 1;
        }

      }
      else
      {
        v10 = 1;
      }
    }

  }
  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (HAPAccessory)accessory
{
  return (HAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *type;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  HAPService *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  void *context;
  NSObject *log;
  id v41;
  void *v42;
  id v43;
  void *v44;
  objc_super v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((isValidTypeName(v12) & 1) != 0)
  {
    objc_msgSend(v12, "hap_validatedAndNormalizedUUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if ((isValidInstanceID(v13) & 1) != 0)
      {
        v45.receiver = self;
        v45.super_class = (Class)HAPService;
        self = -[HAPService init](&v45, sel_init);
        if (self)
        {
          v43 = v15;
          +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
          v41 = v13;
          v17 = v14;
          v18 = v16;
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v18);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          type = self->_type;
          self->_type = v20;

          v42 = (void *)v19;
          v22 = (void *)v19;
          v16 = v18;
          v14 = v17;
          v13 = v41;
          objc_msgSend(v22, "serviceUTIFromType:", v16);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            context = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = self->_type;
              *(_DWORD *)buf = 138544130;
              v47 = v23;
              v25 = (void *)v23;
              v48 = 2112;
              v49 = v24;
              v50 = 2112;
              v51 = v44;
              v52 = 2112;
              v53 = v41;
              _os_log_impl(&dword_1CCE01000, log, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(context);
          }
          objc_storeStrong((id *)&self->_instanceID, a4);
          v15 = v43;
          if (v14)
          {
            if ((unint64_t)objc_msgSend(v14, "count") >= 0x65)
            {
              v26 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v47 = (uint64_t)v28;
                v29 = "%{public}@### HAPService exceeds maximum number of allowed characteristics";
LABEL_30:
                _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

                goto LABEL_31;
              }
              goto LABEL_31;
            }
            objc_storeStrong((id *)&self->_characteristics, a5);
            if (!-[HAPService updateAndValidateCharacteristics](self, "updateAndValidateCharacteristics"))
            {
              v26 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v47 = (uint64_t)v28;
                v29 = "%{public}@### HAPService failed updateAndValidateCharacteristics";
                goto LABEL_30;
              }
LABEL_31:

              objc_autoreleasePoolPop(v26);
              goto LABEL_22;
            }
          }
          self->_serviceProperties = a6;
          objc_storeStrong((id *)&self->_linkedServices, a7);

        }
        self = self;
        v33 = self;
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = (uint64_t)v36;
        v37 = "%{public}@### Unable to initialize service because of invalid instance ID";
        goto LABEL_20;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = (uint64_t)v36;
        v37 = "%{public}@### Unable to initialize service because type name is not a UUID";
LABEL_20:
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v34);
LABEL_22:
    v33 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v30 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = (uint64_t)v32;
    v48 = 2112;
    v49 = (NSString *)v12;
    _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize service because of invalid service type name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v30);
  v33 = 0;
LABEL_27:

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4
{
  return -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](self, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", a3, a4, 0, 0, 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPService instanceID](self, "instanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPService instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPService type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPService propertiesDescription](self, "propertiesDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPService linkedServices](self, "linkedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Instance ID: %@, Type: %@, Properties: %@, Linked Service: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)propertiesDescription
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((-[HAPService serviceProperties](self, "serviceProperties") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("primary"));
  if ((-[HAPService serviceProperties](self, "serviceProperties") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("hidden"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)characteristicsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HAPService characteristics](self, "characteristics", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HAPService *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  HAPService *v25;
  void *v26;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPService isEqual:](self, "isEqual:", v4))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[HAPService characteristics](self, "characteristics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    v29 = v4;
    objc_msgSend(v4, "characteristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v7;
    v11 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v11, "intersectSet:", v10);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (!v13)
    {
      v16 = 1;
      goto LABEL_18;
    }
    v14 = v13;
    v15 = *(_QWORD *)v32;
    v16 = 1;
    while (1)
    {
      v17 = 0;
      v30 = v14;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v17);
        objc_msgSend(v10, "member:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          if ((objc_msgSend(v18, "shouldMergeObject:", v19) & 1) != 0)
            goto LABEL_13;
          v20 = (void *)MEMORY[0x1D17B7244]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v23 = v15;
            v24 = v10;
            v25 = self;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v26;
            v37 = 2112;
            v38 = v19;
            v39 = 2112;
            v40 = v12;
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge characteristic, %@, with existing characteristic: %@", buf, 0x20u);

            self = v25;
            v10 = v24;
            v15 = v23;
            v14 = v30;
          }

          objc_autoreleasePoolPop(v20);
        }
        v16 = 0;
LABEL_13:

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (!v14)
      {
LABEL_18:

        v4 = v29;
        goto LABEL_19;
      }
    }
  }
  v16 = 0;
LABEL_19:

  return v16 & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  HAPService *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  HAPService *v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  HAPService *v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  HAPService *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HAPService *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  id v65;
  void *v66;
  BOOL v67;
  id v68;
  id v69;
  id obj;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
LABEL_28:
    v41 = 0;
    goto LABEL_45;
  }
  if (!-[HAPService shouldMergeObject:](self, "shouldMergeObject:", v6))
  {
    v37 = (void *)MEMORY[0x1D17B7244]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v88 = v40;
      v89 = 2112;
      v90 = v6;
      _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_INFO, "%{public}@Not merging with service: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    goto LABEL_28;
  }
  v64 = v6;
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HAPService characteristics](self, "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v65 = v4;
  objc_msgSend(v4, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v9;
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  v71 = v12;
  objc_msgSend(v13, "minusSet:", v12);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  v67 = v14 != 0;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v81 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1D17B7244]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v22;
          v89 = 2112;
          v90 = v18;
          _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v15);
  }

  v23 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v23, "minusSet:", v66);
  -[HAPService characteristics](self, "characteristics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "shouldValidateValueAfterReading");

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v69 = v23;
  v27 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v77 != v29)
          objc_enumerationMutation(v69);
        v31 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        v32 = (void *)MEMORY[0x1D17B7244]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v35;
          v89 = 2112;
          v90 = v31;
          _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_INFO, "%{public}@Added characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(v31, "setService:", v33);
        objc_msgSend(v31, "setShouldValidateValueAfterReading:", v26);
      }
      v28 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v28);
    v36 = 1;
  }
  else
  {
    v36 = v67;
  }

  v42 = (void *)objc_msgSend(v66, "mutableCopy");
  objc_msgSend(v42, "minusSet:", obj);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v68 = v42;
  v43 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v73 != v45)
          objc_enumerationMutation(v68);
        v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
        v48 = (void *)MEMORY[0x1D17B7244]();
        v49 = self;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v51;
          v89 = 2112;
          v90 = v47;
          _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v48);
        objc_msgSend(v71, "member:", v47);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52 && objc_msgSend(v47, "mergeObject:", v52))
        {
          v53 = (void *)MEMORY[0x1D17B7244]();
          v54 = v49;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v88 = v56;
            v89 = 2112;
            v90 = v47;
            _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_INFO, "%{public}@Updated characteristic: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v53);
          v36 = 1;
        }

      }
      v44 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    }
    while (v44);
  }
  v41 = v36;

  v57 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v68, "allObjects");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "arrayWithArray:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "allObjects");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v60);

  v61 = (void *)objc_msgSend(v59, "copy");
  -[HAPService setCharacteristics:](self, "setCharacteristics:", v61);

  v6 = v64;
  -[HAPService setServiceProperties:](self, "setServiceProperties:", objc_msgSend(v64, "serviceProperties"));
  objc_msgSend(v64, "linkedServices");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPService setLinkedServices:](self, "setLinkedServices:", v62);

  v4 = v65;
LABEL_45:

  return v41 & 1;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (CBService)cbService
{
  void *v2;
  id v3;

  objc_getAssociatedObject(self, "cbService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (CBService *)v3;
}

- (void)setCBService:(id)a3
{
  objc_setAssociatedObject(self, "cbService", a3, (void *)1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HAPService type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[HAPService instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[HAPService characteristics](self, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
  v13 = -[HAPService serviceProperties](self, "serviceProperties");
  v14 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[HAPService linkedServices](self, "linkedServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
  v17 = (void *)objc_msgSend(v5, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v7, v9, v12, v13, v16);

  return v17;
}

- (BOOL)hap2_mergeWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[HAPService characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPService characteristics](self, "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __42__HAPService_HAP2__hap2_mergeWithService___block_invoke;
  v31[3] = &unk_1E894D098;
  v10 = v7;
  v32 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "characteristics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  v21 = 3221225472;
  v22 = __42__HAPService_HAP2__hap2_mergeWithService___block_invoke_2;
  v23 = &unk_1E894D220;
  v15 = v10;
  v24 = v15;
  v26 = &v27;
  v16 = v13;
  v25 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v20);

  if (objc_msgSend(v15, "count", v20, v21, v22, v23))
    *((_BYTE *)v28 + 24) = 1;
  v17 = (void *)objc_msgSend(v16, "copy");
  -[HAPService setCharacteristics:](self, "setCharacteristics:", v17);

  v18 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __42__HAPService_HAP2__hap2_mergeWithService___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "instanceID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __42__HAPService_HAP2__hap2_mergeWithService___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)a1[4];
  v14 = v3;
  objc_msgSend(v3, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)a1[4];
    objc_msgSend(v14, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    v9 = objc_msgSend(v6, "hap2_mergeWithCharacteristic:", v14);
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = (v9 & 1) != 0 || *(_BYTE *)(v10 + 24) != 0;
    *(_BYTE *)(v10 + 24) = v11;
    v12 = (void *)a1[5];
    v13 = v6;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v12 = (void *)a1[5];
    v13 = v14;
  }
  objc_msgSend(v12, "addObject:", v13);

}

+ (BOOL)hap2_mergeServices:(id)a3 discoveredServices:(id)a4 mergedServices:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke;
  v28[3] = &unk_1E894C9C0;
  v12 = v10;
  v29 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v17 = v11;
  v18 = 3221225472;
  v19 = __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke_2;
  v20 = &unk_1E894BE58;
  v13 = v12;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v23 = &v24;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v13, "count", v17, v18, v19, v20))
  {
    v15 = 1;
    *((_BYTE *)v25 + 24) = 1;
  }
  else
  {
    v15 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "instanceID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  objc_msgSend(v3, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v12, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    v9 = objc_msgSend(v6, "hap2_mergeWithService:", v12);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = (v9 & 1) != 0 || *(_BYTE *)(v10 + 24) != 0;
    *(_BYTE *)(v10 + 24) = v11;
    objc_msgSend(v6, "updateAndValidateCharacteristics");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

@end
