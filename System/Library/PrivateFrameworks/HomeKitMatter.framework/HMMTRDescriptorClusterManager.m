@implementation HMMTRDescriptorClusterManager

- (HMMTRDescriptorClusterManager)init
{
  HMMTRDescriptorClusterManager *v2;
  HMMTRDescriptorClusterManager *v3;
  id createClusterInstance;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMTRDescriptorClusterManager;
  v2 = -[HMMTRDescriptorClusterManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    createClusterInstance = v2->_createClusterInstance;
    v2->_createClusterInstance = &__block_literal_global_6043;

  }
  return v3;
}

- (HMMTRProtocolMap)protocolMap
{
  return (HMMTRProtocolMap *)+[HMMTRProtocolMap protocolMap](HMMTRProtocolMap, "protocolMap");
}

- (id)buildClusterDescriptorWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMMTRDescriptorClusterManager createClusterInstance](self, "createClusterInstance");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, id, id, id))v11)[2](v11, CFSTR("MTRClusterDescriptor"), v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)getBridgeEndpointsDeviceTypes:(id)a3 endpointDeviceTypes:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[HMMTRDescriptorClusterManager fetchClusterRevisionForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterRevisionForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(ClusterRevision: %@), "), v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v15);

  -[HMMTRDescriptorClusterManager fetchClusterFeatureMapForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterFeatureMapForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(FeatureMap: %@), "), v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v16);

  -[HMMTRDescriptorClusterManager fetchClusterAttributesForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterAttributesForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17;
  if (v17)
  {
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(Attributes: %@)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(Attributes: ()), "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v18);
  }

  -[HMMTRDescriptorClusterManager fetchClusterEventListForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterEventListForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v20;
  if (v20)
  {
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(Events: %@), "), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(Events: ()), "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v21);
  }

  -[HMMTRDescriptorClusterManager fetchClusterAcceptedCommandsForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterAcceptedCommandsForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(AcceptedCommands: %@), "), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(AcceptedCommands: ()), "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v25);
  }

  -[HMMTRDescriptorClusterManager fetchClusterGeneratedCommandsForDevice:endpointID:clusterID:callbackQueue:](self, "fetchClusterGeneratedCommandsForDevice:endpointID:clusterID:callbackQueue:", v10, v11, v12, v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(GeneratedCommands: %@) "), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(GeneratedCommands: ()), "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v29);
  }

  return v14;
}

- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  id obja;
  void *v70;
  HMMTRDescriptorClusterManager *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v71 = self;
  v72 = v10;
  -[HMMTRDescriptorClusterManager fetchPartsListForDevice:endpointID:callbackQueue:](self, "fetchPartsListForDevice:endpointID:callbackQueue:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v12;
  if (v12)
  {
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(PartsList: %@), "), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(PartsList: ()), "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v13);
  }

  -[HMMTRDescriptorClusterManager fetchDeviceTypesWithMTRDevice:endpointID:callbackQueue:](self, "fetchDeviceTypesWithMTRDevice:endpointID:callbackQueue:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v8;
  v70 = v11;
  v65 = v15;
  if (v15)
  {
    v64 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(DeviceTypes: "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v16);

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = v15;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v82;
      v20 = *MEMORY[0x24BDDB470];
      v21 = *MEMORY[0x24BDDB478];
      v22 = *MEMORY[0x24BDDB518];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v82 != v19)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v27 = v26;

          objc_msgSend(v24, "objectForKeyedSubscript:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
          v30 = v29;

          objc_msgSend(v30, "objectForKeyedSubscript:", v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v32 = v31;
          else
            v32 = 0;
          v33 = v32;

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@ (revision %@), "), v33, v27);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v70;
          objc_msgSend(v70, "appendString:", v34);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("), "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v35);

    v9 = v64;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(DeviceTypes : ()), "));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v36);

  }
  -[HMMTRDescriptorClusterManager fetchServerClustersForDevice:endpointID:callbackQueue:](v71, "fetchServerClustersForDevice:endpointID:callbackQueue:", v8, v9, v72);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDD17C8];
  obja = v37;
  if (v37)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(ServerClusters : "));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v39);

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v40 = v37;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v78 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
          -[HMMTRDescriptorClusterManager _fetchStateCaptureInformationForDevice:endpointID:clusterID:callbackQueue:](v71, "_fetchStateCaptureInformationForDevice:endpointID:clusterID:callbackQueue:", v8, v9, v45, v72);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(ClusterID : %@, ClusterInfo : %@), "), v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendString:", v47);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v42);
    }

    v38 = (void *)MEMORY[0x24BDD17C8];
    v48 = CFSTR("), ");
  }
  else
  {
    v48 = CFSTR("(ServerClusters : ()),");
  }
  objc_msgSend(v38, "stringWithFormat:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v49);

  -[HMMTRDescriptorClusterManager fetchClientClustersForDevice:endpointID:callbackQueue:](v71, "fetchClientClustersForDevice:endpointID:callbackQueue:", v8, v9, v72);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = v11;
    v52 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(ClientClusters: "));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "appendString:", v53);

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v54 = v50;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v74 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
          -[HMMTRDescriptorClusterManager _fetchStateCaptureInformationForDevice:endpointID:clusterID:callbackQueue:](v71, "_fetchStateCaptureInformationForDevice:endpointID:clusterID:callbackQueue:", v8, v52, v59, v72);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("( ClusterID:%@ ClusterInfo: %@), "), v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "appendString:", v61);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v56);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(")"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v52;
    v11 = v70;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(ClientClusters: ()),"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "appendString:", v62);

  return v11;
}

- (void)fetchStateCaptureInformationForDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMMTRDescriptorClusterManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  HMMTRDescriptorClusterManager *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMMTRDescriptorClusterManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void (**v47)(id, _QWORD);
  id v48;
  id v49;
  void *v50;
  id obj;
  uint64_t v52;
  HMMTRDescriptorClusterManager *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  -[HMMTRDescriptorClusterManager fetchPartsListForDevice:endpointID:callbackQueue:](self, "fetchPartsListForDevice:endpointID:callbackQueue:", v12, &unk_250F3F780, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && objc_msgSend(v17, "count"))
  {
    v50 = v18;
    v47 = v16;
    v19 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v20 = (void *)MEMORY[0x24BDD17C8];
    v48 = v14;
    objc_msgSend(v14, "fabricID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v13;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("( NodeID: %@; FabricID: %@, "), v13, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", v22);

    -[HMMTRDescriptorClusterManager _fetchStateCaptureInformationForDevice:endpointID:callbackQueue:](self, "_fetchStateCaptureInformationForDevice:endpointID:callbackQueue:", v12, &unk_250F3F780, v15);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Endpoints: {EndpointID: %@, EndpointData: %@ }, "), &unk_250F3F780, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", v24);

    v25 = (void *)MEMORY[0x242656984]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v28;
      v61 = 2112;
      v62 = v23;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@State Capture: Information for endpoint 0: %@", buf, 0x16u);

    }
    v46 = (void *)v23;

    v53 = v26;
    objc_autoreleasePoolPop(v25);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v18;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v54)
    {
      v52 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v56 != v52)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
          -[HMMTRDescriptorClusterManager _fetchStateCaptureInformationForDevice:endpointID:callbackQueue:](v53, "_fetchStateCaptureInformationForDevice:endpointID:callbackQueue:", v12, v30, v15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x242656984]();
          v33 = v53;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v35 = v19;
            v36 = v15;
            v37 = v12;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v38;
            v61 = 2112;
            v62 = v30;
            v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@State Capture: Information for endpoint %@: %@", buf, 0x20u);

            v12 = v37;
            v15 = v36;
            v19 = v35;
          }

          objc_autoreleasePoolPop(v32);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{EndpointID: %@, EndpointData: %@}, "), v30, v31);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appendString:", v39);

        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v54);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" }; }; "));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", v40);

    v41 = v19;
    v16 = v47;
    ((void (**)(id, void *))v47)[2](v47, v41);

    v14 = v48;
    v13 = v49;
    v18 = v50;
  }
  else
  {
    v42 = (void *)MEMORY[0x242656984]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v45;
      _os_log_impl(&dword_23E95B000, v44, OS_LOG_TYPE_ERROR, "%{public}@State Capture: No Endpoints In Use at endpoint 0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v42);
    v16[2](v16, 0);
  }

}

- (void)fetchHAPServicesWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5871;
  v30[4] = __Block_byref_object_dispose__5872;
  v31 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_250F21568;
  v22[4] = self;
  v17 = v16;
  v27 = v17;
  v28 = v32;
  v18 = v12;
  v23 = v18;
  v19 = v15;
  v24 = v19;
  v29 = v30;
  v20 = v13;
  v25 = v20;
  v21 = v14;
  v26 = v21;
  -[HMMTRDescriptorClusterManager fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:](self, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v18, &unk_250F3F780, v19, v22);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

- (void)fetchHAPCategoryForCHIPDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_250F231C0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[HMMTRDescriptorClusterManager fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:](self, "fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:", v14, &unk_250F3F780, v13, v16);

}

- (void)fetchHAPCategoryWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_250F231C0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[HMMTRDescriptorClusterManager fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:](self, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v14, &unk_250F3F780, v13, v16);

}

- (void)_queryFeatureMapFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, id, _QWORD);
  void *v17;
  HMMTRDescriptorClusterManager *v18;
  NSObject *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  HMMTRDescriptorClusterManager *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMMTRDescriptorClusterManager *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id, id, _QWORD))a7;
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v20;
    v45 = 2112;
    v46 = v15;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Querying device cluster %@ at endpoint %@ for feature map value", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMMTRDescriptorClusterManager createClusterInstance](v18, "createClusterInstance");
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id, id))v21)[2](v21, v15, v13, v12, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v41 = v14;
    v42 = v13;
    v23 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v22, "readAttributeFeatureMapWithParams:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v24, CFSTR("featureMap"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    v28 = (void *)MEMORY[0x242656984]();
    v29 = v18;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v32;
        v45 = 2112;
        v46 = v15;
        v47 = 2112;
        v48 = v27;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Received feature map from accessory for cluster class %@. Value: %@", buf, 0x20u);

        v28 = v39;
      }

      objc_autoreleasePoolPop(v28);
      v16[2](v16, v15, v27, 0);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v40;
        v45 = 2112;
        v46 = v15;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@Feature map not in cache for cluster class %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v38);

    }
    v14 = v41;
    v13 = v42;
  }
  else
  {
    v33 = (void *)MEMORY[0x242656984]();
    v34 = v18;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v37;
      v45 = 2112;
      v46 = v22;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);

      v14 = v36;
    }

    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v24);
  }

}

- (void)_querySupportedAttributesFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, id, _QWORD);
  void *v17;
  HMMTRDescriptorClusterManager *v18;
  NSObject *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  HMMTRDescriptorClusterManager *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMMTRDescriptorClusterManager *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id, id, _QWORD))a7;
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v20;
    v45 = 2112;
    v46 = v15;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Querying device cluster %@ at endpoint %@ for supported attributes", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMMTRDescriptorClusterManager createClusterInstance](v18, "createClusterInstance");
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id, id))v21)[2](v21, v15, v13, v12, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v41 = v14;
    v42 = v13;
    v23 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v22, "readAttributeAttributeListWithParams:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v24, CFSTR("attributeList"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    v28 = (void *)MEMORY[0x242656984]();
    v29 = v18;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v44 = v32;
        v45 = 2112;
        v46 = v15;
        v47 = 2112;
        v48 = v12;
        v49 = 2112;
        v50 = v27;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Received supported attributes list from accessory for cluster class %@ on endpoint %@. Attributes: %@", buf, 0x2Au);

        v28 = v39;
      }

      objc_autoreleasePoolPop(v28);
      v16[2](v16, v15, v27, 0);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v40;
        v45 = 2112;
        v46 = v15;
        v47 = 2112;
        v48 = v12;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@AttributeList attribute for cluster class %@ on endpoint %@ absent from cache", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v38);

    }
    v14 = v41;
    v13 = v42;
  }
  else
  {
    v33 = (void *)MEMORY[0x242656984]();
    v34 = v18;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v37;
      v45 = 2112;
      v46 = v22;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_ERROR, "%{public}@Supported attributes selector not found for cluster: %@", buf, 0x16u);

      v14 = v36;
    }

    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v24);
  }

}

- (void)_populateAttributeValuesForClusterClassName:(id)a3 clusterClassFeatureMap:(id)a4 endpoint:(id)a5 device:(id)a6 deviceTopology:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  void *v20;
  HMMTRDescriptorClusterManager *v21;
  NSObject *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void (**v45)(id, void *);
  id v46;
  void *v47;
  HMMTRDescriptorClusterManager *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  HMMTRDescriptorClusterManager *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMMTRDescriptorClusterManager *v60;
  NSObject *v61;
  void *v62;
  void (**v63)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  HMMTRDescriptorClusterManager *v71;
  NSObject *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  id v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  HMMTRDescriptorClusterManager *v91;
  NSObject *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  HMMTRDescriptorClusterManager *v105;
  void *v106;
  void *v107;
  void *context;
  void *contexte;
  void *contexta;
  void *contextb;
  void *contextc;
  HMMTRDescriptorClusterManager *contextd;
  void *v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  id v130;
  __int16 v131;
  id v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v118 = a7;
  v119 = a8;
  v19 = (void (**)(id, void *))a9;
  v20 = (void *)MEMORY[0x242656984]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v128 = v23;
    v129 = 2112;
    v130 = v15;
    v131 = 2112;
    v132 = v16;
    v133 = 2112;
    v134 = v17;
    v135 = 2112;
    v136 = v18;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Populate attribute values for %@ cluster with featureMap %@ on endpoint %@ from device %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v20);
  v116 = v18;
  v117 = v16;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("MTRClusterPowerSourceConfiguration")))
  {
    -[HMMTRDescriptorClusterManager createClusterInstance](v21, "createClusterInstance");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v24)[2](v24, v15, v18, v17, v119);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v25, "readAttributeSourcesWithParams:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v27, CFSTR("sources"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (v30)
    {
      v31 = v118;
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v30, v15, CFSTR("Sources"), v17);
LABEL_15:
      v36 = 0;
      goto LABEL_42;
    }
    v115 = v27;
    v45 = v19;
    v46 = v25;
    v47 = (void *)MEMORY[0x242656984]();
    v48 = v21;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v128 = v50;
      v129 = 2112;
      v130 = v15;
      v131 = 2112;
      v132 = v17;
      v51 = "%{public}@Sources attribute from the %@ cluster endpoint:%@ absent from cache";
