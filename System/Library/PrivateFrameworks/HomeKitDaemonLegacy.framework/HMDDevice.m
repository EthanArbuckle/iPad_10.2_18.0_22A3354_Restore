@implementation HMDDevice

- (HMDDevice)initWithService:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDDevice *v21;
  HMDDevice *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmd_handlesForService:", v6);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v15, "isGlobal", (_QWORD)v30))
          {
            objc_msgSend(v15, "identifier");
            v16 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v16;
            goto LABEL_16;
          }
          if (!v12)
          {
            if (objc_msgSend(v15, "isLocal"))
            {
              objc_msgSend(v15, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v11)
          continue;
        break;
      }
LABEL_16:

      if (v12)
      {
        objc_msgSend(v8, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_productInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_version");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_capabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](self, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v12, v9, v17, v18, v19, v20);

        v22 = v21;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v22 = 0;
    goto LABEL_25;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Device is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v22 = 0;
LABEL_26:

  return v22;
}

- (id)deviceForIDSService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HMDDevice localHandles](self, "localHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v19 = v8;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v14 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v13, "hmd_handlesForService:", v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setWithArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v7, "intersectsSet:", v16);

          if (v17)
          {
            v10 = v13;
            goto LABEL_12;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
LABEL_12:
      v8 = v19;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)destinationForDevice:(id)a3 service:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "hmd_preferredHandleForService:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)identities
{
  void *v3;
  void *v4;

  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForDevice:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (HMDDevice)init
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDDevice)initWithIdentifier:(id)a3 handles:(id)a4 name:(id)a5 productInfo:(id)a6 version:(id)a7 capabilities:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDDevice *v20;
  HMDDevice *v21;
  uint64_t v22;
  NSUUID *identifier;
  uint64_t v24;
  NSSet *handles;
  uint64_t v26;
  NSString *name;
  uint64_t v28;
  HMFProductInfo *productInfo;
  uint64_t v30;
  HMDDeviceCapabilities *capabilities;
  objc_super v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HMDDevice;
  v20 = -[HMDDevice init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_lock.lock._os_unfair_lock_opaque = 0;
    v22 = objc_msgSend(v14, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSUUID *)v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v24 = objc_claimAutoreleasedReturnValue();
    handles = v21->_handles;
    v21->_handles = (NSSet *)v24;

    v26 = objc_msgSend(v16, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v26;

    v28 = objc_msgSend(v17, "copy");
    productInfo = v21->_productInfo;
    v21->_productInfo = (HMFProductInfo *)v28;

    objc_storeStrong((id *)&v21->_version, a7);
    v30 = objc_msgSend(v19, "copy");
    capabilities = v21->_capabilities;
    v21->_capabilities = (HMDDeviceCapabilities *)v30;

    objc_storeStrong((id *)&v21->_localOnlyVersionFromIDS, a7);
  }

  return v21;
}

- (HMDDevice)initWithDeviceAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDevice *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "idsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isGlobal") & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_5:
    _HMFPreconditionFailure();
  }
  if ((objc_msgSend(v8, "isLocal") & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](self, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v9, v10, 0, 0, 0, 0);

  return v11;
}

- (HMDDevice)initWithObjectModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDevice *v13;
  uint64_t v14;
  NSUUID *modelIdentifier;
  void *v16;
  uint64_t v17;
  HMDRPIdentity *rpIdentity;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "deviceHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](self, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v8, v9, v10, v11, v12, 0);

  if (v13)
  {
    objc_msgSend(v4, "uuid");
    v14 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v13->_modelIdentifier;
    v13->_modelIdentifier = (NSUUID *)v14;

    objc_msgSend(v4, "rpIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    rpIdentity = v13->_rpIdentity;
    v13->_rpIdentity = (HMDRPIdentity *)v17;

  }
  return v13;
}

- (NSString)shortDescription
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = isInternalBuild();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDDevice identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    -[HMDDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[10];

  v36[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice identifier](self, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ID"));
  v36[0] = v33;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v5;
  v30 = (void *)objc_msgSend(v4, "initWithName:value:options:formatter:", CFSTR("Nm"), v5, 0);
  v36[1] = v30;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice version](self, "version");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[HMDDevice version](self, "version");
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("Unknown");
  }
  v28 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Ver"), v7, v7);
  v36[2] = v28;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice capabilities](self, "capabilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shortDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Cap"));
  v36[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice sharedUserIDSIdentifier](self, "sharedUserIDSIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("SHID"), v11);
  v36[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice localOnlyVersionFromIDS](self, "localOnlyVersionFromIDS");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[HMDDevice localOnlyVersionFromIDS](self, "localOnlyVersionFromIDS");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("Unknown");
  }
  v16 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("IdsVer"), v15);
  v36[5] = v16;
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice idsIdentifier](self, "idsIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("IDS"), v18);
  v36[6] = v19;
  v20 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDevice handles](self, "handles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Hndl"), v21);
  v36[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 8);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  if (v29)

  return (NSArray *)v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDDevice *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDDevice *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDDevice identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isRelatedToDevice:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[HMDDevice isEqual:](self, "isEqual:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    -[HMDDevice handles](self, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intersectSet:", v11);

    v5 = objc_msgSend(v8, "count") != 0;
  }

  return v5;
}

