@implementation DSCohortManager

- (void)deviceFound:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[DSCohortManager _deviceFound:](self, "_deviceFound:", v5);

}

- (void)deviceLost:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[DSCohortManager _deviceLost:](self, "_deviceLost:", v5);

}

- (void)_deviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *devices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  __objc2_meth_list **p_opt_inst_meths;
  __objc2_meth_list **v12;
  DSDeviceContext *v13;
  NSObject *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  id v32;
  NSObject *v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  NSObject *v37;
  DSConsensusDataManager *v38;
  DSConsensusDataManager *dataManager;
  DSConsensusDatum *v40;
  uint64_t v41;
  void *v42;
  DSConsensusDatum *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD);
  NSObject *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  _BYTE v72[10];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    devices = self->_devices;
    if (!devices)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_devices;
      self->_devices = v8;

      devices = self->_devices;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    p_opt_inst_meths = &OBJC_PROTOCOL___DSProviderClientProtocol.opt_inst_meths;
    v12 = &OBJC_PROTOCOL___DSProviderClientProtocol.opt_inst_meths;
    if (v10)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6);
      v13 = (DSDeviceContext *)objc_claimAutoreleasedReturnValue();
      if (onceTokenDSCohortManager != -1)
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      v14 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v72 = v6;
        _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "Updating device with ID: %@", buf, 0xCu);
      }
      -[DSDeviceContext updateWithCBDevice:](v13, "updateWithCBDevice:", v5);
      v15 = -[DSDeviceContext changedFlag](v13, "changedFlag");
      v59 = v6;
      if (onceTokenDSCohortManager != -1)
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      v16 = v15 & 2;
      v17 = v15 & 4;
      v18 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v72 = v16 >> 1;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = v17 >> 2;
        _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, "Changed DSInfo: %d, DSAction %d", buf, 0xEu);
      }
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      -[DSXPCServer xpcConnections](self->_xpcDaemonServer, "xpcConnections", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v66 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(v24, "motionSession");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
              v26 = v16 == 0;
            else
              v26 = 1;
            if (v26)
            {
              objc_msgSend(v24, "kappaSession");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
                v28 = v17 == 0;
              else
                v28 = 1;
              if (v28)
                continue;
              objc_msgSend(v24, "kappaSession");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v24, "motionSession");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v30 = v29;
            objc_msgSend(v29, "deviceChangedHandler");
            v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              ((void (**)(_QWORD, DSDeviceContext *))v31)[2](v31, v13);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v21);
      }

      v32 = 0;
      v12 = (__objc2_meth_list **)(&OBJC_PROTOCOL___DSProviderClientProtocol + 40);
      p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___DSProviderClientProtocol + 40);
    }
    else
    {
      if (onceTokenDSCohortManager != -1)
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      v33 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v72 = v6;
        _os_log_impl(&dword_217E3C000, v33, OS_LOG_TYPE_DEFAULT, "Adding device with ID: %@", buf, 0xCu);
      }
      v64 = 0;
      v13 = -[DSDeviceContext initWithCBDevice:error:]([DSDeviceContext alloc], "initWithCBDevice:error:", v5, &v64);
      v32 = v64;
      if (!v13)
      {
        if (onceTokenDSCohortManager != -1)
          dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
        v57 = logObjDSCohortManager;
        if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v72 = v32;
          _os_log_impl(&dword_217E3C000, v57, OS_LOG_TYPE_DEFAULT, "Failed to init DSDeviceContext with error : %@", buf, 0xCu);
        }
LABEL_69:

        goto LABEL_70;
      }
      v58 = v5;
      v59 = v6;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v13, v6);
    }
    v34 = -[DSDeviceContext discoveryFlag](v13, "discoveryFlag");
    v35 = v34 & 2;
    if (p_opt_inst_meths[39] != (__objc2_meth_list *)-1)
      dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
    v36 = v34 & 4;
    v37 = v12[38];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v72 = v35 >> 1;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = v36 >> 2;
      _os_log_impl(&dword_217E3C000, v37, OS_LOG_TYPE_DEFAULT, "Discovered DSInfo: %d, DSAction %d", buf, 0xEu);
    }
    if (v35)
    {
      if (!self->_dataManager)
      {
        v38 = -[DSConsensusDataManager initWithWindowOfInterest:]([DSConsensusDataManager alloc], "initWithWindowOfInterest:", 15.0);
        dataManager = self->_dataManager;
        self->_dataManager = v38;

      }
      v40 = [DSConsensusDatum alloc];
      v41 = -[DSDeviceContext vehicleConfidence](v13, "vehicleConfidence");
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[DSConsensusDatum initWithIdentifier:andConfidence:atTime:](v40, "initWithIdentifier:andConfidence:atTime:", v59, v41, v42);

      if (v43)
        -[DSConsensusDataManager addDatum:](self->_dataManager, "addDatum:", v43);

    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[DSXPCServer xpcConnections](self->_xpcDaemonServer, "xpcConnections");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v61 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v49, "motionSession");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
            v51 = v35 == 0;
          else
            v51 = 1;
          if (!v51)
          {
            objc_msgSend(v49, "motionSession");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_64;
          }
          objc_msgSend(v49, "kappaSession");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
            v53 = v36 == 0;
          else
            v53 = 1;
          if (!v53)
          {
            objc_msgSend(v49, "kappaSession");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:
            v55 = v54;
            objc_msgSend(v54, "deviceFoundHandler");
            v56 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              ((void (**)(_QWORD, DSDeviceContext *))v56)[2](v56, v13);

            }
            continue;
          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v46);
    }

    v5 = v58;
    v6 = v59;
    goto LABEL_69;
  }
LABEL_70:

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (onceTokenDSCohortManager != -1)
      dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
    v6 = logObjDSCohortManager;
    if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "Removing device with ID: %@", buf, 0xCu);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
  }
  v7 = objc_msgSend(v5, "dsInfoIsAlreadyFound");
  v8 = objc_msgSend(v5, "dsActionIsAlreadyFound");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[DSXPCServer xpcConnections](self->_xpcDaemonServer, "xpcConnections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "motionSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          v16 = v7 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v14, "motionSession");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        objc_msgSend(v14, "kappaSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          v18 = v8 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v14, "kappaSession");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          v20 = v19;
          objc_msgSend(v19, "deviceLostHandler");
          v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            ((void (**)(_QWORD, void *))v21)[2](v21, v5);

          }
          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

- (void)printConsensusData
{
  DSConsensusDataManager *dataManager;

  dataManager = self->_dataManager;
  if (dataManager)
    -[DSConsensusDataManager printConsensusData](dataManager, "printConsensusData");
}

- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4
{
  DSConsensusDataManager *dataManager;

  dataManager = self->_dataManager;
  if (dataManager)
    -[DSConsensusDataManager printConsensusDataFromWindowStart:ToWindowEnd:](dataManager, "printConsensusDataFromWindowStart:ToWindowEnd:", a3, a4);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDaemonServer, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

@end
