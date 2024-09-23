@implementation HAPAccessory

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (id)servicesOfType:(id)a3
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
  -[HAPAccessory services](self, "services", 0);
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

- (BOOL)_updateAndValidateServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  HAPAccessory *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HAPAccessory services](self, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    v39 = self;
    v40 = v4;
    v37 = *(_QWORD *)v46;
    while (2)
    {
      v8 = 0;
      v38 = v6;
      do
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        objc_msgSend(v9, "instanceID", v37);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if (v11)
        {
          v32 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "instanceID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringValue");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v34;
            v52 = 2112;
            v53 = v36;
            _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has service with duplicate instance ID '%@'", buf, 0x16u);

            goto LABEL_33;
          }
LABEL_34:

          objc_autoreleasePoolPop(v32);
LABEL_23:

          goto LABEL_27;
        }
        objc_msgSend(v9, "instanceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v9, "characteristics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v42 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v18, "instanceID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v3, "containsObject:", v19);

              if (v20)
              {
                v23 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "instanceID");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "stringValue");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v51 = v25;
                  v52 = 2112;
                  v53 = v27;
                  _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has characteristic with duplicate instance ID '%@'", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v23);

                v4 = v40;
                goto LABEL_23;
              }
              objc_msgSend(v18, "instanceID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v21);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v15)
              continue;
            break;
          }
        }

        self = v39;
        if (!-[HAPAccessory _updateService:](v39, "_updateService:", v9))
        {
          v32 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          v4 = v40;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v34;
            _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateService", buf, 0xCu);
LABEL_33:

          }
          goto LABEL_34;
        }
        ++v8;
        v7 = v37;
        v4 = v40;
      }
      while (v8 != v38);
      v6 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (-[HAPAccessory updateForAccessoryInformationService](self, "updateForAccessoryInformationService"))
  {
    v22 = 1;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v30;
      _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateForAccessoryInformationService", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
LABEL_27:
    v22 = 0;
  }

  return v22;
}

- (BOOL)_updateService:(id)a3
{
  if (a3)
    objc_msgSend(a3, "setAccessory:", self);
  return 1;
}

- (BOOL)_validateCharacteristicValues
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HAPAccessory services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v31;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "characteristics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (objc_msgSend(v13, "shouldValidateValueAfterReading"))
              {
                objc_msgSend(v13, "value");
                v14 = objc_claimAutoreleasedReturnValue();
                if (v14)
                {
                  v15 = (void *)v14;
                  v16 = objc_msgSend(v13, "properties");

                  if ((v16 & 2) != 0)
                  {
                    objc_msgSend(v13, "value");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "validateValue:outValue:", v17, 0);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v18)
                    {
                      v20 = (void *)MEMORY[0x1D17B7244]();
                      HMFGetOSLogHandle();
                      v21 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v13, "type");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v35 = v22;
                        v36 = 2112;
                        v37 = v23;
                        v38 = 2112;
                        v39 = v18;
                        _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@[HAP Accessory] ### Failed to validate value with type %@ with error %@", buf, 0x20u);

                      }
                      objc_autoreleasePoolPop(v20);

                      v19 = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
            if (v10)
              continue;
            break;
          }
        }

        v5 = v25;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      v19 = 1;
    }
    while (v4);
  }
  else
  {
    v19 = 1;
  }
LABEL_24:

  return v19;
}

- (NSArray)services
{
  return self->_services;
}

