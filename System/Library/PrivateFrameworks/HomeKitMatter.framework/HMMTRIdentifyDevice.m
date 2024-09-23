@implementation HMMTRIdentifyDevice

- (HMMTRIdentifyDevice)initWithDevice:(id)a3 topology:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRIdentifyDevice *v12;
  HMMTRIdentifyDevice *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRIdentifyDevice;
  v12 = -[HMMTRIdentifyDevice init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v13->_topology, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)_identifyClusterPresentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMMTRIdentifyDevice *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMMTRIdentifyDevice *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  HMMTRIdentifyDevice *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v4 = a3;
  v52 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[HMMTRIdentifyDevice topology](self, "topology");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMMTRIdentifyDevice topology](self, "topology");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getClustersInUseAtEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "containsObject:", &unk_250F401A0);
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v15;
      v48 = 1024;
      v49 = v4;
      v50 = 2112;
      v51 = v16;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Identify cluster found at endpoint %u: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v12);
    v6[2](v6, v11, 0);
  }
  else
  {
    -[HMMTRIdentifyDevice device](self, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRIdentifyDevice queue](self, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRIdentifyDevice mtrClusterDescriptorWithDevice:endpoint:queue:](self, "mtrClusterDescriptorWithDevice:endpoint:queue:", v17, v4, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v10, "readAttributeServerListWithParams:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v20, CFSTR("serverList"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v24 = (void *)MEMORY[0x242656984]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v23)
    {
      v40 = v20;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v28;
        v48 = 1024;
        v49 = v4;
        v50 = 2112;
        v51 = v23;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@Found endpoint %u clusters: %@", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v24);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v29 = v23;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v42;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v42 != v32)
              objc_enumerationMutation(v29);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "isEqualToNumber:", &unk_250F401A0))
            {
              v34 = (void *)MEMORY[0x242656984]();
              v35 = v25;
              HMFGetOSLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v47 = v37;
                v48 = 1024;
                v49 = v4;
                _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Found identify cluster at endpoint: %u", buf, 0x12u);

              }
              objc_autoreleasePoolPop(v34);
              v6[2](v6, 1, 0);

              goto LABEL_23;
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v31)
            continue;
          break;
        }
      }

      v6[2](v6, 0, 0);
LABEL_23:
      v20 = v40;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        v48 = 1024;
        v49 = v4;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the server list at endpoint: %u", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v39);

    }
  }

}