- (BOOL)isSameAccountWithDevice:(id)a3
{
  HMDDevice *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  HMDDevice *v9;
  HMDDevice *v10;
  void *v11;
  HMDDevice *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  HMDDevice *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (HMDDevice *)a3;
  -[HMDDevice account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDevice account](v4, "account");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = HMFEqualObjects();
  }
  else
  {
    if (v5)
      v9 = v4;
    else
      v9 = self;
    v10 = v9;
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Device is missing account %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);

    v8 = 0;
  }

  return v8;
}

- (HMDDeviceAddress)deviceAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDDevice idsIdentifier](self, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDevice globalHandles](self, "globalHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceAddress addressWithIDSIdentifier:idsDestination:](HMDDeviceAddress, "addressWithIDSIdentifier:idsDestination:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDeviceAddress *)v7;
}

- (id)handles
{
  hmf_unfair_data_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSSet allObjects](self->_handles, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (id)localHandles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDDevice handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocal", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)globalHandles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDDevice handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isGlobal", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)globalDestination
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDDevice globalHandles](self, "globalHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSData)pushToken
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDDevice globalHandles](self, "globalHandles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "pushToken");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSData *)v8;
}

- (void)setHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  NSSet *handles;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[HMDDevice account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "copy");
    if (v5)
    {
      objc_msgSend(v5, "handles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "primaryHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __deviceHandlesForAccount(v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    handles = self->_handles;
    self->_handles = v10;

    os_unfair_lock_unlock(&self->_lock.lock);
    v4 = v12;
  }

}

- (void)__handleAccountHandleUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDDevice *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *handles;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDDevice account](self, "account");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing updated account handle", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v7, "handles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
      {
        objc_msgSend(v7, "primaryHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          os_unfair_lock_lock_with_options();
          -[NSSet allObjects](v10->_handles, "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          __deviceHandlesForAccount(v15, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          handles = v10->_handles;
          v10->_handles = (NSSet *)v17;

          os_unfair_lock_unlock(&v10->_lock.lock);
        }

      }
    }
  }

}

- (NSUUID)idsIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HMDDevice localHandles](self, "localHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "internal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSUUID *)v7;
}

