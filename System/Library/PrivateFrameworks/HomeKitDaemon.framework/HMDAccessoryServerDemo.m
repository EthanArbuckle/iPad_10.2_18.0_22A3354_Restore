@implementation HMDAccessoryServerDemo

- (BOOL)isPaired
{
  return self->__paired;
}

- (BOOL)hasPairings
{
  return self->__hasPairings;
}

- (id)initCommon:(id)a3 browser:(id)a4
{
  id v6;
  HMDAccessoryServerDemo *v7;
  HMDAccessoryServerDemo *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryServerDemo;
  v7 = -[HAPAccessoryServer initWithKeystore:](&v10, sel_initWithKeystore_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_browser, v6);

  return v8;
}

- (HMDAccessoryServerDemo)initWithName:(id)a3 identifier:(id)a4 deviceInfo:(id)a5 paired:(BOOL)a6 keyStore:(id)a7 testMode:(BOOL)a8 browser:(id)a9
{
  id v15;
  id v16;
  id v17;
  HMDAccessoryServerDemo *v18;
  HMDAccessoryServerDemo *v19;
  uint64_t v20;
  NSDictionary *accessoryInfo;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSNumber *category;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = -[HMDAccessoryServerDemo initCommon:browser:](self, "initCommon:browser:", a7, a9);
  v19 = v18;
  if (v18)
  {
    v18->__paired = a6;
    v18->__hasPairings = a6;
    v20 = objc_msgSend(v17, "copy");
    accessoryInfo = v19->_accessoryInfo;
    v19->_accessoryInfo = (NSDictionary *)v20;

    v22 = objc_msgSend(v16, "copy");
    v23 = (int)*MEMORY[0x24BE1BC60];
    v24 = *(Class *)((char *)&v19->super.super.super.isa + v23);
    *(Class *)((char *)&v19->super.super.super.isa + v23) = (Class)v22;

    v25 = objc_msgSend(v15, "copy");
    v26 = (int)*MEMORY[0x24BE1BC70];
    v27 = *(Class *)((char *)&v19->super.super.super.isa + v26);
    *(Class *)((char *)&v19->super.super.super.isa + v26) = (Class)v25;

    v19->_testMode = a8;
    category = v19->_category;
    v19->_category = (NSNumber *)&unk_24E96B600;

  }
  return v19;
}

- (int64_t)linkType
{
  return 1;
}

- (void)discoverAccessories
{
  -[HMDAccessoryServerDemo _parseAttributeDatabase:](self, "_parseAttributeDatabase:", self->_accessoryInfo);
}