- (void)_validIdentifyNodeForParentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void (**v6)(id, BOOL, void *, _QWORD);
  void *v7;
  HMMTRIdentifyDevice *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRIdentifyDevice *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  char v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  char v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v4 = a3;
  v102 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, BOOL, void *, _QWORD))a4;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v10;
    v98 = 1024;
    v99 = v4;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Checking validity of endpoint: %u for identify", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMTRIdentifyDevice topology](v8, "topology");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMMTRIdentifyDevice topology](v8, "topology");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getPartsListAtEndpoint:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x242656984]();
    v16 = v8;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v97 = v18;
      v98 = 1024;
      v99 = v4;
      v100 = 2112;
      v101 = v14;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Parts list of endpoint %u: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v15);
    v6[2](v6, v14 == 0, v14, 0);
    goto LABEL_70;
  }
  -[HMMTRIdentifyDevice device](v8, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRIdentifyDevice queue](v8, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRIdentifyDevice mtrClusterDescriptorWithDevice:endpoint:queue:](v8, "mtrClusterDescriptorWithDevice:endpoint:queue:", v19, v4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  v74 = v21;
  objc_msgSend(v21, "readAttributeDeviceTypeListWithParams:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v6;
  if (v23)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v83 = *MEMORY[0x24BDDB500];
  objc_msgSend(v23, "objectForKeyedSubscript:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  v72 = v23;
  if (objc_msgSend(v27, "isEqual:", *MEMORY[0x24BDDB458]))
  {
    v71 = v24;
    v78 = *MEMORY[0x24BDDB518];
    objc_msgSend(v23, "objectForKeyedSubscript:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v91;
      v85 = *MEMORY[0x24BDDB478];
      v82 = *MEMORY[0x24BDDB4F8];
      v75 = 1;
      v35 = *MEMORY[0x24BDDB470];
      v76 = *(_QWORD *)v91;
      v77 = v31;
      do
      {
        v36 = 0;
        v79 = v33;
        do
        {
          if (*(_QWORD *)v91 != v34)
            objc_enumerationMutation(v31);
          v37 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v36);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v84 = v36;
            objc_msgSend(v37, "objectForKeyedSubscript:", v85);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v39 = v38;
            else
              v39 = 0;
            v40 = v39;

            objc_msgSend(v40, "objectForKeyedSubscript:", v83);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v42 = v41;
            else
              v42 = 0;
            v43 = v42;

            if (objc_msgSend(v43, "isEqual:", v82))
            {
              v81 = v43;
              objc_msgSend(v40, "objectForKeyedSubscript:", v78);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v45 = v44;
              else
                v45 = 0;
              v46 = v45;

              v88 = 0u;
              v89 = 0u;
              v86 = 0u;
              v87 = 0u;
              v47 = v46;
              v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
              if (v48)
              {
                v49 = v48;
                v80 = v40;
                v50 = *(_QWORD *)v87;
                while (2)
                {
                  for (i = 0; i != v49; ++i)
                  {
                    if (*(_QWORD *)v87 != v50)
                      objc_enumerationMutation(v47);
                    v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v52, "objectForKeyedSubscript:", v35);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v54 = v53;
                      else
                        v54 = 0;
                      v55 = v54;

                      if (objc_msgSend(v55, "isEqual:", &unk_250F401B8))
                      {
                        objc_msgSend(v52, "objectForKeyedSubscript:", v85);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        v57 = (objc_opt_isKindOfClass() & 1) != 0 ? v56 : 0;
                        v58 = v57;

                        +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v58, CFSTR("deviceType"));
                        v59 = (void *)objc_claimAutoreleasedReturnValue();

                        v60 = v59;
                        objc_opt_class();
                        v61 = (objc_opt_isKindOfClass() & 1) != 0 ? v60 : 0;
                        v62 = v61;

                        v63 = objc_msgSend(v62, "isEqual:", &unk_250F401D0);
                        if ((v63 & 1) != 0)
                        {

                          v75 = 0;
                          goto LABEL_56;
                        }
                      }

                    }
                  }
                  v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
                  if (v49)
                    continue;
                  break;
                }
LABEL_56:
                v40 = v80;
              }

              v34 = v76;
              v31 = v77;
              v33 = v79;
              v36 = v84;
              v43 = v81;
            }
            else
            {
              v36 = v84;
            }

            v27 = v43;
          }
          ++v36;
        }
        while (v36 != v33);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      }
      while (v33);
    }
    else
    {
      v75 = 1;
    }

    v64 = v75 & 1;
    v65 = v71;
    if (!v71)
      goto LABEL_67;
  }
  else
  {
    v64 = 1;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
      goto LABEL_67;
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v73 + 2))(v73, 0, 0, v65);
LABEL_67:
  v66 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v74, "readAttributePartsListWithParams:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v67, CFSTR("partsList"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = v65;
    v65 = (void *)v69;

  }
  v6 = (void (**)(id, BOOL, void *, _QWORD))v73;
  (*((void (**)(id, uint64_t, void *, void *))v73 + 2))(v73, v64, v68, v65);

  v14 = v74;
LABEL_70:

}

- (void)_issueIdentifyCommand:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  HMMTRIdentifyDevice *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int16 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Issuing identify command at endpoint: %u", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMTRIdentifyDevice device](v8, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRIdentifyDevice queue](v8, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRIdentifyDevice mtrClusterIdentifyWithDevice:endpoint:queue:](v8, "mtrClusterIdentifyWithDevice:endpoint:queue:", v11, v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BDDB760]);
  objc_msgSend(v14, "setIdentifyTime:", &unk_250F401E8);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__HMMTRIdentifyDevice__issueIdentifyCommand_completionHandler___block_invoke;
  v16[3] = &unk_250F23B90;
  v18 = v4;
  v16[4] = v8;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v13, "identifyWithParams:expectedValues:expectedValueInterval:completion:", v14, 0, 0, v16);

}

- (void)_childNodesWithIdentifyForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  dispatch_group_t v7;
  dispatch_group_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  NSObject *v27;
  NSObject *v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  __int16 v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v8 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__9212;
  v35[4] = __Block_byref_object_dispose__9213;
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__9212;
  v33[4] = __Block_byref_object_dispose__9213;
  v34 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke;
  v26[3] = &unk_250F23C58;
  v26[4] = self;
  v32 = v4;
  v9 = v6;
  v29 = v9;
  v10 = v8;
  v27 = v10;
  v30 = v33;
  v11 = v7;
  v28 = v11;
  v31 = v35;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x242656B10](v26);
  -[HMMTRIdentifyDevice topology](self, "topology");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMMTRIdentifyDevice topology](self, "topology");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getPartsListAtEndpoint:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(_DWORD)v4 && !v16)
    {
      -[HMMTRIdentifyDevice topology](self, "topology");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getEndpoints");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v16, 0);
  }
  else
  {
    -[HMMTRIdentifyDevice device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRIdentifyDevice queue](self, "queue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRIdentifyDevice mtrClusterDescriptorWithDevice:endpoint:queue:](self, "mtrClusterDescriptorWithDevice:endpoint:queue:", v18, v4, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v16, "readAttributePartsListWithParams:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v21, CFSTR("partsList"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (v24)
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(_QWORD, id, void *))v12)[2](v12, v24, v25);
    if (!v24)

  }
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

