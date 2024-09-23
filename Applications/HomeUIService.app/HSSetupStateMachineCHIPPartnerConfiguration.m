@implementation HSSetupStateMachineCHIPPartnerConfiguration

- (HFSetupAccessoryResult)setupResult
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)HFSetupAccessoryResult);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryPayload"));
  v6 = objc_msgSend(v3, "initWithPayload:", v5);

  return (HFSetupAccessoryResult *)v6;
}

- (void)setSetupResult:(id)a3
{
  HFSetupAccessoryResult *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  HFSetupAccessoryResult *setupResult;
  HFSetupAccessoryResult *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  HFSetupAccessoryResult *v21;

  v5 = (HFSetupAccessoryResult *)a3;
  v7 = HFLogForCategory(58, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", buf, 0xCu);
  }

  if (-[HSSetupStateMachineCHIPPartnerConfiguration phase](self, "phase"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", -[HSSetupStateMachineCHIPPartnerConfiguration phase](self, "phase")));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupStateMachineConfiguration.m"), 207, CFSTR("HFSetupAutomaticDiscoveryPairingController can't handle changing the setup result (payload) after pairing has already started. Set the setup result before calling -startWithHome:, and create a new pairing controller if you need to change it later. Current phase = %@"), v19);

  }
  setupResult = self->_setupResult;
  self->_setupResult = v5;
  v10 = v5;

  v11 = objc_alloc((Class)HFDiscoveredAccessory);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HFSetupAccessoryResult setupPayload](v10, "setupPayload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HFSetupAccessoryResult setupPayload](v10, "setupPayload"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "category"));
  v17 = objc_msgSend(v11, "initWithAccessoryUUID:accessoryName:accessoryCategory:", v12, v14, v16);
  -[HSSetupStateMachineCHIPPartnerConfiguration setDiscoveredAccessoryToPair:](self, "setDiscoveredAccessoryToPair:", v17);

}

- (void)setDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HSSetupStateMachineCHIPPartnerConfiguration;
  -[HSSetupStateMachineConfiguration setDelegate:](&v10, "setDelegate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topology"));

  if (!v5)
    NSLog(CFSTR("Initialized a CHIPPartnerConfig w/o a partner topology, this shouldn't be possible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homes"));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    -[HSSetupStateMachineCHIPPartnerConfiguration setSelectedPartnerHome:](self, "setSelectedPartnerHome:", v9);

  }
}

- (id)roomName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration selectedPartnerRoom](self, "selectedPartnerRoom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return v3;
}

- (HSMatterEcosystem)targetEcosystem
{
  HSMatterEcosystem *targetEcosystem;
  void *v4;
  void *v5;
  uint64_t v6;
  HSMatterEcosystem *v7;
  uint64_t v8;
  NSObject *v9;
  HSMatterEcosystem *v10;

  targetEcosystem = self->_targetEcosystem;
  if (!targetEcosystem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appBundleURL"));

    if (!v5)
      NSLog(CFSTR("%s Failed to create target ecosystem because the bundle URL of the partner app is missing"), "-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem]");
    v7 = (HSMatterEcosystem *)objc_claimAutoreleasedReturnValue(+[HSMatterEcosystem ecosystemForContainingAppBundleURL:](HSMatterEcosystem, "ecosystemForContainingAppBundleURL:", v5));
    if (!v7)
    {
      v8 = HFLogForCategory(58, v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10005E7A8();

    }
    v10 = self->_targetEcosystem;
    self->_targetEcosystem = v7;

    targetEcosystem = self->_targetEcosystem;
  }
  return targetEcosystem;
}

- (id)updateUserGivenAccessoryName:(id)a3
{
  -[HSSetupStateMachineConfiguration setUserGivenAccessoryName:](self, "setUserGivenAccessoryName:", a3);
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (id)stageCHIPAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  HSSetupStateMachineCHIPPartnerConfiguration *v31;
  id v32;
  unsigned __int8 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeManager"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessorySetupCoordinator"));
  -[HSSetupStateMachineCHIPPartnerConfiguration setPhase:](self, "setPhase:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagedCHIPPairingIdentifier](self, "stagedCHIPPairingIdentifier"));

  if (v6)
  {
    v8 = HFLogForCategory(58, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagedCHIPPairingIdentifier](self, "stagedCHIPPairingIdentifier"));
      *(_DWORD *)buf = 136315394;
      v35 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]";
      v36 = 2112;
      v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s CHIP accessory is known to system commissioner with identifier %@ - skipping staging", buf, 0x16u);

    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagedCHIPPairingIdentifier](self, "stagedCHIPPairingIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setupAccessoryPayload"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
    v15 = objc_msgSend(v14, "shouldScanNetworks");

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10001B248;
      v28[3] = &unk_1000A1888;
      v11 = v11;
      v29 = v11;
      v33 = v15;
      v30 = v5;
      v31 = self;
      objc_copyWeak(&v32, (id *)buf);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v28));
      objc_destroyWeak(&v32);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v17 = HFLogForCategory(58, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005E814(v18, v19, v20, v21, v22, v23, v24, v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v26));

    }
  }

  return v12;
}