- (BOOL)isCurrentDevice
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDevice idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (NSString)name
{
  hmf_unfair_data_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDAccount)account
{
  hmf_unfair_data_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  os_unfair_lock_unlock(&p_lock->lock);
  return (HMDAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  hmf_unfair_data_lock_s *p_lock;
  void *v8;
  HMDDevice *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSUUID *v14;
  void *v15;
  HMDDevice *v16;
  NSObject *v17;
  void *v18;
  NSUUID *modelIdentifier;
  void *v20;
  _BOOL4 v21;
  id v22;
  HMDDevice *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSSet *handles;
  id *p_isa;
  id v31;
  uint8_t buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "primaryHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_account, v4);
  if (v4)
  {
    if (!self->_modelIdentifier)
    {
      objc_msgSend(v4, "modelIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      p_isa = (id *)&v9->super.super.isa;
      v31 = v8;
      if (v31)
      {
        v10 = (void *)MEMORY[0x1E0CB3A28];
        -[HMDDevice identifier](v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hm_deriveUUIDFromBaseUUID:withSalts:", v31, v13);
        v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v9;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing parent identifier while updating model identifier.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        v14 = 0;
      }

      modelIdentifier = self->_modelIdentifier;
      self->_modelIdentifier = v14;

      objc_msgSend(p_isa[10], "modelParentIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
        objc_msgSend(p_isa[10], "setModelParentIdentifier:", self->_modelIdentifier);
    }
    v22 = v4;
    v23 = self;
    __deregisterForAccountHandleUpdates(v23);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v23, sel___handleAccountHandleUpdated_, CFSTR("HMDAccountHandlesUpdatedNotification"), v22);

    v25 = (void *)MEMORY[0x1E0C99E60];
    -[NSSet allObjects](v23->_handles, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    __deviceHandlesForAccount(v26, v6, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    handles = v23->_handles;
    v23->_handles = (NSSet *)v28;

  }
  else
  {
    __deregisterForAccountHandleUpdates(self);
  }
  os_unfair_lock_unlock(&p_lock->lock);

}

- (HMFProductInfo)productInfo
{
  hmf_unfair_data_lock_s *p_lock;
  HMFProductInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_productInfo;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setProductInfo:(id)a3
{
  HMFProductInfo *v4;
  HMFProductInfo *productInfo;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (HMFProductInfo *)objc_msgSend(v6, "copy");
  productInfo = self->_productInfo;
  self->_productInfo = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDHomeKitVersion)version
{
  hmf_unfair_data_lock_s *p_lock;
  HMDHomeKitVersion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_version;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setVersion:(id)a3
{
  HMDHomeKitVersion *v4;
  HMDHomeKitVersion *version;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (HMDHomeKitVersion *)objc_msgSend(v6, "copy");
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (void)updateVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[HMDDevice setVersion:](self, "setVersion:", a3);
  -[HMDDevice setDirty:](self, "setDirty:", 1);
  -[HMDDevice account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __HMDDeviceMarkDirty(self, v6);

  if (objc_msgSend(v5, "shouldSyncDevice:", self))
  {
    objc_msgSend(v5, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateModelObjects:destination:", v8, 2);

  }
}

- (void)updateWithDevice:(id)a3
{
  HMDDevice *v4;
  HMDDevice *v5;
  void *v6;
  HMDDevice *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDDeviceCapabilitiesModel *v29;
  HMDDeviceCapabilitiesModel *v30;
  HMDDeviceCapabilitiesModel *v31;
  id v32;
  void *v33;
  id v34;
  HMDDeviceCapabilitiesModel *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  HMDDeviceCapabilities *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  HMDDevice *v49;
  __int16 v50;
  HMDDevice *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (HMDDevice *)a3;
  v5 = v4;
  if (v4 && self != v4)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v9;
      v48 = 2112;
      v49 = v7;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating with device -- local: %@, remote: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDevice account](v7, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v11;
    objc_msgSend(v11, "backingStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v12;
    objc_msgSend(v12, "transaction:options:", CFSTR("Update Device"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDevice modelObjectWithChangeType:version:](v7, "modelObjectWithChangeType:version:", 2, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    -[HMDDevice modelObjectWithChangeType:version:](v5, "modelObjectWithChangeType:version:", 2, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (objc_msgSend(v17, "diff:differingFields:", v20, 0))
    {
      v21 = (id)objc_msgSend(v17, "merge:", v20);
      objc_msgSend(v17, "uuid");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(v17, "parentUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v14, "add:", v17);
      }
    }
    v44 = v14;
    -[HMDDevice capabilities](v7, "capabilities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "modelObjectWithChangeType:version:", 2, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDevice capabilities](v5, "capabilities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "modelObjectWithChangeType:version:", 2, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
    v31 = v30;

    v32 = v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    v35 = v29;
    if (!v31)
    {
      -[HMDDevice modelIdentifier](v7, "modelIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        +[HMDDeviceCapabilities deviceCapabilitiesModelIdentifierWithParentIdentifier:](HMDDeviceCapabilities, "deviceCapabilitiesModelIdentifierWithParentIdentifier:", v36);
      else
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDDeviceCapabilitiesModel alloc], "initWithObjectChangeType:uuid:parentUUID:", 1, v37, v36);

    }
    if (-[HMDBackingStoreModelObject diff:differingFields:](v35, "diff:differingFields:", v34, 0))
    {
      v38 = -[HMDBackingStoreModelObject merge:](v35, "merge:", v34);
      -[HMDBackingStoreModelObject uuid](v35, "uuid");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        -[HMDBackingStoreModelObject parentUUID](v35, "parentUUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          objc_msgSend(v44, "add:", v35);
      }
    }
    if (objc_msgSend(v45, "shouldSyncDevice:", v7))
    {
      objc_msgSend(v44, "run");
    }
    else
    {
      __transactionDeviceUpdated(v7, v17, 0);
      v42 = -[HMDDeviceCapabilities initWithObjectModel:]([HMDDeviceCapabilities alloc], "initWithObjectModel:", v35);
      -[HMDDevice setCapabilities:](v7, "setCapabilities:", v42);

    }
  }

}

- (HMDHomeKitVersion)localOnlyVersionFromIDS
{
  hmf_unfair_data_lock_s *p_lock;
  HMDHomeKitVersion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_localOnlyVersionFromIDS;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setLocalOnlyVersionFromIDS:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_localOnlyVersionFromIDS && !objc_msgSend(v8, "isGreaterThanVersion:"))
  {
    os_unfair_lock_unlock(&self->_lock.lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_localOnlyVersionFromIDS, a3);
    os_unfair_lock_unlock(&self->_lock.lock);
    -[HMDDevice setDirty:](self, "setDirty:", 1);
    -[HMDDevice account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __HMDDeviceMarkDirty(self, v7);

  }
}

- (BOOL)supportsHH2
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDevice derivedVersion](self, "derivedVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HMDMinimumHomeKitVersionSupportingHH2();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isAtLeastVersion:", v3);

  return v4;
}

- (HMDHomeKitVersion)derivedVersion
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[HMDDevice localOnlyVersionFromIDS](self, "localOnlyVersionFromIDS");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[HMDDevice localOnlyVersionFromIDS](self, "localOnlyVersionFromIDS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDevice version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isGreaterThanVersion:", v6);

  if (v7)
  {
    -[HMDDevice localOnlyVersionFromIDS](self, "localOnlyVersionFromIDS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    -[HMDDevice version](self, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HMDHomeKitVersion *)v8;
}

- (HMDDeviceCapabilities)capabilities
{
  hmf_unfair_data_lock_s *p_lock;
  HMDDeviceCapabilities *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_capabilities;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setCapabilities:(id)a3
{
  HMDDeviceCapabilities *v4;
  HMDDeviceCapabilities *capabilities;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (HMDDeviceCapabilities *)objc_msgSend(v7, "copy");
  capabilities = self->_capabilities;
  self->_capabilities = v4;

  if (self->_modelIdentifier)
  {
    -[HMDDeviceCapabilities modelParentIdentifier](self->_capabilities, "modelParentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[HMDDeviceCapabilities setModelParentIdentifier:](self->_capabilities, "setModelParentIdentifier:", self->_modelIdentifier);
  }
  os_unfair_lock_unlock(&self->_lock.lock);

}

- (BOOL)isDirty
{
  HMDDevice *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_dirty;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)setDirty:(BOOL)a3
{
  hmf_unfair_data_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_dirty = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (NSUUID)idsIdentifierHash
{
  hmf_unfair_data_lock_s *p_lock;
  NSUUID *v4;
  NSUUID *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_idsIdentifierHash;
  os_unfair_lock_unlock(&p_lock->lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HMDDevice idsIdentifier](self, "idsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDDevice idsIdentifier](self, "idsIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        if (__idsIdentifierHashFromIDSIdentifier_onceToken != -1)
          dispatch_once(&__idsIdentifierHashFromIDSIdentifier_onceToken, &__block_literal_global_366);
        v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v10 = __idsIdentifierHashFromIDSIdentifier_namespace;
        objc_msgSend(v8, "dataUsingEncoding:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (NSUUID *)objc_msgSend(v9, "initWithNamespace:data:", v10, v11);

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)setIDSIdentifierHash:(id)a3
{
  NSUUID *v4;
  NSUUID *idsIdentifierHash;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSUUID *)objc_msgSend(v6, "copy");
  idsIdentifierHash = self->_idsIdentifierHash;
  self->_idsIdentifierHash = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (id)remoteDestinationString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDDevice globalHandles](self, "globalHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDDevice localHandles](self, "localHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (HMDRPIdentity)rpIdentity
{
  hmf_unfair_data_lock_s *p_lock;
  HMDRPIdentity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rpIdentity;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setRpIdentity:(id)a3
{
  HMDRPIdentity *v4;
  void *v5;
  HMDDevice *v6;
  NSObject *v7;
  void *v8;
  HMDRPIdentity *rpIdentity;
  int v10;
  void *v11;
  __int16 v12;
  HMDRPIdentity *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (HMDRPIdentity *)a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setting RPIdentity %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  rpIdentity = v6->_rpIdentity;
  v6->_rpIdentity = v4;

  os_unfair_lock_unlock(&v6->_lock.lock);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMDDevice *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMDDevice *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  HMDDevice *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  HMDDevice *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  HMDDevice *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  HMDDevice *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  HMDDevice *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  BOOL v87;
  int v89;
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
    goto LABEL_46;
  -[HMDDevice idsIdentifier](self, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "idsIdentifierHash");
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
    goto LABEL_7;
  v34 = (void *)v33;
  -[HMDDevice idsIdentifierHash](self, "idsIdentifierHash");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idsIdentifierHash");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "isEqual:", v36);

  if ((v37 & 1) != 0)
    goto LABEL_7;
  v38 = (void *)MEMORY[0x1D17BA0A0]();
  v39 = self;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifierHash");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 138543618;
    v90 = v41;
    v91 = 2112;
    v92 = v42;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Updating device account identifier to %@", (uint8_t *)&v89, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  objc_msgSend(v6, "idsIdentifierHash");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDevice setIDSIdentifierHash:](v39, "setIDSIdentifierHash:", v43);

  v8 = 1;
LABEL_8:
  -[HMDDevice name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 138543618;
      v90 = v15;
      v91 = 2112;
      v92 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Updating device name to %@", (uint8_t *)&v89, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice setName:](v13, "setName:", v17);

    v8 = 1;
  }
  objc_msgSend(v6, "productInfo");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[HMDDevice productInfo](self, "productInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 138543618;
        v90 = v26;
        v91 = 2112;
        v92 = v27;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Updating device product info to %@", (uint8_t *)&v89, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v6, "productInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice setProductInfo:](v24, "setProductInfo:", v28);

      v8 = 1;
    }
  }
  objc_msgSend(v6, "version");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if (-[HMDDevice isCurrentDevice](self, "isCurrentDevice"))
    {
      -[HMDDevice version](self, "version");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "version");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if ((v32 & 1) != 0)
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(v6, "version");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice version](self, "version");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isGreaterThanVersion:", v45);

      if (!v46)
        goto LABEL_30;
    }
    v47 = (void *)MEMORY[0x1D17BA0A0]();
    v48 = self;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "version");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 138543618;
      v90 = v50;
      v91 = 2112;
      v92 = v51;
      _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Updating device version to %@", (uint8_t *)&v89, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
    objc_msgSend(v6, "version");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice setVersion:](v48, "setVersion:", v52);

    v8 = 1;
  }
LABEL_30:
  objc_msgSend(v6, "capabilities");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[HMDDevice capabilities](self, "capabilities");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capabilities");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) == 0)
    {
      v58 = (void *)MEMORY[0x1D17BA0A0]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "capabilities");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 138543618;
        v90 = v61;
        v91 = 2112;
        v92 = v62;
        _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_DEBUG, "%{public}@Updating device capabilities to: %@", (uint8_t *)&v89, 0x16u);

      }
      objc_autoreleasePoolPop(v58);
      objc_msgSend(v6, "capabilities");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice setCapabilities:](v59, "setCapabilities:", v63);

      v8 = 1;
    }
  }
  objc_msgSend(v6, "rpIdentity");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    objc_msgSend(v6, "rpIdentity");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice rpIdentity](self, "rpIdentity");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if ((v68 & 1) == 0)
    {
      objc_msgSend(v6, "rpIdentity");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice setRpIdentity:](self, "setRpIdentity:", v69);

      v8 = 1;
    }
  }
  v70 = (void *)MEMORY[0x1E0C99E20];
  -[HMDDevice handles](self, "handles");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithArray:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "handles");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setWithArray:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v72, "mergeObject:", v75);

  if (v76)
  {
    v77 = (void *)MEMORY[0x1D17BA0A0]();
    v78 = self;
    HMFGetOSLogHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 138543618;
      v90 = v80;
      v91 = 2112;
      v92 = v72;
      _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_DEBUG, "%{public}@Updating handles: %@", (uint8_t *)&v89, 0x16u);

    }
    objc_autoreleasePoolPop(v77);
    objc_msgSend(v72, "allObjects");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice setHandles:](v78, "setHandles:", v81);

    goto LABEL_43;
  }

  if (!v8)
  {
LABEL_46:
    v87 = 0;
    goto LABEL_47;
  }
