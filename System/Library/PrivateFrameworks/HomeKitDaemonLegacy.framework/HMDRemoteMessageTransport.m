@implementation HMDRemoteMessageTransport

+ (id)remoteMessageTransportsForProductInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  HMDIDSMessageTransport *v22;
  void *v23;
  HMDIDSMessageTransport *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  HMDHTTPMessageTransport *v39;
  void *v40;
  HMDHTTPMessageTransport *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  HMDIDSProxyMessageTransport *v53;
  void *v54;
  HMDIDSProxyMessageTransport *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  uint8_t v61[24];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v21 = 0;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v61 = 138543362;
    *(_QWORD *)&v61[4] = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Using legacy transport", v61, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = objc_msgSend(v4, "productPlatform");
  if ((unint64_t)(v11 - 1) >= 5)
  {
    if (v11)
      goto LABEL_20;
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v61 = 138543362;
    *(_QWORD *)&v61[4] = v17;
    v18 = "%{public}@Not creating IDS message transport due to unknown platform";
    v19 = v16;
    v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  objc_msgSend(v5, "preferenceForKey:", CFSTR("disableIDSTransport"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      objc_autoreleasePoolPop(v14);
      goto LABEL_20;
    }
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v61 = 138543362;
    *(_QWORD *)&v61[4] = v17;
    v18 = "%{public}@Not creating IDS message transport due to preference";
    v19 = v16;
    v20 = OS_LOG_TYPE_INFO;
LABEL_14:
    _os_log_impl(&dword_1CD062000, v19, v20, v18, v61, 0xCu);

    goto LABEL_15;
  }
  v22 = [HMDIDSMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMDIDSMessageTransport initWithAccountRegistry:](v22, "initWithAccountRegistry:", v23);

  if (v24)
  {
    objc_msgSend(v6, "addObject:", v24);
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v8;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 138543362;
      *(_QWORD *)&v61[4] = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS message transport", v61, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

LABEL_20:
  v29 = objc_msgSend(v4, "productPlatform", *(_OWORD *)v61);
  if (v29 <= 5)
  {
    if (((1 << v29) & 0x36) != 0)
    {
      objc_msgSend(v5, "preferenceForKey:", CFSTR("disableHTTPTransport"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      if ((v31 & 1) == 0)
      {
        v39 = [HMDHTTPMessageTransport alloc];
        +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[HMDHTTPMessageTransport initWithAccountRegistry:](v39, "initWithAccountRegistry:", v40);

        if (v41)
        {
          objc_msgSend(v6, "addObject:", v41);
        }
        else
        {
          v42 = (void *)MEMORY[0x1D17BA0A0]();
          v43 = v8;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v61 = 138543362;
            *(_QWORD *)&v61[4] = v45;
            _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HTTP message transport", v61, 0xCu);

          }
          objc_autoreleasePoolPop(v42);
        }

        goto LABEL_36;
      }
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v8;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        goto LABEL_31;
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 138543362;
      *(_QWORD *)&v61[4] = v35;
      v36 = "%{public}@Not creating HTTP message transport due to preference";
      v37 = v34;
      v38 = OS_LOG_TYPE_INFO;
      goto LABEL_30;
    }
    if (!v29)
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v8;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        objc_autoreleasePoolPop(v32);
        goto LABEL_36;
      }
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 138543362;
      *(_QWORD *)&v61[4] = v35;
      v36 = "%{public}@Not creating HTTP message transport due to unknown platform";
      v37 = v34;
      v38 = OS_LOG_TYPE_ERROR;
LABEL_30:
      _os_log_impl(&dword_1CD062000, v37, v38, v36, v61, 0xCu);

      goto LABEL_31;
    }
  }
LABEL_36:
  objc_msgSend(v8, "_createModernTransportForProductInfo:preferences:", v4, v5, *(_OWORD *)v61);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v6, "addObject:", v46);
  if (objc_msgSend(v4, "productPlatform") == 3 || objc_msgSend(v4, "productClass") == 1)
  {
    objc_msgSend(v5, "preferenceForKey:", CFSTR("disableIDSProxyTransport"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "BOOLValue");

    if ((v48 & 1) != 0)
    {
      v49 = (void *)MEMORY[0x1D17BA0A0]();
      v50 = v8;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v61 = 138543362;
        *(_QWORD *)&v61[4] = v52;
        _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Not creating IDS Proxy message transport due to preference", v61, 0xCu);

      }
      objc_autoreleasePoolPop(v49);
    }
    else
    {
      v53 = [HMDIDSProxyMessageTransport alloc];
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[HMDIDSProxyMessageTransport initWithAccountRegistry:](v53, "initWithAccountRegistry:", v54);

      if (v55)
      {
        objc_msgSend(v6, "addObject:", v55);
      }
      else
      {
        v56 = (void *)MEMORY[0x1D17BA0A0]();
        v57 = v8;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v61 = 138543362;
          *(_QWORD *)&v61[4] = v59;
          _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS Proxy message transport", v61, 0xCu);

        }
        objc_autoreleasePoolPop(v56);
      }

    }
  }

  v21 = (void *)objc_msgSend(v6, "copy");
