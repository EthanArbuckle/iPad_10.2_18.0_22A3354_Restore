@implementation HMDDataStreamController

- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  return -[HMDDataStreamController initWithAccessory:service:workQueue:dataStreamFactory:](self, "initWithAccessory:service:workQueue:dataStreamFactory:", a3, a4, a5, &__block_literal_global_69303);
}

- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDDataStreamController *v14;
  HMDDataStreamController *v15;
  uint64_t v16;
  NSMutableArray *pendingSocketRequests;
  void *v18;
  id dataStreamFactory;
  void *v20;
  uint64_t v21;
  NSString *logIdentifier;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDDataStreamController;
  v14 = -[HMDDataStreamController init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_transferManagementService, v11);
    objc_storeStrong((id *)&v15->_workQueue, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingSocketRequests = v15->_pendingSocketRequests;
    v15->_pendingSocketRequests = (NSMutableArray *)v16;

    v18 = _Block_copy(v13);
    dataStreamFactory = v15->_dataStreamFactory;
    v15->_dataStreamFactory = v18;

    objc_msgSend(v10, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v21;

  }
  return v15;
}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[HMDDataStreamController accessory](self, "accessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), v5);

  if (objc_msgSend(v5, "isReachable"))
    -[HMDDataStreamController handleAccessoryConnected](self, "handleAccessoryConnected");

}

- (void)deRegisterFromNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_resetTransportInfo
{
  -[HMDDataStreamController setSupportsDataStreamOverTCP:](self, "setSupportsDataStreamOverTCP:", 0);
  -[HMDDataStreamController setSupportsDataStreamOverHAP:](self, "setSupportsDataStreamOverHAP:", 0);
  -[HMDDataStreamController setMaxControllerTransportMTU:](self, "setMaxControllerTransportMTU:", 0);
}