- (BOOL)updateForAccessoryInformationService
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[HAPAccessory services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

        if (v11)
        {
          if (v6)
          {
            v39 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v55 = v41;
              _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has more than one Accessory Information Service", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v39);

            return 0;
          }
          v6 = v9;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v5)
        continue;
      break;
    }

    if (v6)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v6, "characteristics", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_msgSend(v17, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v17, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v20 = v19;
              else
                v20 = 0;
              v21 = v20;

              objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "type");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));

              if (v24)
              {
                -[HAPAccessory setName:](self, "setName:", v22);
              }
              else
              {
                objc_msgSend(v17, "type");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("00000020-0000-1000-8000-0026BB765291"));

                if (v26)
                {
                  -[HAPAccessory setManufacturer:](self, "setManufacturer:", v22);
                }
                else
                {
                  objc_msgSend(v17, "type");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("00000021-0000-1000-8000-0026BB765291"));

                  if (v28)
                  {
                    -[HAPAccessory setModel:](self, "setModel:", v22);
                  }
                  else
                  {
                    objc_msgSend(v17, "type");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("00000030-0000-1000-8000-0026BB765291"));

                    if (v30)
                    {
                      -[HAPAccessory setSerialNumber:](self, "setSerialNumber:", v22);
                    }
                    else
                    {
                      objc_msgSend(v17, "type");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("00000052-0000-1000-8000-0026BB765291"));

                      if (v32)
                      {
                        -[HAPAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v22);
                      }
                      else
                      {
                        objc_msgSend(v17, "type");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("00000220-0000-1000-8000-0026BB765291"));

                        if (v34)
                        {
                          v35 = (void *)objc_opt_class();
                          objc_msgSend(v17, "value");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v35, "productDataStringFromData:", v36);
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          -[HAPAccessory setProductData:](self, "setProductData:", v37);

                        }
                      }
                    }
                  }
                }
              }

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v14);
      }

      return 1;
    }
  }
  else
  {

  }
  v42 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v44;
    _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@### Accessory is missing an Accessory Information Service", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v42);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HAPAccessory *v4;
  HAPAccessory *v5;
  HAPAccessory *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;

  v4 = (HAPAccessory *)a3;
  if (self == v4)
  {
    v15 = 1;
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
      goto LABEL_10;
    -[HAPAccessory instanceID](self, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory instanceID](v6, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

    if (!v9)
      goto LABEL_10;
    -[HAPAccessory identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory identifier](v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_10;
    v13 = -[HAPAccessory linkType](self, "linkType");
    if (v13 == -[HAPAccessory linkType](v6, "linkType"))
    {
      v14 = -[HAPAccessory communicationProtocol](self, "communicationProtocol");
      v15 = v14 == -[HAPAccessory communicationProtocol](v6, "communicationProtocol");
    }
    else
    {
LABEL_10:
      v15 = 0;
    }

  }
  return v15;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPAccessory *v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *workQueue;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  HAPAccessory *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((isValidInstanceID(v9) & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)HAPAccessory;
    v11 = -[HAPAccessory init](&v21, sel_init);
    self = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_server, v8);
      self->_linkType = objc_msgSend(v8, "linkType");
      self->_communicationProtocol = objc_msgSend(v8, "communicationProtocol");
      objc_storeStrong((id *)&self->_instanceID, a4);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.HAPAccessory", v12);
      workQueue = self->_workQueue;
      self->_workQueue = v13;

      if (v10)
      {
        if ((unint64_t)objc_msgSend(v10, "count") >= 0x65)
        {
          v15 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v23 = v17;
            v18 = "%{public}@### Accessory exceeds maximum number of allowed services";
LABEL_9:
            _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

            goto LABEL_10;
          }
          goto LABEL_10;
        }
        objc_storeStrong((id *)&self->_services, a5);
        if (!-[HAPAccessory _validateCharacteristicValues](self, "_validateCharacteristicValues"))
        {
          v15 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_10;
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          v18 = "%{public}@### Accessory failed validateCharacteristicValues";
          goto LABEL_9;
        }
        if (!-[HAPAccessory _updateAndValidateServices](self, "_updateAndValidateServices"))
        {
          v15 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_10;
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          v18 = "%{public}@### Accessory failed _updateAndValidateServices";
          goto LABEL_9;
        }
      }
      self->_consecutiveFailedPingCount = 0;
      self->_primary = 1;
      self->_reachable = 1;
      self->_shouldDisconnectOnIdle = 0;
      if (objc_msgSend(v8, "wakeNumber"))
        self->_suspendedState = 3;
    }
    self = self;
    v19 = self;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v17;
    v18 = "%{public}@### Unable to initialize accessory because of invalid arguments";
    goto LABEL_9;
  }
LABEL_10:

  objc_autoreleasePoolPop(v15);
  v19 = 0;
LABEL_16:

  return v19;
}

