@implementation HMDAccessoryServerBrowserDemo

- (int64_t)linkType
{
  return 1;
}

- (void)setDelegate:(id)a3 queue:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryServerBrowserDemo_setDelegate_queue___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)startDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDAccessoryServerBrowserDemo_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)discoverServer
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke;
  v4[3] = &unk_24E797318;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)loadDemoData:(id)a3 finalized:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__HMDAccessoryServerBrowserDemo_loadDemoData_finalized___block_invoke;
  v9[3] = &unk_24E790A98;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)appendDemoData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke;
  block[3] = &unk_24E7972B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)resetDemoAccessory:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = -[HMDAccessoryServerBrowserDemo _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didRemoveAccessoryServer_error_);
    v6 = MEMORY[0x24BDAC760];
    if (v5)
    {
      -[HMDAccessoryServerBrowserDemo delegateQueue](self, "delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke;
      block[3] = &unk_24E79C268;
      block[4] = self;
      v12 = v4;
      dispatch_async(v7, block);

    }
    -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_2;
    v9[3] = &unk_24E79C268;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

- (void)resetDemoAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HMDAccessoryServerBrowserDemo delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDAccessoryServerBrowserDemo delegateQueue](self, "delegateQueue");
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

- (id)_handleTestAccessorySetValue:(id)a3 response:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v96;
  void *v97;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id obj;
  id v104;
  int v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  const __CFString *v136;
  void *v137;
  void *v138;
  uint8_t buf[4];
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  void *v152;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v4;
  v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v157, 16);
  v5 = 0;
  if (v108)
  {
    v107 = *(_QWORD *)v133;
    do
    {
      v6 = 0;
      do
      {
        v112 = v5;
        if (*(_QWORD *)v133 != v107)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v6);
        v111 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kAccessoryName"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kAccessoryInstanceIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("kCharacteristicValue"));
        v110 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kConfigTestingResponseDelayKey"));
        v113 = objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("kCharacteristicEnableNotificationRequestKey"));
        v128 = 0u;
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        -[HMDAccessoryServerBrowserDemo servers](self, "servers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v128, v156, 16);
        if (!v11)
          goto LABEL_14;
        v12 = v11;
        v13 = *(_QWORD *)v129;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v129 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqual:", v8);

            if ((v17 & 1) != 0)
            {
              v18 = v15;

              if (!v18)
                goto LABEL_26;
              v104 = v18;
              if (v9)
              {
                v126 = 0u;
                v127 = 0u;
                v124 = 0u;
                v125 = 0u;
                objc_msgSend(v18, "accessories");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v124, v155, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v125;
                  while (2)
                  {
                    for (j = 0; j != v21; ++j)
                    {
                      if (*(_QWORD *)v125 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
                      objc_msgSend(v24, "instanceID");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v9, "isEqual:", v25);

                      if (v26)
                      {
                        v35 = v24;
                        goto LABEL_31;
                      }
                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v124, v155, 16);
                    if (v21)
                      continue;
                    break;
                  }
                }

LABEL_41:
                v45 = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v140 = v47;
                  v141 = 2112;
                  v142 = v8;
                  v143 = 2112;
                  v144 = v9;
                  _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v45);
                v30 = 2;
                objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = 0;
LABEL_57:
                v31 = v111;
                v61 = v112;
                v33 = (void *)v110;
                v34 = (void *)v113;
                v32 = v104;
              }
              else
              {
                objc_msgSend(v18, "accessories");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "firstObject");
                v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
                v36 = v35;

                if (!v36)
                  goto LABEL_41;
                v122 = 0u;
                v123 = 0u;
                v120 = 0u;
                v121 = 0u;
                v102 = v36;
                objc_msgSend(v36, "services");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v120, v154, 16);
                if (!v38)
                {
LABEL_40:

LABEL_54:
                  v58 = (void *)MEMORY[0x227676638]();
                  HMFGetOSLogHandle();
                  v59 = objc_claimAutoreleasedReturnValue();
                  v48 = v102;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v140 = v60;
                    v141 = 2112;
                    v142 = v8;
                    v143 = 2112;
                    v144 = v9;
                    v145 = 2112;
                    v146 = v115;
                    _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@, serviceInstanceID %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v58);
                  v30 = 2;
                  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_57;
                }
                v39 = v38;
                v40 = *(_QWORD *)v121;