LABEL_51:

  return v21;
}

+ (id)_createModernTransportForProductInfo:(id)a3 preferences:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  HMDModernRemoteMessageTransport *v14;
  void *v15;
  HMDModernRemoteMessageTransport *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "productPlatform") - 1;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8 > 4)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Not creating modern message transport because it is not supported on this platform", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v16 = 0;
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating modern message transport", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v14 = [HMDModernRemoteMessageTransport alloc];
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:](v14, "initWithAccountRegistry:", v15);

  }
  return v16;
}

- (HMDRemoteMessageTransport)init
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

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMDRemoteMessageTransport)initWithAccountRegistry:(id)a3
{
  id v5;
  HMDRemoteMessageTransport *v6;
  uint64_t v7;
  HMFFuture *startFuture;
  id obj;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDRemoteMessageTransport;
  v6 = -[HMDRemoteMessageTransport init](&v11, sel_init);
  if (v6)
  {
    obj = 0;
    objc_msgSend(MEMORY[0x1E0D28588], "futureWithPromise:", &obj);
    v7 = objc_claimAutoreleasedReturnValue();
    startFuture = v6->_startFuture;
    v6->_startFuture = (HMFFuture *)v7;

    objc_storeStrong((id *)&v6->_startPromise, obj);
    objc_storeStrong((id *)&v6->_accountRegistry, a3);

  }
  return v6;
}

- (BOOL)isSecure
{
  return 0;
}

- (id)start
{
  void *v3;

  -[HMDRemoteMessageTransport startPromise](self, "startPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fulfillWithValue:", 0);

  return -[HMDRemoteMessageTransport startFuture](self, "startFuture");
}

- (BOOL)isValidMessage:(id)a3
{
  return 1;
}