- (id)pairStagedCHIPAccessoryToPartnerAppHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeManager"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessorySetupCoordinator"));
  if (!-[HSSetupStateMachineCHIPPartnerConfiguration phase](self, "phase"))
    -[HSSetupStateMachineCHIPPartnerConfiguration setPhase:](self, "setPhase:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem](self, "targetEcosystem"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagedCHIPPairingIdentifier](self, "stagedCHIPPairingIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateMachineConfigurationGetSetupCode:", self));

    v12 = HFLogForCategory(58, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem](self, "targetEcosystem"));
      *(_DWORD *)buf = 136315906;
      v52 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
      v53 = 2112;
      v54 = v8;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s pairingIdentifier %@, setupCode %@, ecosystem %@. Unless this is an accessory previously paired to system commissioner, it will fail to pair to to partner app because it doesn't have a staged identifier", buf, 0x2Au);

    }
    if (v8)
    {
      v16 = HFLogForCategory(58, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v52 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Creating CHIP setup payload with pairingIdentifier", buf, 0xCu);
      }

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10001BAF4;
      v48[3] = &unk_1000A18B0;
      v49 = v5;
      v50 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v48));

    }
    else
    {
      v29 = HFLogForCategory(58, v15);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = v30;
      if (v10)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Using setup code as payload string", buf, 0xCu);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v10));
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_10005E960(v31, v32, v33, v34, v35, v36, v37, v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v39));

      }
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration selectedPartnerHome](self, "selectedPartnerHome"));
    v42 = HFLogForCategory(58, v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
      v53 = 2112;
      v54 = v40;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s selectedPartnerHome %@", buf, 0x16u);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10001BB04;
    v46[3] = &unk_1000A1940;
    v46[4] = self;
    v47 = v40;
    v44 = v40;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "flatMap:", v46));

  }
  else
  {
    v19 = HFLogForCategory(58, v7);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10005E8F0(v20, v21, v22, v23, v24, v25, v26, v27);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 30));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v8));
  }

  return v28;
}