LABEL_27:
      _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_ERROR, v51, buf, 0x20u);

      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("MTRClusterPowerSource")))
  {
    -[HMMTRDescriptorClusterManager createClusterInstance](v21, "createClusterInstance");
    v32 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v32)[2](v32, v15, v18, v17, v119);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v25, "readAttributeOrderWithParams:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v27, CFSTR("order"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v28;
    else
      v34 = 0;
    v30 = v34;

    if (v30)
    {
      v126 = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v118;
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v35, v15, CFSTR("Order"), v17);

      goto LABEL_15;
    }
    v115 = v27;
    v45 = v19;
    v46 = v25;
    v47 = (void *)MEMORY[0x242656984]();
    v48 = v21;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v128 = v50;
      v129 = 2112;
      v130 = v15;
      v131 = 2112;
      v132 = v17;
      v51 = "%{public}@Order attribute from the %@ cluster endpoint:%@ absent from cache";
      goto LABEL_27;
    }
LABEL_28:

    objc_autoreleasePoolPop(v47);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = v118;
    v25 = v46;
    v19 = v45;
    v27 = v115;
    goto LABEL_42;
  }
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MTRClusterColorControl")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("HMMTRSyncColorControl")))
  {
    -[HMMTRDescriptorClusterManager createClusterInstance](v21, "createClusterInstance");
    v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v37)[2](v37, v15, v18, v17, v119);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    v114 = v38;
    objc_msgSend(v38, "readAttributeColorTempPhysicalMinMiredsWithParams:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v40, CFSTR("colorTempPhysicalMinMireds"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
    v43 = v42;

    if (v43)
    {
      v125 = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v125, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v44, v15, CFSTR("ColorTempPhysicalMinMireds"), v17);

      v36 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x242656984]();
      v52 = v21;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v128 = v54;
        v129 = 2112;
        v130 = v15;
        v131 = 2112;
        v132 = v17;
        _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_ERROR, "%{public}@ColorTempPhysicalMinMireds attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v55 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v114, "readAttributeColorTempPhysicalMaxMiredsWithParams:", v55);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v27, CFSTR("colorTempPhysicalMaxMireds"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v56;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v28;
    else
      v57 = 0;
    v30 = v57;

    if (v30)
    {
      v124 = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v118;
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v58, v15, CFSTR("ColorTempPhysicalMaxMireds"), v17);
    }
    else
    {
      v59 = (void *)MEMORY[0x242656984]();
      v60 = v21;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contexte = v59;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v128 = v62;
        v129 = 2112;
        v130 = v15;
        v131 = 2112;
        v132 = v17;
        _os_log_impl(&dword_23E95B000, v61, OS_LOG_TYPE_ERROR, "%{public}@ColorTempPhysicalMaxMireds attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        v59 = contexte;
      }

      objc_autoreleasePoolPop(v59);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v58 = v36;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v118;
    }

  }
  else
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HMMTRThermostat")) & 1) == 0
      && !objc_msgSend(v15, "isEqualToString:", CFSTR("MTRClusterThermostat")))
    {
      v36 = 0;
      v31 = v118;
      goto LABEL_44;
    }
    v25 = v16;
    -[HMMTRDescriptorClusterManager createClusterInstance](v21, "createClusterInstance");
    v63 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v63)[2](v63, v15, v18, v17, v119);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = v25;
    if ((objc_msgSend(v25, "unsignedIntValue") & 2) != 0 || (objc_msgSend(v25, "unsignedIntValue") & 0x20) != 0)
    {
      v64 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v27, "readAttributeAbsMinCoolSetpointLimitWithParams:", v64);
      v65 = objc_claimAutoreleasedReturnValue();

      contexta = (void *)v65;
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v65, CFSTR("absMinCoolSetpointLimit"));
      v66 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v67 = v66;
      else
        v67 = 0;
      v68 = v67;

      if (v68)
      {
        v123 = v68;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v69, v15, CFSTR("AbsMinCoolSetpointLimit"), v17);

        v36 = 0;
      }
      else
      {
        v70 = (void *)MEMORY[0x242656984]();
        v71 = v21;
        HMFGetOSLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v104 = v70;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v128 = v73;
          v129 = 2112;
          v130 = v15;
          v131 = 2112;
          v132 = v17;
          _os_log_impl(&dword_23E95B000, v72, OS_LOG_TYPE_ERROR, "%{public}@AbsMinCoolSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

          v70 = v104;
        }

        objc_autoreleasePoolPop(v70);
        objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v74 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v27, "readAttributeAbsMaxCoolSetpointLimitWithParams:", v74);
      v75 = objc_claimAutoreleasedReturnValue();

      contextb = (void *)v75;
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v75, CFSTR("absMaxCoolSetpointLimit"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = v76;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v78 = v77;
      else
        v78 = 0;
      v79 = v78;

      if (v79)
      {
        v122 = v79;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v122, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v80, v15, CFSTR("AbsMaxCoolSetpointLimit"), v17);
      }
      else
      {
        v81 = (void *)MEMORY[0x242656984]();
        v105 = v21;
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v102 = v81;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v128 = v83;
          v129 = 2112;
          v130 = v15;
          v131 = 2112;
          v132 = v17;
          _os_log_impl(&dword_23E95B000, v82, OS_LOG_TYPE_ERROR, "%{public}@AbsMaxCoolSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

          v81 = v102;
        }

        objc_autoreleasePoolPop(v81);
        objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
        v80 = v36;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v25 = v114;
    }
    else
    {
      v36 = 0;
    }
    if ((objc_msgSend(v25, "unsignedIntValue") & 1) == 0 && (objc_msgSend(v25, "unsignedIntValue") & 0x20) == 0)
    {
      v31 = v118;
      goto LABEL_43;
    }
    v84 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v27, "readAttributeAbsMinHeatSetpointLimitWithParams:", v84);
    v85 = objc_claimAutoreleasedReturnValue();

    v106 = (void *)v85;
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v85, CFSTR("absMinHeatSetpointLimit"));
    v86 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v87 = v86;
    else
      v87 = 0;
    v88 = v87;

    contextc = v88;
    if (v88)
    {
      v121 = v88;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v121, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v89, v15, CFSTR("AbsMinHeatSetpointLimit"), v17);
    }
    else
    {
      v90 = (void *)MEMORY[0x242656984]();
      v91 = v21;
      HMFGetOSLogHandle();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v103 = v90;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v128 = v93;
        v129 = 2112;
        v130 = v15;
        v131 = 2112;
        v132 = v17;
        _os_log_impl(&dword_23E95B000, v92, OS_LOG_TYPE_ERROR, "%{public}@AbsMinHeatSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        v90 = v103;
      }

      objc_autoreleasePoolPop(v90);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v89 = v36;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v94 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v27, "readAttributeAbsMaxHeatSetpointLimitWithParams:", v94);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v28, CFSTR("absMaxHeatSetpointLimit"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v95;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v96 = v30;
    else
      v96 = 0;
    v97 = v96;

    if (v97)
    {
      v120 = v97;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addDeviceAttributeValues:clusterClassName:attributeName:atEndpoint:", v98, v15, CFSTR("AbsMaxHeatSetpointLimit"), v17);
    }
    else
    {
      v99 = (void *)MEMORY[0x242656984]();
      contextd = v21;
      HMFGetOSLogHandle();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v107 = v99;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v128 = v101;
        v129 = 2112;
        v130 = v15;
        v131 = 2112;
        v132 = v17;
        _os_log_impl(&dword_23E95B000, v100, OS_LOG_TYPE_ERROR, "%{public}@AbsMaxHeatSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        v99 = v107;
      }

      objc_autoreleasePoolPop(v99);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v98 = v36;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v31 = v118;
  }
  v25 = v114;
LABEL_42:

LABEL_43:
  v18 = v116;
  v16 = v117;
LABEL_44:
  v19[2](v19, v36);

}

- (void)_verifyHAPCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForFeatureMap:(id)a7 hapServicesToCheckForFeatureMap:(id)a8 hapServicesInUse:(id)a9 deviceTopology:(id)a10 bridgeAggregateNodeEndpoint:(id)a11 server:(id)a12 lastError:(id)a13 completionHandler:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMMTRDescriptorClusterManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  HMMTRDescriptorClusterManager *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMMTRDescriptorClusterManager *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  HMMTRDescriptorClusterManager *v61;
  void *v62;
  NSObject *v63;
  os_log_type_t v64;
  const char *v65;
  uint32_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id obj;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  HMMTRDescriptorClusterManager *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[5];
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  uint8_t v128[128];
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  _BYTE v132[20];
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  v92 = a3;
  v85 = a4;
  v84 = a5;
  v83 = a6;
  v19 = a7;
  v86 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v82 = a13;
  v81 = a14;
  v24 = (void *)MEMORY[0x242656984]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v130 = v27;
    v131 = 2112;
    *(_QWORD *)v132 = v19;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cluster classes to query for feature map : %@", buf, 0x16u);

  }
  v79 = v22;
  v87 = v20;

  objc_autoreleasePoolPop(v24);
  v80 = v19;
  v99 = v21;
  v95 = v23;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "popFirstObject");
    v101 = objc_claimAutoreleasedReturnValue();
    v116[0] = MEMORY[0x24BDAC760];
    v116[1] = 3221225472;
    v116[2] = __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke;
    v116[3] = &unk_250F215E0;
    v116[4] = v25;
    v28 = v92;
    v117 = v92;
    v118 = v21;
    v119 = v85;
    v29 = v83;
    v120 = v83;
    v30 = v84;
    v121 = v84;
    v122 = v19;
    v31 = v23;
    v123 = v86;
    v124 = v87;
    v32 = v79;
    v125 = v79;
    v126 = v31;
    v33 = (void (**)(_QWORD, _QWORD))v81;
    v127 = v81;
    v34 = v25;
    v35 = v86;
    v36 = v19;
    v37 = v85;
    v38 = (void *)v101;
    -[HMMTRDescriptorClusterManager _queryFeatureMapFromClusterAtCHIPEndpoint:device:callbackQueue:clusterClassName:completionHandler:](v34, "_queryFeatureMapFromClusterAtCHIPEndpoint:device:callbackQueue:clusterClassName:completionHandler:", v117, v119, v120, v101, v116);

    v39 = v82;
    goto LABEL_45;
  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v86;
  v28 = v92;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
  if (!v90)
    goto LABEL_29;
  v89 = *(_QWORD *)v113;
  v94 = v25;
  do
  {
    v40 = 0;
    do
    {
      if (*(_QWORD *)v113 != v89)
        objc_enumerationMutation(obj);
      v91 = v40;
      v41 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v40);
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v102 = v41;
      objc_msgSend(v41, "characteristicFeatureMap");
      v93 = (id)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
      if (v97)
      {
        v96 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v97; ++i)
          {
            if (*(_QWORD *)v109 != v96)
              objc_enumerationMutation(v93);
            v43 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
            +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRDescriptorClusterManager protocolMap](v25, "protocolMap");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "clusterIDCharacteristicMap");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v44, v28, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v99, "getFeatureMapForClusterClassName:endpoint:", v47, v28);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "characteristicFeatureMap");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKey:", v43);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = (void *)MEMORY[0x242656984]();
            v52 = v25;
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if (!v48)
            {
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v130 = v62;
                v131 = 2112;
                *(_QWORD *)v132 = v44;
                *(_WORD *)&v132[8] = 2112;
                *(_QWORD *)&v132[10] = v47;
                *(_WORD *)&v132[18] = 2112;
                v133 = v28;
                v63 = v54;
                v64 = OS_LOG_TYPE_ERROR;
                v65 = "%{public}@Failed to get device feature map value for characteristic %@ with cluster class name %@ at endpoint %@";
                v66 = 42;
LABEL_23:
                _os_log_impl(&dword_23E95B000, v63, v64, v65, buf, v66);

              }
LABEL_24:

              objc_autoreleasePoolPop(v51);
              goto LABEL_25;
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v48, "unsignedIntValue");
              v57 = objc_msgSend(v50, "unsignedIntValue");
              *(_DWORD *)buf = 138544130;
              v130 = v55;
              v131 = 1024;
              *(_DWORD *)v132 = v56;
              v28 = v92;
              *(_WORD *)&v132[4] = 2112;
              *(_QWORD *)&v132[6] = v44;
              *(_WORD *)&v132[14] = 1024;
              *(_DWORD *)&v132[16] = v57;
              _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_INFO, "%{public}@Comparing device feature map %u with characteristic %@ required feature map %u", buf, 0x22u);

            }
            objc_autoreleasePoolPop(v51);
            v58 = objc_msgSend(v48, "unsignedIntegerValue");
            v59 = objc_msgSend(v50, "unsignedIntegerValue") & v58;
            if (v59 != objc_msgSend(v50, "unsignedIntegerValue"))
            {
              objc_msgSend(v102, "removeCharacteristic:", v44);
              objc_msgSend(v102, "serviceType");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "addHAPDisabledCharacteristic:atEndpoint:hapServiceType:", v44, v28, v60);

              v51 = (void *)MEMORY[0x242656984]();
              v61 = v52;
              HMFGetOSLogHandle();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v130 = v62;
                v131 = 2112;
                *(_QWORD *)v132 = v44;
                *(_WORD *)&v132[8] = 2112;
                *(_QWORD *)&v132[10] = v28;
                v63 = v54;
                v64 = OS_LOG_TYPE_INFO;
                v65 = "%{public}@Removed unsupported characteristic %@ for endpoint %@";
                v66 = 32;
                goto LABEL_23;
              }
              goto LABEL_24;
            }