LABEL_34:
                v41 = 0;
                while (1)
                {
                  if (*(_QWORD *)v121 != v40)
                    objc_enumerationMutation(v37);
                  v42 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v41);
                  objc_msgSend(v42, "instanceID");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v115, "isEqual:", v43);

                  if ((v44 & 1) != 0)
                    break;
                  if (v39 == ++v41)
                  {
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v120, v154, 16);
                    if (v39)
                      goto LABEL_34;
                    goto LABEL_40;
                  }
                }
                v49 = v42;

                if (!v49)
                  goto LABEL_54;
                v118 = 0u;
                v119 = 0u;
                v116 = 0u;
                v117 = 0u;
                v101 = v49;
                objc_msgSend(v49, "characteristics");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v153, 16);
                if (v51)
                {
                  v52 = v51;
                  v53 = *(_QWORD *)v117;
LABEL_47:
                  v54 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v117 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v54);
                    objc_msgSend(v55, "instanceID");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = objc_msgSend(v114, "isEqual:", v56);

                    if ((v57 & 1) != 0)
                      break;
                    if (v52 == ++v54)
                    {
                      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v153, 16);
                      if (v52)
                        goto LABEL_47;
                      goto LABEL_53;
                    }
                  }
                  v62 = v55;

                  if (!v62)
                    goto LABEL_67;
                  v31 = v111;
                  v34 = (void *)v113;
                  if (v113)
                  {
                    v63 = (void *)MEMORY[0x227676638]();
                    HMFGetOSLogHandle();
                    v64 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544642;
                      v140 = v65;
                      v141 = 2112;
                      v142 = v8;
                      v143 = 2112;
                      v144 = v9;
                      v145 = 2112;
                      v146 = v115;
                      v147 = 2112;
                      v148 = v114;
                      v149 = 2112;
                      v150 = v113;
                      _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@Setting the responseDelay for characteristic (%@+%@/%@/%@) to %@", buf, 0x3Eu);

                    }
                    objc_autoreleasePoolPop(v63);
                    v66 = objc_msgSend(v62, "setResponseDelay:", v113);
                  }
                  else
                  {
                    objc_msgSend(v62, "responseDelay");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v73)
                    {
                      objc_msgSend(v62, "responseDelay");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "setObject:forKey:", v74, CFSTR("kConfigTestingResponseDelayKey"));

                      v75 = (void *)MEMORY[0x227676638]();
                      HMFGetOSLogHandle();
                      v76 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v62, "responseDelay");
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544642;
                        v140 = v77;
                        v141 = 2112;
                        v142 = v8;
                        v143 = 2112;
                        v144 = v9;
                        v145 = 2112;
                        v146 = v115;
                        v147 = 2112;
                        v148 = v114;
                        v149 = 2112;
                        v150 = (uint64_t)v78;
                        _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_INFO, "%{public}@Getting the value for characteristic responseDelay (%@+%@/%@/%@): %@ ", buf, 0x3Eu);

                        v34 = 0;
                      }

                      objc_autoreleasePoolPop(v75);
                    }
                  }
                  v99 = v62;
                  v79 = (void *)MEMORY[0x227676638](v66);
                  HMFGetOSLogHandle();
                  v80 = objc_claimAutoreleasedReturnValue();
                  v81 = os_log_type_enabled(v80, OS_LOG_TYPE_INFO);
                  v33 = (void *)v110;
                  if (v110)
                  {
                    v72 = v112;
                    v32 = v104;
                    if (v81)
                    {
                      HMFGetLogIdentifier();
                      v96 = v79;
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v99, "responseDelay");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544898;
                      v140 = v82;
                      v141 = 2112;
                      v142 = v8;
                      v143 = 2112;
                      v144 = v9;
                      v145 = 2112;
                      v146 = v115;
                      v147 = 2112;
                      v148 = v114;
                      v149 = 2112;
                      v150 = v110;
                      v151 = 2112;
                      v152 = v83;
                      _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_INFO, "%{public}@Setting the value for characteristic (%@+%@/%@/%@) to %@ with responseDelay %@ milliseconds", buf, 0x48u);

                      v34 = (void *)v113;
                      v79 = v96;
                    }

                    objc_autoreleasePoolPop(v79);
                    v84 = objc_msgSend(v99, "setValue:", v110);
                  }
                  else
                  {
                    v72 = v112;
                    v32 = v104;
                    if (v81)
                    {
                      HMFGetLogIdentifier();
                      v97 = v79;
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544642;
                      v140 = v85;
                      v141 = 2112;
                      v142 = v8;
                      v143 = 2112;
                      v144 = v9;
                      v145 = 2112;
                      v146 = v115;
                      v147 = 2112;
                      v148 = v114;
                      v149 = 2112;
                      v150 = 0;
                      _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_INFO, "%{public}@Getting the value for characteristic (%@+%@/%@/%@): %@ ", buf, 0x3Eu);

                      v79 = v97;
                    }

                    objc_autoreleasePoolPop(v79);
                    objc_msgSend(v99, "value");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v86)
                    {
                      objc_msgSend(v111, "setObject:forKey:", v86, CFSTR("kCharacteristicValue"));
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "setObject:forKey:", v87, CFSTR("kCharacteristicValue"));

                    }
                  }
                  if (v105)
                  {
                    v88 = (void *)MEMORY[0x227676638](v84);
                    HMFGetOSLogHandle();
                    v89 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v106 = v88;
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v99, "responseDelay");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544898;
                      v140 = v90;
                      v141 = 2112;
                      v142 = v8;
                      v143 = 2112;
                      v144 = v9;
                      v145 = 2112;
                      v146 = v115;
                      v147 = 2112;
                      v148 = v114;
                      v149 = 2112;
                      v150 = v110;
                      v151 = 2112;
                      v152 = v91;
                      _os_log_impl(&dword_2218F0000, v89, OS_LOG_TYPE_INFO, "%{public}@Triggering update notification for characteristic (%@+%@/%@/%@) with value %@, responseDelay %@ milliseconds", buf, 0x48u);

                      v34 = (void *)v113;
                      v88 = v106;
                    }

                    objc_autoreleasePoolPop(v88);
                    v138 = v99;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v138, 1);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "handleUpdatesForCharacteristics:stateNumber:", v92, 0);

                  }
                  objc_msgSend(v100, "addObject:", v111);
                  v30 = 0;
                  v71 = v99;
                }
                else
                {
LABEL_53:

LABEL_67:
                  v67 = (void *)MEMORY[0x227676638]();
                  HMFGetOSLogHandle();
                  v68 = objc_claimAutoreleasedReturnValue();
                  v31 = v111;
                  v34 = (void *)v113;
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v140 = v69;
                    v141 = 2112;
                    v142 = v8;
                    v143 = 2112;
                    v144 = v9;
                    v145 = 2112;
                    v146 = v115;
                    v147 = 2112;
                    v148 = v114;
                    _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@, serviceInstanceID %@, characteristicInstanceID %@", buf, 0x34u);

                  }
                  objc_autoreleasePoolPop(v67);
                  v30 = 2;
                  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
                  v70 = objc_claimAutoreleasedReturnValue();
                  v71 = v112;
                  v72 = (void *)v70;
                  v33 = (void *)v110;
                  v32 = v104;
                }
                v5 = v72;

                v61 = v101;
                v48 = v102;
              }

              goto LABEL_59;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v128, v156, 16);
          if (v12)
            continue;
          break;
        }