LABEL_43:
  v82 = (void *)MEMORY[0x1D17BA0A0]();
  v83 = self;
  HMFGetOSLogHandle();
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 138543362;
    v90 = v85;
    _os_log_impl(&dword_1CD062000, v84, OS_LOG_TYPE_INFO, "%{public}@Merge resulted in changes, posting update notification", (uint8_t *)&v89, 0xCu);

  }
  objc_autoreleasePoolPop(v82);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "postNotificationName:object:", CFSTR("HMDDeviceUpdatedNotification"), v83);

  v87 = 1;
LABEL_47:

  return v87;
}

- (HMDDevice)initWithCoder:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _HMDLocalDeviceHandle *v11;
  HMDDeviceHandle *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDDevice *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHomeKitVersion *v25;
  void *v26;
  HMDHomeKitVersion *v27;
  HMDDeviceCapabilities *v28;
  HMDDeviceCapabilitiesModel *v29;
  void *v30;
  HMDDeviceCapabilitiesModel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDDevice *v36;
  uint64_t v37;
  NSUUID *modelIdentifier;
  uint64_t v39;
  NSUUID *idsIdentifierHash;
  void *v41;
  char v42;
  uint64_t v43;
  HMDRPIdentity *rpIdentity;
  uint64_t v45;
  NSUUID *sharedUserIDSIdentifier;
  void *v48;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E0CB3000uLL;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.productInfo"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HM.handles")))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("HM.handles"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.idsIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = -[_HMDLocalDeviceHandle initWithDeviceIdentifier:]([_HMDLocalDeviceHandle alloc], "initWithDeviceIdentifier:", v9);
      if (v11)
      {
        v12 = -[HMDDeviceHandle initWithInternal:]([HMDDeviceHandle alloc], "initWithInternal:", v11);
        objc_msgSend(v8, "addObject:", v12);

      }
    }
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.destination"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v8, "addObject:", v14);

    v10 = objc_msgSend(v8, "copy");
  }
  v15 = (void *)v10;

  v48 = v15;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HM.version2")))
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.version2"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    fixHomeKitVersion(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v6;
      v19 = v5;
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v23;
        v53 = 2112;
        v54 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating the version of device '%@'", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v16 = v17;
      v25 = [HMDHomeKitVersion alloc];
      objc_msgSend(v16, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = -[HMDHomeKitVersion initWithVersionString:](v25, "initWithVersionString:", v26);
      fixHomeKitVersion(v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v19;
      v6 = v18;
      v4 = 0x1E0CB3000;
      v15 = v48;
    }
    else
    {
      v16 = 0;
    }
  }

  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HM.capabilities")))
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.capabilities"));
    v28 = (HMDDeviceCapabilities *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = [HMDDeviceCapabilitiesModel alloc];
    objc_msgSend(*(id *)(v4 + 2600), "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDBackingStoreModelObject initWithUUID:](v29, "initWithUUID:", v30);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.supportsKeychainSync")));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsKeychainSync:](v31, "setSupportsKeychainSync:", v32);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.supportsCloudDataSync")));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCloudDataSync:](v31, "setSupportsCloudDataSync:", v33);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.residentCapable")));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setResidentCapable:](v31, "setResidentCapable:", v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.remoteGatewayCapable")));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setRemoteGatewayCapable:](v31, "setRemoteGatewayCapable:", v35);

    v28 = -[HMDDeviceCapabilities initWithObjectModel:]([HMDDeviceCapabilities alloc], "initWithObjectModel:", v31);
  }
  v36 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](self, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v5, v15, v6, v50, v17, v28);
  if (v36)
  {
    if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HM.modelIdentifier")))
    {
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.modelIdentifier"));
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = -[NSUUID copy](v36->_identifier, "copy");
    }
    modelIdentifier = v36->_modelIdentifier;
    v36->_modelIdentifier = (NSUUID *)v37;

    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accountIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    idsIdentifierHash = v36->_idsIdentifierHash;
    v36->_idsIdentifierHash = (NSUUID *)v39;

    -[HMDDeviceCapabilities modelParentIdentifier](v36->_capabilities, "modelParentIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
      -[HMDDeviceCapabilities setModelParentIdentifier:](v36->_capabilities, "setModelParentIdentifier:", v36->_modelIdentifier);
    if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HM.rpIdentity")))
    {
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.rpIdentity"));
      v43 = objc_claimAutoreleasedReturnValue();
      rpIdentity = v36->_rpIdentity;
      v36->_rpIdentity = (HMDRPIdentity *)v43;

    }
    v36->_locallyTracked = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.locallyTracked"));
    v36->_cloudTracked = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.cloudTracked"));
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.sharedUserIDSIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    sharedUserIDSIdentifier = v36->_sharedUserIDSIdentifier;
    v36->_sharedUserIDSIdentifier = (NSUUID *)v45;

    v15 = v48;
  }

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = objc_msgSend(v33, "hmd_isForXPCTransport");
  -[HMDDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v33, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

    -[HMDDevice name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v6, CFSTR("HM.name"));

    -[HMDDevice productInfo](self, "productInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB8BC8]);

    objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isCurrentDevice](self, "isCurrentDevice"), CFSTR("HM.currentDevice"));
    -[HMDDevice idsIdentifier](self, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v8, *MEMORY[0x1E0CB8BC0]);

    if ((objc_msgSend(v33, "hmd_entitlements") & 0x1000) != 0)
    {
      -[HMDDevice remoteDestinationString](self, "remoteDestinationString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB8BB8]);

    }
    -[HMDDevice rpIdentity](self, "rpIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceIRK");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v11, *MEMORY[0x1E0CB8BD0]);

    v12 = -[HMDDevice supportsHH2](self, "supportsHH2");
    objc_msgSend(v33, "encodeBool:forKey:", v12, *MEMORY[0x1E0CB8C38]);
  }
  else
  {
    objc_msgSend(v33, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

    -[HMDDevice handles](self, "handles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v13, CFSTR("HM.handles"));

    -[HMDDevice name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v14, CFSTR("HM.name"));

    -[HMDDevice version](self, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v15, CFSTR("HM.version2"));

    if ((objc_msgSend(v33, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v33, "hmd_isForRemoteTransportOnSameAccount"))
    {
      -[HMDDevice productInfo](self, "productInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeObject:forKey:", v16, CFSTR("HM.productInfo"));

    }
    -[HMDDevice version](self, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu.%tu"), objc_msgSend(v17, "majorVersion"), objc_msgSend(v17, "minorVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v19, "doubleValue");
      objc_msgSend(v20, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v33, "encodeObject:forKey:", v21, CFSTR("HM.version"));

    -[HMDDevice remoteDestinationString](self, "remoteDestinationString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v22, CFSTR("HM.destination"));

    -[HMDDevice idsIdentifier](self, "idsIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v23, CFSTR("HM.idsIdentifier"));

    -[HMDDevice idsIdentifierHash](self, "idsIdentifierHash");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v24, CFSTR("HM.accountIdentifier"));

    -[HMDDevice rpIdentity](self, "rpIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v25, CFSTR("HM.rpIdentity"));

    -[HMDDevice capabilities](self, "capabilities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v26, CFSTR("HM.capabilities"));
    if (v26)
    {
      -[HMDDevice capabilities](self, "capabilities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v27, "supportsKeychainSync"), CFSTR("HM.supportsKeychainSync"));

      -[HMDDevice capabilities](self, "capabilities");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v28, "supportsCloudDataSync"), CFSTR("HM.supportsCloudDataSync"));

      -[HMDDevice capabilities](self, "capabilities");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v29, "isResidentCapable"), CFSTR("HM.residentCapable"));

      -[HMDDevice capabilities](self, "capabilities");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v30, "isRemoteGatewayCapable"), CFSTR("HM.remoteGatewayCapable"));

    }
    if (objc_msgSend(v33, "hmd_isForLocalStore"))
    {
      -[HMDDevice modelIdentifier](self, "modelIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeObject:forKey:", v31, CFSTR("HM.modelIdentifier"));

      objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isLocallyTracked](self, "isLocallyTracked"), CFSTR("HM.locallyTracked"));
      objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isCloudTracked](self, "isCloudTracked"), CFSTR("HM.cloudTracked"));
      -[HMDDevice sharedUserIDSIdentifier](self, "sharedUserIDSIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeObject:forKey:", v32, CFSTR("HM.sharedUserIDSIdentifier"));

    }
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  HMDDevice *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received remove capabilities", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v15 = v22;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v16);

  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDDevice *v21;
  NSObject *v22;
  void *v23;
  id v24;
  HMDDevice *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  HMDDeviceCapabilities *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE buf[12];
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  v13 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v12 | v15)
  {
    objc_msgSend(v10, "transactionResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice __updateDeviceWithActions:](self, "__updateDeviceWithActions:", v16);
    -[HMDDevice account](self, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldDevice:processModel:actions:", self, v13, v16);

    if (v19)
    {
      if (v12)
      {
        __transactionDeviceUpdated(self, (void *)v12, v10);
      }
      else if (v15)
      {
        v25 = self;
        v26 = (id)v15;
        v27 = v10;
        objc_msgSend(v27, "transactionResult");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDevice capabilities](v25, "capabilities");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v27;
        v39 = v26;
        v37 = v29;
        if (v29)
        {
          objc_msgSend(v29, "transactionObjectUpdated:newValues:message:", 0, v26, v27);
          v30 = v28;
        }
        else
        {
          v31 = -[HMDDeviceCapabilities initWithObjectModel:]([HMDDeviceCapabilities alloc], "initWithObjectModel:", v26);
          -[HMDDevice setCapabilities:](v25, "setCapabilities:", v31);

          -[HMDDevice capabilities](v25, "capabilities");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v28;
          if (v32)
          {
            objc_msgSend(v28, "markChanged");
            -[HMDDevice capabilities](v25, "capabilities");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = CFSTR("HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey");
            objc_msgSend(v39, "setProperties");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            logAndPostNotification(CFSTR("HMDDeviceCapabilitiiesUpdatedNotification"), v33, v34);

          }
        }
        if (objc_msgSend(v30, "changed"))
        {
          -[HMDDevice setDirty:](v25, "setDirty:", 1);
          objc_msgSend(v30, "backingStore");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          __HMDDeviceMarkDirty(v25, v35);

        }
      }
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v23;
      v41 = 2112;
      v42 = v13;
      v43 = 2112;
      v44 = (id)objc_opt_class();
      v24 = v44;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v16);
  }

}