- (void)_parseAttributeDatabase:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  id obj;
  void *v49;
  _QWORD block[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE1B478];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE1B478]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_36;
  v29 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v31;
    v59 = 2112;
    v60 = v32;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] No accessory objects found in the attribute database", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  v33 = objc_alloc(MEMORY[0x24BDD1540]);
  v14 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6727, 0);
  if (!v14)
  {
LABEL_36:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v58 = v9;
      v59 = 2112;
      v60 = v10;
      v61 = 2112;
      v62 = v5;
      v63 = 2112;
      v64 = v11;
      v12 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Expected the value of '%@' to be an array in the attribute database, instead it is a %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6727, 0);
    if (!v14)
    {
LABEL_6:
      v47 = v4;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v46 = v6;
      obj = v6;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v53;
        v20 = *MEMORY[0x24BE1BCA0];
        while (2)
        {
          v21 = 0;
          v22 = v18;
          do
          {
            if (*(_QWORD *)v53 != v19)
              objc_enumerationMutation(obj);
            objc_msgSend(MEMORY[0x24BE1B9E0], "_parseSerializedAccessoryDictionary:server:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v21), self, v46);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v34 = (void *)MEMORY[0x227676638]();
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[HAPAccessoryServer name](self, "name");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v58 = v36;
                v59 = 2112;
                v60 = v37;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Unable to parse serialized accessory", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v34);
              v38 = objc_alloc(MEMORY[0x24BDD1540]);
              v14 = (void *)objc_msgSend(v38, "initWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6742, 0);
              goto LABEL_30;
            }
            objc_msgSend(v18, "instanceID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

            if (v25)
            {
              objc_msgSend(v18, "setPrimary:", 1);
              -[HAPAccessoryServer setPrimaryAccessory:](self, "setPrimaryAccessory:", v18);
            }
            else
            {
              objc_msgSend(v18, "setPrimary:", 0);
            }
            objc_msgSend(v18, "instanceID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v15, "containsObject:", v26);

            if (v27)
            {
              v39 = (void *)MEMORY[0x227676638]();
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[HAPAccessoryServer name](self, "name");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v58 = v41;
                v59 = 2112;
                v60 = v42;
                _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Accessory Server has accessory with duplicate instance ID", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v39);
              v43 = objc_alloc(MEMORY[0x24BDD1540]);
              v14 = (void *)objc_msgSend(v43, "initWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6742, 0);

              goto LABEL_30;
            }
            objc_msgSend(v18, "instanceID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v28);

            objc_msgSend(v18, "setServer:", self);
            objc_msgSend(v49, "addObject:", v18);
            ++v21;
            v22 = v18;
          }
          while (v17 != v21);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          if (v17)
            continue;
          break;
        }

      }
      v14 = 0;
LABEL_30:

      -[HAPAccessoryServer setAccessories:](self, "setAccessories:", v49);
      v6 = v46;
      v4 = v47;
    }
  }
  -[HAPAccessoryServer delegateQueue](self, "delegateQueue", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__HMDAccessoryServerDemo__parseAttributeDatabase___block_invoke;
    block[3] = &unk_24E79C268;
    block[4] = self;
    v51 = v14;
    dispatch_async(v45, block);

  }
}

- (void)sendDelayedResponse:(unint64_t)a3 responses:(id)a4 readOperation:(BOOL)a5 completionQueue:(id)a6 completionHandler:(id)a7
{
  void *v9;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  id v26;
  _QWORD handler[5];
  NSObject *v28;
  id v29;
  id v30;
  char v31;
  _QWORD block[4];
  id v33;
  NSObject *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  LODWORD(v9) = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (a3)
  {
    v16 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = v12;
      v18 = (int)v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      *(_DWORD *)buf = 138544386;
      v22 = CFSTR("write");
      v36 = v9;
      if (v18)
        v22 = CFSTR("read");
      v37 = 2112;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      v41 = 2112;
      v42 = v22;
      v43 = 2048;
      v44 = a3;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying %@-response by %lu", buf, 0x34u);

      LOBYTE(v9) = v18;
      v12 = v26;
    }

    objc_autoreleasePoolPop(v16);
    v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v13);
    v24 = dispatch_time(0, 1000000 * a3);
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke_14;
    handler[3] = &unk_24E798BF0;
    v31 = (char)v9;
    handler[4] = self;
    v28 = v23;
    v30 = v15;
    v29 = v12;
    v25 = v23;
    dispatch_source_set_event_handler(v25, handler);
    dispatch_resume(v25);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_24E79C2B8;
    v34 = v14;
    v33 = v12;
    dispatch_async(v13, block);

    v25 = v34;
  }

}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  dispatch_time_t v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  uint64_t v40;
  id obj;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _QWORD handler[4];
  NSObject *v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  unint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (!v11)
  {

LABEL_18:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_24E79C2B8;
    v53 = v47;
    v54 = v10;
    v35 = v47;
    v36 = v10;
    dispatch_async(v9, block);

    v34 = v54;
    goto LABEL_19;
  }
  v37 = v10;
  v38 = v9;
  v12 = 0;
  v46 = *(_QWORD *)v56;
  v13 = v11;
  do
  {
    v14 = 0;
    v40 = v13;
    do
    {
      if (*(_QWORD *)v56 != v46)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v14);
      objc_msgSend(v15, "responseDelay", v37, v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongValue");

      if (v17)
      {
        v18 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v18;
          -[HAPAccessoryServer name](self, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer identifier](self, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "service");
          v44 = v12;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "type");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "instanceID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545154;
          v60 = v45;
          v61 = 2112;
          v62 = v20;
          v63 = 2112;
          v64 = v21;
          v65 = 2112;
          v66 = (unint64_t)v22;
          v67 = 2112;
          v68 = v23;
          v69 = 2112;
          v70 = v24;
          v71 = 2112;
          v72 = v25;
          v73 = 2048;
          v74 = v17;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Service %@ Characteristic %@/%@: value %@, delay %lu", buf, 0x52u);

          v18 = v43;
          v13 = v40;

          v12 = v44;
        }

        objc_autoreleasePoolPop(v18);
        if (v12 <= v17)
          v12 = v17;
      }
      objc_msgSend(MEMORY[0x24BE1BA20], "responseTupleForCharacteristic:error:", v15, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v26);

      ++v14;
    }
    while (v13 != v14);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  }
  while (v13);

  v10 = v37;
  v9 = v38;
  if (!v12)
    goto LABEL_18;
  v27 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v60 = v29;
    v61 = 2112;
    v62 = v30;
    v63 = 2112;
    v64 = v31;
    v65 = 2048;
    v66 = v12;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying read-response by %lu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v27);
  v32 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v38);
  v33 = dispatch_time(0, 1000000 * v12);
  dispatch_source_set_timer(v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_16;
  handler[3] = &unk_24E79B440;
  v49 = v32;
  v50 = v47;
  v51 = v37;
  v34 = v47;
  v35 = v37;
  v36 = v32;
  dispatch_source_set_event_handler(v36, handler);
  dispatch_resume(v36);

LABEL_19:
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  HMDAccessoryServerDemo *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  dispatch_time_t v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id obj;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD handler[4];
  NSObject *v50;
  id v51;
  id v52;
  _QWORD block[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  unint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v8;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  if (!v47)
  {

LABEL_19:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_24E79C2B8;
    v54 = v46;
    v55 = v10;
    v34 = v46;
    v35 = v10;
    dispatch_async(v9, block);

    v33 = v55;
    goto LABEL_20;
  }
  v36 = v10;
  v37 = v9;
  v48 = 0;
  v45 = *(_QWORD *)v57;
  v11 = self;
  do
  {
    for (i = 0; i != v47; ++i)
    {
      if (*(_QWORD *)v57 != v45)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_msgSend(v13, "characteristic", v36, v37);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "responseDelay");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedLongValue");

      if (v16)
      {
        v17 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer name](v11, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer identifier](v11, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "service");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "instanceID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "value");
          v42 = v17;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545154;
          v61 = v44;
          v62 = 2112;
          v63 = v43;
          v64 = 2112;
          v65 = v40;
          v66 = 2112;
          v67 = (unint64_t)v19;
          v68 = 2112;
          v69 = v20;
          v70 = 2112;
          v71 = v21;
          v72 = 2112;
          v73 = v22;
          v74 = 2048;
          v75 = v16;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Service %@ Characteristic %@/%@: value %@, delay %lu", buf, 0x52u);

          v17 = v42;
          v11 = self;

        }
        objc_autoreleasePoolPop(v17);
        v23 = v48;
        if (v48 <= v16)
          v23 = v16;
        v48 = v23;
      }
      objc_msgSend(v13, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryServerDemo processCharacteristicWrite:value:](v11, "processCharacteristicWrite:value:", v14, v24);

      objc_msgSend(MEMORY[0x24BE1BA20], "responseTupleForCharacteristic:error:", v14, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v25);

    }
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  }
  while (v47);

  v10 = v36;
  v9 = v37;
  if (!v48)
    goto LABEL_19;
  v26 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v61 = v28;
    v62 = 2112;
    v63 = v29;
    v64 = 2112;
    v65 = v30;
    v66 = 2048;
    v67 = v48;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying write-response by %lu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v26);
  v31 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v37);
  v32 = dispatch_time(0, 1000000 * v48);
  dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_17;
  handler[3] = &unk_24E79B440;
  v50 = v31;
  v51 = v46;
  v52 = v36;
  v33 = v46;
  v34 = v36;
  v35 = v31;
  dispatch_source_set_event_handler(v35, handler);
  dispatch_resume(v35);