- (void)handleAccessoryConnected
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDDataStreamController_handleAccessoryConnected__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)_isDataStreamConfigurationValid
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDDataStreamController *v12;
  NSObject *v13;
  NSObject *v14;
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
  id v25;
  BOOL v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  HMDDataStreamController *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDDataStreamController *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  HMDDataStreamController *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDDataStreamController *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  HMDDataStreamController *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  BOOL v99;
  BOOL v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  uint8_t v116[128];
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDataStreamController transferManagementService](self, "transferManagementService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findCharacteristicWithType:", *MEMORY[0x24BDD5A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE3F2A8]);
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithVersionString:", v8);

    if (v9)
    {
      v10 = objc_msgSend(v9, "majorVersion");
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v10 == 1)
      {
        v105 = v5;
        v108 = v4;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamController accessory](v12, "accessory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamController accessory](v12, "accessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v118 = v15;
          v119 = 2112;
          v120 = v9;
          v121 = 2112;
          v122 = v17;
          v123 = 2112;
          v124 = v20;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@HDS has version '%@' (%@/%@)", buf, 0x2Au);

          v5 = v105;
          v4 = v108;

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v4, "findCharacteristicWithType:", CFSTR("00000130-0000-1000-8000-0026BB765291"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[HMDDataStreamController _resetTransportInfo](v12, "_resetTransportInfo");
          v22 = (void *)MEMORY[0x24BE1BAC0];
          objc_msgSend(v21, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = 0;
          objc_msgSend(v22, "parsedFromData:error:", v23, &v115);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v115;

          if (v25)
            v26 = 1;
          else
            v26 = v24 == 0;
          v27 = !v26;
          if (v26)
          {
            v82 = (void *)MEMORY[0x227676638]();
            v83 = v12;
            HMFGetOSLogHandle();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDDataStreamController accessory](v83, "accessory");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "name");
              v100 = v27;
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDDataStreamController accessory](v83, "accessory");
              v104 = v82;
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "uuid");
              v98 = v24;
              v89 = v21;
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "UUIDString");
              v96 = v25;
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v118 = v85;
              v119 = 2112;
              v120 = v87;
              v121 = 2112;
              v122 = v91;
              _os_log_impl(&dword_2218F0000, v84, OS_LOG_TYPE_INFO, "%{public}@Failed to parse HDS supported configuration (%@/%@)", buf, 0x20u);

              v21 = v89;
              v24 = v98;

              v82 = v104;
              v27 = v100;

              v4 = v108;
              v25 = v96;

              v5 = v105;
            }

            objc_autoreleasePoolPop(v82);
          }
          else
          {
            v94 = v9;
            v95 = v25;
            v99 = v27;
            v93 = v21;
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v97 = v24;
            objc_msgSend(v24, "configurations");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v112;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v112 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
                  objc_msgSend(v33, "transport");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v34)
                  {
                    objc_msgSend(v33, "transport");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "value");

                    if (v36 == 1)
                    {
                      if (!-[HMDDataStreamController supportsDataStreamOverHAP](v12, "supportsDataStreamOverHAP"))
                      {
                        objc_msgSend(v33, "maximumControllerTransportMTU");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v37)
                        {
                          objc_msgSend(v33, "maximumControllerTransportMTU");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "value");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v39, "unsignedIntegerValue");

                          -[HMDDataStreamController setSupportsDataStreamOverHAP:](v12, "setSupportsDataStreamOverHAP:", 1);
                          -[HMDDataStreamController setMaxControllerTransportMTU:](v12, "setMaxControllerTransportMTU:", v40);
                        }
                        else
                        {
                          v41 = (void *)MEMORY[0x227676638]();
                          v42 = v12;
                          HMFGetOSLogHandle();
                          v43 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                          {
                            HMFGetLogIdentifier();
                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543362;
                            v118 = v44;
                            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service advertises HDS-over-HAP but provides no MTU; ignoring.",
                              buf,
                              0xCu);

                          }
                          objc_autoreleasePoolPop(v41);
                        }
                      }
                    }
                    else if (!v36)
                    {
                      -[HMDDataStreamController setSupportsDataStreamOverTCP:](v12, "setSupportsDataStreamOverTCP:", 1);
                    }
                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
              }
              while (v30);
            }

            v5 = v105;
            v4 = v108;
            v21 = v93;
            v9 = v94;
            v27 = v99;
            v25 = v95;
            v24 = v97;
          }

        }
        else
        {
          v73 = (void *)MEMORY[0x227676638]();
          v74 = v12;
          HMFGetOSLogHandle();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDDataStreamController accessory](v74, "accessory");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "name");
            v103 = v73;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDDataStreamController accessory](v74, "accessory");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "uuid");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "UUIDString");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v118 = v76;
            v119 = 2112;
            v120 = v78;
            v121 = 2112;
            v122 = v81;
            _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_INFO, "%{public}@No HDS supported configuration (%@/%@)", buf, 0x20u);

            v21 = 0;
            v73 = v103;

            v5 = v105;
            v4 = v108;

          }
          objc_autoreleasePoolPop(v73);
          v27 = 0;
        }

        goto LABEL_50;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController accessory](v12, "accessory");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "name");
        v107 = v5;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController accessory](v12, "accessory");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "uuid");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "UUIDString");
        v110 = v4;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v118 = v67;
        v119 = 2112;
        v120 = v9;
        v121 = 2112;
        v122 = v69;
        v123 = 2112;
        v124 = v72;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@HDS version '%@' is not supported (%@/%@)", buf, 0x2Au);

        v5 = v107;
        v4 = v110;

      }
      v66 = v11;
    }
    else
    {
      v56 = MEMORY[0x227676638]();
      v57 = self;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController accessory](v57, "accessory");
        v106 = v5;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "name");
        v109 = v4;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController accessory](v57, "accessory");
        v102 = v56;
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "uuid");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "UUIDString");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v118 = v59;
        v119 = 2112;
        v120 = v60;
        v121 = 2112;
        v122 = v62;
        v123 = 2112;
        v124 = v65;
        _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@HDS version '%@' was not parsable (%@/%@)", buf, 0x2Au);

        v56 = v102;
        v4 = v109;

        v5 = v106;
      }

      v66 = (void *)v56;
    }
    objc_autoreleasePoolPop(v66);
    v27 = 0;
