@implementation HMDMRSetEndpointVolumeOperation

- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4 externalObjectInterface:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDMRSetEndpointVolumeOperation *v11;
  void *v12;
  float v13;
  double v14;
  uint64_t v15;
  NSNumber *volume;
  uint64_t v17;
  NSArray *routeIDs;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDMRSetEndpointVolumeOperation;
  v11 = -[HMFOperation initWithTimeout:](&v21, sel_initWithTimeout_, 0.0);
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "floatValue");
    *(float *)&v14 = v13 / 100.0;
    objc_msgSend(v12, "numberWithFloat:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    volume = v11->_volume;
    v11->_volume = (NSNumber *)v15;

    v17 = objc_msgSend(v8, "copy");
    routeIDs = v11->_routeIDs;
    v11->_routeIDs = (NSArray *)v17;

    objc_storeStrong((id *)&v11->_externalObjectInterface, a5);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("HMDMRSetEndpointVolumeOperation"));
    -[HMFOperation setActivity:](v11, "setActivity:", v19);

  }
  return v11;
}

- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4
{
  id v6;
  id v7;
  HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface *v8;
  HMDMRSetEndpointVolumeOperation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface);
  v9 = -[HMDMRSetEndpointVolumeOperation initWithRouteIDs:volume:externalObjectInterface:](self, "initWithRouteIDs:volume:externalObjectInterface:", v7, v6, v8);

  return v9;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[HMFOperation activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markWithReason:", CFSTR("Volume Operation Started"));

  if (-[HMDMRSetEndpointVolumeOperation cancelOnSetup](self, "cancelOnSetup"))
  {
    -[HMFOperation activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markWithReason:", CFSTR("Canceled with error before starting"));

    -[HMFOperation activity](self, "activity");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

  }
  else
  {
    -[HMDMRSetEndpointVolumeOperation externalObjectInterface](self, "externalObjectInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createAssistantDiscovery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMRSetEndpointVolumeOperation setDiscovery:](self, "setDiscovery:", v6);

    -[HMDMRSetEndpointVolumeOperation routeIDs](self, "routeIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMRSetEndpointVolumeOperation discoverRemoteControlEndpointsForUIDs:](self, "discoverRemoteControlEndpointsForUIDs:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke;
    v15[3] = &unk_24E799B48;
    objc_copyWeak(&v16, &location);
    v10 = (id)objc_msgSend(v8, "addFailureBlock:", v15);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2;
    v13[3] = &unk_24E79ADC0;
    objc_copyWeak(&v14, &location);
    v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

- (void)generateOverallResultAndFinishWithDeviceStatuses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMRSetEndpointVolumeOperation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMRSetEndpointVolumeOperation *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDMRSetEndpointVolumeOperation *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  HMDMROutputDeviceStatus *v32;
  void *v33;
  HMDMROutputDeviceStatus *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  HMDMRSetEndpointVolumeOperation *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  HMDMRSetEndpointVolumeOperation *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDMRSetEndpointVolumeOperation *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMFOperation activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markWithReason:", CFSTR("Volume futures completed"));

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v84 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Volume futures completed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = (void *)objc_msgSend(v4, "mutableCopy");
  v11 = v10;
  v12 = v7;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = (void *)MEMORY[0x24BDBCF20];
  -[HMDMRSetEndpointVolumeOperation routeIDs](v7, "routeIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v14, "na_map:", &__block_literal_global_94);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = v17;
  v72 = v14;
  v70 = v20;
  if ((objc_msgSend(v17, "isEqualToSet:", v20) & 1) == 0)
  {
    v68 = v4;
    v21 = (void *)objc_msgSend(v17, "mutableCopy");
    v22 = (void *)MEMORY[0x227676638](objc_msgSend(v21, "minusSet:", v20));
    v67 = v12;
    v23 = v12;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v25;
      v85 = 2112;
      v86 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Couldn't discover these endpoints to set their volume: %@", buf, 0x16u);

      v14 = v72;
    }

    objc_autoreleasePoolPop(v22);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v26 = v21;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v78 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          v32 = [HMDMROutputDeviceStatus alloc];
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 2, CFSTR("Could not find endpoint"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[HMDMROutputDeviceStatus initWithOutputUID:error:](v32, "initWithOutputUID:error:", v31, v33);

          v14 = v72;
          if ((objc_msgSend(v72, "containsObject:", v34) & 1) == 0)
            objc_msgSend(v72, "addObject:", v34);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v28);
    }

    v12 = v67;
    v4 = v68;
    v17 = v71;
  }
  if (!objc_msgSend(v14, "na_any:", &__block_literal_global_100_31998))
    goto LABEL_40;
  v69 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v37 = v14;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v74 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v42, "outputUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v42, "error");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            objc_msgSend(v42, "error");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "outputUID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v45, v46);

          }
          else
          {
            objc_msgSend(v42, "outputUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v45);
          }

        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v39);
  }

  v47 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v47, CFSTR("HMD.MRSetEndpointVolumeOperation.FailedEndpoints"));

  objc_msgSend(v36, "allObjects");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v48, CFSTR("HMD.MRSetEndpointVolumeOperation.SucceededEndpoints"));

  v49 = (void *)MEMORY[0x24BDD1540];
  v50 = (void *)objc_msgSend(v69, "copy");
  objc_msgSend(v49, "hmfErrorWithCode:userInfo:", 14, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v36, "count");
  -[HMFOperation activity](v12, "activity");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v52)
  {
    objc_msgSend(v53, "markWithReason:", CFSTR("finished with partial success"));

    v55 = (void *)MEMORY[0x227676638]();
    v56 = v12;
    HMFGetOSLogHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v58 = v4;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v59;
      v85 = 2112;
      v86 = v51;
      _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@Operation finished with partial success <%@>", buf, 0x16u);

      v4 = v58;
    }

    objc_autoreleasePoolPop(v55);
    -[HMDMRSetEndpointVolumeOperation setPartialExecutionError:](v56, "setPartialExecutionError:", v51);
  }
  else
  {
    objc_msgSend(v53, "markWithReason:", CFSTR("Canceled with error"));

    -[HMFOperation activity](v12, "activity");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "invalidate");

    v61 = (void *)MEMORY[0x227676638]();
    v62 = v12;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v64;
      v85 = 2112;
      v86 = v51;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Operation canceled due to failure <%@>", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v61);
    -[HMFOperation cancelWithError:](v62, "cancelWithError:", v51);
  }
  v20 = v70;

  v17 = v71;
  v14 = v72;
  if (v52)
  {
LABEL_40:
    -[HMFOperation activity](v12, "activity");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "markWithReason:", CFSTR("Finished with success"));

    -[HMFOperation activity](v12, "activity");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "invalidate");

    -[HMFOperation finish](v12, "finish");
  }

}