- (id)shortDescription
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = HAPIsInternalBuild();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[HAPAccessory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory instanceID](self, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@+%@"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HAPAccessory identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory instanceID](self, "instanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@+%@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HAPAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPAccessory instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setServerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)name
{
  return self->_name;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (BOOL)isReachable
{
  HAPAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)instanceIDForUniqueIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)serverIdentifierWithUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  HAPAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HAPAccessory *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    if (a4 >= 0.0)
    {
      -[HAPAccessory server](self, "server");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v18 = v23;
        objc_msgSend(v23, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v10, v11, v12, a4);
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17B7244]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v27;
          v39 = 2112;
          v40 = v10;
          _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to read characteristics %@ because there is no server.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v18 = 0;
        if (v11 && v12)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_80;
          v28[3] = &unk_1E894D5E0;
          v29 = v13;
          v30 = v12;
          dispatch_async(v11, v28);

          v18 = 0;
        }
      }
      goto LABEL_20;
    }
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_79;
      block[3] = &unk_1E894D5E0;
      v32 = v13;
      v33 = v12;
      dispatch_async(v11, block);

      v18 = v32;
LABEL_20:

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristics are required.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    if (v11 && v12)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
      v34[3] = &unk_1E894D5E0;
      v35 = v13;
      v36 = v12;
      dispatch_async(v11, v34);

      v18 = v35;
      goto LABEL_20;
    }
  }

}