LABEL_50:

    goto LABEL_51;
  }
  v45 = (void *)MEMORY[0x227676638]();
  v46 = self;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController accessory](v46, "accessory");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController accessory](v46, "accessory");
    v51 = v5;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "uuid");
    v53 = v4;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "UUIDString");
    v101 = v45;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v118 = v48;
    v119 = 2112;
    v120 = v50;
    v121 = 2112;
    v122 = v55;
    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@No HDS version found (%@/%@)", buf, 0x20u);

    v4 = v53;
    v5 = v51;

    v45 = v101;
  }

  objc_autoreleasePoolPop(v45);
  v27 = 0;
LABEL_51:

  return v27;
}

- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDDataStreamController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  _QWORD v27[4];
  void (**v28)(id, void *);
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[HMDDataStreamController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDataStreamController transferManagementService](self, "transferManagementService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findCharacteristicWithType:", *MEMORY[0x24BDD5A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findCharacteristicWithType:", CFSTR("00000130-0000-1000-8000-0026BB765291"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v11);

  }
  else
  {
    objc_msgSend(v7, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12
      && (objc_msgSend(v9, "value"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      v4[2](v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v15, "addObject:", v16);
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v15, "addObject:", v17);
      if (objc_msgSend(v15, "count"))
      {
        context = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamController accessory](v18, "accessory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v25;
          v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Reading required transport characteristic for data stream controller %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_initWeak((id *)buf, v18);
        -[HMDDataStreamController accessory](v18, "accessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController workQueue](v18, "workQueue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __87__HMDDataStreamController__readRequiredTransportCharacteristicsIfNeededWithCompletion___block_invoke;
        v27[3] = &unk_24E79AC58;
        objc_copyWeak(&v29, (id *)buf);
        v28 = v4;
        objc_msgSend(v22, "readCharacteristicValues:source:queue:completionHandler:", v15, 7, v23, v27);

        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v24);

      }
    }
  }

}

- (void)_handleAccessoryConnected
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  HMDDataStreamController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDDataStreamController _isDataStreamConfigurationValid](self, "_isDataStreamConfigurationValid");
  v5 = -[HMDDataStreamController canAcceptBulkSendListeners](self, "canAcceptBulkSendListeners");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController accessory](v7, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is connected: %@. Configured: %@ Accepts Bulk Send: %@", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);
  if (v4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController accessory](v7, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("HMDAccessoryDoesSupportBulkSendDataStreamNotification"), v15);

  }
}

- (void)handleAccessoryDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDDataStreamController *v9;

  v4 = a3;
  -[HMDDataStreamController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMDDataStreamController_handleAccessoryDisconnected___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleAccessoryDisconnected
{
  void *v3;
  HMDDataStreamController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  HMDDataStreamController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is no longer connected: %@. Removing any transports that were active", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v4->_supportsDataStreamOverTCP = 0;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController _cancelStreamTransportWithError:](v4, "_cancelStreamTransportWithError:", v7);

}

- (id)_getActiveProtocolWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDDataStreamController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolWithName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  HMDDataStreamController *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  HMDDataStreamController *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDDataStreamController accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[HMDDataStreamBulkSendProtocol protocolName](HMDDataStreamBulkSendProtocol, "protocolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v19;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding bulk-send listener on this stream for file-type '%@'", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v14, "addListener:fileType:", v6, v7);
    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v26;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Cancelling bulk-send listener registration for file-type '%@' due to no such protocol on this stream", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1064);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessory:didCloseDataStreamWithError:", v8, v27);

    }
  }
  else
  {
    -[HMDDataStreamController _initiateStreamSetup](self, "_initiateStreamSetup");
    -[HMDDataStreamController setupInProgress](self, "setupInProgress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v25;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Add pending bulk-send listener registration for file-type '%@' (waiting for stream setup)", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDDataStreamController setupInProgress](v22, "setupInProgress");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addBulkSendListener:fileType:", v6, v7);
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v28;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling bulk-send listener registration for file-type '%@' due to no active data stream", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1063);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessory:didCloseDataStreamWithError:", v8, v12);
    }
  }

}

- (void)removeBulkSendListener:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDDataStreamController *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDDataStreamController *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDataStreamController accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HMDDataStreamController setupInProgress](self, "setupInProgress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMDDataStreamController setupInProgress](self, "setupInProgress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "removeBulkSendListener:", v4);

      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v23)
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v28 = 138543362;
          *(_QWORD *)&v28[4] = v24;
          v25 = "%{public}@Removed pending bulk-send listener registration (waiting for stream setup)";