- (BOOL)cancelOnSetup
{
  HMDMRSetEndpointVolumeOperation *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  HMDMRSetEndpointVolumeOperation *v11;
  HMDMRSetEndpointVolumeOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  float v20;
  _BOOL4 v21;
  void *v22;
  float v23;
  int v24;
  int v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDMRSetEndpointVolumeOperation *v33;
  NSObject *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v2 = self;
  v46 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HMDMRSetEndpointVolumeOperation dependencies](self, "dependencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x227676638]();
          v11 = v2;
          v12 = v2;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v42 = v14;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Volume Operation canceled by dependency failure", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v10);
          -[HMFOperation activity](v12, "activity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "markWithReason:", CFSTR("Volume Operation canceled by dependency failure"));

          objc_msgSend(v8, "error");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFOperation cancelWithError:](v12, "cancelWithError:", v16);

          v2 = v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v5);
  }

  -[HMDMRSetEndpointVolumeOperation routeIDs](v2, "routeIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  -[HMDMRSetEndpointVolumeOperation volume](v2, "volume");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  if (v20 >= 0.0)
  {
    -[HMDMRSetEndpointVolumeOperation volume](v2, "volume");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v21 = v23 <= 1.0;

  }
  else
  {
    v21 = 0;
  }

  v24 = -[HMDMRSetEndpointVolumeOperation isCancelled](v2, "isCancelled");
  v25 = !v21;
  if (!v18)
    v25 = 1;
  if (!v24 && v25)
  {
    if (v18)
      v26 = 1;
    else
      v26 = v21;
    v27 = (void *)MEMORY[0x24BDD17C8];
    if ((v26 & 1) != 0)
    {
      if (v18)
      {
        -[HMDMRSetEndpointVolumeOperation volume](v2, "volume");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("SetVolumeOperation: volume: (%@) is invalid"), v28);
      }
      else
      {
        -[HMDMRSetEndpointVolumeOperation routeIDs](v2, "routeIDs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("SetVolumeOperation: route ID: (%@) is invalid"), v28);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDMRSetEndpointVolumeOperation volume](v2, "volume");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMRSetEndpointVolumeOperation routeIDs](v2, "routeIDs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("SetVolumeOperation volume: (%@) and route ID: (%@) are invalid"), v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 3, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v2, "cancelWithError:", v31);

    v32 = (void *)MEMORY[0x227676638]();
    v33 = v2;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v35;
      v43 = 2112;
      v44 = v30;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);

  }
  return -[HMDMRSetEndpointVolumeOperation isCancelled](v2, "isCancelled");
}

