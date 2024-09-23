@implementation HMMediaSystemBuilder

- (HMMediaSystemBuilder)initWithHome:(id)a3 mediaSystemUUID:(id)a4 context:(id)a5 components:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMMediaSystemBuilder *v14;
  HMMediaSystemBuilder *v15;
  uint64_t v16;
  NSUUID *uuid;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMMediaSystemBuilder;
  v14 = -[HMMediaSystemBuilder init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_mediaSystemUUID, a4);
    objc_storeStrong((id *)&v15->_context, a5);
    objc_storeStrong((id *)&v15->_componentsArray, a6);
  }

  return v15;
}

- (HMMediaSystemBuilder)initWithHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMMediaSystemBuilder *v9;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMutableArray array](HMMutableArray, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMediaSystemBuilder initWithHome:mediaSystemUUID:context:components:](self, "initWithHome:mediaSystemUUID:context:components:", v5, v6, v7, v8);

  return v9;
}

- (HMMediaSystemBuilder)initWithMediaSystem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMediaSystemBuilder *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *configuredName;

  v5 = a3;
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMMediaSystemBuilder initWithHome:mediaSystemUUID:context:components:](self, "initWithHome:mediaSystemUUID:context:components:", v6, v7, v8, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSystem, a3);
    objc_msgSend(v5, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_msgSend(v5, "configuredName");
    v14 = objc_claimAutoreleasedReturnValue();
    configuredName = v11->_configuredName;
    v11->_configuredName = (NSString *)v14;

  }
  return v11;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMMediaSystemBuilder logIdentifier](self, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMMediaSystemBuilder: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
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

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)components
{
  void *v2;
  void *v3;

  -[HMMediaSystemBuilder componentsArray](self, "componentsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setComponents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSystemBuilder componentsArray](self, "componentsArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArray:", v4);

}

- (void)commitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystemBuilder *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMMediaSystemBuilder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemBuilder context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMMediaSystemBuilder activity](self, "activity");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "markWithReason:", CFSTR("commit with completion"));
    -[HMMediaSystemBuilder home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__HMMediaSystemBuilder_commitWithCompletionHandler___block_invoke;
      block[3] = &unk_1E3AB60A0;
      block[4] = self;
      v18 = v4;
      dispatch_async(v7, block);

    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to commit due to no reference to home", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v16, 0);

      }
    }
    __HMFActivityScopeLeave();

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2080;
      v23 = "-[HMMediaSystemBuilder commitWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_commitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMediaSystemBuilder *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString **v31;
  __CFString *v32;
  void *v33;
  HMMediaSystemBuilder *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  HMMediaSystemBuilder *v38;
  void *v39;
  void *v40;
  id v41;
  __CFString *v42;
  void *v43;
  void *v44;
  HMMediaSystemBuilder *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *context;
  id v59;
  void *v60;
  void *v61;
  __CFString *obj;
  __CFString *obja;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  __CFString *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemBuilder builderSessionID](self, "builderSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@There is already a builder session ID in progress, cannot submit another commit", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMMediaSystemBuilder context](v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:mediaSystem:", v4, v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    -[HMMediaSystemBuilder setBuilderSessionID:](self, "setBuilderSessionID:", v14);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)v14;
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, kMediaSystemBuilderSessionIDKey);
    -[HMMediaSystemBuilder configuredName](self, "configuredName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, kMediaSystemConfiguredNameCodingKey);

    -[HMMediaSystemBuilder mediaSystemUUID](self, "mediaSystemUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v15;
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, kMediaSystemUUIDCodingKey);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[HMMediaSystemBuilder components](self, "components");
    obj = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v69;
      v59 = v4;
LABEL_7:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v22)
          objc_enumerationMutation(obj);
        v24 = *(__CFString **)(*((_QWORD *)&v68 + 1) + 8 * v23);
        v25 = (void *)-[__CFString copy](v24, "copy");
        objc_msgSend(v25, "serialize");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v26);

        -[__CFString accessory](v24, "accessory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          break;
        if (objc_msgSend(v19, "containsObject:", v28))
        {
          context = (void *)MEMORY[0x1A1AC1AAC]();
          v38 = self;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMediaSystemBuilder components](v38, "components", context);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v73 = v39;
            v74 = 2112;
            v75 = v24;
            v76 = 2112;
            v77 = v40;
            _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Builder session does not have unique accessory UUID for component %@ in components: %@", buf, 0x20u);

          }
          v37 = 3;
LABEL_24:
          v4 = v59;
          v10 = v60;

          objc_autoreleasePoolPop(context);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v37);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          -[HMMediaSystemBuilder _callCompletion:builderSessionID:error:response:](self, "_callCompletion:builderSessionID:error:response:", v59, v60, v41, MEMORY[0x1E0C9AA70]);
          v42 = obj;
          goto LABEL_29;
        }
        objc_msgSend(v19, "addObject:", v28);

        if (v21 == ++v23)
        {
          v21 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          v4 = v59;
          if (v21)
            goto LABEL_7;
          goto LABEL_14;
        }
      }
      context = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v36;
        v74 = 2112;
        v75 = v24;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Builder session could not get accessory UUID for component %@", buf, 0x16u);

      }
      v28 = 0;
      v37 = 20;
      goto LABEL_24;
    }