- (void)postDidReceiveRemoteMessageWithNoListenerFromDevice:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  HMDRemoteMessageTransport *v8;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke;
    v6[3] = &unk_1E89C2328;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (id)remoteMessageFromMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HMDRemoteMessageTransport accountRegistry](self, "accountRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteMessageFromMessage:secure:accountRegistry:", v4, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)matchResponse:(id)a3 requestedCapabilities:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v48 = a4;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v8;
    v71 = 2112;
    v72 = v48;
    v73 = 2112;
    v74 = v5;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Select based on capability %@, and responses %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_250);
  v80[0] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v14;
    v71 = 2112;
    v72 = v50;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sorted responses by homed version: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v47 = v5;
  v56 = v9;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v15 = v48;
    v51 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v51)
    {
      v49 = *(_QWORD *)v66;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v66 != v49)
            objc_enumerationMutation(v15);
          v52 = v16;
          v17 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v16);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          obj = v50;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v62 != v20)
                  objc_enumerationMutation(obj);
                v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                if ((objc_msgSend(v9, "containsObject:", v22) & 1) == 0)
                {
                  objc_msgSend(v9, "addObject:", v22);
                  objc_msgSend(v10, "addObject:", &unk_1E8B35268);
                }
                objc_msgSend(v22, "objectForKeyedSubscript:", v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", v17);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = -[HMDRemoteMessageTransport compareCapability:key:withCapability:](self, "compareCapability:key:withCapability:", v23, v17, v24);

                v9 = v56;
                if ((v25 & 0x8000000000000000) == 0)
                {
                  v26 = objc_msgSend(v56, "indexOfObject:", v22);
                  v27 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v10, "objectAtIndexedSubscript:", v26);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue") + 1);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v26, v29);

                }
              }
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
            }
            while (v19);
          }

          v16 = v52 + 1;
        }
        while (v52 + 1 != v51);
        v51 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v51);
    }

  }
  if (!objc_msgSend(v9, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", v50);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = v10;
  v30 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v58 != v35)
          objc_enumerationMutation(v55);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "integerValue");
        objc_msgSend(v56, "objectAtIndexedSubscript:", v32 + j);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          v40 = v37;
        else
          v40 = v37 + 1;
        if (v40 > (uint64_t)v34)
        {
          v33 = (void *)(v32 + j);
          v34 = (void *)v40;
        }

      }
      v32 += j;
      v31 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
    }
    while (v31);
  }
  else
  {
    v33 = 0;
    v34 = 0;
  }

  v41 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v43;
    v71 = 2048;
    v72 = v34;
    v73 = 2048;
    v74 = v33;
    v75 = 2112;
    v76 = v56;
    _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Returning Best matched capability (Matched: %ld, Index: %ld) from Filtered list :%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v41);
  objc_msgSend(v56, "objectAtIndexedSubscript:", v33);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (BOOL)doesResponse:(id)a3 matchAllCapabilities:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HMDRemoteMessageTransport compareCapability:key:withCapability:](self, "compareCapability:key:withCapability:", v13, v12, v14);

        if (v15 > 1)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (int64_t)compareCapability:(id)a3 key:(id)a4 withCapability:(id)a5
{
  id v7;
  id v8;
  id v9;
  int64_t v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (((objc_msgSend(v8, "isEqualToString:", CFSTR("kHomedVersionKey")) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", CFSTR("kHomeConfigurationVersionKey")) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", CFSTR("kMetadataInfoSchemaVersionKey")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("kMetadataInfoVersionKey")))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v7, "compare:", v9);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kHomeUUID"))
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v7, "isEqualToString:", v9) - 1;
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)configureWithHomeMembershipVerifier:(id)a3
{
  objc_storeWeak((id *)&self->_homeMembershipVerifier, a3);
}

- (id)dumpState
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFObject debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D27EE0]);

  return v3;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (HMDRemoteMessageTransportReachabilityDelegate)reachabilityDelegate
{
  return (HMDRemoteMessageTransportReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_reachabilityDelegate);
}

- (void)setReachabilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reachabilityDelegate, a3);
}

- (HMDHomeMembershipVerifier)homeMembershipVerifier
{
  return (HMDHomeMembershipVerifier *)objc_loadWeakRetained((id *)&self->_homeMembershipVerifier);
}

- (HMFFuture)startFuture
{
  return self->_startFuture;
}

- (HMFPromise)startPromise
{
  return self->_startPromise;
}

- (int)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startPromise, 0);
  objc_storeStrong((id *)&self->_startFuture, 0);
  objc_destroyWeak((id *)&self->_homeMembershipVerifier);
  objc_destroyWeak((id *)&self->_reachabilityDelegate);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
}

uint64_t __65__HMDRemoteMessageTransport_matchResponse_requestedCapabilities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  HMDHomeKitVersion *v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kHomeKitVersionStringKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("kHomeKitVersionStringKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v6)
    {
      v9 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v6);
      if (v8)
      {
LABEL_4:
        v10 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v8);
        v11 = (unint64_t)v10;
        v12 = v9 != 0;
        if (!v9 || !v10)
          goto LABEL_17;
LABEL_9:
        v14 = objc_msgSend((id)v9, "compare:", v11);
        goto LABEL_22;
      }
    }
    else
    {
      v9 = 0;
      if (v7)
        goto LABEL_4;
    }
    v11 = 0;
    v12 = v9 != 0;
LABEL_17:
    v16 = !v12;
    v17 = 1;
    if (v16)
      v17 = -1;
    if (v9 | v11)
      v14 = v17;
    else
      v14 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kHomedVersionKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("kHomedVersionKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (v9 && v13)
    goto LABEL_9;
  v15 = 1;
  if (!v9)
    v15 = -1;
  if (v9 | v13)
    v14 = v15;
  else
    v14 = 0;
LABEL_22:

  return v14;
}

