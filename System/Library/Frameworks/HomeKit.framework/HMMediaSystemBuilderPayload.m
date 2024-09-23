@implementation HMMediaSystemBuilderPayload

- (HMMediaSystemBuilderPayload)initWithUUID:(id)a3 name:(id)a4 configuredName:(id)a5 leftComponentUUID:(id)a6 rightComponentUUID:(id)a7 leftAccessoryUUID:(id)a8 rightAccessoryUUID:(id)a9 sessionID:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMMediaSystemBuilderPayload *v24;
  HMMediaSystemBuilderPayload *v25;
  HMMediaSystemBuilderPayload *v27;
  SEL v28;
  id v29;
  id obj;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a3;
  v35 = a4;
  obj = a5;
  v34 = a5;
  v31 = a6;
  v18 = a6;
  v32 = a7;
  v19 = a7;
  v33 = a8;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v20)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v21)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_15:
    v27 = (HMMediaSystemBuilderPayload *)_HMFPreconditionFailure();
    return -[HMMediaSystemBuilderPayload initWithPayload:](v27, v28, v29);
  }
  v36.receiver = self;
  v36.super_class = (Class)HMMediaSystemBuilderPayload;
  v24 = -[HMMediaSystemBuilderPayload init](&v36, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, a3);
    objc_storeStrong((id *)&v25->_name, a4);
    objc_storeStrong((id *)&v25->_configuredName, obj);
    objc_storeStrong((id *)&v25->_leftComponentUUID, v31);
    objc_storeStrong((id *)&v25->_rightComponentUUID, v32);
    objc_storeStrong((id *)&v25->_leftAccessoryUUID, v33);
    objc_storeStrong((id *)&v25->_rightAccessoryUUID, a9);
    objc_storeStrong((id *)&v25->_sessionID, a10);
  }

  return v25;
}