LABEL_25:

            v25 = v94;
            v23 = v95;
          }
          v97 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
        }
        while (v97);
      }

      v40 = v91 + 1;
    }
    while (v91 + 1 != v90);
    v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
  }
  while (v90);
LABEL_29:

  v30 = v84;
  objc_msgSend(v84, "objectForKey:", v28);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v85;
  v35 = v86;
  v39 = v82;
  v29 = v83;
  v33 = (void (**)(_QWORD, _QWORD))v81;
  if (objc_msgSend(v38, "count") == 1)
  {
    objc_msgSend(v38, "objectAtIndex:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "integerValue") == 256)
    {
      objc_msgSend(v99, "getClustersInUseAtEndpoint:", v28);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "containsObject:", &unk_250F3F7B0))
      {
        v98 = v68;
        v103 = v67;
        +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", CFSTR("00000008-0000-1000-8000-0026BB765291"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", CFSTR("00000043-0000-1000-8000-0026BB765291"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v71 = v87;
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v73; ++j)
            {
              if (*(_QWORD *)v105 != v74)
                objc_enumerationMutation(v71);
              v76 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
              objc_msgSend(v76, "serviceType");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v77, "isEqualToString:", v70);

              if (v78)
              {
                objc_msgSend(v76, "removeCharacteristic:", v69);
                objc_msgSend(v99, "addHAPDisabledCharacteristic:atEndpoint:hapServiceType:", v69, v92, v70);
              }
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
          }
          while (v73);
        }

        v28 = v92;
        v30 = v84;
        v37 = v85;
        v39 = v82;
        v29 = v83;
        v35 = v86;
        v33 = (void (**)(_QWORD, _QWORD))v81;
        v67 = v103;
        v68 = v98;
      }

    }
  }
  ((void (**)(_QWORD, void *))v33)[2](v33, v39);
  v32 = v79;
  v36 = v80;
LABEL_45:

}

- (void)_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForAttributes:(id)a7 hapServicesToCheckForOptionalMatterAttribute:(id)a8 clusterAttributesSupported:(id)a9 hapServicesInUse:(id)a10 deviceTopology:(id)a11 bridgeAggregateNodeEndpoint:(id)a12 server:(id)a13 lastError:(id)a14 completionHandler:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  HMMTRDescriptorClusterManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMMTRDescriptorClusterManager *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  HMMTRDescriptorClusterManager *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  HMMTRDescriptorClusterManager *v62;
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v85;
  uint64_t v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[5];
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  id v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v87 = a3;
  v70 = a4;
  v69 = a5;
  v68 = a6;
  v20 = a7;
  v82 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v80 = a13;
  v66 = a14;
  v65 = a15;
  v25 = (void *)MEMORY[0x242656984]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v28;
    v115 = 2112;
    v116 = v20;
    _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Cluster classes to query for attributes : %@", buf, 0x16u);

  }
  v71 = v24;
  v72 = v22;
  v78 = v23;

  objc_autoreleasePoolPop(v25);
  v67 = v20;
  v81 = v21;
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "popFirstObject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __328__HMMTRDescriptorClusterManager__verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForAttributes_hapServicesToCheckForOptionalMatterAttribute_clusterAttributesSupported_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke;
    v100[3] = &unk_250F21608;
    v100[4] = v26;
    v29 = v87;
    v101 = v87;
    v102 = v21;
    v30 = v20;
    v103 = v70;
    v31 = v69;
    v104 = v69;
    v32 = v68;
    v105 = v68;
    v106 = v30;
    v33 = v82;
    v107 = v82;
    v108 = v22;
    v109 = v78;
    v110 = v71;
    v34 = v80;
    v111 = v80;
    v112 = v65;
    v35 = v26;
    v36 = v65;
    v37 = v70;
    v38 = v67;
    -[HMMTRDescriptorClusterManager _querySupportedAttributesFromClusterAtCHIPEndpoint:device:callbackQueue:clusterClassName:completionHandler:](v35, "_querySupportedAttributesFromClusterAtCHIPEndpoint:device:callbackQueue:clusterClassName:completionHandler:", v101, v103, v105, v85, v100);

    v39 = v66;
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v33 = v82;
    obj = v82;
    v29 = v87;
    v34 = v80;
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v125, 16);
    if (v75)
    {
      v74 = *(_QWORD *)v97;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v97 != v74)
            objc_enumerationMutation(obj);
          v76 = v40;
          v41 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v40);
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v79 = v41;
          objc_msgSend(v41, "optionalCharacteristics");
          v77 = (id)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v92, v124, 16);
          if (v86)
          {
            v83 = *(_QWORD *)v93;
            do
            {
              for (i = 0; i != v86; ++i)
              {
                if (*(_QWORD *)v93 != v83)
                  objc_enumerationMutation(v77);
                v43 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
                +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRDescriptorClusterManager protocolMap](v26, "protocolMap");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "clusterIDCharacteristicMap");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v44, v29, v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v81, "objectForKey:", v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRDescriptorClusterManager protocolMap](v26, "protocolMap");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "getCHIPAttributesForCharacteristic:", v43);
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                v90 = 0u;
                v91 = 0u;
                v88 = 0u;
                v89 = 0u;
                v51 = v50;
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v123, 16);
                if (v52)
                {
                  v53 = v52;
                  v54 = *(_QWORD *)v89;
                  while (2)
                  {
                    for (j = 0; j != v53; ++j)
                    {
                      if (*(_QWORD *)v89 != v54)
                        objc_enumerationMutation(v51);
                      if ((objc_msgSend(v48, "containsObject:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j)) & 1) == 0)
                      {
                        v56 = (void *)MEMORY[0x242656984]();
                        v57 = v26;
                        HMFGetOSLogHandle();
                        v58 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138544386;
                          v114 = v59;
                          v115 = 2112;
                          v116 = v51;
                          v117 = 2112;
                          v118 = v44;
                          v119 = 2112;
                          v120 = v48;
                          v121 = 2112;
                          v122 = v87;
                          _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_INFO, "%{public}@Attributes %@ for characteristic %@ not found in supported attribute list %@ for endpoint %@", buf, 0x34u);

                        }
                        objc_autoreleasePoolPop(v56);

                        objc_msgSend(v79, "removeCharacteristic:", v44);
                        objc_msgSend(v79, "serviceType");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v78, "addHAPDisabledCharacteristic:atEndpoint:hapServiceType:", v44, v87, v60);

                        v61 = (void *)MEMORY[0x242656984]();
                        v62 = v57;
                        HMFGetOSLogHandle();
                        v63 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v114 = v64;
                          v115 = 2112;
                          v116 = v44;
                          v117 = 2112;
                          v118 = v87;
                          _os_log_impl(&dword_23E95B000, v63, OS_LOG_TYPE_INFO, "%{public}@Removed unsupported characteristic %@ for endpoint %@", buf, 0x20u);

                        }
                        objc_autoreleasePoolPop(v61);
                        v29 = v87;
                        goto LABEL_29;
                      }
                    }
                    v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v123, 16);
                    if (v53)
                      continue;
                    break;
                  }
                }

LABEL_29:
                v33 = v82;
                v34 = v80;
              }
              v86 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v92, v124, 16);
            }
            while (v86);
          }

          v40 = v76 + 1;
        }
        while (v76 + 1 != v75);
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v125, 16);
      }
      while (v75);
    }

    v36 = v65;
    v39 = v66;
    (*((void (**)(id, id))v65 + 2))(v65, v66);
    v31 = v69;
    v37 = v70;
    v38 = v67;
    v32 = v68;
    v21 = v81;
  }

}

- (void)fetchHAPServicesAtCHIPEndpoint:(id)a3 deviceTopology:(id)a4 endpointDeviceTypes:(id)a5 accessoryInfo:(id)a6 hapToCHIPClusterMappingArray:(id)a7 device:(id)a8 isBridge:(BOOL)a9 bridgeAggregateNodeEndpoint:(id)a10 isComposedDevice:(BOOL)a11 server:(id)a12 callbackQueue:(id)a13 completionHandler:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMMTRDescriptorClusterManager *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  HMMTRDescriptorClusterManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMMTRDescriptorClusterManager *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void (**v57)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMMTRDescriptorClusterManager *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  HMMTRDescriptorClusterManager *v72;
  NSObject *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  HMMTRDescriptorClusterManager *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v106;
  id v107;
  _QWORD v108[5];
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  BOOL v124;
  BOOL v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t v130[128];
  uint8_t buf[4];
  void *v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  __int16 v137;
  _BOOL4 v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v93 = a4;
  v95 = a5;
  v94 = a6;
  v107 = a7;
  v96 = a8;
  v20 = a10;
  v21 = v20;
  v22 = a12;
  v23 = a13;
  v91 = a14;
  v24 = (void *)MEMORY[0x242656984]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = v23;
    v28 = v22;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v132 = v29;
    v133 = 2112;
    v134 = v19;
    v135 = 2112;
    v136 = v20;
    v137 = 1024;
    v138 = a11;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Fetching server list from descriptor cluster at endpoint %@, bridgeAggregateNodeEndpoint %@, isComposedDevice %d", buf, 0x26u);

    v22 = v28;
    v23 = v27;
  }

  objc_autoreleasePoolPop(v24);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v25, "buildClusterDescriptorWithDevice:endpointID:queue:", v96, v19, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v30, "readAttributeServerListWithParams:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v32, CFSTR("ServerList"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v34 = v33;
  else
    v34 = 0;
  v35 = v34;
  v90 = v33;

  v92 = v35;
  if (v35)
  {
    if (objc_msgSend(v35, "count"))
    {
      v86 = v20;
      v87 = v32;
      v83 = v30;
      v84 = v23;
      v103 = v22;
      objc_msgSend(v93, "setClustersInUse:atEndpoint:", v35, v19);
      -[HMMTRDescriptorClusterManager _buildClustersInUseDictWithClustersInUse:](v25, "_buildClustersInUseDictWithClustersInUse:", v35);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "getHAPServiceTypesAtEndpoint:", v19);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v19;
      objc_msgSend(v93, "getHAPCategoriesAtEndpoint:", v19);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = (void *)objc_opt_new();
      v101 = (void *)objc_opt_new();
      v99 = (void *)objc_opt_new();
      v37 = (void *)MEMORY[0x242656984]();
      v38 = v25;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v40;
        v133 = 2112;
        v134 = v19;
        v135 = 2112;
        v136 = v92;
        _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Retrieved at endpoint %@ following clusters in use %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v37);
      v41 = (void *)MEMORY[0x242656984]();
      v42 = v38;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v44;
        v133 = 2112;
        v134 = v106;
        v135 = 2112;
        v136 = v85;
        _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Retrieved at endpoint %@ following HAP categories in use %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v41);
      v97 = (void *)objc_opt_new();
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v45 = v36;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v127;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v127 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i);
            objc_msgSend(v93, "getNodeLabelAtEndpoint:", v106);
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
              v52 = (__CFString *)v51;
            else
              v52 = &stru_250F24B08;
            -[HMMTRDescriptorClusterManager hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:](v42, "hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:", v50, v102, v106, v52, v107, v104, v101, v99, v103);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if (v53)
            {
              objc_msgSend(v53, "setEndpoint:", v106);
              objc_msgSend(v97, "addObject:", v54);
            }

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
        }
        while (v47);
      }
      v82 = v45;

      objc_msgSend(v104, "allObjects");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v55, "mutableCopy");

      objc_msgSend(v104, "allObjects");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v56, "mutableCopy");

      v78 = (void *)objc_opt_new();
      v108[0] = MEMORY[0x24BDAC760];
      v108[1] = 3221225472;
      v108[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke;
      v108[3] = &unk_250F21680;
      v80 = v42;
      v108[4] = v42;
      v109 = v106;
      v110 = v96;
      v111 = v95;
      v112 = v84;
      v113 = v79;
      v114 = v99;
      v115 = v78;
      v116 = v97;
      v117 = v93;
      v118 = v20;
      v22 = v103;
      v119 = v103;
      v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v91;
      v124 = a9;
      v123 = v91;
      v120 = v85;
      v121 = v94;
      v58 = v92;
      v122 = v92;
      v125 = a11;
      v59 = v85;
      v60 = v97;
      v98 = v78;
      v19 = v106;
      v100 = v99;
      v89 = v79;
      v61 = v95;
      v23 = v84;
      -[HMMTRDescriptorClusterManager _verifyHAPCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForFeatureMap:hapServicesToCheckForFeatureMap:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:](v80, "_verifyHAPCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForFeatureMap:hapServicesToCheckForFeatureMap:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:", v109, v110, v111, v112, v81, v101, v60, v117, v118, v119, 0, v108);

      v62 = v86;
      v63 = v94;

      v30 = v83;
      v32 = v87;
    }
    else
    {
      v71 = (void *)MEMORY[0x242656984]();
      v72 = v25;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = v32;
        v74 = v30;
        v75 = v23;
        v76 = v22;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v132 = v77;
        v133 = 2112;
        v134 = v19;
        _os_log_impl(&dword_23E95B000, v73, OS_LOG_TYPE_ERROR, "%{public}@No clusters in use at endpoint %@", buf, 0x16u);

        v22 = v76;
        v23 = v75;
        v30 = v74;
        v32 = v88;
      }

      objc_autoreleasePoolPop(v71);
      v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v91;
      v62 = v21;
      (*((void (**)(id, _QWORD, BOOL, id, _QWORD))v91 + 2))(v91, 0, a9, v21, 0);
      v63 = v94;
      v61 = v95;
      v58 = v92;
    }
  }
  else
  {
    v64 = (void *)MEMORY[0x242656984]();
    v65 = v25;
    HMFGetOSLogHandle();
    v66 = objc_claimAutoreleasedReturnValue();
    v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v91;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v67 = v23;
      v68 = v22;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v132 = v69;
      v133 = 2112;
      v134 = v19;
      _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch clusters in use at endpoint %@", buf, 0x16u);

      v22 = v68;
      v23 = v67;
      v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v91;
    }

    objc_autoreleasePoolPop(v64);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, BOOL, id, void *))v57)[2](v57, 0, a9, v21, v70);

    v62 = v21;
    v58 = 0;
    v63 = v94;
    v61 = v95;
  }

}