- (void)_updateAccessoryNameWithCHIPPairingIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)MTSSystemCommissionerPairingManager);
  -[HSSetupStateMachineConfiguration setPairingManager:](self, "setPairingManager:", v5);

  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration pairingManager](self, "pairingManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001BF0C;
  v8[3] = &unk_1000A1990;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "fetchPairingsWithCompletionHandler:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (id)cancelStagingForCHIPPairing
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagedCHIPPairingIdentifier](self, "stagedCHIPPairingIdentifier"));

  if (v3)
  {
    v5 = HFLogForCategory(58, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
      v7 = "%s did not cancel staging - the accessory is already staged.";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));

    if (!v10)
    {
      v15 = HFLogForCategory(58, v11);
      v6 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      *(_DWORD *)buf = 136315138;
      v28 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
      v7 = "%s did not cancel staging as there is no stagingRequestUUID";
      goto LABEL_4;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));

    if (!v12)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "homeManager"));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10001C44C;
      v24[3] = &unk_1000A19B8;
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accessorySetupCoordinator"));
      v18 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));
      v26 = v18;
      v19 = v25;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v24));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001C45C;
      v22[3] = &unk_1000A0D90;
      v23 = v18;
      v20 = v18;
      v21 = objc_msgSend(v8, "addCompletionBlock:", v22);

      return v8;
    }
    v14 = HFLogForCategory(58, v13);
    v6 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
      v7 = "%s Accessory was already paired to Apple Home, no need to cancel staging.  Noop";
      goto LABEL_4;
    }
  }
LABEL_5:

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v8;
}

- (void)didReceiveDeviceCredential:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessorySetupCoordinator"));
  v11 = objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));
    v14 = objc_msgSend(v13, "hmf_isEqualToUUID:", v7);

    if ((v14 & 1) == 0)
      NSLog(CFSTR("%s received stagingRequestUUID that does not match"), "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]");
  }
  -[HSSetupStateMachineCHIPPartnerConfiguration setStagingRequestUUID:](self, "setStagingRequestUUID:", v7);
  v16 = HFLogForCategory(58, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]";
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Received and validating device credential: %@ staging request UUID: %@", buf, 0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem](self, "targetEcosystem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "extensionMessenger"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001C764;
  v23[3] = &unk_1000A19E0;
  v24 = v6;
  v25 = v10;
  v26 = v7;
  v20 = v7;
  v21 = v10;
  v22 = v6;
  objc_msgSend(v19, "validateDeviceCredential:completionHandler:", v22, v23);

}

- (void)didReceiveThreadScanResults:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessorySetupCoordinator"));
  v12 = HFLogForCategory(58, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveThreadScanResults:forStagingRequestUUID:]";
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Selecting Thread network from scan results: %@", buf, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem](self, "targetEcosystem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensionMessenger"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001CA14;
  v18[3] = &unk_1000A1A08;
  v19 = v10;
  v20 = v7;
  v16 = v7;
  v17 = v10;
  objc_msgSend(v15, "selectThreadNetworkFromScanResults:completionHandler:", v6, v18);

}

- (void)didReceiveWiFiScanResults:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessorySetupCoordinator"));
  v12 = HFLogForCategory(58, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveWiFiScanResults:forStagingRequestUUID:]";
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Selecting WiFi network from scan results: %@", buf, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem](self, "targetEcosystem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensionMessenger"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001CCC8;
  v18[3] = &unk_1000A1A30;
  v19 = v10;
  v20 = v7;
  v16 = v7;
  v17 = v10;
  objc_msgSend(v15, "selectWiFiNetworkFromScanResults:completionHandler:", v6, v18);

}

- (void)didUpdateProgress:(int64_t)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration stagingRequestUUID](self, "stagingRequestUUID"));
    v10 = objc_msgSend(v9, "hmf_isEqualToUUID:", v6);

    if ((v10 & 1) == 0)
      NSLog(CFSTR("%s received stagingRequestUUID that does not match"), "-[HSSetupStateMachineCHIPPartnerConfiguration didUpdateProgress:forStagingRequestUUID:]");
  }
  -[HSSetupStateMachineCHIPPartnerConfiguration setStagingRequestUUID:](self, "setStagingRequestUUID:", v6);
  v12 = HFLogForCategory(58, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = HMSetupAccessoryProgressAsString(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 136315394;
    v24 = "-[HSSetupStateMachineCHIPPartnerConfiguration didUpdateProgress:forStagingRequestUUID:]";
    v25 = 2112;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s received progress update: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration context](self, "context"));
  objc_msgSend(v17, "setSetupAccessoryDescription:", v16);

  v18 = -[HSSetupStateMachineCHIPPartnerConfiguration phase](self, "phase");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration context](self, "context"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration discoveredAccessoryToPair](self, "discoveredAccessoryToPair"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration setupResult](self, "setupResult"));
  -[HSSetupStateMachineCHIPPartnerConfiguration setPhase:](self, "setPhase:", +[HFSetupPairingControllerUtilities processThirdPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:callerClass:](HFSetupPairingControllerUtilities, "processThirdPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:callerClass:", a3, v18, v19, v20, v21, objc_opt_class(self, v22)));

}