LABEL_20:
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, v25, v28, 0xCu);

        }
      }
      else if (v23)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v24;
        v25 = "%{public}@Removed bulk-send listener trivially (stream setting up, but this was not part of it)";
        goto LABEL_20;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v24;
        v25 = "%{public}@Removed bulk-send listener trivially (nothing had started)";
        goto LABEL_20;
      }
    }

    objc_autoreleasePoolPop(v20);
LABEL_22:
    objc_msgSend(v4, "accessory:didCloseDataStreamWithError:", v5, 0, *(_OWORD *)v28);
    goto LABEL_23;
  }
  +[HMDDataStreamBulkSendProtocol protocolName](HMDDataStreamBulkSendProtocol, "protocolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream", v28, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "removeListener:", v4);

    goto LABEL_22;
  }
  if (v15)
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138543362;
    *(_QWORD *)&v28[4] = v26;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream (but there was no protocol!?)", v28, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1064);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory:didCloseDataStreamWithError:", v5, v27);

LABEL_23:
}

- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  HMDDataStreamController *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Data Stream sending target-control whoami message", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDataStreamController defaultDataStream](v7, "defaultDataStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protocolDelegateHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDataStreamTargetControlProtocol sendTargetControlWhoAmIWithIdentifier:dataStreamProtocolDelegate:](HMDDataStreamTargetControlProtocol, "sendTargetControlWhoAmIWithIdentifier:dataStreamProtocolDelegate:", v3, v12);

  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Data Stream not running; dropping target-control whoami message",
        (uint8_t *)&v14,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4
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
  -[HMDDataStreamController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HMDDataStreamController_openStreamSocketWithApplicationProtocol_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_processPendingSocketRequests
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController pendingSocketRequests](self, "pendingSocketRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    -[HMDDataStreamController _getStreamProtocol](self, "_getStreamProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HMDDataStreamController pendingSocketRequests](self, "pendingSocketRequests", 0);
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
          objc_msgSend(v11, "applicationProtocolName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "completion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamController _createStreamSocketWithStreamProtocol:applicationProtocolName:completion:](self, "_createStreamSocketWithStreamProtocol:applicationProtocolName:completion:", v5, v12, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[HMDDataStreamController pendingSocketRequests](self, "pendingSocketRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

  }
}