- (void)_removeDisabledCharacteristicsFromServiceDescription:(id)a3 endpoint:(id)a4 topology:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMMTRDescriptorClusterManager *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  HMMTRDescriptorClusterManager *v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  id v39;
  void *obj;
  id v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v7, "requiredCharacteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  v41 = v8;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    v39 = v7;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serviceType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v9, "isHAPCharacteristicDisabledAtEndpoint:hapServiceType:hapCharacteristic:", v8, v16, v15);

        if (v17)
        {
          v18 = (void *)MEMORY[0x242656984](objc_msgSend(v7, "removeCharacteristic:", v15));
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = v12;
            v22 = v13;
            v23 = v9;
            v24 = v10;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v25;
            v54 = 2112;
            v55 = v15;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Removed disabled required characteristic : %@", buf, 0x16u);

            v10 = v24;
            v9 = v23;
            v13 = v22;
            v12 = v21;
            v7 = v39;
          }

          objc_autoreleasePoolPop(v18);
          v8 = v41;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v7, "optionalCharacteristics");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v44;
    *(_QWORD *)&v27 = 138543618;
    v38 = v27;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(obj);
        +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), v38);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serviceType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v9, "isHAPCharacteristicDisabledAtEndpoint:hapServiceType:hapCharacteristic:", v8, v32, v31);

        if (v33)
        {
          v34 = (void *)MEMORY[0x242656984](objc_msgSend(v7, "removeCharacteristic:", v31));
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v53 = v37;
            v54 = 2112;
            v55 = v31;
            _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Removed disabled optional characteristic : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v34);
          v8 = v41;
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v28);
  }

}

- (id)hapServiceDescriptionsForTopology:(id)a3 namesDictionary:(id)a4 server:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  id v50;
  void *v51;
  id obj;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v55 = a4;
  v71 = a5;
  -[HMMTRDescriptorClusterManager protocolMap](self, "protocolMap");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "hapToCHIPClusterMappingArray");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v50, "setNumberStyle:", 1);
  v53 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v69 = v8;
  objc_msgSend(v8, "hapServiceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v66 = v9;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_185_5896);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v12;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
  if (v56)
  {
    v54 = *(_QWORD *)v92;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v92 != v54)
          objc_enumerationMutation(obj);
        v61 = v13;
        v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "integerValue"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v74 = (void *)objc_opt_new();
        v73 = (void *)objc_opt_new();
        v72 = (void *)objc_opt_new();
        objc_msgSend(v69, "getPartsListAtEndpoint:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "getNodeLabelAtEndpoint:", v15);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
          v19 = (const __CFString *)v18;
        else
          v19 = &stru_250F24B08;
        objc_msgSend(v55, "setObject:forKey:", v19, v14);
        objc_msgSend(v69, "getClustersInUseAtEndpoint:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRDescriptorClusterManager _buildClustersInUseDictWithClustersInUse:](self, "_buildClustersInUseDictWithClustersInUse:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v57 = v14;
        objc_msgSend(v66, "objectForKeyedSubscript:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v62 = v22;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v88 != v25)
                objc_enumerationMutation(v62);
              -[HMMTRDescriptorClusterManager hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:](self, "hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i), v21, v15, v19, v70, v74, v73, v72, v71);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                objc_msgSend(v27, "setEndpoint:", v15);
                -[HMMTRDescriptorClusterManager _removeDisabledCharacteristicsFromServiceDescription:endpoint:topology:](self, "_removeDisabledCharacteristicsFromServiceDescription:endpoint:topology:", v28, v15, v69);
                objc_msgSend(v16, "addObject:", v28);
              }

            }
            v24 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
          }
          while (v24);
        }
        v58 = (void *)v21;
        v59 = (__CFString *)v19;
        v60 = (void *)v15;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v63 = v17;
        v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
        if (v67)
        {
          v65 = *(_QWORD *)v84;
          do
          {
            v29 = 0;
            do
            {
              if (*(_QWORD *)v84 != v65)
                objc_enumerationMutation(v63);
              v68 = v29;
              v30 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v29);
              objc_msgSend(v30, "stringValue");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "getClustersInUseAtEndpoint:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRDescriptorClusterManager _buildClustersInUseDictWithClustersInUse:](self, "_buildClustersInUseDictWithClustersInUse:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "getNodeLabelAtEndpoint:", v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              v36 = v32;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v80;
                do
                {
                  for (j = 0; j != v38; ++j)
                  {
                    if (*(_QWORD *)v80 != v39)
                      objc_enumerationMutation(v36);
                    -[HMMTRDescriptorClusterManager hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:](self, "hapServiceDescriptionForServiceType:clustersInUse:endpoint:name:hapToCHIPClusterMappingArray:clusterClassesToQuery:hapServicesToCheckForFeatureMap:hapServicesToCheckForOptionalMatterAttribute:server:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j), v34, v30, v35, v70, v74, v73, v72, v71);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = v41;
                    if (v41)
                    {
                      objc_msgSend(v41, "setEndpoint:", v30);
                      -[HMMTRDescriptorClusterManager _removeDisabledCharacteristicsFromServiceDescription:endpoint:topology:](self, "_removeDisabledCharacteristicsFromServiceDescription:endpoint:topology:", v42, v30, v69);
                      objc_msgSend(v16, "addObject:", v42);
                    }

                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
                }
                while (v38);
              }

              objc_msgSend(v30, "stringValue");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v43);

              v29 = v68 + 1;
            }
            while (v68 + 1 != v67);
            v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
          }
          while (v67);
        }

        if (v16)
          objc_msgSend(v53, "setObject:forKey:", v16, v57);

        v13 = v61 + 1;
      }
      while (v61 + 1 != v56);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    }
    while (v56);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v44 = v64;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v76 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(v53, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    }
    while (v46);
  }

  return v53;
}