- (id)discoverRemoteControlEndpointsForUIDs:(id)a3
{
  id v4;
  void *v5;
  HMDMRSetEndpointVolumeOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Begin discoverRemoteControlEndpointsMatchingUIDs", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMFOperation activity](v6, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markWithReason:", CFSTR("Begin discoverRemoteControlEndpointsMatchingUIDs"));

  objc_initWeak((id *)buf, v6);
  v10 = (void *)MEMORY[0x24BE6B608];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke;
  v14[3] = &unk_24E779E10;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v4;
  v15 = v11;
  objc_msgSend(v10, "futureWithCompletionHandlerAdapterBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (id)connectToEndpoint:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMRSetEndpointVolumeOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin connect to endpoint %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMFOperation activity](v9, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markWithFormat:", CFSTR("Begin connect to endpoint %@"), v6);

  objc_initWeak((id *)buf, v9);
  v13 = (void *)MEMORY[0x24BE6B608];
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke;
  v24[3] = &unk_24E779E60;
  v15 = v7;
  v25 = v15;
  v16 = v6;
  v26 = v16;
  objc_msgSend(v13, "futureWithErrorOnlyHandlerAdapterBlock:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_3;
  v21[3] = &unk_24E78BFB0;
  objc_copyWeak(&v23, (id *)buf);
  v18 = v16;
  v22 = v18;
  objc_msgSend(v17, "addCompletionBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v19;
}

- (id)getVolumeCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMRSetEndpointVolumeOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMFOperation activity](v9, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markWithFormat:", CFSTR("Begin getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@"), v7);

  objc_initWeak((id *)buf, v9);
  -[HMDMRSetEndpointVolumeOperation externalObjectInterface](v9, "externalObjectInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation underlyingQueue](v9, "underlyingQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint:outputDeviceUID:queue:", v6, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __84__HMDMRSetEndpointVolumeOperation_getVolumeCapabilitiesForEndpoint_outputDeviceUID___block_invoke;
  v20[3] = &unk_24E779E88;
  objc_copyWeak(&v23, (id *)buf);
  v16 = v6;
  v21 = v16;
  v17 = v7;
  v22 = v17;
  objc_msgSend(v15, "addCompletionBlock:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v18;
}

- (id)setVolumeOnEndpoint:(id)a3 outputDeviceUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMRSetEndpointVolumeOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2112;
    v40 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin setMRAVOutputDeviceVolume on outputDeviceUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMFOperation activity](v9, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markWithFormat:", CFSTR("Begin setMRAVOutputDeviceVolume on outputDeviceUID %@"), v7);

  objc_initWeak((id *)buf, v9);
  -[HMDMRSetEndpointVolumeOperation externalObjectInterface](v9, "externalObjectInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMRSetEndpointVolumeOperation volume](v9, "volume");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;
  -[HMFOperation underlyingQueue](v9, "underlyingQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = v16;
  objc_msgSend(v13, "setMRAVOutputDeviceVolume:endpoint:outputDeviceUID:queue:", v6, v7, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke;
  v35[3] = &unk_24E793078;
  v21 = v7;
  v36 = v21;
  objc_msgSend(v19, "flatMap:", v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_2;
  v33[3] = &unk_24E7927B0;
  v23 = v21;
  v34 = v23;
  objc_msgSend(v22, "recover:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_3;
  v29[3] = &unk_24E77A850;
  objc_copyWeak(&v32, (id *)buf);
  v25 = v23;
  v30 = v25;
  v26 = v6;
  v31 = v26;
  objc_msgSend(v24, "addCompletionBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

  return v27;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMRSetEndpointVolumeOperation volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMRSetEndpointVolumeOperation routeIDs](self, "routeIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ volume: %@ route IDs: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMRSetEndpointVolumeOperation volume](self, "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Volume"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMRSetEndpointVolumeOperation routeIDs](self, "routeIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Route IDs"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSNumber)volume
{
  return self->_volume;
}

- (NSArray)routeIDs
{
  return self->_routeIDs;
}

- (NSError)partialExecutionError
{
  return self->_partialExecutionError;
}

- (void)setPartialExecutionError:(id)a3
{
  objc_storeStrong((id *)&self->_partialExecutionError, a3);
}

- (HMDMPCAssistantDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (HMDMRSetEndpointVolumeOperationExternalObjectInterface)externalObjectInterface
{
  return (HMDMRSetEndpointVolumeOperationExternalObjectInterface *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalObjectInterface, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_partialExecutionError, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);
  objc_storeStrong((id *)&self->_volume, 0);
}

id __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke(uint64_t a1)
{
  void *v1;
  HMDMROutputDeviceStatus *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BE6B608];
  v2 = -[HMDMROutputDeviceStatus initWithOutputUID:]([HMDMROutputDeviceStatus alloc], "initWithOutputUID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  HMDMROutputDeviceStatus *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = a2;
  v5 = -[HMDMROutputDeviceStatus initWithOutputUID:error:]([HMDMROutputDeviceStatus alloc], "initWithOutputUID:error:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v3, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markWithFormat:", CFSTR("Complete setMRAVOutputDeviceVolume on outputDeviceUID %@"), *(_QWORD *)(a1 + 32));

  v9 = (void *)MEMORY[0x227676638]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Complete setMRAVOutputDeviceVolume on outputDeviceUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void *)MEMORY[0x227676638]();
  v15 = v10;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v6)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "volume");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v6;
      v21 = "%{public}@Unable to set volume to %@ on endpoint %@ : %@";
      v22 = v17;
      v23 = OS_LOG_TYPE_ERROR;
      v24 = 42;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, buf, v24);

    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "volume");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v25;
    v21 = "%{public}@Sucessfully set volume to %@ on endpoint %@";
    v22 = v17;
    v23 = OS_LOG_TYPE_INFO;
    v24 = 32;
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v14);
}

void __84__HMDMRSetEndpointVolumeOperation_getVolumeCapabilitiesForEndpoint_outputDeviceUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine if volume control is supported on endpoint %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = WeakRetained;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Complete getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v14, "activity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "markWithFormat:", CFSTR("Complete getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@"), *(_QWORD *)(a1 + 40));

}

void __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "mravEndpoint");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_2;
  v7[3] = &unk_24E779E38;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "connectToEndpoint:completion:", v5, v7);

}