void __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@Posting notification about incoming message with no listeners from: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("kIDSMessageSourceIDKey");
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "remoteDestinationString", CFSTR("kIDSMessageSourceIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("HMDDidReceiveRemoteMessageWithNoListenerNotification"), v7, v9);

}

+ (unint64_t)restriction
{
  return -1;
}

+ (id)remoteMessageFromMessage:(id)a3 secure:(BOOL)a4 accountRegistry:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  HMDRemoteMessage *v10;
  HMDRemoteMessage *v11;
  HMDRemoteMessage *v12;
  HMDRemoteMessage *v13;
  HMDRemoteMessage *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDRemoteDeviceMessageDestination *v36;
  void *v37;
  HMDRemoteDeviceMessageDestination *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  __CFString *v50;
  uint64_t v52;
  char v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  __CFString *v65;
  uint64_t v66;

  v6 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (HMDRemoteMessage *)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = v10;
    if (v6)
    {
      -[HMDRemoteMessage setSecure:](v12, "setSecure:", 1);
      v13 = v10;
    }
  }
  else
  {
    v14 = [HMDRemoteMessage alloc];
    -[HMDRemoteMessage name](v10, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDRemoteMessage qualityOfService](v10, "qualityOfService");
    -[HMDRemoteMessage destination](v10, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage messagePayload](v10, "messagePayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage timeout](v10, "timeout");
    v20 = v19;
    LOBYTE(v52) = -[HMFMessage isSecureRemote](v10, "isSecureRemote") || v6;
    v13 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v14, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v15, v16, v17, v18, 0, 3, v20, v52, -[HMFMessage remoteRestriction](v10, "remoteRestriction"), 0);

    -[HMDRemoteMessage identifier](v10, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setIdentifier:](v13, "setIdentifier:", v21);

    -[HMDRemoteMessage responseHandler](v10, "responseHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setResponseHandler:](v13, "setResponseHandler:", v22);

  }
  -[HMDRemoteMessage attributedMessageName](v13, "attributedMessageName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    -[HMDRemoteMessage name](v10, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setAttributedMessageName:](v13, "setAttributedMessageName:", v24);

  }
  if (v9)
  {
    -[HMDRemoteMessage destination](v13, "destination");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (v27)
    {
      v53 = 0;
      objc_msgSend(v27, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handles");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceForHandle:exists:", v30, &v53);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "device");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v34;
          v56 = 2112;
          v57 = v35;
          v58 = 2112;
          v59 = v31;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        v36 = [HMDRemoteDeviceMessageDestination alloc];
        objc_msgSend(v27, "target");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v36, "initWithTarget:device:", v37, v31);

        -[HMDRemoteMessage setDestination:](v13, "setDestination:", v38);
        objc_msgSend(v27, "preferredHandle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v27, "preferredHandle");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDRemoteDeviceMessageDestination setPreferredHandle:](v38, "setPreferredHandle:", v40);

        }
      }

    }
  }
  v41 = (void *)MEMORY[0x1D17BA0A0]();
  v42 = a1;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage identifier](v13, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage name](v13, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage timeout](v13, "timeout");
    v48 = v47;
    v49 = -[HMDRemoteMessage type](v13, "type");
    if (v49 > 3)
      v50 = 0;
    else
      v50 = off_1E89C1CE0[v49];
    *(_DWORD *)buf = 138544642;
    v55 = v44;
    v56 = 2112;
    v57 = v42;
    v58 = 2112;
    v59 = v45;
    v60 = 2112;
    v61 = v46;
    v62 = 2048;
    v63 = v48;
    v64 = 2112;
    v65 = v50;
    _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Created remote message from message with identifier: %@ name: %@ timeout: %.0f and type: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v41);

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_181469 != -1)
    dispatch_once(&logCategory__hmf_once_t19_181469, &__block_literal_global_253);
  return (id)logCategory__hmf_once_v20_181470;
}

void __40__HMDRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_181470;
  logCategory__hmf_once_v20_181470 = v0;

}

@end