- (id)_buildClustersInUseDictWithClustersInUse:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lX"), objc_msgSend(v10, "unsignedLongValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)hapServiceDescriptionForServiceType:(id)a3 clustersInUse:(id)a4 endpoint:(id)a5 name:(id)a6 hapToCHIPClusterMappingArray:(id)a7 clusterClassesToQuery:(id)a8 hapServicesToCheckForFeatureMap:(id)a9 hapServicesToCheckForOptionalMatterAttribute:(id)a10 server:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMMTRHAPServiceDescription *v22;
  void *v23;
  HMMTRHAPServiceDescription *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t i;
  void *v40;
  void *v41;
  HMMTRDescriptorClusterManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  HMMTRDescriptorClusterManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMMTRDescriptorClusterManager *v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  void *v78;
  HMMTRDescriptorClusterManager *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  HMMTRDescriptorClusterManager *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  HMMTRDescriptorClusterManager *v95;
  NSObject *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  HMMTRDescriptorClusterManager *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  HMMTRDescriptorClusterManager *v107;
  NSObject *v108;
  void *v109;
  HMMTRHAPServiceDescription *v110;
  void *v111;
  void *v112;
  HMMTRDescriptorClusterManager *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  HMMTRDescriptorClusterManager *v117;
  NSObject *v118;
  void *v119;
  void *v121;
  HMMTRDescriptorClusterManager *v122;
  NSObject *v123;
  void *v124;
  const char *v125;
  void *v126;
  HMMTRDescriptorClusterManager *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  HMMTRDescriptorClusterManager *v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  id v148;
  id v149;
  void *v150;
  uint64_t v151;
  void *obj;
  id v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  HMMTRHAPServiceDescription *v157;
  id v158;
  id v159;
  HMMTRDescriptorClusterManager *v160;
  void *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  uint8_t v179[128];
  uint8_t buf[4];
  void *v181;
  __int16 v182;
  void *v183;
  __int16 v184;
  void *v185;
  __int16 v186;
  void *v187;
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v159 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v153 = a8;
  v21 = v20;
  v149 = a9;
  v148 = a10;
  v161 = v18;
  v158 = a11;
  v22 = [HMMTRHAPServiceDescription alloc];
  -[HMMTRDescriptorClusterManager protocolMap](self, "protocolMap");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v19;
  v24 = -[HMMTRHAPServiceDescription initWithType:endpoint:name:optionalServiceLabelIndexIncluded:](v22, "initWithType:endpoint:name:optionalServiceLabelIndexIncluded:", v17, v18, v19, objc_msgSend(v23, "optionalServiceLabelIndexIncludedInService:", v17));

  v160 = self;
  -[HMMTRDescriptorClusterManager protocolMap](self, "protocolMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v24;
  -[HMMTRHAPServiceDescription serviceType](v24, "serviceType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requiredCharacteristicsForService:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v175;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v175 != v31)
          objc_enumerationMutation(v28);
        v139 = v32;
        v33 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v32);
        -[HMMTRDescriptorClusterManager protocolMap](v160, "protocolMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = v33;
        objc_msgSend(v34, "getIDForCharacteristic:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          v126 = (void *)MEMORY[0x242656984]();
          v127 = v160;
          HMFGetOSLogHandle();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v181 = v129;
            v182 = 2112;
            v183 = v150;
            v184 = 2112;
            v185 = v161;
            _os_log_impl(&dword_23E95B000, v128, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP characteristic ID for characteristic %@ on endpoint %@, aborting", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v126);
          v35 = 0;
          goto LABEL_92;
        }
        if (!v21 || !objc_msgSend(v21, "count"))
        {
          v121 = (void *)MEMORY[0x242656984]();
          v122 = v160;
          HMFGetOSLogHandle();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v181 = v124;
            v182 = 2112;
            v183 = v150;
            v184 = 2112;
            v185 = v161;
            v125 = "%{public}@Failed to find HAP to CHIP cluster mapping for characteristic %@ on endpoint %@, aborting";
            goto LABEL_90;
          }
LABEL_91:

          objc_autoreleasePoolPop(v121);
LABEL_92:
          v111 = v147;
LABEL_76:

          v110 = 0;
          v65 = v28;
          goto LABEL_81;
        }
        v145 = v28;
        v172 = 0u;
        v173 = 0u;
        v170 = 0u;
        v171 = 0u;
        objc_msgSend(v21, "objectForKeyedSubscript:", v35);
        obj = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v188, 16);
        if (!v36)
        {

LABEL_88:
          v121 = (void *)MEMORY[0x242656984]();
          v122 = v160;
          HMFGetOSLogHandle();
          v123 = objc_claimAutoreleasedReturnValue();
          v28 = v145;
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v181 = v124;
            v182 = 2112;
            v183 = v35;
            v184 = 2112;
            v185 = v161;
            v125 = "%{public}@Mandatory characteristic %@ cannot be found in clusters in use at endpoint %@.";
LABEL_90:
            _os_log_impl(&dword_23E95B000, v123, OS_LOG_TYPE_ERROR, v125, buf, 0x20u);

          }
          goto LABEL_91;
        }
        v37 = v36;
        v135 = v30;
        v137 = v31;
        v141 = v21;
        v143 = v17;
        v38 = 0;
        v155 = *(_QWORD *)v171;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v171 != v155)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i);
            v41 = (void *)MEMORY[0x242656984]();
            v42 = v160;
            HMFGetOSLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v181 = v44;
              v182 = 2112;
              v183 = v35;
              v184 = 2112;
              v185 = v40;
              v186 = 2112;
              v187 = v161;
              _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Looking for required HAP Characteristic %@ as its matching CHIP clusterID %@ on endpoint %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v41);
            objc_msgSend(v159, "objectForKeyedSubscript:", v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (v45 == 0) | v38;

            if ((v46 & 1) == 0)
            {
              v47 = (void *)MEMORY[0x242656984](objc_msgSend(v158, "setClusterIDForCharacteristic:endpointID:clusterID:", v35, v161, v40));
              v48 = v42;
              HMFGetOSLogHandle();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v181 = v50;
                v182 = 2112;
                v183 = v35;
                v184 = 2112;
                v185 = v40;
                v186 = 2112;
                v187 = v161;
                _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, "%{public}@Constructed HAP service description for HAP Characteristic %@, CHIP clusterID %@, endpoint %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v47);
              -[HMMTRHAPServiceDescription addMandatoryCharacteristic:](v157, "addMandatoryCharacteristic:", v35);
              -[HMMTRDescriptorClusterManager protocolMap](v48, "protocolMap");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "clusterIDCharacteristicMap");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "getMTRClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v35, v161, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v53)
              {
                v112 = (void *)MEMORY[0x242656984]();
                v113 = v48;
                HMFGetOSLogHandle();
                v114 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v181 = v115;
                  v182 = 2112;
                  v183 = v35;
                  v184 = 2112;
                  v185 = v161;
                  _os_log_impl(&dword_23E95B000, v114, OS_LOG_TYPE_ERROR, "%{public}@Cluster class name not found for mandatory characteristic %@ in use at endpoint %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v112);

                v21 = v141;
                v17 = v143;
                v28 = v145;
                v111 = v147;
                goto LABEL_76;
              }
              objc_msgSend(v153, "addObject:", v53);
              -[HMMTRDescriptorClusterManager protocolMap](v48, "protocolMap");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "getRequiredFeaturesBitmapForCharacteristic:", v150);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v56 = (void *)MEMORY[0x242656984]();
              v57 = v48;
              HMFGetOSLogHandle();
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
              if (v55)
              {
                if (v59)
                {
                  HMFGetLogIdentifier();
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v181 = v60;
                  v182 = 2112;
                  v183 = v55;
                  v184 = 2112;
                  v185 = v35;
                  v186 = 2112;
                  v187 = v161;
                  _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Found required feature map %@ for mandatory characteristic %@ on endpoint %@", buf, 0x2Au);

                }
                objc_autoreleasePoolPop(v56);
                -[HMMTRHAPServiceDescription addFeatureMapForCharacteristic:featureMap:](v157, "addFeatureMapForCharacteristic:featureMap:", v35, v55);
                objc_msgSend(v149, "addObject:", v157);
              }
              else
              {
                if (v59)
                {
                  HMFGetLogIdentifier();
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v181 = v61;
                  v182 = 2112;
                  v183 = v35;
                  v184 = 2112;
                  v185 = v161;
                  _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Feature map information not available for mandatory characteristic %@ on endpoint %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v56);
              }

              v38 = 1;
            }
          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v188, 16);
        }
        while (v37);

        v21 = v141;
        v17 = v143;
        if ((v38 & 1) == 0)
          goto LABEL_88;

        v31 = v137;
        v32 = v139 + 1;
        v30 = v135;
        v28 = v145;
      }
      while (v139 + 1 != v135);
      v30 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
    }
    while (v30);
  }

  -[HMMTRDescriptorClusterManager protocolMap](v160, "protocolMap");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRHAPServiceDescription serviceType](v157, "serviceType");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "optionalCharacteristicsForService:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v65 = v64;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v166, v179, 16);
  if (!v66)
    goto LABEL_72;
  v67 = v66;
  v68 = *(_QWORD *)v167;
  v142 = v21;
  v144 = v17;
  v146 = v28;
  v140 = v65;
  v134 = *(_QWORD *)v167;
  while (2)
  {
    v69 = 0;
    v136 = v67;
    do
    {
      if (*(_QWORD *)v167 != v68)
        objc_enumerationMutation(v65);
      v70 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v69);
      -[HMMTRDescriptorClusterManager protocolMap](v160, "protocolMap", v134);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = v70;
      objc_msgSend(v71, "getIDForCharacteristic:", v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
      {
        v130 = (void *)MEMORY[0x242656984]();
        v131 = v160;
        HMFGetOSLogHandle();
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v181 = v133;
          v182 = 2112;
          v183 = v154;
          v184 = 2112;
          v185 = v161;
          _os_log_impl(&dword_23E95B000, v132, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP characteristic ID for characteristic %@ on endpoint %@, aborting", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v130);
        v72 = 0;
        v111 = v147;
LABEL_80:

        v110 = 0;
        goto LABEL_81;
      }
      v138 = v69;
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      objc_msgSend(v21, "objectForKeyedSubscript:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
      if (!v156)
      {

LABEL_67:
        v106 = (void *)MEMORY[0x242656984]();
        v107 = v160;
        HMFGetOSLogHandle();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v181 = v109;
          v182 = 2112;
          v183 = v72;
          v184 = 2112;
          v185 = v161;
          _os_log_impl(&dword_23E95B000, v108, OS_LOG_TYPE_ERROR, "%{public}@Optional characteristic %@ cannot be found in clusters in use at endpoint %@.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v106);
        goto LABEL_70;
      }
      v74 = 0;
      v75 = *(_QWORD *)v163;
      v151 = *(_QWORD *)v163;
      while (2)
      {
        for (j = 0; j != v156; ++j)
        {
          if (*(_QWORD *)v163 != v75)
            objc_enumerationMutation(v73);
          v77 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
          v78 = (void *)MEMORY[0x242656984]();
          v79 = v160;
          HMFGetOSLogHandle();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v181 = v81;
            v182 = 2112;
            v183 = v72;
            v184 = 2112;
            v185 = v77;
            v186 = 2112;
            v187 = v161;
            _os_log_impl(&dword_23E95B000, v80, OS_LOG_TYPE_INFO, "%{public}@Looking for optional HAP Characteristic %@ as its matching CHIP clusterID %@ on endpoint %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v78);
          objc_msgSend(v159, "objectForKeyedSubscript:", v77);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = (v82 == 0) | v74;

          if ((v83 & 1) == 0)
          {
            v84 = (void *)MEMORY[0x242656984](objc_msgSend(v158, "setClusterIDForCharacteristic:endpointID:clusterID:", v72, v161, v77));
            v85 = v79;
            HMFGetOSLogHandle();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v181 = v87;
              v182 = 2112;
              v183 = v72;
              v184 = 2112;
              v185 = v77;
              v186 = 2112;
              v187 = v161;
              _os_log_impl(&dword_23E95B000, v86, OS_LOG_TYPE_INFO, "%{public}@Constructed HAP service description for optional HAP Characteristic %@, CHIP clusterID %@, endpoint %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v84);
            -[HMMTRHAPServiceDescription addOptionalCharacteristic:](v157, "addOptionalCharacteristic:", v72);
            -[HMMTRDescriptorClusterManager protocolMap](v85, "protocolMap");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "clusterIDCharacteristicMap");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "getMTRClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v72, v161, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v90)
            {
              v116 = (void *)MEMORY[0x242656984]();
              v117 = v85;
              HMFGetOSLogHandle();
              v118 = objc_claimAutoreleasedReturnValue();
              v65 = v140;
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v181 = v119;
                v182 = 2112;
                v183 = v72;
                v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_23E95B000, v118, OS_LOG_TYPE_ERROR, "%{public}@Cluster class name not found for optional characteristic %@ in use at endpoint %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v116);

              v21 = v142;
              v17 = v144;
              v28 = v146;
              v111 = v147;
              goto LABEL_80;
            }
            v91 = v73;
            objc_msgSend(v153, "addObject:", v90);
            -[HMMTRDescriptorClusterManager protocolMap](v85, "protocolMap");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "getRequiredFeaturesBitmapForCharacteristic:", v154);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            v94 = (void *)MEMORY[0x242656984]();
            v95 = v85;
            HMFGetOSLogHandle();
            v96 = objc_claimAutoreleasedReturnValue();
            v97 = os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG);
            if (v93)
            {
              if (v97)
              {
                HMFGetLogIdentifier();
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v181 = v98;
                v182 = 2112;
                v183 = v93;
                v184 = 2112;
                v185 = v72;
                v186 = 2112;
                v187 = v161;
                _os_log_impl(&dword_23E95B000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Found required feature map %@ for optional characteristic %@ on endpoint %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v94);
              -[HMMTRHAPServiceDescription addFeatureMapForCharacteristic:featureMap:](v157, "addFeatureMapForCharacteristic:featureMap:", v72, v93);
              objc_msgSend(v149, "addObject:", v157);
            }
            else
            {
              if (v97)
              {
                HMFGetLogIdentifier();
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v181 = v99;
                v182 = 2112;
                v183 = v72;
                v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_23E95B000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Feature map information not available for optional characteristic %@ on endpoint %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v94);
            }
            -[HMMTRDescriptorClusterManager protocolMap](v95, "protocolMap");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "isRequiresOptionalMatterAttributeForCharacteristic:", v154);

            if (v101)
            {
              v102 = (void *)MEMORY[0x242656984]();
              v103 = v95;
              HMFGetOSLogHandle();
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v181 = v105;
                v182 = 2112;
                v183 = v72;
                v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_23E95B000, v104, OS_LOG_TYPE_DEBUG, "%{public}@Optional characteristic %@ on endpoint %@ requires an additional Optional Matter attribute check", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v102);
              objc_msgSend(v148, "addObject:", v157);
            }

            v74 = 1;
            v73 = v91;
            v75 = v151;
          }
        }
        v156 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
        if (v156)
          continue;
        break;
      }

      v21 = v142;
      v17 = v144;
      v28 = v146;
      if ((v74 & 1) == 0)
        goto LABEL_67;
LABEL_70:

      v69 = v138 + 1;
      v65 = v140;
      v68 = v134;
    }
    while (v138 + 1 != v136);
    v67 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v166, v179, 16);
    if (v67)
      continue;
    break;
  }
LABEL_72:

  v110 = v157;
  v111 = v147;
LABEL_81:

  return v110;
}

- (void)fetchDeviceTypesForEndpoints:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  HMMTRDescriptorClusterManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke;
  v35[3] = &unk_250F216C8;
  v35[4] = self;
  v21 = v18;
  v36 = v21;
  v22 = v19;
  v37 = v22;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x242656B10](v35);
  if (objc_msgSend(v14, "count"))
  {
    if (!v16)
      v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v14, "popFirstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2;
    v26[3] = &unk_250F216F0;
    v27 = v17;
    v28 = self;
    v29 = v24;
    v16 = v16;
    v30 = v16;
    v31 = v14;
    v32 = v15;
    v33 = v21;
    v34 = v22;
    v25 = v24;
    -[HMMTRDescriptorClusterManager fetchDeviceTypesForDevice:atEndpoint:callbackQueue:completionHandler:](self, "fetchDeviceTypesForDevice:atEndpoint:callbackQueue:completionHandler:", v32, v25, v33, v26);

  }
  else
  {
    ((void (**)(_QWORD, id, id))v23)[2](v23, v16, v17);
  }

}

- (void)fetchDeviceTypesForEndpoints:(id)a3 mtrDevice:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  HMMTRDescriptorClusterManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke;
  v35[3] = &unk_250F216C8;
  v35[4] = self;
  v21 = v18;
  v36 = v21;
  v22 = v19;
  v37 = v22;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x242656B10](v35);
  if (objc_msgSend(v14, "count"))
  {
    if (!v16)
      v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v14, "popFirstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2;
    v26[3] = &unk_250F216F0;
    v27 = v17;
    v28 = self;
    v29 = v24;
    v16 = v16;
    v30 = v16;
    v31 = v14;
    v32 = v15;
    v33 = v21;
    v34 = v22;
    v25 = v24;
    -[HMMTRDescriptorClusterManager fetchDeviceTypesWithMTRDevice:atEndpoint:callbackQueue:completionHandler:](self, "fetchDeviceTypesWithMTRDevice:atEndpoint:callbackQueue:completionHandler:", v32, v25, v33, v26);

  }
  else
  {
    ((void (**)(_QWORD, id, id))v23)[2](v23, v16, v17);
  }

}

- (void)_updateOTARequestorEndpointsInTopology:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__5871;
  v26[4] = __Block_byref_object_dispose__5872;
  v27 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", v12);
  v25 = _HMFThreadLocalAsyncContextPush();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_250F21718;
  v24 = v26;
  v16 = v10;
  v23 = v16;
  -[HMMTRDescriptorClusterManager runBlockForAllEndpointsWithClusterID:mtrDevice:callbackQueue:block:](self, "runBlockForAllEndpointsWithClusterID:mtrDevice:callbackQueue:block:", &unk_250F3F7F8, v11, v12, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke_2;
  v20[3] = &unk_250F21740;
  v20[4] = self;
  v18 = v13;
  v21 = v18;
  v19 = (id)objc_msgSend(v17, "finally:", v20);

  _HMFThreadLocalAsyncContextPop();
  _Block_object_dispose(v26, 8);

}

- (void)fetchHAPServicesForEndpoints:(id)a3 endpointDeviceTypes:(id)a4 device:(id)a5 nodeId:(id)a6 isBridge:(BOOL)a7 bridgeAggregateNodeEndpoint:(id)a8 server:(id)a9 topology:(id)a10 hapAccessoryInfo:(id)a11 callbackQueue:(id)a12 completionHandler:(id)a13
{
  id v18;
  id v19;
  HMMTRMutableDeviceTopology *v20;
  HMMTRHAPAccessoryInfo *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMMTRMutableDeviceTopology *v36;
  HMMTRMutableDeviceTopology *v37;
  HMMTRMutableDeviceTopology *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMMTRHAPDescriptionAtEndpoint *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _BOOL4 v50;
  HMMTRDescriptorClusterManager *v51;
  HMMTRHAPAccessoryInfo *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  HMMTRMutableDeviceTopology *v59;
  HMMTRDescriptorClusterManager *v60;
  id v61;
  id v62;
  HMMTRHAPAccessoryInfo *v63;
  id v64;
  id v65;
  BOOL v66;
  _QWORD v67[5];
  id v68;
  HMMTRMutableDeviceTopology *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  HMMTRHAPAccessoryInfo *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  BOOL v81;
  _QWORD v82[4];
  id v83;
  id v84;

  v50 = a7;
  v18 = a3;
  v19 = a4;
  v49 = a5;
  v48 = a6;
  v47 = a8;
  v46 = a9;
  v20 = (HMMTRMutableDeviceTopology *)a10;
  v21 = (HMMTRHAPAccessoryInfo *)a11;
  v22 = a12;
  v23 = a13;
  v51 = self;
  -[HMMTRDescriptorClusterManager protocolMap](self, "protocolMap");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hapToCHIPClusterMappingArray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke;
  v82[3] = &unk_250F230A8;
  v26 = v22;
  v83 = v26;
  v27 = v23;
  v84 = v27;
  v53 = (void *)MEMORY[0x242656B10](v82);
  v55 = v19;
  v56 = v25;
  v54 = v27;
  v57 = v26;
  if (objc_msgSend(v18, "count"))
  {
    if (!v20)
      v20 = objc_alloc_init(HMMTRMutableDeviceTopology);
    v28 = v19;
    if (!v21)
    {
      v29 = (void *)objc_opt_new();
      v21 = -[HMMTRHAPAccessoryInfo initWithType:]([HMMTRHAPAccessoryInfo alloc], "initWithType:", v29);

    }
    objc_msgSend(v18, "popFirstObject");
    v30 = v18;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v31);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_3;
    v67[3] = &unk_250F217B8;
    v67[4] = v51;
    v68 = v31;
    v69 = v20;
    v70 = v24;
    v71 = v28;
    v72 = v49;
    v73 = v26;
    v52 = v21;
    v74 = v52;
    v75 = v25;
    v81 = v50;
    v32 = v47;
    v76 = v47;
    v33 = v46;
    v77 = v46;
    v78 = v30;
    v34 = v48;
    v79 = v48;
    v35 = v54;
    v80 = v54;
    v36 = v31;
    v18 = v30;
    v37 = v36;
    v38 = v69;
    objc_msgSend(v70, "servicesOfMTRDevice:forDeviceTypes:endpoint:callbackQueue:completionHandler:", v72, v45, v36, v73, v67);

    v39 = v49;
    v40 = v53;
  }
  else
  {
    if (v50)
    {
      v32 = v47;
      if (!v20)
      {
        if (objc_msgSend(v18, "count"))
          v20 = 0;
        else
          v20 = objc_alloc_init(HMMTRMutableDeviceTopology);
      }
      v41 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "arrayWithObject:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v46;
      if (v47)
      {
        -[HMMTRMutableDeviceTopology setHAPCategories:atEndpoint:](v20, "setHAPCategories:atEndpoint:", v43, v47);
        v44 = -[HMMTRHAPDescriptionAtEndpoint initWithType:serviceDescriptions:]([HMMTRHAPDescriptionAtEndpoint alloc], "initWithType:serviceDescriptions:", v43, 0);
        -[HMMTRHAPAccessoryInfo setAccessoryInfo:forEndpoint:](v21, "setAccessoryInfo:forEndpoint:", v44, v47);

      }
      v34 = v48;
      v39 = v49;
    }
    else
    {
      v34 = v48;
      v39 = v49;
      v33 = v46;
      v32 = v47;
    }
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_202;
    v58[3] = &unk_250F217E0;
    v66 = v50;
    v38 = v20;
    v59 = v38;
    v60 = v51;
    v61 = v34;
    v62 = v33;
    v40 = v53;
    v65 = v53;
    v52 = v21;
    v63 = v52;
    v64 = v32;
    -[HMMTRDescriptorClusterManager _updateOTARequestorEndpointsInTopology:device:callbackQueue:completionHandler:](v60, "_updateOTARequestorEndpointsInTopology:device:callbackQueue:completionHandler:", v38, v39, v57, v58);

    v37 = v59;
    v35 = v54;
  }

}