- (void)addPairingObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration pairingObservers](self, "pairingObservers"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[HSSetupStateMachineCHIPPartnerConfiguration setPairingObservers:](self, "setPairingObservers:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration pairingObservers](self, "pairingObservers"));
  objc_msgSend(v7, "addObject:", v4);

}

- (id)pairedAccessories
{
  return (id)objc_opt_new(NSSet, a2);
}

- (void)removePairingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration pairingObservers](self, "pairingObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)setPhase:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  if (self->_phase != a3)
  {
    v5 = HFLogForCategory(58, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", self->_phase));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a3));
      *(_DWORD *)buf = 136315650;
      v26 = "-[HSSetupStateMachineCHIPPartnerConfiguration setPhase:]";
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s old phase: %@ new phase: %@", buf, 0x20u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration accessoryNotFoundSoftTimeoutTimer](self, "accessoryNotFoundSoftTimeoutTimer"));
    objc_msgSend(v9, "invalidate");

    -[HSSetupStateMachineCHIPPartnerConfiguration setAccessoryNotFoundSoftTimeoutTimer:](self, "setAccessoryNotFoundSoftTimeoutTimer:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration accessoryNotFoundFatalTimeoutTimer](self, "accessoryNotFoundFatalTimeoutTimer"));
    objc_msgSend(v10, "invalidate");

    -[HSSetupStateMachineCHIPPartnerConfiguration setAccessoryNotFoundFatalTimeoutTimer:](self, "setAccessoryNotFoundFatalTimeoutTimer:", 0);
    if (a3 == 2)
    {
      objc_initWeak((id *)buf, self);
      +[HFSetupPairingControllerUtilities accessoryDiscoverySoftTimeout](HFSetupPairingControllerUtilities, "accessoryDiscoverySoftTimeout");
      v12 = v11;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001D3F8;
      v23[3] = &unk_1000A1A58;
      objc_copyWeak(&v24, (id *)buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v23, v12));
      -[HSSetupStateMachineCHIPPartnerConfiguration setAccessoryNotFoundSoftTimeoutTimer:](self, "setAccessoryNotFoundSoftTimeoutTimer:", v13);

      +[HFSetupPairingControllerUtilities accessoryDiscoveryFatalTimeout](HFSetupPairingControllerUtilities, "accessoryDiscoveryFatalTimeout");
      v15 = v14;
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_10001D4B4;
      v21 = &unk_1000A1A58;
      objc_copyWeak(&v22, (id *)buf);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v18, v15));
      -[HSSetupStateMachineCHIPPartnerConfiguration setAccessoryNotFoundFatalTimeoutTimer:](self, "setAccessoryNotFoundFatalTimeoutTimer:", v16, v18, v19, v20, v21);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    self->_phase = a3;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[HSSetupStateMachineCHIPPartnerConfiguration setPhaseStartDate:](self, "setPhaseStartDate:", v17);

    if (a3 != 9)
      -[HSSetupStateMachineCHIPPartnerConfiguration _updateStatusTextAndNotifyDelegate:](self, "_updateStatusTextAndNotifyDelegate:", 1);
  }
}

- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t phase;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v3 = a3;
  v31 = 0;
  v32 = 0;
  phase = self->_phase;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration phaseStartDate](self, "phaseStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration discoveredAccessoryToPair](self, "discoveredAccessoryToPair"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration setupResult](self, "setupResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration pairingError](self, "pairingError"));
  +[HFSetupPairingControllerUtilities getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:](HFSetupPairingControllerUtilities, "getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:", &v32, &v31, phase, v6, v7, v8, v9, v10);
  v11 = v32;
  v12 = v31;

  v14 = HFLogForCategory(58, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v11;
    v36 = 2112;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\", buf, 0x16u);
  }

  -[HSSetupStateMachineCHIPPartnerConfiguration setStatusTitle:](self, "setStatusTitle:", v11);
  -[HSSetupStateMachineCHIPPartnerConfiguration setStatusDescription:](self, "setStatusDescription:", v12);
  if (v3)
  {
    v25 = v12;
    v26 = v11;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration pairingObservers](self, "pairingObservers"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v21, "pairingController:didTransitionToPhase:statusTitle:statusDescription:") & 1) != 0)
          {
            v22 = self->_phase;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration statusTitle](self, "statusTitle"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineCHIPPartnerConfiguration statusDescription](self, "statusDescription"));
            objc_msgSend(v21, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, v22, v23, v24);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v18);
    }

    v12 = v25;
    v11 = v26;
  }

}

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HMAccessorySetupCompletedInfo)completedInfo
{
  return self->_completedInfo;
}

- (NSUUID)stagingRequestUUID
{
  return self->_stagingRequestUUID;
}

- (void)setStagingRequestUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)stagedCHIPPairingIdentifier
{
  return self->_stagedCHIPPairingIdentifier;
}

- (void)setStagedCHIPPairingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSUUID)chipDevicePairingUUID
{
  return self->_chipDevicePairingUUID;
}

- (void)setChipDevicePairingUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (HFSetupPairingContext)context
{
  return (HFSetupPairingContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (MTSDeviceSetupHome)selectedPartnerHome
{
  return self->_selectedPartnerHome;
}

- (void)setSelectedPartnerHome:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (MTSDeviceSetupRoom)selectedPartnerRoom
{
  return self->_selectedPartnerRoom;
}

- (void)setSelectedPartnerRoom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)statusTitle
{
  return self->_statusTitle;
}

- (void)setStatusTitle:(id)a3
{
  objc_storeStrong((id *)&self->_statusTitle, a3);
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_storeStrong((id *)&self->_statusDescription, a3);
}

- (HSAccessoryPairingFuture)homekitPairingFuture
{
  return self->_homekitPairingFuture;
}

- (void)setHomekitPairingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_homekitPairingFuture, a3);
}

- (MTSSystemCommissionerPairing)currentPairing
{
  return self->_currentPairing;
}

- (void)setCurrentPairing:(id)a3
{
  objc_storeStrong((id *)&self->_currentPairing, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSDate)phaseStartDate
{
  return self->_phaseStartDate;
}

- (void)setPhaseStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_phaseStartDate, a3);
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
  objc_storeStrong((id *)&self->_pairingObservers, a3);
}

- (NSTimer)accessoryNotFoundFatalTimeoutTimer
{
  return self->_accessoryNotFoundFatalTimeoutTimer;
}

- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, a3);
}

- (NSTimer)accessoryNotFoundSoftTimeoutTimer
{
  return self->_accessoryNotFoundSoftTimeoutTimer;
}

- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, a3);
}

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
}

- (void)setDiscoveredAccessoryToPair:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_currentPairing, 0);
  objc_storeStrong((id *)&self->_homekitPairingFuture, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_selectedPartnerRoom, 0);
  objc_storeStrong((id *)&self->_selectedPartnerHome, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_chipDevicePairingUUID, 0);
  objc_storeStrong((id *)&self->_stagedCHIPPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_stagingRequestUUID, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_targetEcosystem, 0);
}

@end