- (void)__updateDeviceWithActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDDevice *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDDevice *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  HMDDevice *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDevice account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "source") == 2)
  {
    if (-[HMDDevice isCurrentDevice](self, "isCurrentDevice")
      || objc_msgSend(v6, "isCurrentDeviceDataOwnerForDevice:", self))
    {
      v7 = -[HMDDevice isLocallyTracked](self, "isLocallyTracked");
      if ((v7 & 1) == 0)
        v7 = -[HMDDevice setLocallyTracked:](self, "setLocallyTracked:", 1);
      v8 = (void *)MEMORY[0x1D17BA0A0](v7);
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Not marking cloud transaction as a change for current device", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      goto LABEL_22;
    }
    v18 = -[HMDDevice isCloudTracked](self, "isCloudTracked");
    if ((v18 & 1) == 0)
      v18 = -[HMDDevice setCloudTracked:](self, "setCloudTracked:", 1);
    v13 = (void *)MEMORY[0x1D17BA0A0](v18);
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      objc_autoreleasePoolPop(v13);
      objc_msgSend(v4, "markChanged");
      goto LABEL_22;
    }
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v16;
    v17 = "%{public}@Marking cloud transaction as a change";
LABEL_20:
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v23, 0xCu);

    goto LABEL_21;
  }
  if (objc_msgSend(v4, "source"))
    goto LABEL_22;
  if (-[HMDDevice isCurrentDevice](self, "isCurrentDevice")
    || objc_msgSend(v6, "isCurrentDeviceDataOwnerForDevice:", self))
  {
    v12 = -[HMDDevice isLocallyTracked](self, "isLocallyTracked");
    if ((v12 & 1) == 0)
      v12 = -[HMDDevice setLocallyTracked:](self, "setLocallyTracked:", 1);
    v13 = (void *)MEMORY[0x1D17BA0A0](v12);
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v16;
    v17 = "%{public}@Marking local transaction for cloud upload";
    goto LABEL_20;
  }
  if (!isWatch())
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Not marking local transaction for cloud upload", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDDevice setCloudTracked:](v20, "setCloudTracked:", 1);
  }
  objc_msgSend(v4, "markLocalChanged");