LABEL_20:
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(void *, _QWORD, void *);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x24BE1BA20], "responseTupleForCharacteristic:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (v10)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __86__HMDAccessoryServerDemo_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    v20[3] = &unk_24E79C2B8;
    v22 = (void (**)(void *, _QWORD, void *))v9;
    v21 = v11;
    dispatch_async(v10, v20);

    v18 = v22;
  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v9);
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)processCharacteristicWrite:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  int v61;
  id v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  dispatch_time_t v86;
  NSObject *v87;
  void *v88;
  int v89;
  void *v90;
  id v91;
  void *v93;
  void *v94;
  void *v95;
  _QWORD block[4];
  id v97;
  id v98;
  id v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v91 = a4;
  v6 = (void *)objc_msgSend(v91, "copy");
  objc_msgSend(v5, "setValue:", v6);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueUpdatedTime:", v7);

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1B628]);

  if (v9)
  {
    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B500]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    v11 = (double *)&unk_22269F000;
    if (v10)
      goto LABEL_6;
LABEL_56:
    v95 = 0;
    v90 = 0;
    v16 = v11[448];
    goto LABEL_57;
  }
  objc_msgSend(v5, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE1B608]);

  if (v13)
  {
    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B4E0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    v11 = (double *)&unk_22269F000;
    if (v10)
      goto LABEL_6;
    goto LABEL_56;
  }
  objc_msgSend(v5, "type");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE1B618]);

  if (v27)
  {
    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B4F0]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "characteristicsOfType:", *MEMORY[0x24BE1B520]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B648]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v95)
    {

      v95 = 0;
      v90 = 0;
      v16 = 1.1;
      goto LABEL_57;
    }
    objc_msgSend(v95, "responseDelay");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedLongValue");
    v33 = v32 == 0;

    if (v32)
    {
      v34 = 0;
      v16 = 1.1;
LABEL_15:

      goto LABEL_18;
    }
    if (objc_msgSend(v91, "integerValue") == 3)
    {
      objc_msgSend(v29, "value");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "doubleValue");
      v56 = v55;
      objc_msgSend(v30, "value");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v59 = v58;

      v16 = 0.3;
      if (v56 <= v59)
      {
        objc_msgSend(v29, "value");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "doubleValue");
        v75 = v74;
        objc_msgSend(v30, "value");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "doubleValue");
        v78 = v77;

        if (v75 >= v78)
          v34 = &unk_24E96B630;
        else
          v34 = &unk_24E96B600;
      }
      else
      {
        v34 = &unk_24E96B618;
      }
      goto LABEL_15;
    }
    v34 = v91;
    if (objc_msgSend(v34, "integerValue") == 1)
    {
      v62 = v34;
      v63 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v30, "value");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      objc_msgSend(v63, "numberWithDouble:", v65 + -1.0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setObject:forKey:", v66, v29);

      v16 = 0.3;
    }
    else
    {
      v16 = 0.3;
      if (objc_msgSend(v34, "integerValue") != 2)
        goto LABEL_15;
      v62 = v34;
      v79 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v30, "value");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "doubleValue");
      objc_msgSend(v79, "numberWithDouble:", v81 + 1.0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setObject:forKey:", v82, v29);

    }
    v34 = v62;
    goto LABEL_15;
  }
  objc_msgSend(v5, "type");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x24BE1B648]);

  if (v36)
  {
    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B520]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v37;
    v11 = (double *)&unk_22269F000;
    if (v37)
    {
      objc_msgSend(v37, "responseDelay");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedLongValue");

      if (v39)
        goto LABEL_7;
      objc_msgSend(v93, "characteristicsOfType:", *MEMORY[0x24BE1B4F0]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "value");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "integerValue");

      if (v43 == 1)
      {
        v44 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v91, "doubleValue");
        objc_msgSend(v44, "numberWithDouble:", v45 + -1.0);
        v46 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v41, "value");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "integerValue");

        if (v70 == 2)
        {
          v71 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v91, "doubleValue");
          objc_msgSend(v71, "numberWithDouble:", v72 + 1.0);
          v46 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v46 = v91;
        }
      }
      v34 = v46;

      goto LABEL_17;
    }
    goto LABEL_56;
  }
  objc_msgSend(v5, "type");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x24BE1B638]);

  if (v48)
  {
    __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B510]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    v11 = (double *)&unk_22269F000;
    if (!v10)
      goto LABEL_56;
  }
  else
  {
    objc_msgSend(v5, "type");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x24BE1B640]);

    if (v50)
    {
      __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B518]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v51;
      if (!v51)
      {
        v95 = 0;
        v90 = 0;
        v16 = 1.1;
        goto LABEL_57;
      }
      objc_msgSend(v51, "responseDelay");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "unsignedLongValue");

      if (v53)
      {
        v90 = 0;
        v16 = 1.1;
        goto LABEL_8;
      }
      if (objc_msgSend(v91, "integerValue") >= 3)
        v34 = &unk_24E96B600;
      else
        v34 = &unk_24E96B630;
      v33 = 1;
      v16 = 0.3;
