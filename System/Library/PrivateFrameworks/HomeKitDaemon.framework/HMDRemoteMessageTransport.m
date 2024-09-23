@implementation HMDRemoteMessageTransport

+ (id)remoteMessageTransportsForProductInfo:(id)a3
{
  HMDModernRemoteMessageTransport *v3;
  void *v4;
  HMDModernRemoteMessageTransport *v5;
  HMDIDSMessageTransport *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = [HMDModernRemoteMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:](v3, "initWithAccountRegistry:", v4);

  v6 = [HMDIDSMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDIDSMessageTransport initLegacyTransportWithAccountRegistry:](v6, "initLegacyTransportWithAccountRegistry:", v7);

  v11[0] = v5;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDRemoteMessageTransport)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
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
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
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
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &obj);
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
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke;
    v6[3] = &unk_24E79C268;
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

  v80[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v48 = a4;
  v6 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Select based on capability %@, and responses %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_253);
  v80[0] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sorted responses by homed version: %@", buf, 0x16u);

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
                  objc_msgSend(v10, "addObject:", &unk_24E96D610);
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
                  v27 = (void *)MEMORY[0x24BDD16E0];
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

  v41 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Returning Best matched capability (Matched: %ld, Index: %ld) from Filtered list :%@", buf, 0x2Au);

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

  v23 = *MEMORY[0x24BDAC8D0];
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFObject debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE3EAD8]);

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

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@Posting notification about incoming message with no listeners from: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("kIDSMessageSourceIDKey");
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "remoteDestinationString", CFSTR("kIDSMessageSourceIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
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
  void *v14;
  void *v15;
  void *v16;
  HMDRemoteMessage *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  HMDRemoteDeviceMessageDestination *v40;
  void *v41;
  HMDRemoteDeviceMessageDestination *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __CFString *v54;
  uint64_t v56;
  id v57;
  char v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  __CFString *v70;
  uint64_t v71;
  _QWORD v72[2];

  v6 = a4;
  v72[1] = *MEMORY[0x24BDAC8D0];
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
    -[HMDRemoteMessage untrustedClientIdentifier](v10, "untrustedClientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = a1;
    if (v14)
    {
      v71 = *MEMORY[0x24BE3EC00];
      -[HMDRemoteMessage untrustedClientIdentifier](v10, "untrustedClientIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v17 = [HMDRemoteMessage alloc];
    -[HMDRemoteMessage name](v10, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDRemoteMessage qualityOfService](v10, "qualityOfService");
    -[HMDRemoteMessage destination](v10, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage messagePayload](v10, "messagePayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage timeout](v10, "timeout");
    v23 = v22;
    LOBYTE(v56) = -[HMFMessage isSecureRemote](v10, "isSecureRemote") || v6;
    v13 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v17, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v18, v19, v20, v21, v16, 3, v23, v56, -[HMFMessage remoteRestriction](v10, "remoteRestriction"), 0);

    -[HMDRemoteMessage identifier](v10, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setIdentifier:](v13, "setIdentifier:", v24);

    -[HMDRemoteMessage responseHandler](v10, "responseHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setResponseHandler:](v13, "setResponseHandler:", v25);

    a1 = v57;
  }
  -[HMDRemoteMessage attributedMessageName](v13, "attributedMessageName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    -[HMDRemoteMessage name](v10, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage setAttributedMessageName:](v13, "setAttributedMessageName:", v27);

  }
  if (v9)
  {
    -[HMDRemoteMessage destination](v13, "destination");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (v30)
    {
      v58 = 0;
      objc_msgSend(v30, "device");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handles");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceForHandle:exists:", v33, &v58);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v35 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "device");
          v38 = a1;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = v37;
          v61 = 2112;
          v62 = v39;
          v63 = 2112;
          v64 = v34;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", buf, 0x20u);

          a1 = v38;
        }

        objc_autoreleasePoolPop(v35);
        v40 = [HMDRemoteDeviceMessageDestination alloc];
        objc_msgSend(v30, "target");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v40, "initWithTarget:device:", v41, v34);

        -[HMDRemoteMessage setDestination:](v13, "setDestination:", v42);
        objc_msgSend(v30, "preferredHandle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v30, "preferredHandle");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDRemoteDeviceMessageDestination setPreferredHandle:](v42, "setPreferredHandle:", v44);

        }
      }

    }
  }
  v45 = (void *)MEMORY[0x227676638]();
  v46 = a1;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage identifier](v13, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage name](v13, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage timeout](v13, "timeout");
    v52 = v51;
    v53 = -[HMDRemoteMessage type](v13, "type");
    if (v53 > 3)
      v54 = 0;
    else
      v54 = off_24E79B130[v53];
    *(_DWORD *)buf = 138544642;
    v60 = v48;
    v61 = 2112;
    v62 = v46;
    v63 = 2112;
    v64 = v49;
    v65 = 2112;
    v66 = v50;
    v67 = 2048;
    v68 = v52;
    v69 = 2112;
    v70 = v54;
    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Created remote message from message with identifier: %@ name: %@ timeout: %.0f and type: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v45);

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_248517 != -1)
    dispatch_once(&logCategory__hmf_once_t19_248517, &__block_literal_global_256_248518);
  return (id)logCategory__hmf_once_v20_248519;
}

void __40__HMDRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_248519;
  logCategory__hmf_once_v20_248519 = v0;

}

@end