- (void)_processChildNodesForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  __int16 v10;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke;
  v8[3] = &unk_250F23CA8;
  v8[4] = self;
  v9 = v6;
  v10 = v4;
  v7 = v6;
  -[HMMTRIdentifyDevice _childNodesWithIdentifyForEndpoint:completionHandler:](self, "_childNodesWithIdentifyForEndpoint:completionHandler:", v4, v8);

}

- (void)identifyWithEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  HMMTRIdentifyDevice *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __int16 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Request for identify received at endpoint %u", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke;
  v12[3] = &unk_250F23CF8;
  v12[4] = v8;
  v13 = v6;
  v14 = v4;
  v11 = v6;
  -[HMMTRIdentifyDevice _identifyClusterPresentAtEndpoint:completionHandler:](v8, "_identifyClusterPresentAtEndpoint:completionHandler:", v4, v12);

}

- (id)mtrClusterDescriptorWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v7 = (objc_class *)MEMORY[0x24BDDB5D8];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithDevice:endpoint:queue:", v9, v5, v8);

  return v10;
}

- (id)mtrClusterIdentifyWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v7 = (objc_class *)MEMORY[0x24BDDB5F0];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithDevice:endpoint:queue:", v9, v5, v8);

  return v10;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MTRDevice)device
{
  return (MTRDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMMTRDeviceTopology)topology
{
  return (HMMTRDeviceTopology *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    if (a2)
    {
      v7 = *(unsigned __int16 *)(a1 + 48);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_2;
      v16[3] = &unk_250F23F80;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v6, "_issueIdentifyCommand:completionHandler:", v7, v16);

      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "topology");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getBridgeAggregateNodeEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "topology");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && !*(_WORD *)(a1 + 48))
    {

      if (v9)
      {
        v11 = *(void **)(a1 + 32);
        v12 = objc_msgSend(v9, "unsignedIntValue");
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_3;
        v14[3] = &unk_250F23CD0;
        v13 = *(void **)(a1 + 40);
        v14[4] = *(_QWORD *)(a1 + 32);
        v15 = v13;
        objc_msgSend(v11, "_issueIdentifyCommand:completionHandler:", v12, v14);

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_processChildNodesForEndpoint:completionHandler:", *(unsigned __int16 *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_10:

}

uint64_t __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Identify on aggregator failed.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Identify on aggregator successful", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id obj;
  _QWORD block[5];
  id v26;
  _BYTE *v27;
  __int16 v28;
  _QWORD v29[4];
  NSObject *v30;
  _BYTE *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  _BYTE buf[24];
  char v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = v5;
    v23 = v7;
    if (objc_msgSend(v7, "count"))
    {
      v8 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v38 = 0;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v7;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            dispatch_group_enter(v8);
            v13 = *(void **)(a1 + 32);
            LOWORD(v12) = objc_msgSend(v12, "unsignedIntValue");
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_52;
            v29[3] = &unk_250F23E68;
            v31 = buf;
            v30 = v8;
            objc_msgSend(v13, "_issueIdentifyCommand:completionHandler:", (unsigned __int16)v12, v29);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(a1 + 32), "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_2;
      block[3] = &unk_250F23C80;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      v27 = buf;
      block[4] = v15;
      v28 = *(_WORD *)(a1 + 48);
      v26 = v16;
      dispatch_group_notify(v8, v14, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v17 = (void *)MEMORY[0x242656984]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(unsigned __int16 *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v21;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@No endpoints found with identify cluster for parent endpoint: %u", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v17);
      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
      v8 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, NSObject *))(v22 + 16))(v22, v8);
    }

    v6 = 0;
  }

}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_52(uint64_t a1, uint64_t a2)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(unsigned __int16 *)(a1 + 56);
      v9 = 138543618;
      v10 = v5;
      v11 = 1024;
      v12 = v6;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@No successful identify command issued for endpoint: %u", (uint8_t *)&v9, 0x12u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  unsigned __int16 v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  unsigned __int16 v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  id obj;
  _QWORD block[4];
  id v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(unsigned __int16 *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      v80 = v10;
      v81 = 1024;
      v82 = v11;
      v83 = 2112;
      v84 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get parts list for endpoint: %u, error: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v12 = v5;
    v13 = (void *)MEMORY[0x242656984]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(unsigned __int16 *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      v80 = v16;
      v81 = 1024;
      v82 = v17;
      v83 = 2112;
      v84 = v12;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Endpoint %u, child nodes: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v13);
    v49 = v12;
    if (*(_WORD *)(a1 + 80))
    {
      v60 = 0uLL;
      v61 = 0uLL;
      v58 = 0uLL;
      v59 = 0uLL;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v59 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v24 = *(void **)(a1 + 32);
            v25 = objc_msgSend(v23, "unsignedIntValue");
            v54[0] = MEMORY[0x24BDAC760];
            v54[1] = 3221225472;
            v54[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_3;
            v54[3] = &unk_250F23BE0;
            v26 = *(id *)(a1 + 48);
            v27 = *(_QWORD *)(a1 + 72);
            v56 = v23;
            v57 = v27;
            v55 = v26;
            objc_msgSend(v24, "_identifyClusterPresentAtEndpoint:completionHandler:", v25, v54);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
        }
        while (v20);
      }

      v28 = *(NSObject **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v29 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_4;
      block[3] = &unk_250F23C08;
      v30 = *(id *)(a1 + 56);
      v31 = *(_QWORD *)(a1 + 72);
      v52 = v30;
      v53 = v31;
      dispatch_group_notify(v28, v29, block);

      v32 = v52;
    }
    else
    {
      v75 = 0uLL;
      v76 = 0uLL;
      v73 = 0uLL;
      v74 = 0uLL;
      obj = v12;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v74;
        v36 = MEMORY[0x24BDAC760];
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v74 != v35)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
            v39 = *(void **)(a1 + 32);
            v40 = objc_msgSend(v38, "unsignedIntValue");
            v68[0] = v36;
            v68[1] = 3221225472;
            v68[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_45;
            v68[3] = &unk_250F23BB8;
            v41 = *(id *)(a1 + 40);
            v42 = *(_QWORD *)(a1 + 32);
            v69 = v41;
            v70 = v42;
            v43 = *(_QWORD *)(a1 + 64);
            v71 = v38;
            v72 = v43;
            objc_msgSend(v39, "_validIdentifyNodeForParentAtEndpoint:completionHandler:", v40, v68);

          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        }
        while (v34);
      }

      v44 = *(NSObject **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v45 = objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_47;
      v62[3] = &unk_250F23C30;
      v46 = *(_QWORD *)(a1 + 64);
      v62[4] = *(_QWORD *)(a1 + 32);
      v66 = v46;
      v63 = obj;
      v47 = *(id *)(a1 + 48);
      v48 = *(_QWORD *)(a1 + 72);
      v64 = v47;
      v67 = v48;
      v65 = *(id *)(a1 + 56);
      dispatch_group_notify(v44, v45, v62);

      v32 = v63;
    }

  }
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_45(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8 && (a2 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(*(id *)(a1 + 48), "unsignedIntValue");
      *(_DWORD *)buf = 138543874;
      v25 = v12;
      v26 = 1024;
      v27 = v13;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Node %u is not a valid node for identify. Invalidating child nodes: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 48));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_47(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unsigned __int16 v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v34 = v5;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@All invalid endpoints for identify: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "containsObject:", v12) & 1) == 0)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          v13 = *(void **)(a1 + 32);
          v14 = objc_msgSend(v12, "unsignedIntValue");
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_48;
          v24[3] = &unk_250F23BE0;
          v15 = *(id *)(a1 + 48);
          v16 = *(_QWORD *)(a1 + 72);
          v26 = v12;
          v27 = v16;
          v25 = v15;
          objc_msgSend(v13, "_identifyClusterPresentAtEndpoint:completionHandler:", v14, v24);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  v17 = *(NSObject **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_2;
  block[3] = &unk_250F23C08;
  v19 = *(id *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 72);
  v22 = v19;
  v23 = v20;
  dispatch_group_notify(v17, v18, block);

}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!v5 && a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!v5 && a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __63__HMMTRIdentifyDevice__issueIdentifyCommand_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int16 *)(a1 + 48);
    v9 = 138543874;
    v10 = v7;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Identify command status for endpoint: %u, error: %@", (uint8_t *)&v9, 0x1Cu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27 != -1)
    dispatch_once(&logCategory__hmf_once_t27, &__block_literal_global_9252);
  return (id)logCategory__hmf_once_v28;
}

void __34__HMMTRIdentifyDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28;
  logCategory__hmf_once_v28 = v0;

}

@end