- (id)fetchPartsListForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRDescriptorClusterManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRDescriptorClusterManager *v20;
  NSObject *v21;
  void *v22;
  HMMTRDescriptorClusterManager *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v14;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchPartsListForDevice: Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v12, "buildClusterDescriptorWithDevice:endpointID:queue:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v15, "readAttributePartsListWithParams:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v26 = v8;
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v17, CFSTR("PartsList"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchPartsListForDevice: Retrieved the following parts list in use %@", buf, 0x16u);

    }
  }
  else
  {
    if (!objc_msgSend(v9, "isEqual:", &unk_250F3F780))
    {
      v18 = 0;
      goto LABEL_11;
    }
    v26 = v8;
    v19 = (void *)MEMORY[0x242656984]();
    v23 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@fetchPartsListForDevice: Failed to read parts list.", buf, 0xCu);

    }
    v18 = 0;
  }

  objc_autoreleasePoolPop(v19);
  v8 = v26;
LABEL_11:

  return v18;
}

- (void)fetchEndpointsForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  HMMTRDescriptorClusterManager *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRBaseClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB570]), "initWithDevice:endpoint:queue:", v10, objc_msgSend(v11, "unsignedShortValue"), v12);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __100__HMMTRDescriptorClusterManager_fetchEndpointsForDevice_endpointID_callbackQueue_completionHandler___block_invoke;
  v21[3] = &unk_250F24268;
  v22 = v11;
  v23 = v15;
  v24 = v13;
  v19 = v13;
  v20 = v11;
  objc_msgSend(v18, "readAttributePartsListWithCompletionHandler:", v21);

}

- (void)fetchEndpointsWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD);
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  void (**v26)(id, id, _QWORD);
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  HMMTRDescriptorClusterManager *v35;
  NSObject *v36;
  void (**v37)(id, id, _QWORD);
  id v38;
  void *v39;
  void *context;
  void *contexta;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, _QWORD))a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v17;
    v45 = 2112;
    v46 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v15, "buildClusterDescriptorWithDevice:endpointID:queue:", v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v18, "readAttributePartsListWithParams:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v20, CFSTR("partsList"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  v42 = v20;
  if (v23 || !objc_msgSend(v11, "isEqual:", &unk_250F3F780))
  {
    v32 = v11;
    v33 = v10;
    v34 = (void *)MEMORY[0x242656984]();
    v35 = v15;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      contexta = v18;
      v37 = v13;
      v38 = v12;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v39;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Retrieved the following endpoints in use %@", buf, 0x16u);

      v12 = v38;
      v13 = v37;
      v18 = contexta;
    }

    objc_autoreleasePoolPop(v34);
    v13[2](v13, v23, 0);
    v10 = v33;
    v11 = v32;
    v20 = v42;
  }
  else
  {
    context = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = v13;
      v27 = v12;
      v28 = v11;
      v29 = v10;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v30;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Parts list absent from cache", buf, 0xCu);

      v10 = v29;
      v11 = v28;
      v12 = v27;
      v13 = v26;
      v20 = v42;
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v13)[2](v13, 0, v31);

  }
}

- (id)fetchDeviceTypesWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRDescriptorClusterManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRDescriptorClusterManager *v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchDeviceTypesWithMTRDevice: Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve device types.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v12, "buildClusterDescriptorWithDevice:endpointID:queue:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v15, "readAttributeDeviceTypeListWithParams:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:clusterIdentifier:attributeIdentifier:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:clusterIdentifier:attributeIdentifier:forIdentify:", v17, &unk_250F3F810, &unk_250F3F828, CFSTR("DeviceList"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = v8;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchDeviceTypesWithMTRDevice: At endpoint %@, retrieved the following device types in use %@", buf, 0x20u);

      v8 = v24;
    }

    objc_autoreleasePoolPop(v19);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fetchServerClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRDescriptorClusterManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRDescriptorClusterManager *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchServerClustersForDevice: Examining MTRBaseClusterDescriptor serverlist attribute at endpoint %@ to retrieve server clusters.", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v12, "buildClusterDescriptorWithDevice:endpointID:queue:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v15, "readAttributeServerListWithParams:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v17, CFSTR("ClustersInUse"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchServerClustersForDevice: Retrieved the following server clusters %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fetchClientClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRDescriptorClusterManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRDescriptorClusterManager *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchClientClustersForDevice: Examining MTRBaseClusterDescriptor clientlist attribute at endpoint %@ to retrieve client clusters.", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v12, "buildClusterDescriptorWithDevice:endpointID:queue:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v15, "readAttributeClientListWithParams:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v17, CFSTR("ClustersInUse"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchClientClustersForDevice: Retrieved the following client clusters %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fetchClusterAttributesForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterAttributesForDevice: Examining MTRBaseClusterDescriptor attributelist attribute at endpoint %@ to retrieve cluster attributes.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F840, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("AttributeList"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterAttributesForDevice: For endpoint %@, cluster %@, retrieved the following attributes %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchClusterEventListForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterEventListForDevice: Examining MTRBaseClusterDescriptor eventlist attribute at endpoint %@ to retrieve events.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F858, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("EventList"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterEventListForDevice: For endpoint %@, cluster %@, retrieved the following events %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchClusterRevisionForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterRevisionForDevice: Examining MTRBaseClusterDescriptor cluster revision attribute at endpoint %@ to cluster revision number.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F870, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("Revision"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterRevisionForDevice: For endpoint %@, cluster %@, retrieved the revison number %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchClusterFeatureMapForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterFeatureMapForDevice: Examining MTRBaseClusterDescriptor cluster feature map attribute at endpoint %@ to retrieve feature map.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F888, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("FeatureMap"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterFeatureMapForDevice: For endpoint %@, cluster %@, retrieved the following feature map %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchClusterAcceptedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterAcceptedCommandsForDevice: Examining MTRBaseClusterDescriptor cluster acceptedCommandList attribute at endpoint %@ to retrieve accepted commands.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F8A0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("AcceptedCommands"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterAcceptedCommandsForDevice: For endpoint %@, cluster %@, retrieved the following accepted command list %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchClusterGeneratedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRDescriptorClusterManager *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterGeneratedCommandsForDevice: Examining MTRBaseClusterDescriptor cluster generated command list attribute at endpoint %@ to retrieve accepted commands.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v10, "readAttributeWithEndpointID:clusterID:attributeID:params:", v11, v12, &unk_250F3F8B8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("GeneratedCommands"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v15;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterGeneratedCommandsForDevice: For endpoint %@, cluster %@, retrieved the following generated command list %@", buf, 0x2Au);

      v13 = v26;
      v10 = v29;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)fetchDeviceTypesForDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRBaseClusterDescriptor device list at endpoint %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB570]), "initWithDevice:endpoint:queue:", v10, objc_msgSend(v11, "unsignedShortValue"), v12);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __102__HMMTRDescriptorClusterManager_fetchDeviceTypesForDevice_atEndpoint_callbackQueue_completionHandler___block_invoke;
  v21[3] = &unk_250F24268;
  v22 = v11;
  v23 = v13;
  v21[4] = v15;
  v19 = v11;
  v20 = v13;
  objc_msgSend(v18, "readAttributeDeviceListWithCompletionHandler:", v21);

}

- (void)fetchDeviceTypesWithMTRDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  HMMTRDescriptorClusterManager *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  int v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  HMMTRDescriptorClusterManager *v68;
  NSObject *v69;
  void *v70;
  HMMTRDescriptorClusterManager *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v18;
    v98 = 2112;
    v99 = v11;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRClusterDescriptor device list at endpoint %@", buf, 0x16u);

    v15 = v17;
  }

  objc_autoreleasePoolPop(v14);
  -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](v15, "buildClusterDescriptorWithDevice:endpointID:queue:", v10, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  v75 = v19;
  objc_msgSend(v19, "readAttributeDeviceTypeListWithParams:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v76 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v76 = objc_claimAutoreleasedReturnValue();
  }
  v84 = *MEMORY[0x24BDDB500];
  objc_msgSend(v21, "objectForKeyedSubscript:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqual:", *MEMORY[0x24BDDB458]))
  {
    v71 = v15;
    v73 = v11;
    v74 = v10;
    v72 = v21;
    v79 = *MEMORY[0x24BDDB518];
    objc_msgSend(v21, "objectForKeyedSubscript:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v93;
      v87 = *MEMORY[0x24BDDB478];
      v83 = *MEMORY[0x24BDDB4F8];
      v32 = *MEMORY[0x24BDDB470];
      v77 = *(_QWORD *)v93;
      v78 = v28;
      do
      {
        v33 = 0;
        v80 = v30;
        do
        {
          if (*(_QWORD *)v93 != v31)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v33);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v85 = v33;
            objc_msgSend(v34, "objectForKeyedSubscript:", v87);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v36 = v35;
            else
              v36 = 0;
            v37 = v36;

            v38 = v37;
            objc_msgSend(v37, "objectForKeyedSubscript:", v84);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v40 = v39;
            else
              v40 = 0;
            v41 = v40;

            if (objc_msgSend(v41, "isEqual:", v83))
            {
              v81 = v41;
              v82 = v38;
              objc_msgSend(v38, "objectForKeyedSubscript:", v79);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v43 = v42;
              else
                v43 = 0;
              v44 = v43;

              v90 = 0u;
              v91 = 0u;
              v88 = 0u;
              v89 = 0u;
              v45 = v44;
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
              if (v46)
              {
                v47 = v46;
                v48 = *(_QWORD *)v89;
                do
                {
                  for (i = 0; i != v47; ++i)
                  {
                    if (*(_QWORD *)v89 != v48)
                      objc_enumerationMutation(v45);
                    v50 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v50, "objectForKeyedSubscript:", v32);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v52 = (objc_opt_isKindOfClass() & 1) != 0 ? v51 : 0;
                      v53 = v52;

                      v54 = objc_msgSend(v53, "isEqual:", &unk_250F3F780);
                      if (v54)
                      {
                        objc_msgSend(v50, "objectForKeyedSubscript:", v87);
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          v56 = v55;
                        else
                          v56 = 0;
                        v57 = v56;

                        +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v57, CFSTR("deviceType"));
                        v58 = (void *)objc_claimAutoreleasedReturnValue();

                        v59 = v58;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          v60 = v59;
                        else
                          v60 = 0;
                        v61 = v60;

                        objc_msgSend(v86, "addObject:", v61);
                      }
                    }
                  }
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
                }
                while (v47);
              }

              v31 = v77;
              v28 = v78;
              v30 = v80;
              v41 = v81;
              v38 = v82;
            }

            v24 = v41;
            v33 = v85;
          }
          ++v33;
        }
        while (v33 != v30);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
      }
      while (v30);
    }

    v11 = v73;
    v10 = v74;
    v62 = v28;
    v15 = v71;
    v21 = v72;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v63 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v76;
    v76 = v63;
  }

  if (objc_msgSend(v86, "hmf_isEmpty"))
  {
    v64 = (void *)v76;
    v13[2](v13, 0, v76);
    v65 = v86;
  }
  else
  {
    v66 = v21;
    v67 = (void *)MEMORY[0x242656984]();
    v68 = v15;
    HMFGetOSLogHandle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v97 = v70;
      v98 = 2112;
      v99 = v11;
      v100 = 2112;
      v101 = v86;
      _os_log_impl(&dword_23E95B000, v69, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Got at endpoint %@ following device types in use %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v67);
    v65 = v86;
    ((void (**)(id, void *, uint64_t))v13)[2](v13, v86, 0);
    v21 = v66;
    v64 = (void *)v76;
  }

}

- (void)endpointForClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Finding endpoint for clusterID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_250F24100;
  v25 = v12;
  v26 = v13;
  v22[4] = v15;
  v23 = v10;
  v24 = v11;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v13;
  -[HMMTRDescriptorClusterManager fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:](v15, "fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:", v19, &unk_250F3F780, v18, v22);

}