- (NSNumber)category
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  -[HAPAccessory server](self, "server");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[HAPAccessory isPrimary](self, "isPrimary"), v4, v5))
  {
    -[HAPAccessory server](self, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (HAPAccessoryServer)server
{
  return (HAPAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (NSString)productData
{
  return self->_productData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicMacAddress, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  HAPAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    -[HAPAccessory server](self, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HAPAccessory server](self, "server");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShouldDisconnectOnIdle:", v3);

    }
    else
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessory shortDescription](v8, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set shouldDisconnectOnIdle due to no server instance for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
  }
}

- (int64_t)linkLayerType
{
  os_unfair_lock_s *p_lock;
  int64_t linkLayerType;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  linkLayerType = self->_linkLayerType;
  os_unfair_lock_unlock(p_lock);
  return linkLayerType;
}

- (HAPAccessory)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4
{
  return -[HAPAccessory initWithServer:instanceID:parsedServices:](self, "initWithServer:instanceID:parsedServices:", a3, a4, 0);
}

- (NSString)description
{
  void *v2;
  id v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HAPAccessory instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Instance ID: %@    "), v5);

  v6 = HAPIsInternalBuild();
  if (v6)
  {
    -[HAPAccessory server](self, "server");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<private>");
  }
  -[HAPAccessory server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Server: '%@' (%@)    "), v7, v9);

  if (v6)
  {

  }
  if (-[HAPAccessory isPrimary](self, "isPrimary"))
  {
    -[HAPAccessory category](self, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Category: %@    "), v10);

  }
  -[HAPAccessory name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (HAPIsInternalBuild())
    {
      -[HAPAccessory name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Name: %@    "), v12);

    }
    else
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("Name: %@    "), CFSTR("<private>"));
    }
  }
  HAPAccessorySuspendedStateDescription(-[HAPAccessory suspendedState](self, "suspendedState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Suspended State: %@    "), v13);

  -[HAPAccessory model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (-[HAPAccessory manufacturer](self, "manufacturer"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[HAPAccessory serialNumber](self, "serialNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_22;
  }
  -[HAPAccessory model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HAPAccessory model](self, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Model: %@    "), v16);

  }
  -[HAPAccessory manufacturer](self, "manufacturer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HAPAccessory manufacturer](self, "manufacturer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Manufacturer: %@    "), v18);

  }
  -[HAPAccessory serialNumber](self, "serialNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HAPAccessory serialNumber](self, "serialNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Serial Number: %@    "), v20);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("\n"));
LABEL_22:
  -[HAPAccessory services](self, "services");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Services: %@    "), v21);

  return (NSString *)v4;
}

- (BOOL)isPaired
{
  void *v2;
  char v3;

  -[HAPAccessory server](self, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaired");

  return v3;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    -[HAPAccessory delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[HAPAccessory delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessory:didUpdateReachabilityState:", self, v3);

    }
  }
}

- (void)setLinkLayerType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_linkLayerType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)suspendedState
{
  os_unfair_lock_s *p_lock;
  unint64_t suspendedState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  suspendedState = self->_suspendedState;
  os_unfair_lock_unlock(p_lock);
  return suspendedState;
}

- (void)setSuspendedState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_suspendedState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldDisconnectOnIdle
{
  HAPAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)consecutiveFailedPingCount
{
  HAPAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_consecutiveFailedPingCount;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setConsecutiveFailedPingCount:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_consecutiveFailedPingCount = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *uniqueIdentifier;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *identifier;
  NSString *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_uniqueIdentifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);

    if (WeakRetained)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumber stringValue](self->_instanceID, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), v7, CFSTR("+"), v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = self->_uniqueIdentifier;
      self->_uniqueIdentifier = v9;

    }
    else
    {
      v11 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = identifier;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot create globally unique identifier because there is no server for accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
  v15 = self->_uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  HAPAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;
  void *v26;
  HAPAccessory *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      -[HAPAccessory server](self, "server");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v42 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_2;
        v30[3] = &unk_1E894D048;
        v24 = &v32;
        v32 = v12;
        v25 = &v31;
        v31 = v10;
        objc_msgSend(v22, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v23, v11, v30, a4);

      }
      else
      {
        v26 = (void *)MEMORY[0x1D17B7244]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v29;
          v45 = 2112;
          v46 = v10;
          _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to read value for characteristic %@ because there is no server.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        v17 = 0;
        if (!v11 || !v12)
          goto LABEL_21;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_66;
        v33[3] = &unk_1E894D5E0;
        v24 = &v35;
        v35 = v12;
        v25 = &v34;
        v34 = v10;
        dispatch_async(v11, v33);
      }

      v17 = v22;
LABEL_21:

      goto LABEL_22;
    }
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v16;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_63;
      block[3] = &unk_1E894D5E0;
      v38 = v12;
      v37 = v10;
      dispatch_async(v11, block);

      v17 = v38;
      goto LABEL_21;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v21;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic is a required parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    if (v11 && v12)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke;
      v39[3] = &unk_1E894D5E0;
      v40 = 0;
      v41 = v12;
      dispatch_async(v11, v39);

      v17 = v41;
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  HAPAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;
  void *v26;
  HAPAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      -[HAPAccessory server](self, "server");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v43 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_2;
        v31[3] = &unk_1E894D048;
        v24 = &v33;
        v33 = v12;
        v25 = &v32;
        v32 = v10;
        objc_msgSend(v22, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v23, v11, v31, a4);

      }
      else
      {
        v26 = (void *)MEMORY[0x1D17B7244]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "characteristic");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v29;
          v46 = 2112;
          v47 = v30;
          _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to write value for characteristic %@ because there is no server.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        v17 = 0;
        if (!v11 || !v12)
          goto LABEL_21;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_84;
        v34[3] = &unk_1E894D5E0;
        v24 = &v36;
        v36 = v12;
        v25 = &v35;
        v35 = v10;
        dispatch_async(v11, v34);
      }

      v17 = v22;
LABEL_21:

      goto LABEL_22;
    }
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v16;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_83;
      block[3] = &unk_1E894D5E0;
      v39 = v12;
      v38 = v10;
      dispatch_async(v11, block);

      v17 = v39;
      goto LABEL_21;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v21;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic write request is a required parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    if (v11 && v12)
    {
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke;
      v40[3] = &unk_1E894D5E0;
      v41 = 0;
      v42 = v12;
      dispatch_async(v11, v40);

      v17 = v42;
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  HAPAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HAPAccessory *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    if (a4 >= 0.0)
    {
      -[HAPAccessory server](self, "server");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v18 = v23;
        objc_msgSend(v23, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v10, v11, v12, a4);
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17B7244]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v27;
          v39 = 2112;
          v40 = v10;
          _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to write characteristics %@ because there is no server.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v18 = 0;
        if (v11 && v12)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_92;
          v28[3] = &unk_1E894D5E0;
          v29 = v13;
          v30 = v12;
          dispatch_async(v11, v28);

          v18 = 0;
        }
      }
      goto LABEL_20;
    }
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_91;
      block[3] = &unk_1E894D5E0;
      v32 = v13;
      v33 = v12;
      dispatch_async(v11, block);

      v18 = v32;