- (void)_failPendingSocketRequestsWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDDataStreamController pendingSocketRequests](self, "pendingSocketRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "completion");
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[HMDDataStreamController pendingSocketRequests](self, "pendingSocketRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (id)_getStreamProtocol
{
  void *v3;
  void *v4;
  HMDDataStreamStreamProtocol *v5;
  HMDDataStreamStreamProtocol *v6;
  HMDDataStreamStreamProtocol *v7;
  HMDDataStreamStreamProtocol *v8;
  HMDDataStreamStreamProtocol *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  +[HMDDataStreamStreamProtocol protocolName](HMDDataStreamStreamProtocol, "protocolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = v5;
  if (!v7)
  {
    v9 = [HMDDataStreamStreamProtocol alloc];
    -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "protocolDelegateHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDDataStreamStreamProtocol initWithDataStream:](v9, "initWithDataStream:", v11);

    -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDataStreamStreamProtocol protocolName](HMDDataStreamStreamProtocol, "protocolName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addProtocol:name:", v8, v13);

  }
  return v8;
}

- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  HMDDataStreamController *v12;
  NSObject *v13;
  void *v14;
  HMDDataStreamSocket *v15;
  void *v16;
  HMDDataStreamSocket *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v14;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating stream socket for application protocol %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = [HMDDataStreamSocket alloc];
  -[HMDDataStreamController workQueue](v12, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDDataStreamSocket initWithStreamProtocol:applicationProtocolName:workQueue:](v15, "initWithStreamProtocol:applicationProtocolName:workQueue:", v8, v9, v16);

  objc_msgSend(v8, "registerSocket:", v17);
  v10[2](v10, v17, 0);

}

- (BOOL)_isDataStreamCapable
{
  return -[HMDDataStreamController supportsDataStreamOverTCP](self, "supportsDataStreamOverTCP")
      || -[HMDDataStreamController supportsDataStreamOverHAP](self, "supportsDataStreamOverHAP");
}

- (BOOL)setupRequiresCharacteristicReads
{
  void *v3;
  HMDDataStreamController *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[HMDDataStreamController _isDataStreamCapable](self, "_isDataStreamCapable"))
    return 0;
  if (!-[HMDDataStreamController _isDataStreamConfigurationValid](self, "_isDataStreamConfigurationValid"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current data stream configuration is not valid", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  return !-[HMDDataStreamController _isDataStreamCapable](self, "_isDataStreamCapable");
}

- (void)_initiateStreamSetup
{
  void *v3;
  void *v4;
  HMDDataStreamController *v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDDataStreamController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v8 = -[HMDDataStreamController setupRequiresCharacteristicReads](self, "setupRequiresCharacteristicReads");
    -[HMDDataStreamController accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController transferManagementService](self, "transferManagementService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDDataStreamController supportsDataStreamOverTCP](self, "supportsDataStreamOverTCP"))
    {
      -[HMDDataStreamController workQueue](self, "workQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamController logIdentifier](self, "logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDataStreamSetupOperation tcpSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:](HMDDataStreamSetupOperation, "tcpSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:", v9, v11, v12, v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[HMDDataStreamController supportsDataStreamOverHAP](self, "supportsDataStreamOverHAP") && !v8)
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v20;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; not supported",
            (uint8_t *)&v22,
            0xCu);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamController _cancelStreamTransportWithError:](v18, "_cancelStreamTransportWithError:", v21);

        goto LABEL_14;
      }
      -[HMDDataStreamController workQueue](self, "workQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamController logIdentifier](self, "logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDataStreamSetupOperation hapSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:](HMDDataStreamSetupOperation, "hapSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:", v9, v11, v12, v10, -[HMDDataStreamController maxControllerTransportMTU](self, "maxControllerTransportMTU"), v8);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    -[HMDDataStreamController setSetupInProgress:](self, "setSetupInProgress:", v13);

    -[HMDDataStreamController setupInProgress](self, "setupInProgress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    if (!v8)
    {
      -[HMDDataStreamController setupInProgress](self, "setupInProgress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startSetup");

    }
LABEL_14:

    return;
  }
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Initiating stream setup while already in progress; ignoring this extra call.",
      (uint8_t *)&v22,
      0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  HMDDataStreamController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDDataStreamController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (v4)
      -[HMDDataStreamController _handleAccessoryConnected](self, "_handleAccessoryConnected");
    if (-[HMDDataStreamController _isDataStreamCapable](self, "_isDataStreamCapable")
      && !-[HMDDataStreamController supportsDataStreamOverTCP](self, "supportsDataStreamOverTCP"))
    {
      objc_msgSend(v6, "setMaxControllerTransportMTU:", self->_maxControllerTransportMTU);
      -[HMDDataStreamController setupInProgress](self, "setupInProgress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startSetup");

    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream initialization setup (which is in progress)", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDDataStreamController setSetupInProgress:](v13, "setSetupInProgress:", 0);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamController _failPendingSocketRequestsWithError:](v13, "_failPendingSocketRequestsWithError:", v16);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Setup init operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v18,
        0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDDataStreamController *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
  {
    -[HMDDataStreamController dataStreamFactory](self, "dataStreamFactory");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController workQueue](self, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamController logIdentifier](self, "logIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *, void *))v16)[2](v16, v9, v10, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDataStreamController setDefaultDataStream:](self, "setDefaultDataStream:", v19);
    -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    objc_msgSend(v9, "setDelegate:", v19);
    -[HMDDataStreamController _createBulkStreamProtocol](self, "_createBulkStreamProtocol");
    objc_msgSend(v19, "connect");
    -[HMDDataStreamController setSetupInProgress:](self, "setSetupInProgress:", 0);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Setup operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v21,
        0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDDataStreamController *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup (which is in progress)", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDDataStreamController setSetupInProgress:](v10, "setSetupInProgress:", 0);
    -[HMDDataStreamController _failPendingSocketRequestsWithError:](v10, "_failPendingSocketRequestsWithError:", v7);
  }

}

- (void)_cancelStreamTransportWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDDataStreamController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDataStreamController *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDataStreamController setupInProgress](v7, "setupInProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelSetup");

    -[HMDDataStreamController _failPendingSocketRequestsWithError:](v7, "_failPendingSocketRequestsWithError:", v4);
    -[HMDDataStreamController setSetupInProgress:](v7, "setSetupInProgress:", 0);
  }
  else
  {
    -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Canceling active DataStream", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDDataStreamController defaultDataStream](v13, "defaultDataStream");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "close");

    }
    else
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Dropping cancel-stream; appears to already be canceled",
          (uint8_t *)&v19,
          0xCu);

      }
      objc_autoreleasePoolPop(v12);
    }
  }

}