- (void)endpointForClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Finding endpoint for clusterID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_250F24100;
  v25 = v12;
  v26 = v13;
  v22[4] = v15;
  v23 = v10;
  v24 = v11;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v13;
  -[HMMTRDescriptorClusterManager fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:](v15, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v19, &unk_250F3F780, v18, v22);

}

- (id)runBlockForAllEndpointsWithClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Running block on all endpoints with clusterID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __97__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_device_callbackQueue_block___block_invoke;
  v24[3] = &unk_250F21808;
  v24[4] = v15;
  v25 = *(id *)buf;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  -[HMMTRDescriptorClusterManager fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:](v15, "fetchEndpointsForDevice:endpointID:callbackQueue:completionHandler:", v21, &unk_250F3F780, v20, v24);

  return v18;
}

- (id)runBlockForAllEndpointsWithClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRDescriptorClusterManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Running block on all endpoints with clusterID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __100__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_mtrDevice_callbackQueue_block___block_invoke;
  v24[3] = &unk_250F21808;
  v24[4] = v15;
  v25 = *(id *)buf;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  -[HMMTRDescriptorClusterManager fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:](v15, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v21, &unk_250F3F780, v20, v24);

  return v18;
}

- (void)queryEndpointForClusterID:(id)a3 endpoint:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x24BDDB570];
  v16 = a6;
  v17 = a5;
  v18 = (void *)objc_msgSend([v15 alloc], "initWithDevice:endpointID:queue:", v17, v13, v16);

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __107__HMMTRDescriptorClusterManager_queryEndpointForClusterID_endpoint_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_250F231C0;
  v22[4] = self;
  v23 = v13;
  v24 = v12;
  v25 = v14;
  v19 = v12;
  v20 = v14;
  v21 = v13;
  objc_msgSend(v18, "readAttributeServerListWithCompletionHandler:", v22);

}

- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMMTRDescriptorClusterManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "popFirstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB570]), "initWithDevice:endpoint:queue:", v14, objc_msgSend(v17, "unsignedShortValue"), v15);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __110__HMMTRDescriptorClusterManager__queryEndpointsForClusterID_endpoints_device_callbackQueue_completionHandler___block_invoke;
    v24[3] = &unk_250F21830;
    v24[4] = self;
    v25 = v17;
    v30 = v16;
    v26 = v12;
    v27 = v13;
    v28 = v14;
    v29 = v15;
    v19 = v17;
    objc_msgSend(v18, "readAttributeServerListWithCompletionHandler:", v24);

  }
  else
  {
    v20 = (void *)MEMORY[0x242656984]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

}

- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMMTRDescriptorClusterManager *v25;
  NSObject *v26;
  void *v27;
  HMMTRDescriptorClusterManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *context;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "popFirstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    -[HMMTRDescriptorClusterManager buildClusterDescriptorWithDevice:endpointID:queue:](self, "buildClusterDescriptorWithDevice:endpointID:queue:", v13, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v17, "readAttributeServerListWithParams:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v19, CFSTR("serverList"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      v23 = v34;
      if (objc_msgSend(v22, "containsObject:", v34))
        v15[2](v15, v16, 0);
      else
        -[HMMTRDescriptorClusterManager _queryEndpointsForClusterID:endpoints:mtrDevice:callbackQueue:completionHandler:](self, "_queryEndpointsForClusterID:endpoints:mtrDevice:callbackQueue:completionHandler:", v34, v12, v33, v14, v15);
    }
    else
    {
      context = (void *)MEMORY[0x242656984]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v31;
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@ServerList at endpoint %@ absent from cache", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v15)[2](v15, 0, v30);

      v23 = v34;
    }

    v13 = v33;
  }
  else
  {
    v24 = (void *)MEMORY[0x242656984]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v34;
      _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v15[2](v15, 0, 0);
    v23 = v34;
  }

}

- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMTRDescriptorClusterManager *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  HMMTRDescriptorClusterManager *v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v15, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", v17);
    *(_QWORD *)buf = _HMFThreadLocalAsyncContextPush();
    v21 = (void *)MEMORY[0x24BE3F180];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke;
    v29[3] = &unk_250F218A8;
    v30 = v16;
    v31 = v17;
    v32 = v14;
    v33 = self;
    v34 = v19;
    objc_msgSend(v15, "na_map:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allSettled:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ignoreResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "resolveWithFuture:", v24);
    _HMFThreadLocalAsyncContextPop();
  }
  else
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v28;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rejectWithError:", v20);
  }

}

- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMTRDescriptorClusterManager *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE buf[12];
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v15, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", v17);
    *(_QWORD *)buf = _HMFThreadLocalAsyncContextPush();
    v21 = (void *)MEMORY[0x24BE3F180];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __143__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_mtrDevice_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke;
    v29[3] = &unk_250F218A8;
    v29[4] = self;
    v30 = v16;
    v31 = v17;
    v32 = v14;
    v33 = v19;
    objc_msgSend(v15, "na_map:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allSettled:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ignoreResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "resolveWithFuture:", v24);
    _HMFThreadLocalAsyncContextPop();
  }
  else
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v28;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rejectWithError:", v20);
  }

}

- (id)createClusterInstance
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCreateClusterInstance:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createClusterInstance, 0);
}

id __143__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_mtrDevice_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buildClusterDescriptorWithDevice:endpointID:queue:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v4, "readAttributeServerListWithParams:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v6, CFSTR("serverList"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 56)))
      v10 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@ServerList attribute at endpoint %@ absent from cache", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB570]), "initWithDevice:endpoint:queue:", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "unsignedShortValue"), *(_QWORD *)(a1 + 40));
  v17 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resolverBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readAttributeServerListWithCompletionHandler:", v6);

  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_2;
  v13[3] = &unk_250F21858;
  v14 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 64);
  v15 = v3;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3;
  v11[3] = &unk_250F21880;
  v11[4] = *(_QWORD *)(a1 + 56);
  v12 = v15;
  v8 = v15;
  objc_msgSend(v5, "then:orRecover:", v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3(v7);
  }
}

uint64_t __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

void __110__HMMTRDescriptorClusterManager__queryEndpointsForClusterID_endpoints_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
  }
  else
  {
    if (!objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(a1 + 32), "_queryEndpointsForClusterID:endpoints:device:callbackQueue:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      goto LABEL_8;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
  }
  v12();
LABEL_8:

}

void __107__HMMTRDescriptorClusterManager_queryEndpointForClusterID_endpoint_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
      v11 = *(_QWORD *)(a1 + 40);
      v16 = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v16, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v7);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at endpoint: %@", (uint8_t *)&v16, 0x20u);

    }
    goto LABEL_9;
  }
  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
  v12();

}

void __100__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_mtrDevice_callbackQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v6);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    objc_msgSend(v11, "addObjectsFromArray:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_runBlockForAllEndpointsWithClusterID:endpoints:mtrDevice:callbackQueue:finishedRunningAllBlocksPromise:block:", *(_QWORD *)(a1 + 48), v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

  }
}

void __97__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_device_callbackQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v6);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    objc_msgSend(v11, "addObjectsFromArray:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_runBlockForAllEndpointsWithClusterID:endpoints:device:callbackQueue:finishedRunningAllBlocksPromise:block:", *(_QWORD *)(a1 + 48), v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

  }
}

void __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    objc_msgSend(v11, "addObjectsFromArray:", v5);
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke_233;
    v16[3] = &unk_250F22FD0;
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v12, "_queryEndpointsForClusterID:endpoints:mtrDevice:callbackQueue:completionHandler:", v13, v11, v14, v15, v16);

  }
}

uint64_t __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    objc_msgSend(v11, "addObjectsFromArray:", v5);
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke_231;
    v16[3] = &unk_250F22FD0;
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v12, "_queryEndpointsForClusterID:endpoints:device:callbackQueue:completionHandler:", v13, v11, v14, v15, v16);

  }
}

uint64_t __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__HMMTRDescriptorClusterManager_fetchDeviceTypesForDevice_atEndpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void (*v22)(void);
  id v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_17:
    v22();
    goto LABEL_18;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_17;
  }
  v23 = v6;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Got at endpoint %@ following device type in use %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = v5;
  obj = v5;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x242656984]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v21;
          v33 = 2112;
          v34 = v17;
          _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Found device type %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(v12, "addObject:", v17);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = v23;
  v5 = v24;
LABEL_18:

}

void __100__HMMTRDescriptorClusterManager_fetchEndpointsForDevice_endpointID_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 || !objc_msgSend(*(id *)(a1 + 32), "isEqual:", &unk_250F3F780))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Retrieved the following endpoints in use %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read parts list. Error: %@", (uint8_t *)&v12, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = *(NSObject **)(a1 + 32);
  if (v12)
  {
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2;
      block[3] = &unk_250F229D8;
      v18 = v13;
      v15 = v9;
      v19 = a3;
      v16 = v10;
      v17 = v11;
      dispatch_async(v12, block);

    }
  }

}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v48 = v10;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get HAP Services from plist for endpoint:%@. Error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = v5;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = *(void **)(a1 + 48);
  objc_msgSend(v30, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHAPServiceTypes:atEndpoint:", v16, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "setHAPDisabledCharacteristics:atEndpoint:", v12, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setDeviceFeatureMapValues:atEndpoint:", v13, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setDeviceAttributeValues:atEndpoint:", v14, *(_QWORD *)(a1 + 40));
  v17 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoriesForDeviceTypes:", v18);
  v29 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 48);
  objc_msgSend(v20, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHAPCategories:atEndpoint:", v22, *(_QWORD *)(a1 + 40));

  v24 = *(void **)(a1 + 32);
  v23 = *(_QWORD *)(a1 + 40);
  v26 = *(_QWORD *)(a1 + 72);
  v25 = *(_QWORD *)(a1 + 80);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_200;
  v32[3] = &unk_250F21790;
  v33 = *(id *)(a1 + 48);
  v27 = *(id *)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 32);
  v34 = v27;
  v35 = v28;
  v36 = *(id *)(a1 + 64);
  v37 = *(id *)(a1 + 88);
  v38 = *(id *)(a1 + 96);
  v39 = *(id *)(a1 + 72);
  v46 = *(_BYTE *)(a1 + 144);
  v40 = *(id *)(a1 + 104);
  v41 = *(id *)(a1 + 112);
  v42 = *(id *)(a1 + 80);
  v43 = *(id *)(a1 + 120);
  v44 = *(id *)(a1 + 128);
  v45 = *(id *)(a1 + 136);
  objc_msgSend(v24, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v26, v23, v25, v32);

}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_202(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clustersInUse");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {

          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (*(_BYTE *)(a1 + 88))
  {
LABEL_14:
    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "protocolMap", (_QWORD)v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVersion:for:", v18, CFSTR("EnumeratedProtocolMap"));

    objc_msgSend(*(id *)(a1 + 32), "storeForNodeId:server:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x242656984]();
    v20 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v15)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2112;
        v35 = v24;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to store device(%@) topology", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 48);
        v27 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully stored device(%@) topology: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v15 = 0;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@No endpoints contain clusters, not storing topology. Enumeration will re-run next time.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v5 = a2;
  v20 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPartsList:atEndpoint:", v5, *(_QWORD *)(a1 + 40));
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 64);
  v9 = *(_BYTE *)(a1 + 136);
  v11 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 104);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2_201;
  v21[3] = &unk_250F21768;
  v21[4] = v7;
  v22 = v6;
  v23 = *(id *)(a1 + 32);
  v24 = *(id *)(a1 + 112);
  v25 = *(id *)(a1 + 56);
  v26 = *(id *)(a1 + 80);
  v27 = *(id *)(a1 + 120);
  v28 = *(id *)(a1 + 96);
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 104);
  v31 = *(id *)(a1 + 128);
  LOBYTE(v15) = v16;
  LOBYTE(v14) = v9;
  objc_msgSend(v7, "fetchHAPServicesAtCHIPEndpoint:deviceTopology:endpointDeviceTypes:accessoryInfo:hapToCHIPClusterMappingArray:device:isBridge:bridgeAggregateNodeEndpoint:isComposedDevice:server:callbackQueue:completionHandler:", v22, v19, v18, v17, v8, v11, v14, v10, v15, v12, v13, v21);

}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2_201(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to get HAP Services at Endpoint:%@. Error:%@. Error is not fatal, continuing with enumeration", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClustersInUse:atEndpoint:", v18, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "fetchHAPServicesForEndpoints:endpointDeviceTypes:device:nodeId:isBridge:bridgeAggregateNodeEndpoint:server:topology:hapAccessoryInfo:callbackQueue:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), a3, v10, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));

}

uint64_t __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  if (v6)
  {
    if (!objc_msgSend(v6, "isEqualToNumber:", v4))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
  v7 = 1;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "setOTARequestorEnabled:atEndpoint:", v7, v4);
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated OTA requestor endpoints in topology", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 1;
}

void __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling fetch Device Types completion block, error: %@, endpointDeviceTypes %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(NSObject **)(a1 + 40);
  if (v11)
  {
    v12 = *(void **)(a1 + 48);
    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_190;
      block[3] = &unk_250F240D8;
      v16 = v12;
      v14 = v5;
      v15 = v6;
      dispatch_async(v11, block);

    }
  }

}

void __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ Failed to get the device types %@. Not fatal, continuing with enumeration...", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = v6;

    v7 = v13;
  }
  else if (v5)
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ The List of device types %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "fetchDeviceTypesForEndpoints:mtrDevice:endpointDeviceTypes:lastError:callbackQueue:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

}

uint64_t __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_190(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling fetch Device Types completion block, error: %@, endpointDeviceTypes %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(NSObject **)(a1 + 40);
  if (v11)
  {
    v12 = *(void **)(a1 + 48);
    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_189;
      block[3] = &unk_250F240D8;
      v16 = v12;
      v14 = v5;
      v15 = v6;
      dispatch_async(v11, block);

    }
  }

}