LABEL_18:
      v90 = v34;
      if (v33 && v34)
      {
        objc_msgSend(v94, "setObject:forKey:", v34, v95);
        goto LABEL_57;
      }
      goto LABEL_8;
    }
    objc_msgSend(v5, "type");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "isEqualToString:", *MEMORY[0x24BE1B630]);

    if (v61)
    {
      __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B508]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v10;
      v11 = (double *)&unk_22269F000;
      if (!v10)
        goto LABEL_56;
    }
    else
    {
      objc_msgSend(v5, "type");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "isEqualToString:", *MEMORY[0x24BE1B620]);

      if (v68)
      {
        __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B4F8]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v10;
        v11 = (double *)&unk_22269F000;
        if (!v10)
          goto LABEL_56;
      }
      else
      {
        objc_msgSend(v5, "type");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "isEqualToString:", *MEMORY[0x24BE1B658]);

        if (v84)
        {
          __findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B530]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v10;
          v11 = (double *)&unk_22269F000;
          if (v10)
            goto LABEL_6;
          goto LABEL_56;
        }
        objc_msgSend(v5, "type");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "isEqualToString:", *MEMORY[0x24BE1B4A8]);

        v11 = (double *)&unk_22269F000;
        v16 = 1.1;
        if (!v89
          || (__findAssociatedCharacteristicWithService(v93, *MEMORY[0x24BE1B550]),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              (v95 = v10) == 0))
        {
          v95 = 0;
          v90 = 0;
          goto LABEL_57;
        }
      }
    }
  }