LABEL_20:

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristic writes are required.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    if (v11 && v12)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
      v34[3] = &unk_1E894D5E0;
      v35 = v13;
      v36 = v12;
      dispatch_async(v11, v34);

      v18 = v35;
      goto LABEL_20;
    }
  }

}

- (void)invalidateWithError:(id)a3
{
  id v4;
  void *v5;
  HAPAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory shortDescription](v6, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating and updating connection state for HAP Accessory: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (id)serviceWithInstanceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HAPAccessory services](self, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "instanceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToNumber:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)characteristicsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HAPAccessory services](self, "services", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "characteristicsOfType:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)characteristicOfType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!v6 || !v7)
    goto LABEL_9;
  -[HAPAccessory servicesOfType:](self, "servicesOfType:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_7;
  }
  -[HAPAccessory servicesOfType:](self, "servicesOfType:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "characteristicsOfType:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
LABEL_7:

    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v9;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (id)characteristicWithInstanceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HAPAccessory services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "characteristics", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "instanceID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v4, "isEqualToNumber:", v15);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
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
  HAPAccessory *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  HAPAccessory *v25;
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
  if (-[HAPAccessory isEqual:](self, "isEqual:", v4))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[HAPAccessory services](self, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    v29 = v4;
    objc_msgSend(v4, "services");
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
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge service, %@, with existing service: %@", buf, 0x20u);

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  HAPAccessory *v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  HAPAccessory *v36;
  NSObject *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  HAPAccessory *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HAPAccessory *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  BOOL v89;
  char v90;
  id v91;
  id v92;
  id obj;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  id v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
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
    v39 = 0;
    goto LABEL_57;
  }
  if (!-[HAPAccessory shouldMergeObject:](self, "shouldMergeObject:", v6))
  {
    v35 = (void *)MEMORY[0x1D17B7244]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v38;
      v111 = 2112;
      v112 = v6;
      _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_INFO, "%{public}@Not merging with accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    goto LABEL_28;
  }
  v85 = v6;
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HAPAccessory services](self, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v86 = v4;
  objc_msgSend(v4, "services");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v87 = v9;
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  v88 = (void *)v12;
  objc_msgSend(v13, "minusSet:", v12);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
  v89 = v14 != 0;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v103 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1D17B7244]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v22;
          v111 = 2112;
          v112 = v18;
          _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed service: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
    }
    while (v15);
  }

  v23 = v88;
  v24 = (void *)objc_msgSend(v88, "mutableCopy");
  objc_msgSend(v24, "minusSet:", v87);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v92 = v24;
  v25 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v99 != v27)
          objc_enumerationMutation(v92);
        v29 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1D17B7244]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v33;
          v111 = 2112;
          v112 = v29;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_INFO, "%{public}@Added service: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(v29, "setAccessory:", v31);
      }
      v26 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    }
    while (v26);
    v34 = 1;
    v23 = v88;
  }
  else
  {
    v34 = v89;
  }
  v90 = v34;

  v40 = (void *)objc_msgSend(v87, "mutableCopy");
  objc_msgSend(v40, "minusSet:", obj);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v91 = v40;
  v41 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v95 != v43)
          objc_enumerationMutation(v91);
        v45 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
        v46 = (void *)MEMORY[0x1D17B7244]();
        v47 = self;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v49;
          v111 = 2112;
          v112 = v45;
          _os_log_impl(&dword_1CCE01000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing service: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v46);
        objc_msgSend(v23, "member:", v45);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50 && objc_msgSend(v45, "mergeObject:", v50))
        {
          v51 = (void *)MEMORY[0x1D17B7244]();
          v52 = v47;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v110 = v54;
            v111 = 2112;
            v112 = v45;
            _os_log_impl(&dword_1CCE01000, v53, OS_LOG_TYPE_INFO, "%{public}@Updated service: %@", buf, 0x16u);

            v23 = v88;
          }

          objc_autoreleasePoolPop(v51);
          v90 = 1;
        }

      }
      v42 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v42);
  }

  v55 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v91, "allObjects");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "arrayWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v92, "allObjects");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObjectsFromArray:", v58);

  v59 = (void *)objc_msgSend(v57, "copy");
  -[HAPAccessory setServices:](self, "setServices:", v59);

  -[HAPAccessory name](self, "name");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v85;
  objc_msgSend(v85, "name");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v60, "isEqualToString:", v61);

  v39 = v90;
  if ((v62 & 1) == 0)
  {
    objc_msgSend(v85, "name");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setName:](self, "setName:", v63);

    v39 = 1;
  }
  -[HAPAccessory manufacturer](self, "manufacturer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "manufacturer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v64, "isEqualToString:", v65);

  v4 = v86;
  if ((v66 & 1) == 0)
  {
    objc_msgSend(v85, "manufacturer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setManufacturer:](self, "setManufacturer:", v67);

    v39 = 1;
  }
  -[HAPAccessory model](self, "model");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "model");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v68, "isEqualToString:", v69);

  if ((v70 & 1) == 0)
  {
    objc_msgSend(v85, "model");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setModel:](self, "setModel:", v71);

    v39 = 1;
  }
  -[HAPAccessory serialNumber](self, "serialNumber");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "serialNumber");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v72, "isEqualToString:", v73);

  if ((v74 & 1) == 0)
  {
    objc_msgSend(v85, "serialNumber");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setSerialNumber:](self, "setSerialNumber:", v75);

    v39 = 1;
  }
  -[HAPAccessory firmwareVersion](self, "firmwareVersion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "firmwareVersion");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v76, "isEqualToString:", v77);

  if ((v78 & 1) == 0)
  {
    objc_msgSend(v85, "firmwareVersion");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v79);

    v39 = 1;
  }
  -[HAPAccessory productData](self, "productData");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "productData");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v80, "isEqualToString:", v81);

  if ((v82 & 1) == 0)
  {
    objc_msgSend(v85, "productData");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setProductData:](self, "setProductData:", v83);

    v39 = 1;
  }

