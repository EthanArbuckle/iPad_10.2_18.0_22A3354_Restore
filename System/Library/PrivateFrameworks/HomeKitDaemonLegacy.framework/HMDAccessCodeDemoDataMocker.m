@implementation HMDAccessCodeDemoDataMocker

- (HMDAccessCodeDemoDataMocker)init
{
  HMDAccessCodeDemoDataMocker *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *accessCodes;
  objc_super v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessCodeDemoDataMocker;
  v2 = -[HMDAccessCodeDemoDataMocker init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E08];
    v9[0] = &unk_1E8B34E00;
    v9[1] = &unk_1E8B34E18;
    v10[0] = CFSTR("1234");
    v10[1] = CFSTR("56789");
    v9[2] = &unk_1E8B34E30;
    v10[2] = CFSTR("2468");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    accessCodes = v2->_accessCodes;
    v2->_accessCodes = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)handleWriteRequests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMDAccessCodeDemoDataMocker *v25;
  NSObject *v26;
  void *v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v31)
  {
    obj = v5;
    v30 = *(_QWORD *)v40;
    v32 = v4;
    while (2)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[HMDAccessCodeDemoDataMocker _controlResponseForWriteRequest:](self, "_controlResponseForWriteRequest:", v7, obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_14;
        v9 = v8;
        v38 = 0;
        objc_msgSend(v8, "serializeWithError:", &v38);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v38;
        if (!v10)
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v27;
            v51 = 2112;
            v52 = v9;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);

LABEL_14:
          v5 = obj;

          v23 = 0;
          v4 = v32;
          goto LABEL_15;
        }
        objc_msgSend(v7, "characteristic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "service");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "instanceID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "instanceID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v17;
        objc_msgSend(v16, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v10;
        v45 = v18;
        v43 = CFSTR("kCharacteristicValue");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v35 = v11;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v34 = v9;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v22);

      }
      v5 = obj;
      v4 = v32;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      if (v31)
        continue;
      break;
    }
  }

  v23 = v4;
LABEL_15:

  return v23;
}

- (id)handleReadRequests:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v23;
  HMDAccessCodeDemoDataMocker *v24;
  NSObject *v25;
  void *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = v3;
  v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v30)
  {
    obj = v4;
    v29 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[HMDAccessCodeDemoDataMocker _controlResponseForReadRequest:](self, "_controlResponseForReadRequest:", v6, obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(v7, "serializeWithError:", &v37);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v37;
        if (!v8)
        {
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = v26;
            v50 = 2112;
            v51 = v7;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);

          v4 = obj;
          v22 = 0;
          v21 = v31;
          goto LABEL_13;
        }
        objc_msgSend(v6, "characteristic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "service");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "instanceID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "characteristic");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "instanceID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v15;
        objc_msgSend(v14, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v8;
        v44 = v16;
        v42 = CFSTR("kCharacteristicValue");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v34 = v9;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v33 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v19, v20);

      }
      v4 = obj;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      if (v30)
        continue;
      break;
    }
  }

  v21 = v31;
  v22 = v31;
LABEL_13:

  return v22;
}

- (id)_controlResponseForReadRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16368]), "initWithValue:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B34E48);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B34E60);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B34E78);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16370]), "initWithCharacterSet:minimumValueLength:maximumValueLength:maximumAccessCodes:", v3, v4, v5, v6);

  return v7;
}

- (id)_controlResponseForWriteRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  HMDAccessCodeDemoDataMocker *v11;
  void *v12;
  HMDAccessCodeDemoDataMocker *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D16378];
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "parsedFromData:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v7)
  {
    objc_msgSend(v7, "operationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "value");

    switch(v10)
    {
      case 1:
        -[HMDAccessCodeDemoDataMocker _handleListRequest](self, "_handleListRequest");
        v11 = (HMDAccessCodeDemoDataMocker *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
        -[HMDAccessCodeDemoDataMocker _handleReadRequest:](self, "_handleReadRequest:", v7);
        v11 = (HMDAccessCodeDemoDataMocker *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3:
        -[HMDAccessCodeDemoDataMocker _handleAddRequest:](self, "_handleAddRequest:", v7);
        v11 = (HMDAccessCodeDemoDataMocker *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 4:
        -[HMDAccessCodeDemoDataMocker _handleUpdateRequest:](self, "_handleUpdateRequest:", v7);
        v11 = (HMDAccessCodeDemoDataMocker *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 5:
        -[HMDAccessCodeDemoDataMocker _handleRemoveRequest:](self, "_handleRemoveRequest:", v7);
        v11 = (HMDAccessCodeDemoDataMocker *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        self = v11;
        break;
      default:
        break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = 0;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    self = 0;
  }

  return self;
}

- (id)_handleListRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16390]), "initWithValue:", 0);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163A0]), "initWithValue:", 0);
        v13 = objc_alloc(MEMORY[0x1E0D16388]);
        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v13, "initWithIdentifier:accessCode:flags:statusCode:", v10, v15, v11, v12);

        objc_msgSend(v21, "addObject:", v16);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16398]), "initWithValue:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16378]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v17, 0, v21);

  return v18;
}

- (id)_handleReadRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v4;
  objc_msgSend(v4, "accessCodeControlRequest");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v10);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16390]), "initWithValue:", 0);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163A0]), "initWithValue:", 0);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16388]), "initWithIdentifier:accessCode:flags:statusCode:", v13, v12, v14, v15);
        objc_msgSend(v22, "addObject:", v16);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16398]), "initWithValue:", 2);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16378]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v17, 0, v22);

  return v18;
}

- (id)_handleAddRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = v4;
  objc_msgSend(v4, "accessCodeControlRequest");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v8), "accessCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB37E8];
        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKeyPath:", CFSTR("@max.self"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v14);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v14);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16390]), "initWithValue:", 0);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163A0]), "initWithValue:", 0);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16388]), "initWithIdentifier:accessCode:flags:statusCode:", v16, v9, v17, v18);
        objc_msgSend(v25, "addObject:", v19);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16398]), "initWithValue:", 3);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16378]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v20, 0, v25);

  return v21;
}

- (id)_handleUpdateRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v4;
  objc_msgSend(v4, "accessCodeControlRequest");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "accessCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v11);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16390]), "initWithValue:", 0);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163A0]), "initWithValue:", 0);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16388]), "initWithIdentifier:accessCode:flags:statusCode:", v14, v12, v15, v16);
        objc_msgSend(v23, "addObject:", v17);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16398]), "initWithValue:", 4);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16378]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v18, 0, v23);

  return v19;
}

- (id)_handleRemoveRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v4;
  objc_msgSend(v4, "accessCodeControlRequest");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccessCodeDemoDataMocker accessCodes](self, "accessCodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v10);

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v10);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16390]), "initWithValue:", 0);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163A0]), "initWithValue:", 0);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16388]), "initWithIdentifier:accessCode:flags:statusCode:", v14, v12, v15, v16);
        objc_msgSend(v23, "addObject:", v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16398]), "initWithValue:", 5);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16378]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v18, 0, v23);

  return v19;
}

- (NSMutableDictionary)accessCodes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessCodes, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_153195 != -1)
    dispatch_once(&logCategory__hmf_once_t3_153195, &__block_literal_global_153196);
  return (id)logCategory__hmf_once_v4_153197;
}

void __42__HMDAccessCodeDemoDataMocker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_153197;
  logCategory__hmf_once_v4_153197 = v0;

}

@end