LABEL_6:
  objc_msgSend(v10, "responseDelay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongValue");

  if (!v15)
  {
    v34 = v91;
LABEL_17:
    v33 = 1;
    v16 = v11[448];
    goto LABEL_18;
  }
LABEL_7:
  v90 = 0;
  v16 = v11[448];
LABEL_8:
  v17 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "responseDelay");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedLongValue");
    objc_msgSend(v95, "type");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "instanceID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v101 = v19;
    v102 = 2112;
    v103 = v20;
    v104 = 2112;
    v105 = v21;
    v106 = 2048;
    v107 = v23;
    v108 = 2112;
    v109 = v24;
    v110 = 2112;
    v111 = v25;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] responseDelay set to %lu for current state characteristic %@/%@ - bypassing processing effects...", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v17);
LABEL_57:
  if (objc_msgSend(v94, "count"))
  {
    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v94, "count"));
    objc_initWeak((id *)buf, self);
    if (-[HMDAccessoryServerDemo _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
    {
      v86 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v87 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__HMDAccessoryServerDemo_processCharacteristicWrite_value___block_invoke;
      block[3] = &unk_24E7965D0;
      v97 = v94;
      v98 = v85;
      objc_copyWeak(&v99, (id *)buf);
      dispatch_after(v86, v87, block);

      objc_destroyWeak(&v99);
    }
    objc_destroyWeak((id *)buf);

  }
}

- (void)startPairingWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->__paired = 1;
  self->__hasPairings = 1;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPAccessoryServer keyStore](self, "keyStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v10 = objc_msgSend(v8, "savePublicKey:forAccessoryName:error:", v7, v9, &v21);
  v11 = v21;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to save public for accessory %@/%@ - error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
  }
  if (-[HMDAccessoryServerDemo _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__HMDAccessoryServerDemo_startPairingWithRequest___block_invoke;
    block[3] = &unk_24E79C268;
    block[4] = self;
    v20 = v11;
    dispatch_async(v18, block);

  }
}