LABEL_14:

LABEL_26:
        v27 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v140 = v29;
          v141 = 2112;
          v142 = v8;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessoryServer with deviceIdentifier %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v30 = 2;
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v111;
        v32 = v112;
        v33 = (void *)v110;
        v34 = (void *)v113;
LABEL_59:

        if (v30)
          goto LABEL_91;
        ++v6;
      }
      while (v6 != v108);
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v157, 16);
      v108 = v93;
    }
    while (v93);
  }
LABEL_91:

  v136 = CFSTR("CharacteristicConfiguration");
  v94 = (void *)objc_msgSend(v100, "copy");
  v137 = v94;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_handleTestAccessorySetReachability:(id)a3
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  __int128 v44;
  id obj;
  id v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = a3;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  v4 = 0;
  if (v48)
  {
    v47 = *(_QWORD *)v62;
    *(_QWORD *)&v3 = 138543874;
    v44 = v3;
    while (2)
    {
      v5 = 0;
      v6 = v4;
      do
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v5);
        objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kAccessoryName"), v44);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kAccessoryInstanceIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v10 = objc_msgSend(v7, "hmf_BOOLForKey:isPresent:", CFSTR("kAccessoryIsReachableKey"), &v60);
        if (!v60)
        {
          v40 = (void *)MEMORY[0x227676638](v10);
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = v42;
            v67 = 2112;
            v68 = v7;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@No reachability setting for the setReachability request: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_48;
        }
        v50 = v10;
        v51 = v6;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        -[HMDAccessoryServerBrowserDemo servers](self, "servers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v57;
LABEL_9:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v57 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v8);

            if ((v18 & 1) != 0)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
              if (v13)
                goto LABEL_9;
              goto LABEL_15;
            }
          }
          v19 = v16;

          if (!v19)
            goto LABEL_27;
          v46 = v19;
          if (v9)
          {
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            objc_msgSend(v19, "accessories");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v53;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v53 != v22)
                    objc_enumerationMutation(v20);
                  v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v24, "instanceID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v9, "isEqual:", v25);

                  if (v26)
                  {
                    v32 = v24;
                    goto LABEL_32;
                  }
                }
                v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
                if (v21)
                  continue;
                break;
              }
            }
          }
          else
          {
            objc_msgSend(v19, "accessories");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
            v21 = v32;
          }

          v33 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v35)
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v66 = v36;
              v67 = 2112;
              v68 = v8;
              v69 = 2112;
              v70 = v9;
              v71 = 2112;
              v72 = v37;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting the reachability of accessory %@+%@ to %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v33);
            objc_msgSend(v21, "setReachable:", v50);
            v38 = 0;
            v4 = v51;
          }
          else
          {
            if (v35)
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v44;
              v66 = v39;
              v67 = 2112;
              v68 = v8;
              v69 = 2112;
              v70 = v9;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v33);
            v38 = 2;
            objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v29 = v46;
          v31 = v38;
        }
        else
        {
LABEL_15:

LABEL_27:
          v27 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v51;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = v30;
            v67 = 2112;
            v68 = v8;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessoryServer with deviceIdentifier %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          v31 = 2;
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v31)
          goto LABEL_48;
        ++v5;
        v6 = v4;
      }
      while (v5 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      if (v48)
        continue;
      break;
    }
  }
