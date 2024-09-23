@implementation HMDCharacteristicUpdateTuple

- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5
{
  id v9;
  id v10;
  HMDCharacteristicUpdateTuple *v11;
  HMDCharacteristicUpdateTuple *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicUpdateTuple;
  v11 = -[HMDCharacteristicUpdateTuple init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a3);
    objc_storeStrong(&v12->_value, a4);
    v12->_broadcast = a5;
  }

  return v12;
}

- (id)updatedValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDCharacteristicUpdateTuple *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  HMDCharacteristicUpdateTuple *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDCharacteristicUpdateTuple characteristicResponse](self, "characteristicResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());

  if (v5)
  {
    -[HMDCharacteristicUpdateTuple characteristic](self, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastKnownValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCharacteristicUpdateTuple characteristic](self, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastKnownValueUpdateTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicUpdateTuple characteristicResponse](self, "characteristicResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueUpdatedTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "compare:", v11) == 1)
    {
      -[HMDCharacteristicUpdateTuple value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqual:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543874;
          v20 = v17;
          v21 = 2112;
          v22 = v15;
          v23 = 2112;
          v24 = v7;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating tuple to last known characteristic value %@ -> %@", (uint8_t *)&v19, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
        -[HMDCharacteristicUpdateTuple setValue:](v15, "setValue:", v7);
      }
    }
    else
    {

    }
  }
  -[HMDCharacteristicUpdateTuple value](self, "value");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCharacteristicUpdateTuple characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDCharacteristicUpdateTuple value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = -[HMDCharacteristicUpdateTuple isBroadcast](self, "isBroadcast");
        v12 = v11 ^ objc_msgSend(v6, "isBroadcast") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCharacteristicUpdateTuple characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicUpdateTuple characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("characteristic"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicUpdateTuple value](self, "value", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("value"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicUpdateTuple isBroadcast](self, "isBroadcast");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("isBroadcast"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (BOOL)isBroadcast
{
  return self->_broadcast;
}

- (HMDCharacteristicResponse)characteristicResponse
{
  return self->_characteristicResponse;
}

- (void)setCharacteristicResponse:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicResponse, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicResponse, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

+ (id)characteristicUpdateTuplesWithCharacteristics:(id)a3 isBroadcast:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HMDCharacteristicUpdateTuple *v13;
  void *v14;
  HMDCharacteristicUpdateTuple *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = [HMDCharacteristicUpdateTuple alloc];
        objc_msgSend(v12, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HMDCharacteristicUpdateTuple initWithCharacteristic:updatedValue:isBroadcast:](v13, "initWithCharacteristic:updatedValue:isBroadcast:", v12, v14, v4);

        objc_msgSend(v6, "addObject:", v15);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

@end