void __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to connect to endpoint %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(WeakRetained, "activity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markWithFormat:", CFSTR("Complete connect to endpoint %@"), *(_QWORD *)(a1 + 32));

  v14 = (void *)MEMORY[0x227676638]();
  v15 = WeakRetained;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Complete connect to endpoint %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

}

uint64_t __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "discovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_2;
  v8[3] = &unk_24E779DE8;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v3;
  v9 = v7;
  objc_msgSend(v5, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v6, v8);

  objc_destroyWeak(&v10);
}

void __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Operation endpoints %@ : output devices %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markWithReason:", CFSTR("Completed discoverRemoteControlEndpointsMatchingUIDs"));

  v13 = (void *)MEMORY[0x227676638]();
  v14 = v9;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Completed discoverRemoteControlEndpointsMatchingUIDs", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "na_map:", &__block_literal_global_126);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v17, 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v14;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@No endpoints found for volume operation", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 15, CFSTR("Could not find endpoints"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v17);
  }

}

HMDMRAVEndpoint *__73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_124(uint64_t a1, void *a2)
{
  id v2;
  HMDMRAVEndpoint *v3;

  v2 = a2;
  v3 = -[HMDMRAVEndpoint initWithMRAVEndpoint:]([HMDMRAVEndpoint alloc], "initWithMRAVEndpoint:", v2);

  return v3;
}