LABEL_14:

    v29 = v61;
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v12, kMediaSystemComponentsCodingKey);
    -[HMMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = &kUpdateMediaSystemRequest;
    if (!v30)
      v31 = &kAddMediaSystemRequest;
    v32 = *v31;

    -[HMMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    obja = v32;
    if (v33)
      -[HMMediaSystemBuilder mediaSystem](self, "mediaSystem");
    else
      -[HMMediaSystemBuilder home](self, "home");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1A1AC1AAC]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    v10 = v60;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v73 = v47;
      v74 = 2112;
      v75 = obja;
      v76 = 2112;
      v77 = v48;
      v78 = 2112;
      v79 = v61;
      _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Committing the media system builder with message: %@, targetUUID: %@, payload: %@", buf, 0x2Au);

      v29 = v61;
    }

    objc_autoreleasePoolPop(v44);
    v49 = objc_alloc(MEMORY[0x1E0D285F8]);
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v25);
    v28 = (void *)objc_msgSend(v49, "initWithName:destination:payload:", obja, v50, v29);

    -[HMMediaSystemBuilder context](v45, "context");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "pendingRequests");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "identifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = _Block_copy(v4);
    objc_msgSend(v52, "addMediaSystemBuilder:andCompletionBlock:forIdentifier:", v45, v54, v53);

    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __53__HMMediaSystemBuilder__commitWithCompletionHandler___block_invoke;
    v64[3] = &unk_1E3AB5C08;
    v65 = v52;
    v66 = v53;
    v67 = v60;
    v55 = v53;
    v41 = v52;
    objc_msgSend(v28, "setResponseHandler:", v64);
    -[HMMediaSystemBuilder context](v45, "context");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "messageDispatcher");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "sendMessage:", v28);

    v42 = obja;
LABEL_29:

    v11 = v61;
  }

}

- (void)_callCompletion:(id)a3 builderSessionID:(id)a4 error:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMediaSystemBuilder *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  HMMediaSystemBuilder *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMMediaSystemBuilder *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  HMMediaSystemBuilder *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Received response for Builder-Session-ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMMediaSystemBuilder builderSessionID](v15, "builderSessionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if ((v19 & 1) != 0)
  {
    v20 = -[HMMediaSystemBuilder setBuilderSessionID:](v15, "setBuilderSessionID:", 0);
    if (v12)
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC](v20);
      v22 = v15;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v24;
        v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Builder message responded with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      -[HMMediaSystemBuilder context](v22, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "callCompletion:error:mediaSystem:", v10, v12, 0);

    }
    else
    {
      v40 = 0;
      -[HMMediaSystemBuilder resultingMediaSystemFromResponse:error:](v15, "resultingMediaSystemFromResponse:error:", v13, &v40);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v40;
      if (v25)
      {
        -[HMMediaSystemBuilder handleResultingMediaSystem:](v15, "handleResultingMediaSystem:", v25);
        -[HMMediaSystemBuilder context](v15, "context");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "delegateCaller");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystemBuilder mediaSystem](v15, "mediaSystem");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v33)
          v35 = (void *)v33;
        else
          v35 = v25;
        objc_msgSend(v32, "callCompletion:error:mediaSystem:", v10, v12, v35);

      }
      else
      {
        v36 = (void *)MEMORY[0x1A1AC1AAC]();
        v37 = v15;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v39;
          v43 = 2112;
          v44 = v13;
          _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to get resulting media system from response: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        -[HMMediaSystemBuilder context](v37, "context");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "delegateCaller");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "callCompletion:error:mediaSystem:", v10, v12, 0);
      }

    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = v15;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      v43 = 2112;
      v44 = v11;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get matching builder session ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (id)resultingMediaSystemFromResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMediaSystemBuilder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMMediaSystemBuilder *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hmf_dictionaryForKey:", kMediaSystemCodingKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMMediaSystemBuilder home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMMediaSystem mediaSystemWithDictionary:home:](HMMediaSystem, "mediaSystemWithDictionary:home:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create media system from system payload: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media system payload in response: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)handleResultingMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystemBuilder *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMediaSystemBuilder *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMMediaSystemBuilder *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling resulting media system: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMediaSystemBuilder home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v9, "isFeatureHomeTheaterQFAEnabled") & 1) != 0)
    {
      -[HMMediaSystemBuilder mediaSystem](v6, "mediaSystem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HMMediaSystemBuilder mediaSystem](v6, "mediaSystem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mergeFromNewObject:isFromSerializedData:", v4, 1);

      }
      else
      {
        -[HMMediaSystemBuilder context](v6, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "__configureWithContext:home:", v21, v10);

        objc_msgSend(v10, "stageAddedMediaSystem:", v4);
        objc_msgSend(v4, "postConfigure");
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@QFA is not enabled", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMMediaSystemBuilder legacyHandleResultingMediaSystem:](v18, "legacyHandleResultingMediaSystem:", v4);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v16;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed handle resulting media system due to no home", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)legacyHandleResultingMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMediaSystemBuilder *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMediaSystemBuilder *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemBuilder home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1A1AC1AAC]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging resulting media system: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v4, "applicationData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystemBuilder mediaSystem](v8, "mediaSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setApplicationData:", v11);

      -[HMMediaSystemBuilder mediaSystem](v8, "mediaSystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mergeFromNewObject:isFromSerializedData:", v4, 1);
    }
    else
    {
      objc_msgSend(v5, "stageAddedMediaSystem:", v4);
      -[HMMediaSystemBuilder context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "__configureWithContext:home:", v13, v5);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle resulting media system due to no home", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMMediaSystemBuilder uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemBuilder builderSessionID](self, "builderSessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)configuredName
{
  return self->_configuredName;
}