- (HMMediaSystemBuilderPayload)initWithPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMMediaSystemBuilderPayload *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "hmf_UUIDForKey:", kMediaSystemUUIDCodingKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", kMediaSystemNameCodingKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", kMediaSystemConfiguredNameCodingKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_UUIDForKey:", kMediaSystemBuilderSessionIDKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_arrayForKey:", kMediaSystemComponentsCodingKey);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMediaSystemBuilderPayload decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:](HMMediaSystemBuilderPayload, "decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:");
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v11;
  if (v4 && v7 && v8 && v10 && v9 && v11)
  {
    v13 = -[HMMediaSystemBuilderPayload initWithUUID:name:configuredName:leftComponentUUID:rightComponentUUID:leftAccessoryUUID:rightAccessoryUUID:sessionID:](self, "initWithUUID:name:configuredName:leftComponentUUID:rightComponentUUID:leftAccessoryUUID:rightAccessoryUUID:sessionID:", v4, v5, v6, v8, v10, v9, v11, v7);
    self = v13;
  }
  else
  {
    v18 = v4;
    v19 = v5;
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode media system builder payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
    v4 = v18;
    v5 = v19;
  }

  return v13;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  -[HMMediaSystemBuilderPayload leftComponentUUID](self, "leftComponentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemBuilderPayload leftAccessoryUUID](self, "leftAccessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemBuilderPayload rightComponentUUID](self, "rightComponentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemBuilderPayload rightAccessoryUUID](self, "rightAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMediaSystemBuilderPayload encodeComponentDataWithLeftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:](HMMediaSystemBuilderPayload, "encodeComponentDataWithLeftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = kMediaSystemUUIDCodingKey;
  -[HMMediaSystemBuilderPayload uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v18[1] = kMediaSystemNameCodingKey;
  -[HMMediaSystemBuilderPayload name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v11;
  v18[2] = kMediaSystemConfiguredNameCodingKey;
  -[HMMediaSystemBuilderPayload configuredName](self, "configuredName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[2] = v13;
  v19[3] = v7;
  v18[3] = kMediaSystemComponentsCodingKey;
  v18[4] = kMediaSystemBuilderSessionIDKey;
  -[HMMediaSystemBuilderPayload sessionID](self, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  if (!v10)

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaSystemBuilderPayload *v4;
  HMMediaSystemBuilderPayload *v5;
  HMMediaSystemBuilderPayload *v6;
  void *v7;
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
  char v18;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (HMMediaSystemBuilderPayload *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMMediaSystemBuilderPayload uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystemBuilderPayload uuid](v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMMediaSystemBuilderPayload leftComponentUUID](self, "leftComponentUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystemBuilderPayload leftComponentUUID](v6, "leftComponentUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hmf_isEqualToUUID:", v10))
        {
          -[HMMediaSystemBuilderPayload rightComponentUUID](self, "rightComponentUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMediaSystemBuilderPayload rightComponentUUID](v6, "rightComponentUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "hmf_isEqualToUUID:", v12))
          {
            -[HMMediaSystemBuilderPayload leftAccessoryUUID](self, "leftAccessoryUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMediaSystemBuilderPayload leftAccessoryUUID](v6, "leftAccessoryUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v13;
            if (objc_msgSend(v13, "hmf_isEqualToUUID:", v27))
            {
              -[HMMediaSystemBuilderPayload rightAccessoryUUID](self, "rightAccessoryUUID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMediaSystemBuilderPayload rightAccessoryUUID](v6, "rightAccessoryUUID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v14;
              if (objc_msgSend(v14, "hmf_isEqualToUUID:", v25))
              {
                -[HMMediaSystemBuilderPayload sessionID](self, "sessionID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMediaSystemBuilderPayload sessionID](v6, "sessionID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v15;
                if (objc_msgSend(v15, "hmf_isEqualToUUID:", v23)
                  && (-[HMMediaSystemBuilderPayload name](self, "name"),
                      v21 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[HMMediaSystemBuilderPayload name](v6, "name"),
                      v16 = (void *)objc_claimAutoreleasedReturnValue(),
                      v20 = HMFEqualObjects(),
                      v16,
                      v21,
                      v20))
                {
                  -[HMMediaSystemBuilderPayload configuredName](self, "configuredName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMMediaSystemBuilderPayload configuredName](v6, "configuredName");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = HMFEqualObjects();

                }
                else
                {
                  v18 = 0;
                }

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaSystemBuilderPayload uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)leftComponentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)rightComponentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)leftAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)rightAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)configuredName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_rightAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_leftAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_rightComponentUUID, 0);
  objc_storeStrong((id *)&self->_leftComponentUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)decodeComponentData:(id)a3 leftComponentUUID:(id *)a4 leftAccessoryUUID:(id *)a5 rightComponentUUID:(id *)a6 rightAccessoryUUID:(id *)a7
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  BOOL v19;
  id *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v8)
  {
    v9 = v8;
    v32 = 0;
    v10 = *(_QWORD *)v36;
    v11 = (void *)MEMORY[0x1E0C9AA70];
    obj = v7;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
      objc_msgSend(v13, "hmf_dictionaryForKey:", kMediaSystemComponentRoleCodingKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_UUIDForKey:", kMediaSystemComponentUUIDCodingKey);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      if (v14)
        v17 = v14;
      else
        v17 = v11;
      v18 = +[HMMediaSystemRole roleFromDictionary:roleOutput:](HMMediaSystemRole, "roleFromDictionary:roleOutput:", v17, &v34);
      if (v15)
        v19 = v16 == 0;
      else
        v19 = 1;
      if (v19 || v34 == 0)
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC](v18);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          v41 = 2112;
          v42 = v13;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMMediaSystemBuilderPayload] Failed to decode component data due to encoded component: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);

        v7 = obj;
        v26 = 0;
        goto LABEL_29;
      }
      if (v34 == 1)
        break;
      if (v34 == 2)
      {
        BYTE4(v32) = 1;
        v21 = a6;
        v22 = a7;
LABEL_20:
        *v21 = objc_retainAutorelease(v15);
        *v22 = objc_retainAutorelease(v16);
      }

      if (v9 == ++v12)
      {
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_28;
      }
    }
    LOBYTE(v32) = 1;
    v21 = a4;
    v22 = a5;
    goto LABEL_20;
  }
  v32 = 0;
LABEL_28:

  v26 = v32 & BYTE4(v32);
LABEL_29:

  return v26 & 1;
}

+ (id)encodeComponentDataWithLeftComponentUUID:(id)a3 leftAccessoryUUID:(id)a4 rightComponentUUID:(id)a5 rightAccessoryUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint64_t v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28[0] = kMediaSystemComponentUUIDCodingKey;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v28[1] = CFSTR("kAccessoryUUID");
  objc_msgSend(v11, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29[1] = v13;
  v28[2] = kMediaSystemComponentRoleCodingKey;
  v26 = kMediaSystemRoleTypeCodingKey;
  v27 = &unk_1E3B2E4D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  v24[0] = kMediaSystemComponentUUIDCodingKey;
  objc_msgSend(v10, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v16;
  v24[1] = CFSTR("kAccessoryUUID");
  objc_msgSend(v9, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v17;
  v24[2] = kMediaSystemComponentRoleCodingKey;
  v22 = kMediaSystemRoleTypeCodingKey;
  v23 = &unk_1E3B2E4E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