- (void)_createBulkStreamProtocol
{
  HMDDataStreamBulkSendProtocol *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDataStreamBulkSendProtocol *v12;

  v3 = [HMDDataStreamBulkSendProtocol alloc];
  -[HMDDataStreamController workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController logIdentifier](self, "logIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDDataStreamBulkSendProtocol initWithQueue:accessory:logIdentifier:](v3, "initWithQueue:accessory:logIdentifier:", v4, v5, v6);

  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDataStreamBulkSendProtocol protocolName](HMDDataStreamBulkSendProtocol, "protocolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addProtocol:name:", v12, v8);

  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protocolDelegateHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamBulkSendProtocol setDataStream:](v12, "setDataStream:", v10);

  -[HMDDataStreamController setupInProgress](self, "setupInProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "movePendingBulkSendListenersToBulkSendProtocol:", v12);

}

- (void)_resetDefaultDataStream
{
  id v3;

  -[HMDDataStreamController setDefaultDataStream:](self, "setDefaultDataStream:", 0);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController _failPendingSocketRequestsWithError:](self, "_failPendingSocketRequestsWithError:", v3);

}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDataStreamController *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@DataStream failed with error (%@)!", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDDataStreamController _resetDefaultDataStream](v9, "_resetDefaultDataStream");

}

- (void)dataStreamDidClose:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream closed", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamController _resetDefaultDataStream](v6, "_resetDefaultDataStream");

}

- (void)dataStreamDidOpen:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream opened", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamController _processPendingSocketRequests](v6, "_processPendingSocketRequests");

}

- (void)dataStreamDidReceiveRawFrame:(id)a3
{
  void *v3;
  id v4;

  -[HMDDataStreamController accessory](self, "accessory", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryIPServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_indicateSessionActivityWithReason:", CFSTR("DataStream"));

}

- (void)dataStreamDidUpdateActiveStatus:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;

  -[HMDDataStreamController workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDDataStreamController defaultDataStream](self, "defaultDataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
    -[HMDDataStreamController _stopIdleTimer](self, "_stopIdleTimer");
  else
    -[HMDDataStreamController _startIdleTimer](self, "_startIdleTimer");
}

- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  HMDDataStreamController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  +[HMDDataStreamBulkSendProtocol protocolName](HMDDataStreamBulkSendProtocol, "protocolName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v21)
  {
    objc_msgSend(v21, "openSessionForFileType:reason:metadata:queue:callback:", v12, v13, v14, v15, v16);
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDDataStreamBulkSendProtocol not registered; cannot start bulk send session",
        buf,
        0xCu);

      v22 = v27;
    }

    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v26);

  }
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDDataStreamController_invalidate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startIdleTimer
{
  NSObject *v3;
  void *v4;
  HMDDataStreamController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638](-[HMDDataStreamController _stopIdleTimer](self, "_stopIdleTimer"));
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting idle timer", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceForKey:", CFSTR("hdsIdleTimeout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "numberValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    v13 = 5.0;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, v13);
  -[HMDDataStreamController setIdleTimer:](v5, "setIdleTimer:", v14);

  -[HMDDataStreamController idleTimer](v5, "idleTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v5);

  -[HMDDataStreamController workQueue](v5, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamController idleTimer](v5, "idleTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegateQueue:", v16);

  -[HMDDataStreamController idleTimer](v5, "idleTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

}

- (void)_stopIdleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDDataStreamController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDataStreamController idleTimer](self, "idleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping idle timer", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDDataStreamController idleTimer](v6, "idleTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    -[HMDDataStreamController setIdleTimer:](v6, "setIdleTimer:", 0);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDDataStreamController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDataStreamController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDataStreamController idleTimer](self, "idleTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamController defaultDataStream](v8, "defaultDataStream");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isActive");
      v13 = CFSTR("inactive");
      if (v12)
        v13 = CFSTR("active");
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Idle timer fired and data stream is %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDDataStreamController defaultDataStream](v8, "defaultDataStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isActive");

    if ((v15 & 1) == 0)
    {
      -[HMDDataStreamController defaultDataStream](v8, "defaultDataStream");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "close");

    }
    -[HMDDataStreamController _stopIdleTimer](v8, "_stopIdleTimer");
  }

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (HMDService)transferManagementService
{
  return (HMDService *)objc_loadWeakRetained((id *)&self->_transferManagementService);
}