LABEL_22:

}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (NSUUID)modelParentIdentifier
{
  void *v2;
  void *v3;

  -[HMDDevice account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  HMDDeviceModel *v6;
  void *v7;
  void *v8;
  HMDDeviceModel *v9;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = [HMDDeviceModel alloc];
  -[HMDDevice modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDevice modelParentIdentifier](self, "modelParentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v8);

  -[HMDDevice identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceModel setIdentifier:](v9, "setIdentifier:", v10);

  -[HMDDevice name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[HMDDeviceModel setName:](v9, "setName:", v12);

  -[HMDDevice version](self, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[HMDDeviceModel setVersion:](v9, "setVersion:", v14);

  -[HMDDevice productInfo](self, "productInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[HMDDeviceModel setProductInfo:](v9, "setProductInfo:", v16);

  -[HMDDevice rpIdentity](self, "rpIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMDDevice rpIdentity](self, "rpIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[HMDDeviceModel setRpIdentity:](v9, "setRpIdentity:", v19);

  }
  -[HMDDevice handles](self, "handles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v26), 1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v21, "addObject:", v27, (_QWORD)v30);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v24);
  }

  v28 = (void *)objc_msgSend(v21, "copy");
  -[HMDDeviceModel setHandles:](v9, "setHandles:", v28);

  return v9;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMDDevice modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);
    -[HMDDevice capabilities](self, "capabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "modelObjectWithChangeType:version:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
    v12 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)modelBackedObjects
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self);
  -[HMDDevice capabilities](self, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (BOOL)isBackingStorageEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;
  void *v29;
  HMDDevice *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  HMDDevice *v36;
  HMDDevice *v37;
  HMDDevice *v38;
  HMDDevice *v39;
  HMDDevice *v40;
  void *v42;
  HMDDevice *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDDevice *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!-[HMDDevice isEqual:](self, "isEqual:", v6))
    goto LABEL_27;
  -[HMDDevice idsIdentifier](self, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice idsIdentifier](v30, "idsIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    v58 = 2112;
    v59 = v33;
    v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device IDS Identifier from %@ to %@";
LABEL_25:
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x20u);

    goto LABEL_26;
  }
  -[HMDDevice name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if ((v12 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice name](v36, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    v58 = 2112;
    v59 = v33;
    v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device name from %@ to %@";
    goto LABEL_25;
  }
  -[HMDDevice productInfo](self, "productInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice productInfo](v37, "productInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    v58 = 2112;
    v59 = v33;
    v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device Product Info from %@ to %@";
    goto LABEL_25;
  }
  -[HMDDevice version](self, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice version](v38, "version");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    v58 = 2112;
    v59 = v33;
    v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device version from %@ to %@";
    goto LABEL_25;
  }
  -[HMDDevice capabilities](self, "capabilities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDevice capabilities](v39, "capabilities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capabilities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    v58 = 2112;
    v59 = v33;
    v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device capabilities from %@ to %@";
    goto LABEL_25;
  }
  -[HMDDevice pushToken](self, "pushToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = HMFEqualObjects();

  if ((v24 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice pushToken](v40, "pushToken");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pushToken");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v32;
      v58 = 2112;
      v59 = v33;
      v60 = 2112;
      v61 = v34;
      v35 = "%{public}@Updating Push Token from %@ to %@";
      goto LABEL_25;
    }
LABEL_26:

    objc_autoreleasePoolPop(v29);
LABEL_27:
    v28 = 0;
    goto LABEL_28;
  }
  -[HMDDevice rpIdentity](self, "rpIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rpIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice rpIdentity](v43, "rpIdentity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rpIdentity");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v45;
      v58 = 2112;
      v59 = v46;
      v60 = 2112;
      v61 = v47;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Updating Device Rapport identity from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v42);
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v48 = v43;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice rpIdentity](v48, "rpIdentity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "deviceIRK");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "data");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rpIdentity");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "deviceIRK");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "data");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v49;
      v58 = 2112;
      v59 = v50;
      v60 = 2112;
      v61 = v53;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Rapport identity changed from %@ to %@", buf, 0x20u);

    }
    goto LABEL_26;
  }
  v28 = 1;