- (void)setConfiguredName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMFActivity)activity
{
  return (HMFActivity *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)mediaSystemUUID
{
  return self->_mediaSystemUUID;
}

- (NSString)builderSessionID
{
  return self->_builderSessionID;
}

- (void)setBuilderSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_builderSessionID, a3);
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMMediaSystem)mediaSystem
{
  return self->_mediaSystem;
}

- (HMMutableArray)componentsArray
{
  return self->_componentsArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentsArray, 0);
  objc_storeStrong((id *)&self->_mediaSystem, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_builderSessionID, 0);
  objc_storeStrong((id *)&self->_mediaSystemUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

void __53__HMMediaSystemBuilder__commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "removeMediaSystemBuilderForIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_callCompletion:builderSessionID:error:response:", v9, *(_QWORD *)(a1 + 48), v8, v7);

}

uint64_t __52__HMMediaSystemBuilder_commitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)canSupportMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"));

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Returning no since category does not support stereo for accessory: %@ category: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

+ (BOOL)supportsMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BYTE v14[24];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "canSupportMediaSystem:", v4))
  {
    *(_OWORD *)v14 = *MEMORY[0x1E0D28198];
    *(_QWORD *)&v14[16] = *(_QWORD *)(MEMORY[0x1E0D28198] + 16);
    objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAtLeastVersion:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "softwareVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v14 = 138543874;
        *(_QWORD *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2112;
        *(_QWORD *)&v14[14] = v4;
        *(_WORD *)&v14[22] = 2112;
        v15 = v12;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Does not support media system due to accessory: %@ software version: %@", v14, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isStereoPairingSupportedForAccessories:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportedStereoPairVersions");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v4;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      v39 = a1;
      v40 = v4;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        if (!+[HMMediaSystemBuilder supportsMediaSystem:](HMMediaSystemBuilder, "supportsMediaSystem:", v13))goto LABEL_31;
        v14 = objc_msgSend(v13, "supportedStereoPairVersions");
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v15))
          break;
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v13, "serialNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (objc_msgSend(v8, "containsObject:", v16))
          {
            v34 = (void *)MEMORY[0x1A1AC1AAC]();
            v35 = v39;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v37;
              v48 = 2112;
              v49 = v16;
              _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Accessories are not supported for stereo pair as they have same serial number: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v34);

LABEL_30:
LABEL_31:

            v24 = 0;
            v4 = v40;
            goto LABEL_32;
          }
          objc_msgSend(v8, "addObject:", v16);
        }
        v6 &= v14;

        if (v10 == ++v12)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          a1 = v39;
          v4 = v40;
          if (v10)
            goto LABEL_4;
          goto LABEL_14;
        }
      }
      v29 = (void *)MEMORY[0x1A1AC1AAC]();
      v30 = v39;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v32;
        v48 = 2112;
        v49 = obj;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Accessories are not supported for stereo pair as they are not unique accessories: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      goto LABEL_30;
    }
LABEL_14:

    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v6)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = v4;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        v48 = 2112;
        v49 = obj;
        v50 = 2112;
        v51 = v23;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Stereo pairing versions are supported for accessories: %@ stereo pair version: %@", buf, 0x20u);

        v4 = v21;
      }

      objc_autoreleasePoolPop(v17);
      v24 = 1;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v33;
        v48 = 2112;
        v49 = obj;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Stereo pairing versions are not supported for accessories: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v24 = 0;
    }
LABEL_32:

  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = a1;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v28;
      v48 = 2112;
      v49 = v4;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Stereo pairing is not supported due wrong number of components: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1)
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_45966);
  return (id)logCategory__hmf_once_v29;
}

void __35__HMMediaSystemBuilder_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;

}

@end