LABEL_48:

  return v4;
}

- (id)_handleTestAccessoryGenerateNotification:(id)a3
{
  return 0;
}

- (id)_handleTestAccessoryReadValue:(id)a3
{
  return 0;
}

- (id)_handleTestModeConfigRequest:(id)a3 response:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kConfigTestingSetReturnValueKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDAccessoryServerBrowserDemo _handleTestAccessorySetValue:response:](self, "_handleTestAccessorySetValue:response:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kConfigTestingSetReachabilityKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDAccessoryServerBrowserDemo _handleTestAccessorySetReachability:](self, "_handleTestAccessorySetReachability:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kConfigTestingGenerateNotificationKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[HMDAccessoryServerBrowserDemo _handleTestAccessoryGenerateNotification:](self, "_handleTestAccessoryGenerateNotification:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kConfigTestingReadValueKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[HMDAccessoryServerBrowserDemo _handleTestAccessoryReadValue:](self, "_handleTestAccessoryReadValue:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

      }
    }

  }
  return v8;
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  return (HAPAccessoryServerBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSMutableArray)servers
{
  return self->_servers;
}

- (void)setServers:(id)a3
{
  objc_storeStrong((id *)&self->_servers, a3);
}

- (NSDictionary)demoData
{
  return self->_demoData;
}