- (void)setTransferManagementService:(id)a3
{
  objc_storeWeak((id *)&self->_transferManagementService, a3);
}

- (HMDDataStream)defaultDataStream
{
  return self->_defaultDataStream;
}

- (void)setDefaultDataStream:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDataStream, a3);
}

- (NSMutableArray)pendingSocketRequests
{
  return self->_pendingSocketRequests;
}

- (void)setPendingSocketRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSocketRequests, a3);
}

- (HMDDataStreamSetupOperation)setupInProgress
{
  return self->_setupInProgress;
}

- (void)setSetupInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_setupInProgress, a3);
}

- (id)dataStreamFactory
{
  return self->_dataStreamFactory;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (BOOL)supportsDataStreamOverTCP
{
  return self->_supportsDataStreamOverTCP;
}

- (void)setSupportsDataStreamOverTCP:(BOOL)a3
{
  self->_supportsDataStreamOverTCP = a3;
}

- (BOOL)supportsDataStreamOverHAP
{
  return self->_supportsDataStreamOverHAP;
}

- (void)setSupportsDataStreamOverHAP:(BOOL)a3
{
  self->_supportsDataStreamOverHAP = a3;
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  self->_maxControllerTransportMTU = a3;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong(&self->_dataStreamFactory, 0);
  objc_storeStrong((id *)&self->_setupInProgress, 0);
  objc_storeStrong((id *)&self->_pendingSocketRequests, 0);
  objc_storeStrong((id *)&self->_defaultDataStream, 0);
  objc_destroyWeak((id *)&self->_transferManagementService);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __37__HMDDataStreamController_invalidate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 2, &unk_24E971A00);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cancelStreamTransportWithError:", v2);

}

void __78__HMDDataStreamController_openStreamSocketWithApplicationProtocol_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  HMDPendingSocketRequest *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "defaultDataStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    || (objc_msgSend(*(id *)(a1 + 32), "_initiateStreamSetup"),
        objc_msgSend(*(id *)(a1 + 32), "setupInProgress"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingSocketRequests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HMDPendingSocketRequest initWithApplicationProtocolName:completion:]([HMDPendingSocketRequest alloc], "initWithApplicationProtocolName:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setupInProgress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Waiting for DataStream setup before processing stream socket request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processPendingSocketRequests");
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

  }
}

void __55__HMDDataStreamController_handleAccessoryDisconnected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleAccessoryDisconnected");
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured accessory: %@ did not match self.accessory :%@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __87__HMDDataStreamController__readRequiredTransportCharacteristicsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "error", (_QWORD)v16);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

uint64_t __51__HMDDataStreamController_handleAccessoryConnected__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__HMDDataStreamController_handleAccessoryConnected__block_invoke_2;
  v3[3] = &unk_24E79BD80;
  v3[4] = v1;
  return objc_msgSend(v1, "_readRequiredTransportCharacteristicsIfNeededWithCompletion:", v3);
}

void __51__HMDDataStreamController_handleAccessoryConnected__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required transport characteristics for: %@ with error: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryConnected");
  }

}

HMDDataStream *__63__HMDDataStreamController_initWithAccessory_service_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  HMDDataStream *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = -[HMDDataStream initWithTransport:sessionEncryption:workQueue:logIdentifier:]([HMDDataStream alloc], "initWithTransport:sessionEncryption:workQueue:logIdentifier:", v11, v10, v9, v8);

  return v12;
}

@end