LABEL_28:

  return v28;
}

- (BOOL)isPublishingOnObservedNetService
{
  HMDDevice *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lastKnownIsPublishingStateValue;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)startObservingIsPublishingForService:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  HMDDevice *v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMDDevice_startObservingIsPublishingForService___block_invoke;
  aBlock[3] = &unk_1E89B3F08;
  objc_copyWeak(&v13, &location);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __50__HMDDevice_startObservingIsPublishingForService___block_invoke_2;
  block[3] = &unk_1E89C1B48;
  v10 = self;
  v11 = _Block_copy(aBlock);
  v9 = v4;
  v6 = v11;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3;

  -[HMDDevice _swapToNetServiceKVOCancellation:swapToObservedNetService:]((uint64_t)self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)HMDDevice;
  -[HMDDevice dealloc](&v3, sel_dealloc);
}

- (NSUUID)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (BOOL)isCloudTracked
{
  return self->_cloudTracked;
}

- (void)setCloudTracked:(BOOL)a3
{
  self->_cloudTracked = a3;
}

- (NSUUID)sharedUserIDSIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSharedUserIDSIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifierHash, 0);
  objc_storeStrong((id *)&self->_localOnlyVersionFromIDS, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_rpIdentity, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_netServiceKVOCancellation, 0);
  objc_storeStrong((id *)&self->_observedNetService, 0);
}