- (void)setDemoData:(id)a3
{
  objc_storeStrong((id *)&self->_demoData, a3);
}

- (BOOL)accessoryPaired
{
  return *(&self->_browsing + 3);
}

- (void)setAccessoryPaired:(BOOL)a3
{
  *(&self->_browsing + 3) = a3;
}

- (BOOL)browsing
{
  return *(&self->_browsing + 4);
}

- (void)setBrowsing:(BOOL)a3
{
  *(&self->_browsing + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoData, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "servers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_firstObjectWithValue:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_msgSend(v4, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_2;
      v11[3] = &unk_24E79C268;
      v11[4] = *(_QWORD *)(a1 + 32);
      v6 = &v12;
      v12 = v3;
      v7 = v11;
LABEL_6:
      dispatch_async(v5, v7);

    }
  }
  else if (objc_msgSend(v4, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_3;
    v9[3] = &unk_24E79C268;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v6 = &v10;
    v10 = v8;
    v7 = v9;
    goto LABEL_6;
  }

}

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "servers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "servers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didRemoveAccessoryServer_error_))
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke_2;
          v12[3] = &unk_24E79C268;
          v12[4] = *(_QWORD *)(a1 + 32);
          v12[5] = v10;
          dispatch_async(v11, v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didRemoveAccessoryServer:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didRemoveAccessoryServer:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  HMDAccessoryServerDemo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessoryServerDemo *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  HMDAccessoryServerDemo *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "servers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  v3 = [HMDAccessoryServerDemo alloc];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessoryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDAccessoryServerDemo initWithName:identifier:deviceInfo:paired:keyStore:testMode:browser:](v3, "initWithName:identifier:deviceInfo:paired:keyStore:testMode:browser:", v4, v5, v6, 0, v7, 0, *(_QWORD *)(a1 + 32));

  v9 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[CoreHAP] Discovered new accessory server %@ with Demo info", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*(id *)(a1 + 32), "servers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v8);

  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_23;
    block[3] = &unk_24E79C268;
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v8;
    dispatch_async(v14, block);

  }
}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_23(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  id *WeakRetained;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[11], "hmf_arrayForKey:", CFSTR("accessories"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "hmf_arrayForKey:", CFSTR("accessories"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v9;
        v25[1] = 3221225472;
        v25[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_2;
        v25[3] = &unk_24E79B878;
        v26 = v4;
        v27 = v5;
        objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v12 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "addObjectsFromArray:", v5));
    v13 = WeakRetained;
    v14 = WeakRetained;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v16;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updated demo accessory list: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v32 = CFSTR("accessories");
    v33 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = WeakRetained[11];
    WeakRetained[11] = (id)v17;

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v13 = WeakRetained;
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@No new accessories (but kicking re-discovery anyway).", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }
  if (*((_BYTE *)v13 + 61))
    objc_msgSend(v13, "discoverServer");

}

void __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_3;
  v7[3] = &unk_24E797380;
  v6 = v3;
  v8 = v6;
  if ((objc_msgSend(v4, "na_any:", v7) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("testMode"));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

uint64_t __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __56__HMDAccessoryServerBrowserDemo_loadDemoData_finalized___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 11, *(id *)(a1 + 32));
  *((_BYTE *)WeakRetained + 60) = *(_BYTE *)(a1 + 48);

}