LABEL_57:
  return v39 & 1;
}

- (HAPAccessoryDelegate)delegate
{
  return (HAPAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (HMFMACAddress)bluetoothClassicMacAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBluetoothClassicMacAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSDate)timeBecameReachable
{
  return self->_timeBecameReachable;
}

- (void)setTimeBecameReachable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("One or more target characteristic writes are required."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_91(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("The timeout must not be negative."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_92(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 13, CFSTR("Write failed."), CFSTR("There is no server present for the accessory."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("Characteristic write request is a required parameter."), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);

}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_83(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("The timeout must not be negative."), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);

}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_84(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 13, CFSTR("Write failed."), CFSTR("There is no server present for the accessory."), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);

}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v14 = v5;
    objc_msgSend(a2, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "error");
        v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "characteristic");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v11);

        v5 = v14;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v10 = v14;
    goto LABEL_7;
  }
LABEL_8:

}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("One or more target characteristics are required."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_79(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("The timeout must not be negative."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_80(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 14, CFSTR("Read failed."), CFSTR("There is no server present for the accessory."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");

  objc_msgSend(v2, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("Characteristic is a required parameter."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_63(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("The timeout must not be negative."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_66(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 14, CFSTR("Read failed."), CFSTR("There is no server present for the accessory."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = v5;
    objc_msgSend(a2, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      objc_msgSend(v6, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v6, "error");
        v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v10 = v9;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        v5 = v11;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v9 = v11;
    goto LABEL_7;
  }
LABEL_8:

}

+ (BOOL)isAccessoryPairedWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v13;
  char v14;
  id v15;
  id v16;

  v3 = a3;
  if (v3)
  {
    +[HAPSystemKeychainStore systemStore](HAPSystemKeychainStore, "systemStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    objc_msgSend(v4, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v16, 0, 0, 0, v3, &v15);
    v5 = v16;
    v6 = v15;

    v7 = 0;
    if (!v6 && v5)
    {
      v14 = 0;
      +[HAPSystemKeychainStore systemStore](HAPSystemKeychainStore, "systemStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v8, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v3, &v14, &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v13;

      if (v6)
        v10 = 1;
      else
        v10 = v9 == 0;
      v7 = !v10 && v14 != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)productDataStringFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "hmf_hexadecimalStringWithOptions:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t47 != -1)
    dispatch_once(&logCategory__hmf_once_t47, &__block_literal_global_18586);
  return (id)logCategory__hmf_once_v48;
}

void __27__HAPAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v48;
  logCategory__hmf_once_v48 = v0;

}

@end