void __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ Failed to get the device types %@. Not fatal, continuing with enumeration...", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = v6;

    v7 = v13;
  }
  else if (v5)
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ The List of device types %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "fetchDeviceTypesForEndpoints:device:endpointDeviceTypes:lastError:callbackQueue:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

}

uint64_t __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_189(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __90__HMMTRDescriptorClusterManager_hapServiceDescriptionsForTopology_namesDictionary_server___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v10 = *(_OWORD *)(a1 + 104);
  v11 = *(_OWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 120);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_2;
  v12[3] = &unk_250F21658;
  v12[4] = v2;
  v22 = *(id *)(a1 + 152);
  v23 = *(_BYTE *)(a1 + 160);
  v13 = *(id *)(a1 + 112);
  v14 = *(id *)(a1 + 104);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 128);
  v17 = *(id *)(a1 + 96);
  v18 = *(id *)(a1 + 136);
  v19 = *(id *)(a1 + 144);
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 64);
  v24 = *(_BYTE *)(a1 + 161);
  objc_msgSend(v2, "_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForAttributes:hapServicesToCheckForOptionalMatterAttribute:clusterAttributesSupported:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:", v3, v4, v5, v6, v7, v8, v11, v10, v9, 0, v12);

}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v25;
  void *v26;
  void *v27;
  void *context;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  char v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "getPartsListAtEndpoint:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "getFixedLabelsAtEndpoint:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_172;
    v30[3] = &unk_250F21630;
    v31 = *(id *)(a1 + 64);
    v32 = *(id *)(a1 + 72);
    v10 = v8;
    v33 = v10;
    v11 = v9;
    v34 = v11;
    v35 = *(id *)(a1 + 80);
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v36 = v12;
    v37 = v13;
    v38 = *(id *)(a1 + 48);
    v40 = *(id *)(a1 + 112);
    v41 = *(_BYTE *)(a1 + 120);
    v39 = *(id *)(a1 + 40);
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x242656B10](v30);
    if (objc_msgSend(*(id *)(a1 + 88), "indexOfObject:", &unk_250F3F7C8) == 0x7FFFFFFFFFFFFFFFLL
      || !*(_BYTE *)(a1 + 120))
    {
      if (objc_msgSend(*(id *)(a1 + 88), "indexOfObject:", &unk_250F3F7E0) == 0x7FFFFFFFFFFFFFFFLL
        || *(_BYTE *)(a1 + 120)
        || *(_BYTE *)(a1 + 121))
      {
        v14[2](v14, 0);
        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 32), "createClusterInstance");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD, _QWORD))v24)[2](v24, CFSTR("MTRClusterBasic"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v16, "readAttributeNodeLabelWithParams:", v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v18, CFSTR("nodeLabel"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v19;
      else
        v26 = 0;
      v21 = v26;

      if (v21)
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 48), "setNodeLabel:atEndpoint:", v21, *(_QWORD *)(a1 + 56), v27);
        ((void (**)(_QWORD, id))v14)[2](v14, v21);

LABEL_19:
        goto LABEL_20;
      }
      v29 = v16;
      context = (void *)MEMORY[0x242656984]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        objc_autoreleasePoolPop(context);
        v16 = v29;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "createClusterInstance");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD, _QWORD))v15)[2](v15, CFSTR("MTRClusterBridgedDeviceBasic"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v16, "readAttributeNodeLabelWithParams:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v18, CFSTR("nodeLabel"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (v21)
        goto LABEL_14;
      v29 = v16;
      context = (void *)MEMORY[0x242656984]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
    }
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v27;
    _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attribute node label absent from cache", buf, 0xCu);

    goto LABEL_13;
  }
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v7;
    v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@HAP characteristics support verification failed with error : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
LABEL_20:

}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  HMMTRHAPDescriptionAtEndpoint *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[HMMTRHAPDescriptionAtEndpoint initWithType:serviceDescriptions:name:partsList:fixedLabels:]([HMMTRHAPDescriptionAtEndpoint alloc], "initWithType:serviceDescriptions:name:partsList:fixedLabels:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 64), "setAccessoryInfo:forEndpoint:", v4, *(_QWORD *)(a1 + 72)));
  v6 = *(id *)(a1 + 80);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 88);
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updated topology : %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

}

void __328__HMMTRDescriptorClusterManager__verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForAttributes_hapServicesToCheckForOptionalMatterAttribute_clusterAttributesSupported_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to get device attribute list for cluster class name %@ at endpoint %@. Error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "protocolMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mtrBaseClusterNameFromMTRClusterName:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v16);
  }
  objc_msgSend(*(id *)(a1 + 32), "_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForAttributes:hapServicesToCheckForOptionalMatterAttribute:clusterAttributesSupported:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), 0, *(_QWORD *)(a1 + 128));

}

void __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v38 = v13;
      v39 = 2112;
      v40 = v7;
      v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to get device feature map value for cluster class name %@ at endpoint %@. Ignoring feature map errors", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);

    v8 = &unk_250F3F780;
  }
  objc_msgSend(*(id *)(a1 + 32), "protocolMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mtrBaseClusterNameFromMTRClusterName:", v7);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v7;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 48), "addDeviceFeatureMapValue:clusterClassName:atEndpoint:", v8, v19, *(_QWORD *)(a1 + 40));
  v21 = *(void **)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 64);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke_158;
  v25[3] = &unk_250F215B8;
  v25[4] = v21;
  v26 = v20;
  v27 = *(id *)(a1 + 56);
  v28 = *(id *)(a1 + 72);
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 80);
  v31 = *(id *)(a1 + 88);
  v32 = *(id *)(a1 + 96);
  v33 = *(id *)(a1 + 48);
  v34 = *(id *)(a1 + 104);
  v35 = *(id *)(a1 + 112);
  v36 = *(id *)(a1 + 120);
  objc_msgSend(v21, "_populateAttributeValuesForClusterClassName:clusterClassFeatureMap:endpoint:device:deviceTopology:callbackQueue:completionHandler:", v7, v8, v26, v22, v23, v24, v25);

}

uint64_t __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke_158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verifyHAPCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForFeatureMap:hapServicesToCheckForFeatureMap:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), 0, *(_QWORD *)(a1 + 120));
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    v8 = (void *)MEMORY[0x242656984](objc_msgSend(v7, "addObjectsFromArray:", v5));
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_msgSend(v7, "mutableCopy");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_102;
    v20[3] = &unk_250F21590;
    v14 = *(_QWORD *)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v12, "fetchDeviceTypesForEndpoints:mtrDevice:endpointDeviceTypes:lastError:callbackQueue:completionHandler:", v13, v14, 0, 0, v15, v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
      goto LABEL_9;
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_38:
    v35();
    goto LABEL_39;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v10;
    v54 = 2112;
    v55 = v6;
    v56 = 2112;
    v57 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v5)
  {
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_38;
  }
  v11 = (void *)MEMORY[0x242656984]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v14;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
LABEL_9:
  v15 = (void *)MEMORY[0x242656984]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v18;
    v54 = 2112;
    v55 = v5;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(*(id *)(a1 + 32), "protocolMap");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v5;
  v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v39)
  {

    v20 = 0;
LABEL_35:
    v36 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v34);
    goto LABEL_36;
  }
  v20 = 0;
  v40 = 0;
  v21 = *(_QWORD *)v47;
  v37 = *(_QWORD *)v47;
  v38 = v6;
  do
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v47 != v21)
        objc_enumerationMutation(v19);
      v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_msgSend(v19, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v43;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v43 != v28)
              objc_enumerationMutation(v25);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "integerValue") == 14)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

              v6 = v38;
              goto LABEL_39;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v27)
            continue;
          break;
        }
      }

      objc_msgSend(v41, "categoriesForDeviceTypes:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
      {
        if (!v20
          || (v31 = objc_msgSend(v23, "unsignedShortValue"), v31 < objc_msgSend(v20, "unsignedShortValue")))
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
          v32 = objc_claimAutoreleasedReturnValue();

          v33 = v23;
          v20 = v33;
          v40 = (void *)v32;
        }
      }

      v21 = v37;
    }
    v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  }
  while (v39);

  v34 = v40;
  if (!v40)
  {
    v6 = v38;
    goto LABEL_35;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = v38;
LABEL_36:

LABEL_39:
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    v8 = (void *)MEMORY[0x242656984](objc_msgSend(v7, "addObjectsFromArray:", v5));
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_msgSend(v7, "mutableCopy");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_98;
    v20[3] = &unk_250F21590;
    v14 = *(_QWORD *)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v12, "fetchDeviceTypesForEndpoints:device:endpointDeviceTypes:lastError:callbackQueue:completionHandler:", v13, v14, 0, 0, v15, v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
      goto LABEL_9;
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_38:
    v35();
    goto LABEL_39;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v10;
    v54 = 2112;
    v55 = v6;
    v56 = 2112;
    v57 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v5)
  {
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_38;
  }
  v11 = (void *)MEMORY[0x242656984]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v14;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
LABEL_9:
  v15 = (void *)MEMORY[0x242656984]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v18;
    v54 = 2112;
    v55 = v5;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  +[HMMTRProtocolMap protocolMap](HMMTRProtocolMap, "protocolMap");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v5;
  v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v39)
  {

    v20 = 0;
LABEL_35:
    v36 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v34);
    goto LABEL_36;
  }
  v20 = 0;
  v40 = 0;
  v21 = *(_QWORD *)v47;
  v37 = *(_QWORD *)v47;
  v38 = v6;
  do
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v47 != v21)
        objc_enumerationMutation(v19);
      v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_msgSend(v19, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v43;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v43 != v28)
              objc_enumerationMutation(v25);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "integerValue") == 14)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

              v6 = v38;
              goto LABEL_39;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v27)
            continue;
          break;
        }
      }

      objc_msgSend(v41, "categoriesForDeviceTypes:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
      {
        if (!v20
          || (v31 = objc_msgSend(v23, "unsignedShortValue"), v31 < objc_msgSend(v20, "unsignedShortValue")))
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
          v32 = objc_claimAutoreleasedReturnValue();

          v33 = v23;
          v20 = v33;
          v40 = (void *)v32;
        }
      }

      v21 = v37;
    }
    v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  }
  while (v39);

  v34 = v40;
  if (!v40)
  {
    v6 = v38;
    goto LABEL_35;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = v38;
LABEL_36:

LABEL_39:
}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    v8 = (void *)MEMORY[0x242656984](objc_msgSend(v7, "addObjectsFromArray:", v5));
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_msgSend(v7, "mutableCopy");
    v15 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_94;
    v20[3] = &unk_250F21540;
    v20[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 72);
    v27 = *(_OWORD *)(a1 + 80);
    v21 = v5;
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 48);
    objc_msgSend(v12, "fetchDeviceTypesForEndpoints:mtrDevice:endpointDeviceTypes:lastError:callbackQueue:completionHandler:", v13, v15, 0, 0, v14, v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543874;
      v59 = v10;
      v60 = 2112;
      v61 = v6;
      v62 = 2112;
      v63 = v5;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (!v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      goto LABEL_35;
    }
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    v38 = v6;
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v18;
      v60 = 2112;
      v61 = v5;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v39 = v5;
    v19 = v5;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v53 != v22)
            objc_enumerationMutation(v19);
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          {
            v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v19, "objectForKey:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v26 = v25;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v49;
              while (2)
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v49 != v29)
                    objc_enumerationMutation(v26);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "integerValue") == 14)
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
                    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v24);
                    goto LABEL_27;
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                if (v28)
                  continue;
                break;
              }
            }
LABEL_27:

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v21);
    }

    v6 = v38;
    v5 = v39;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v31 = *(void **)(a1 + 32);
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_95;
    v40[3] = &unk_250F21518;
    v40[4] = v31;
    v34 = *(_QWORD *)(a1 + 72);
    v46 = *(id *)(a1 + 80);
    v47 = *(_OWORD *)(a1 + 88);
    v41 = v5;
    v42 = *(id *)(a1 + 48);
    v43 = *(id *)(a1 + 56);
    v44 = *(id *)(a1 + 64);
    v45 = *(id *)(a1 + 72);
    objc_msgSend(v31, "fetchEndpointsWithMTRDevice:endpointID:callbackQueue:completionHandler:", v32, v33, v34, v40);

  }
  else
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_250F3F780, 0);
    objc_msgSend(v35, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    v36 = *(void **)(a1 + 32);
    v37 = (void *)objc_msgSend(v35, "mutableCopy");
    objc_msgSend(v36, "fetchHAPServicesForEndpoints:endpointDeviceTypes:device:nodeId:isBridge:bridgeAggregateNodeEndpoint:server:topology:hapAccessoryInfo:callbackQueue:completionHandler:", v37, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), 0, *(_QWORD *)(a1 + 64), 0, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

  }
LABEL_35:

}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Endpoints In Use for the bridge: %@. Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "getBridgeEndpointsDeviceTypes:endpointDeviceTypes:", v5, *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchHAPServicesForEndpoints:endpointDeviceTypes:device:nodeId:isBridge:bridgeAggregateNodeEndpoint:server:topology:hapAccessoryInfo:callbackQueue:completionHandler:", v13, v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 64), 0, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the endpoints for the aggregate node (bridge) endpoint: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

id __37__HMMTRDescriptorClusterManager_init__block_invoke(uint64_t a1, NSString *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc(NSClassFromString(a2)), "initWithDevice:endpointID:queue:", v10, v9, v8);

  return v11;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_27);
  return (id)cachedDescriptorClusterManager;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t173 != -1)
    dispatch_once(&logCategory__hmf_once_t173, &__block_literal_global_238);
  return (id)logCategory__hmf_once_v174;
}

void __44__HMMTRDescriptorClusterManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v174;
  logCategory__hmf_once_v174 = v0;

}

void __46__HMMTRDescriptorClusterManager_sharedManager__block_invoke()
{
  HMMTRDescriptorClusterManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMMTRDescriptorClusterManager);
  v1 = (void *)cachedDescriptorClusterManager;
  cachedDescriptorClusterManager = (uint64_t)v0;

}

@end