BOOL __84__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses___block_invoke_98(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __84__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outputUID");
}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "generateOverallResultAndFinishWithDeviceStatuses:", 0);

}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  void *v19;
  void *v20;
  id v21;
  id obj;
  id *from;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  from = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v8);
        objc_msgSend(WeakRetained, "externalObjectInterface");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "createAssistantConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "connectToEndpoint:connection:", v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v6;
        v28[1] = 3221225472;
        v28[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3;
        v28[3] = &unk_24E779D00;
        v13 = v11;
        v29 = v13;
        objc_copyWeak(&v31, from);
        v30 = v9;
        objc_msgSend(v12, "flatMap:", v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v6;
        v27[1] = 3221225472;
        v27[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_5;
        v27[3] = &unk_24E7927B0;
        v27[4] = v9;
        objc_msgSend(v14, "recover:", v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "addObject:", v15);
        objc_destroyWeak(&v31);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  v16 = (void *)MEMORY[0x24BE6B608];
  v17 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(WeakRetained, "underlyingQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "schedulerWithDispatchQueue:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "combineAllFutures:ignoringErrors:scheduler:", v24, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_6;
  v25[3] = &unk_24E79ADC0;
  objc_copyWeak(&v26, from);
  v21 = (id)objc_msgSend(v20, "addSuccessBlock:", v25);

  objc_destroyWeak(&v26);
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id *from;
  uint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  id WeakRetained;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  id v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v35 = a2;
  v36 = *(id *)(a1 + 32);
  from = (id *)(a1 + 48);
  v38 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "externalObjectInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copyMRAVEndpointOutputDevices:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v55 != v41)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        objc_msgSend(v8, "uid", v35, v36);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(WeakRetained, "routeIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x24BDAC760];
          v52[1] = 3221225472;
          v52[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_75;
          v52[3] = &unk_24E795220;
          v11 = v8;
          v53 = v11;
          objc_msgSend(v10, "na_filter:", v52);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x227676638]();
          v14 = WeakRetained;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v59 = v16;
            v60 = 2112;
            v61 = v17;
            v62 = 2112;
            v63 = v12;
            v64 = 2112;
            v65 = v11;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Found %@ matching route IDs (%@) on the output device: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v13);
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v14, "getVolumeCapabilitiesForEndpoint:outputDeviceUID:", *(_QWORD *)(v38 + 40), v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x24BDAC760];
            v48[1] = 3221225472;
            v48[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_77;
            v48[3] = &unk_24E779C68;
            objc_copyWeak(&v51, from);
            v19 = v9;
            v20 = *(_QWORD *)(v38 + 40);
            v49 = v19;
            v50 = v20;
            objc_msgSend(v18, "flatMap:", v48);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_79;
            v46[3] = &unk_24E7927B0;
            v47 = v19;
            objc_msgSend(v21, "recover:", v46);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x24BDAC760];
            v44[1] = 3221225472;
            v44[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2_81;
            v44[3] = &unk_24E779CB8;
            v45 = v12;
            objc_msgSend(v22, "flatMap:", v44);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "addObject:", v23);
            objc_destroyWeak(&v51);
          }

        }
        else
        {
          v24 = (void *)MEMORY[0x227676638]();
          v25 = WeakRetained;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v59 = v27;
            v60 = 2112;
            v61 = v6;
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Got nil output device from outputDeviceRef %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v42);
  }

  v28 = (void *)MEMORY[0x24BE6B608];
  v29 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(WeakRetained, "underlyingQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "schedulerWithDispatchQueue:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "combineAllFutures:ignoringErrors:scheduler:", v39, 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "flatMap:", &__block_literal_global_32019);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  HMDMROutputDeviceStatus *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = a2;
  v5 = -[HMDMROutputDeviceStatus initWithOutputEndpoint:error:]([HMDMROutputDeviceStatus alloc], "initWithOutputEndpoint:error:", *(_QWORD *)(a1 + 32), v4);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  objc_msgSend(a2, "na_arrayByFlattening");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "generateOverallResultAndFinishWithDeviceStatuses:", v4);

}

uint64_t __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_75(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsUID:", a2);
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDMROutputDeviceStatus *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "unsignedIntegerValue") == 2)
  {
    objc_msgSend(WeakRetained, "setVolumeOnEndpoint:outputDeviceUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping setMRAVOutputDeviceVolume on outputDeviceUID %@. Volume not controllable with given capabilities: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = (void *)MEMORY[0x24BE6B608];
    v12 = -[HMDMROutputDeviceStatus initWithOutputUID:]([HMDMROutputDeviceStatus alloc], "initWithOutputUID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11, "futureWithResult:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_79(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  HMDMROutputDeviceStatus *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = a2;
  v5 = -[HMDMROutputDeviceStatus initWithOutputUID:error:]([HMDMROutputDeviceStatus alloc], "initWithOutputUID:error:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v3, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BE6B608];
  v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3_82;
  v10[3] = &unk_24E779C90;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v5, "na_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(a2, "na_arrayByFlattening");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HMDMROutputDeviceStatus *__39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3_82(uint64_t a1, void *a2)
{
  id v3;
  HMDMROutputDeviceStatus *v4;
  void *v5;
  HMDMROutputDeviceStatus *v6;

  v3 = a2;
  v4 = [HMDMROutputDeviceStatus alloc];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMROutputDeviceStatus initWithOutputUID:error:](v4, "initWithOutputUID:error:", v3, v5);

  return v6;
}

+ (id)shortDescription
{
  return CFSTR("HMDMRSetEndpointVolumeOperation");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_32036 != -1)
    dispatch_once(&logCategory__hmf_once_t24_32036, &__block_literal_global_152);
  return (id)logCategory__hmf_once_v25_32037;
}

void __46__HMDMRSetEndpointVolumeOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_32037;
  logCategory__hmf_once_v25_32037 = v0;

}

@end