- (uint64_t)_swapToNetServiceKVOCancellation:(void *)a3 swapToObservedNetService:
{
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v8 = objc_msgSend(*(id *)(a1 + 8), "isPublishing");
    v9 = *(id *)(a1 + 16);
    v12 = *(id *)(a1 + 8);
    objc_storeStrong((id *)(a1 + 16), a2);
    objc_storeStrong((id *)(a1 + 8), a3);
    v10 = v8 ^ objc_msgSend(*(id *)(a1 + 8), "isPublishing");
    if ((_DWORD)v10 == 1)
      *(_BYTE *)(a1 + 24) = objc_msgSend(*(id *)(a1 + 8), "isPublishing");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HMDDevice__swapToNetServiceKVOCancellation_swapToObservedNetService___block_invoke;
      block[3] = &unk_1E89C2328;
      v14 = v9;
      v15 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __71__HMDDevice__swapToNetServiceKVOCancellation_swapToObservedNetService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __50__HMDDevice_startObservingIsPublishingForService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 *WeakRetained;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v10;
  else
    v8 = 0;
  v9 = v8;

  if (WeakRetained && v9)
  {
    os_unfair_lock_lock_with_options();
    if (v9 == *((id *)WeakRetained + 1) && WeakRetained[24] != objc_msgSend(v9, "isPublishing"))
    {
      WeakRetained[24] = objc_msgSend(*((id *)WeakRetained + 1), "isPublishing");
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 7);
      -[HMDDevice _postIsPublishingChanged:](WeakRetained);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 7);
    }
  }

}

void __50__HMDDevice_startObservingIsPublishingForService___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hmf_registerObserverForKeyPath:options:handler:", CFSTR("isPublishing"), 1, *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HMDDevice _swapToNetServiceKVOCancellation:swapToObservedNetService:](*(_QWORD *)(a1 + 40), v2, *(void **)(a1 + 32)))-[HMDDevice _postIsPublishingChanged:](*(void **)(a1 + 40));

}

- (void)_postIsPublishingChanged:(void *)a1
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C9AA70];
  v3 = MEMORY[0x1E0C9AA70];
  if (a1)
  {
    v17 = CFSTR("isPublishing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPublishingOnObservedNetService"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Posting HMDDeviceIsPublishingChangedNotification with userInfo: %@, changeDictionary: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("HMDDeviceIsPublishingChangedNotification"), v7, v5);

  }
}

+ (HMDDevice)deviceWithDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "deviceWithHandle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid destination: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return (HMDDevice *)v6;
}

+ (HMDDevice)deviceWithHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v6, v7, 0, 0, 0, 0);
  return (HMDDevice *)v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_113759 != -1)
    dispatch_once(&logCategory__hmf_once_t33_113759, &__block_literal_global_113760);
  return (id)logCategory__hmf_once_v34_113761;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __24__HMDDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34_113761;
  logCategory__hmf_once_v34_113761 = v0;

}

@end