- (BOOL)stopPairingWithError:(id *)a3
{
  return 0;
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (-[HMDAccessoryServerDemo testMode](self, "testMode"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6702, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__HMDAccessoryServerDemo_addPairing_completionQueue_completionHandler___block_invoke;
    v13[3] = &unk_24E79C2B8;
    v14 = v10;
    v15 = v9;
    v11 = v10;
    dispatch_async(v7, v13);

  }
  else
  {
    v11 = (void (**)(id, void *))_Block_copy(v8);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v12);

    }
  }

}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (-[HMDAccessoryServerDemo testMode](self, "testMode"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6702, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__HMDAccessoryServerDemo_removePairing_completionQueue_completionHandler___block_invoke;
    v13[3] = &unk_24E79C2B8;
    v14 = v10;
    v15 = v9;
    v11 = v10;
    dispatch_async(v7, v13);

  }
  else
  {
    v11 = (void (**)(id, void *))_Block_copy(v8);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v12);

    }
  }

}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *);
  void *v19;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  self->__paired = 0;
  self->__hasPairings = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  objc_msgSend(WeakRetained, "resetDemoAccessory:", self);

  -[HAPAccessoryServer keyStore](self, "keyStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "removeAccessoryKeyForName:error:", v10, &v24);
  v11 = v24;

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to remove public key for accessory %@/%@- error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (v6)
    {
      if (!-[HMDAccessoryServerDemo testMode](self, "testMode"))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6702, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __78__HMDAccessoryServerDemo_removePairingForCurrentControllerOnQueue_completion___block_invoke;
        block[3] = &unk_24E79C2B8;
        v22 = v17;
        v23 = v7;
        v18 = v17;
        dispatch_async(v6, block);

        v19 = v23;
LABEL_12:

        goto LABEL_13;
      }
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    goto LABEL_8;
  }
  v18 = (void (**)(id, void *))_Block_copy(v7);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v19);
    goto LABEL_12;
  }
LABEL_13:

  return 0;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (-[HMDAccessoryServerDemo testMode](self, "testMode"))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], -6702, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__HMDAccessoryServerDemo_listPairingsWithCompletionQueue_completionHandler___block_invoke;
    v12[3] = &unk_24E79C2B8;
    v13 = v9;
    v14 = v8;
    v10 = v9;
    dispatch_async(v6, v12);

  }
  else
  {
    v10 = (void (**)(id, _QWORD, void *))_Block_copy(v7);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v11);

    }
  }

}

- (void)identifyWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HAPAccessoryServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = objc_opt_respondsToSelector();
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessoryServerDemo_handleUpdatesForCharacteristics_stateNumber___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (NSDictionary)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfo, a3);
}

- (HMDAccessoryServerBrowserDemo)browser
{
  return (HMDAccessoryServerBrowserDemo *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (BOOL)_paired
{
  return self->__paired;
}

- (void)set_paired:(BOOL)a3
{
  self->__paired = a3;
}

- (BOOL)_hasPairings
{
  return self->__hasPairings;
}

- (void)set_hasPairings:(BOOL)a3
{
  self->__hasPairings = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

void __70__HMDAccessoryServerDemo_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

  }
}

void __76__HMDAccessoryServerDemo_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD, _QWORD))v2 + 2))(v2, 0, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __78__HMDAccessoryServerDemo_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __74__HMDAccessoryServerDemo_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __71__HMDAccessoryServerDemo_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __50__HMDAccessoryServerDemo_startPairingWithRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__HMDAccessoryServerDemo_processCharacteristicWrite_value___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDBCE60], "date", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValueUpdatedTime:", v8);

        objc_msgSend(a1[4], "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:", v9);

        objc_msgSend(a1[5], "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(a1[5], "copy");
  objc_msgSend(v11, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", WeakRetained, v12, 0, 0);

}

void __86__HMDAccessoryServerDemo_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32), 0);
    v2 = v3;
  }

}

uint64_t __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke_14(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const __CFString *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = *(unsigned __int8 *)(a1 + 64);
    v11 = 138544130;
    v12 = v4;
    if (v8)
      v9 = CFSTR("read");
    else
      v9 = CFSTR("write");
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Sending %@-response", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __50__HMDAccessoryServerDemo__parseAttributeDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, *(_QWORD *)(a1 + 40));

}

@end