void __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  HMDAccessoryServerDemo *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *context;
  HMDAccessoryServerDemo *contexta;
  id *v36;
  id obj;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD block[5];
  HMDAccessoryServerDemo *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*((_QWORD *)WeakRetained + 10))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)*((_QWORD *)WeakRetained + 10);
    *((_QWORD *)WeakRetained + 10) = v2;

  }
  v4 = *((id *)WeakRetained + 11);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("accessories"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v31 = v6;
      v32 = v5;
      v49 = 0u;
      v47 = 0u;
      v48 = 0u;
      v46 = 0u;
      obj = v6;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v41)
      {
        v7 = CFSTR("name");
        v40 = *(_QWORD *)v47;
        v36 = (id *)WeakRetained;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v47 != v40)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v9, "objectForKeyedSubscript:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attrDB"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testMode"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x227676638]();
            v15 = WeakRetained;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v38 = v12;
              v17 = v7;
              v18 = WeakRetained;
              v19 = v13;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v51 = v20;
              v52 = 2112;
              v53 = v10;
              v54 = 2112;
              v55 = v11;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Processing Demo Accessory information: %@ / %@", buf, 0x20u);

              v13 = v19;
              WeakRetained = v18;
              v7 = v17;
              v12 = v38;
            }

            objc_autoreleasePoolPop(v14);
            if (v10 && v11 && v12)
            {
              objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 0, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v39 = v13;
                v22 = (void *)*((_QWORD *)WeakRetained + 10);
                v44[0] = MEMORY[0x24BDAC760];
                v44[1] = 3221225472;
                v44[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_12;
                v44[3] = &unk_24E778070;
                v23 = v11;
                v45 = v23;
                objc_msgSend(v22, "na_firstObjectPassingTest:", v44);
                v24 = objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  v25 = (HMDAccessoryServerDemo *)v24;
                  context = (void *)MEMORY[0x227676638]();
                  v26 = v15;
                  HMFGetOSLogHandle();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v51 = v33;
                    v52 = 2112;
                    v53 = v10;
                    v54 = 2112;
                    v55 = v23;
                    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Server already exists for Demo Accessory: %@ / %@ - leaving it in place", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(context);
                }
                else
                {
                  contexta = [HMDAccessoryServerDemo alloc];
                  v28 = objc_msgSend(v15, "accessoryPaired");
                  objc_msgSend(v15, "keyStore");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = -[HMDAccessoryServerDemo initWithName:identifier:deviceInfo:paired:keyStore:testMode:browser:](contexta, "initWithName:identifier:deviceInfo:paired:keyStore:testMode:browser:", v10, v23, v21, v28, v29, objc_msgSend(v13, "BOOLValue"), v15);

                  objc_msgSend(v36[10], "addObject:", v25);
                }
                if (objc_msgSend(v15, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
                {
                  objc_msgSend(v15, "delegateQueue");
                  v30 = objc_claimAutoreleasedReturnValue();
                  block[0] = MEMORY[0x24BDAC760];
                  block[1] = 3221225472;
                  block[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_17;
                  block[3] = &unk_24E79C268;
                  block[4] = v15;
                  v43 = v25;
                  dispatch_async(v30, block);

                }
                WeakRetained = v36;
                v13 = v39;
              }

              v7 = CFSTR("name");
            }

          }
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v41);
      }

      v5 = 0;
      v6 = v31;
    }

  }
}

uint64_t __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);

}

void __64__HMDAccessoryServerBrowserDemo_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = 0;
  v1 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_2218F0000, v2, OS_LOG_TYPE_INFO, "%{public}@[Demo Accessory Browser] Stopping browse for Demo accessories", (uint8_t *)&v4, 0xCu);

  }
  objc_autoreleasePoolPop(v1);
}

uint64_t __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@[Demo Accessory Browser] Starting browse for Demo accessories...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke_1;
    block[3] = &unk_24E79C240;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
  return objc_msgSend(*(id *)(a1 + 32), "discoverServer");
}

void __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke_1(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __51__HMDAccessoryServerBrowserDemo_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

@end
