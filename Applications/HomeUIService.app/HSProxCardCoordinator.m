@implementation HSProxCardCoordinator

- (HSProxCardCoordinator)initWithHome:(id)a3 accessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5 setupSpecificAccessory:(BOOL)a6 entitlementContext:(id)a7 discoveredAccessory:(id)a8 delegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HSProxCardCoordinator *v19;
  HSProxCardCoordinator *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUUID *suggestedRoomUUID;
  HFAccessoryBrowsingManager *v30;
  HFAccessoryBrowsingManager *accessoryBrowser;
  unsigned int v32;
  __objc2_class **v33;
  id v34;
  id v35;
  HSAccessoryTuple *v36;
  uint64_t v37;
  NAFuture *matterSetupPairingWindowReadyFuture;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v53 = a7;
  v52 = a8;
  v18 = a9;
  v54.receiver = self;
  v54.super_class = (Class)HSProxCardCoordinator;
  v19 = -[HSProxCardCoordinator init](&v54, "init");
  v20 = v19;
  if (v19)
  {
    v51 = v18;
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_setupAccessoryDescription, a4);
    objc_storeStrong((id *)&v20->_matterDeviceSetupRequest, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setupAccessoryPayload"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "setupPayloadURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));

    if (objc_msgSend(v23, "length"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:](HMAccessorySetupCoordinator, "communicationProtocolForSetupPayloadURLString:", v23));
      v25 = objc_msgSend(v24, "integerValue");

      v20->_accessoryCommunicationProtocol = (int64_t)v25;
    }
    v20->_setupSpecificAccessory = a6;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setupAccessoryPayload"));
    objc_msgSend(v26, "logTransportFlagsFromPayload:", v27);

    objc_storeStrong((id *)&v20->_entitlementContext, a7);
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "suggestedRoomUniqueIdentifier"));
    suggestedRoomUUID = v20->_suggestedRoomUUID;
    v20->_suggestedRoomUUID = (NSUUID *)v28;

    v20->_pairingState = 0;
    objc_storeStrong((id *)&v20->_discoveredAccessory, a8);
    if (!a6)
    {
      v30 = (HFAccessoryBrowsingManager *)objc_alloc_init((Class)HFAccessoryBrowsingManager);
      accessoryBrowser = v20->_accessoryBrowser;
      v20->_accessoryBrowser = v30;

      -[HFAccessoryBrowsingManager startSearchingForNewAccessories](v20->_accessoryBrowser, "startSearchingForNewAccessories");
    }
    v32 = objc_msgSend(v16, "isSetupInitiatedByOtherMatterEcosystem");
    v33 = &off_1000A0648;
    if (!v32)
      v33 = off_1000A0640;
    v34 = objc_alloc_init(*v33);
    v35 = objc_msgSend(objc_alloc((Class)objc_msgSend(v34, "configurationObjectClass")), "initWithHome:", v15);
    objc_msgSend(v35, "setDelegate:", v20);
    v36 = objc_alloc_init(HSAccessoryTuple);
    -[HSAccessoryTuple setStateMachine:](v36, "setStateMachine:", v34);
    -[HSAccessoryTuple setConfiguration:](v36, "setConfiguration:", v35);
    objc_storeStrong((id *)&v20->_topAccessoryTuple, v36);
    objc_storeStrong((id *)&v20->_activeTuple, v20->_topAccessoryTuple);
    v37 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    matterSetupPairingWindowReadyFuture = v20->_matterSetupPairingWindowReadyFuture;
    v20->_matterSetupPairingWindowReadyFuture = (NAFuture *)v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v39, "setOverrideHome:", v15);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v40, "addHomeObserver:", v20);

    if (_os_feature_enabled_impl("Home", "SiriEndpoints"))
      objc_opt_class(HUHomeFeatureOnboardingUtilities, v41);
    v42 = HFLogForCategory(58, v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hf_prettyDescription"));
      v49 = v17;
      v50 = v15;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hf_prettyDescription"));
      v46 = v23;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "hf_prettyDescription"));
      *(_DWORD *)buf = 138413058;
      v56 = v44;
      v57 = 2112;
      v58 = v45;
      v59 = 2112;
      v60 = v53;
      v61 = 2112;
      v62 = v47;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Initialized HSProxCardCoordinator with Home [%@] accessoryDescription [%@] entitlementContext [%@] discoveredAccessory [%@]", buf, 0x2Au);

      v23 = v46;
      v17 = v49;
      v15 = v50;

    }
    v18 = v51;
  }

  return v20;
}

- (HSProxCardCoordinator)initWithHome:(id)a3 accessories:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HSProxCardCoordinator *v11;
  HSProxCardCoordinator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HSProxCardCoordinator;
  v11 = -[HSProxCardCoordinator init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    if (v9)
      v13 = v9;
    else
      v13 = &__NSArray0__struct;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    -[HSProxCardCoordinator didReceiveAccessories:](v12, "didReceiveAccessories:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v15, "setOverrideHome:", v8);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v16, "addHomeObserver:", v12);

    if (_os_feature_enabled_impl("Home", "SiriEndpoints"))
      objc_opt_class(HUHomeFeatureOnboardingUtilities, v17);
  }

  return v12;
}

- (HMHome)home
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));

  return (HMHome *)v4;
}

- (int64_t)launchReason
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "coordinatorGetLaunchReason:", self);

  return (int64_t)v4;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  v8 = -[HSProxCardCoordinator pairingState](self, "pairingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ setupAccessoryDescription: %@ discoveredAccessory: %@ pairingState: %lu pairingFuture: %@ activeTuple: %@>"), v5, v6, v7, v8, v9, v10));

  return (NSString *)v11;
}

- (void)updateAccessoriesPendingConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if ((id)-[HSProxCardCoordinator launchReason](self, "launchReason") != (id)1)
  {
    v7 = HFLogForCategory(58, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005FA70(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v16 = HFLogForCategory(58, v6);
    v8 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005FA00(v8, v17, v18, v19, v20, v21, v22, v23);
LABEL_8:

    goto LABEL_9;
  }
  -[HSProxCardCoordinator didReceiveAccessories:](self, "didReceiveAccessories:", v4);
  -[HSProxCardCoordinator setUserDidSelectAccessories:](self, "setUserDidSelectAccessories:", 1);
LABEL_9:

}

- (void)didReceiveAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  v4 = a3;
  -[HSProxCardCoordinator setPairingState:](self, "setPairingState:", 2);
  if (-[HSProxCardCoordinator launchReason](self, "launchReason"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1000A2620));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _tupleForAccessory:](self, "_tupleForAccessory:", v7));
    -[HSProxCardCoordinator setTopAccessoryTuple:](self, "setTopAccessoryTuple:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
    -[HSProxCardCoordinator setActiveTuple:](self, "setActiveTuple:", v9);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", &stru_1000A2660));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
    objc_msgSend(v6, "setAccessory:", v7);
  }

  v22 = v4;
  v10 = v22;
  if ((objc_msgSend(v7, "hf_isNetworkRouter") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet na_setWithSafeObject:](NSSet, "na_setWithSafeObject:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "na_setByRemovingObjectsFromSet:", v11));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
  v14 = objc_msgSend(v13, "hf_isSprinkler");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "na_filter:", &stru_1000A2680));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v15));

    v10 = (void *)v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_1000A2620));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100034A64;
  v23[3] = &unk_1000A26C8;
  v23[4] = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "na_map:", v23));
  -[HSProxCardCoordinator setBridgedAccessories:](self, "setBridgedAccessories:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &stru_1000A2708));
  -[HSProxCardCoordinator setBridgedAccessoryCategoryToArrayMap:](self, "setBridgedAccessoryCategoryToArrayMap:", v21);

}

- (void)pairAccessory
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v4 = objc_msgSend(v3, "isSetupInitiatedByOtherMatterEcosystem");

  if (v4)
    -[HSProxCardCoordinator pairAccessoryToPEA](self, "pairAccessoryToPEA");
  else
    -[HSProxCardCoordinator pairAccessoryToAppleHome](self, "pairAccessoryToAppleHome");
}

- (void)pairAccessoryToAppleHome
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  HSAccessoryPairingFuture *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  HSProxCardCoordinator *v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));

  if (!v4)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSProxCardCoordinator.m"), 277, CFSTR("Add Accessory request can not be nil"));

  }
  v5 = objc_alloc((Class)HFSetupPairingContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator entitlementContext](self, "entitlementContext"));
  v8 = objc_msgSend(v5, "initWithSetupAccessoryDescription:isTrustedOrigin:", v6, objc_msgSend(v7, "isEntitledForHomeKitSPI"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessory"));
  v11 = objc_msgSend(v10, "knownToSystemCommissioner");

  if ((v11 & 1) != 0)
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  v13 = -[HSAccessoryPairingFuture initWithPairingContext:discoveredAccessory:]([HSAccessoryPairingFuture alloc], "initWithPairingContext:discoveredAccessory:", v8, v12);
  -[HSProxCardCoordinator setPairingFuture:](self, "setPairingFuture:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator delegate](self, "delegate"));
  objc_msgSend(v14, "setPairingObserver:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v16, "logPairingBegin");

  objc_initWeak(&location, self);
  v18 = HFLogForCategory(58, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class(self, v20);
    v22 = NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *(_DWORD *)buf = 138413058;
    v33 = v21;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ pairing starting with context: %@ coordinator: %@", buf, 0x2Au);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator home](self, "home"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startPairingWithHome:", v25));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100034E10;
  v29[3] = &unk_1000A2730;
  objc_copyWeak(&v30, &location);
  v27 = objc_msgSend(v26, "addCompletionBlock:", v29);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
}

- (void)pairAccessoryToPEA
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  HSProxCardCoordinator *v28;
  SEL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));

  if (!v4)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSProxCardCoordinator.m"), 327, CFSTR("Add Accessory request can not be nil"));

  }
  v5 = objc_alloc((Class)HFSetupPairingContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator entitlementContext](self, "entitlementContext"));
  v8 = objc_msgSend(v5, "initWithSetupAccessoryDescription:isTrustedOrigin:", v6, objc_msgSend(v7, "isEntitledForHomeKitSPI"));

  v10 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  v13 = v12;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v12, v10) & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v10, objc_opt_class(v13, v18));

    }
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v15, "setContext:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator delegate](self, "delegate"));
  objc_msgSend(v15, "addPairingObserver:", v19);

  objc_initWeak(&location, self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stageCHIPAccessory"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100035340;
  v30[3] = &unk_1000A2758;
  v21 = v15;
  v31 = v21;
  objc_copyWeak(&v32, &location);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recover:", v30));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100035660;
  v26[3] = &unk_1000A27A8;
  v23 = v21;
  v27 = v23;
  v28 = self;
  v29 = a2;
  v24 = objc_msgSend(v22, "addSuccessBlock:", v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

- (void)notifyDelegateOfPairingFailureWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[HSProxCardCoordinator setPairingState:](self, "setPairingState:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingStatusTitle"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, HFErrorUserInfoOptionTitleKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingStatusDescription"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, HFErrorUserInfoOptionDescriptionKey);

  v9 = objc_msgSend(v4, "count");
  if (v9)
    v10 = objc_msgSend(v4, "copy");
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hf_errorWithOperationType:options:", 0, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
  objc_msgSend(v13, "setPairingError:", v11);

  if (v9)
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator delegate](self, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configuration"));
  objc_msgSend(v14, "coordinator:updatedConfiguration:", self, v16);

}

- (id)_generateNextStep
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _generateNextStepWithActiveTuple:](self, "_generateNextStepWithActiveTuple:", v3));

  return v4;
}

- (id)_generateNextStepWithActiveTuple:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  HSProxCardCoordinator *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moveToNextStep"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100035D04;
  v13[3] = &unk_1000A27D0;
  v6 = v4;
  v14 = v6;
  v15 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v13));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035DE0;
  v11[3] = &unk_1000A2848;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v11));

  return v9;
}

- (id)nextViewController
{
  return -[HSProxCardCoordinator nextViewControllerWithTarget:](self, "nextViewControllerWithTarget:", 0);
}

- (id)nextViewControllerWithTarget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21[2];
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v6 = objc_msgSend(v5, "currentStep");

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _generateNextStep](self, "_generateNextStep"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036318;
  v20[3] = &unk_1000A2870;
  objc_copyWeak(v21, &location);
  v21[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v20));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000366F0;
  v18[3] = &unk_1000A2898;
  v18[4] = self;
  v9 = v4;
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v18));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000368B8;
  v16[3] = &unk_1000A2898;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v16));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100036C0C;
  v15[3] = &unk_1000A1C28;
  v15[4] = self;
  v13 = objc_msgSend(v12, "addFailureBlock:", v15);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v12;
}

- (void)dismissProxCardFlowAfterExecuting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id location;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];

  v47 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));

  if (objc_msgSend(v48, "hf_currentUserIsOwner"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v7 = v6;
    v8 = 1;
  }
  else if (objc_msgSend(v48, "hf_currentUserIsAdministrator"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v7 = v6;
    v8 = 2;
  }
  else
  {
    if (!v48)
      goto LABEL_8;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "logHUISUserType:", v8);

LABEL_8:
  if (!-[HSProxCardCoordinator launchReason](self, "launchReason"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    objc_msgSend(v9, "logIsUsingCHIPCommunicationProtocol:", -[HSProxCardCoordinator isUsingCHIPCommunicationProtocol](self, "isUsingCHIPCommunicationProtocol"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator delegate](self, "delegate"));
  objc_msgSend(v10, "logCardCount:", objc_msgSend(v11, "coordinatorGetNumberOfProxCards:", self));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v12, "logHUISDismiss");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  if (!-[HSProxCardCoordinator launchReason](self, "launchReason")
    || (id)-[HSProxCardCoordinator launchReason](self, "launchReason") == (id)1
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple")),
        v15 = (uint64_t)objc_msgSend(v14, "currentStep"),
        v14,
        v15 >= 11))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator allAccessoryTuples](self, "allAccessoryTuples"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10003729C;
    v52[3] = &unk_1000A28E8;
    v53 = v48;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "na_map:", v52));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v17));
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    v21 = v20;

    v13 = v21;
  }
  if (v47)
    v22 = v47;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cancelPairing"));
  v26 = v25;
  if (v25)
    v27 = v25;
  else
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v31 = objc_msgSend(v30, "isSetupInitiatedByOtherMatterEcosystem");

  if (v31)
  {
    v33 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
    v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "configuration"));
    v36 = v35;
    if (v35)
    {
      if ((objc_opt_isKindOfClass(v35, v33) & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;
      if (!v38)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v33, objc_opt_class(v36, v39));

      }
    }
    else
    {
      v38 = 0;
    }

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "cancelStagingForCHIPPairing"));
    v29 = (void *)v40;
  }
  objc_initWeak(&location, self);
  v54[0] = v29;
  v54[1] = v13;
  v54[2] = v23;
  v54[3] = v28;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 4));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v41, 1, v42));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100037668;
  v49[3] = &unk_1000A11E8;
  objc_copyWeak(&v50, &location);
  v44 = objc_msgSend(v43, "addCompletionBlock:", v49);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

}

- (void)resetForRetry
{
  void *v3;
  unsigned int v4;
  __objc2_class **v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  HSAccessoryTuple *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HFAccessoryBrowsingManager *v19;
  HFAccessoryBrowsingManager *accessoryBrowser;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  -[HSProxCardCoordinator setPairingState:](self, "setPairingState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v4 = objc_msgSend(v3, "isSetupInitiatedByOtherMatterEcosystem");
  v5 = &off_1000A0648;
  if (!v4)
    v5 = off_1000A0640;
  v6 = objc_alloc_init(*v5);

  v7 = objc_alloc((Class)objc_msgSend(v6, "configurationObjectClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator home](self, "home"));
  v9 = objc_msgSend(v7, "initWithHome:", v8);

  objc_msgSend(v9, "setDelegate:", self);
  v10 = objc_alloc_init(HSAccessoryTuple);
  -[HSAccessoryTuple setStateMachine:](v10, "setStateMachine:", v6);
  -[HSAccessoryTuple setConfiguration:](v10, "setConfiguration:", v9);
  -[HSProxCardCoordinator setTopAccessoryTuple:](self, "setTopAccessoryTuple:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  -[HSProxCardCoordinator setActiveTuple:](self, "setActiveTuple:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  objc_msgSend(v12, "updateRetry:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  objc_msgSend(v13, "setCancellationReason:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "setupAccessoryPayload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "setupCode"));
  -[HSProxCardCoordinator setSetupCode:](self, "setSetupCode:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "setupAccessoryPayload"));
  -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", objc_msgSend(v18, "communicationProtocol"));

  if (!-[HSProxCardCoordinator setupSpecificAccessory](self, "setupSpecificAccessory"))
  {
    v19 = (HFAccessoryBrowsingManager *)objc_alloc_init((Class)HFAccessoryBrowsingManager);
    accessoryBrowser = self->_accessoryBrowser;
    self->_accessoryBrowser = v19;

    -[HFAccessoryBrowsingManager startSearchingForNewAccessories](self->_accessoryBrowser, "startSearchingForNewAccessories");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  objc_msgSend(v21, "updateStatus:error:", 1, 0);

  v23 = HFLogForCategory(58, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    sub_10005FC98(self, (uint64_t)v6, v24);

}

- (void)home:(id)a3 didFailAccessorySetupWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v9 = HFLogForCategory(58, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class(self, v11);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    v20 = 138412802;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    v24 = 2112;
    v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "-[%@ home:%@ didFailAccessorySetupWithError:%@]", (uint8_t *)&v20, 0x20u);

  }
  if (objc_msgSend(v7, "hf_isHMErrorWithCode:", 23))
  {
    v13 = HFLogForCategory(58, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10005FDAC(v14);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator pairingFuture](self, "pairingFuture"));
    v15 = -[NSObject cancelPairingWithError:](v14, "cancelPairingWithError:", v7);
  }

}

- (HSAccessoryTuple)nextUnconfiguredBridgedAccessory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "na_firstObjectPassingTest:", &stru_1000A2928));

  return (HSAccessoryTuple *)v3;
}

- (id)_bridgedConfigurationOrdinalityString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  uint64_t v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));

    if (v4 == v5)
      return 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryCategoryOrPrimaryServiceType"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessoryCategoryToArrayMap](self, "bridgedAccessoryCategoryToArrayMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v3));

    if ((unint64_t)objc_msgSend(v8, "count") < 2
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple")),
          v10 = (char *)objc_msgSend(v8, "indexOfObject:", v9),
          v9,
          v10 == (char *)0x7FFFFFFFFFFFFFFFLL))
    {
      v11 = 0;
    }
    else
    {
      v13 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardOrdinalityString"), v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, objc_msgSend(v8, "count"), v10 + 1));

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_configurationForAccessory:(id)a3 stateMachine:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a4, "configurationObjectClass")), "initWithAccessory:", v6);

  objc_msgSend(v7, "setDelegate:", self);
  return v7;
}

- (id)_tupleForAccessory:(id)a3
{
  id v4;
  HSAccessoryTuple *v5;
  HSSetupStateMachine *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(HSAccessoryTuple);
  v6 = objc_alloc_init(HSSetupStateMachine);
  -[HSAccessoryTuple setStateMachine:](v5, "setStateMachine:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple stateMachine](v5, "stateMachine"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _configurationForAccessory:stateMachine:](self, "_configurationForAccessory:stateMachine:", v4, v7));

  -[HSAccessoryTuple setConfiguration:](v5, "setConfiguration:", v8);
  return v5;
}

- (NSArray)allAccessoryTuples
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));

  if (!v3)
    return (NSArray *)0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));

  return (NSArray *)v7;
}

- (NSArray)allAccessories
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator allAccessoryTuples](self, "allAccessoryTuples"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "na_map:", &stru_1000A2968));

  return (NSArray *)v3;
}

- (BOOL)isConfiguringLastAccessoryOfSameCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryCategoryOrPrimaryServiceType"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessoryCategoryToArrayMap](self, "bridgedAccessoryCategoryToArrayMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessory"));
  v11 = v8 == v10;

  return v11;
}

- (unint64_t)numberOfAccessoriesInSameCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));

  if (v3 == v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryCategoryOrPrimaryServiceType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessoryCategoryToArrayMap](self, "bridgedAccessoryCategoryToArrayMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  v9 = objc_msgSend(v8, "count");

  return (unint64_t)v9;
}

- (void)stateMachineConfigurationIsReadyToPair:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!-[HSProxCardCoordinator pairingState](self, "pairingState"))
  {
    -[HSProxCardCoordinator setPairingState:](self, "setPairingState:", 1);
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator matterSetupPairingWindowReadyFuture](self, "matterSetupPairingWindowReadyFuture"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000380E0;
    v7[3] = &unk_1000A2990;
    objc_copyWeak(&v8, &location);
    v6 = objc_msgSend(v5, "addSuccessBlock:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)stateMachineConfiguration:(id)a3 didUpdateHome:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v5, "setOverrideHome:", v4);

}

- (BOOL)stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories", a3));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
    if (objc_msgSend(v5, "count") == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessory"));
      v9 = objc_msgSend(v8, "hf_isNetworkRouter") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)stateMachineConfigurationActiveTupleIsTopTuple
{
  HSProxCardCoordinator *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](v2, "topAccessoryTuple"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)stateMachineConfigurationShouldSkipDetectedStep:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "addedAccessory"));

  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessory"));
      v5 = objc_msgSend(v8, "knownToSystemCommissioner");

    }
    else
    {
      v5 = 1;
    }

  }
  return v5 ^ 1;
}

- (BOOL)stateMachineConfigurationShouldSkipHomeHubStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
    NSLog(CFSTR("No home for tuple %@"), v6);

  }
  v7 = !-[HSProxCardCoordinator isUsingCHIPCommunicationProtocol](self, "isUsingCHIPCommunicationProtocol");
  if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    if (objc_msgSend(v8, "hf_currentUserIsOwner"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeManager"));
      LOBYTE(v7) = objc_msgSend(v10, "hasOptedToHH2") | v7;

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  if ((objc_msgSend(v11, "hf_currentUserIsOwner") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    if (objc_msgSend(v13, "hf_currentUserIsAdministrator"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
      v12 = objc_msgSend(v14, "hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin");

    }
    else
    {
      v12 = 0;
    }

  }
  if ((v7 & 1) != 0)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    v15 = objc_msgSend(v16, "hf_hasResidentDeviceCapableOfSupportingCHIP") & v12;

  }
  return v15;
}

- (BOOL)stateMachineConfigurationShouldSkipHomeHubUpgradeStep:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  BOOL v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  int v23;
  const char *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;

  v4 = a3;
  if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v21 = HFLogForCategory(58, v5);
    v15 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315138;
      v24 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
      v18 = "%s Skipping HSProxCardSetupUIStepHomeHubUpgradeRequired due to runtime FF disabled: [HOME_ENABLE_MATTER_IPHO"
            "NE_ONLY_PAIRING]";
      v19 = v15;
      v20 = 12;
      goto LABEL_13;
    }
LABEL_14:
    v17 = 1;
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "residentDevices"));
  v8 = objc_msgSend(v7, "count");

  v9 = -[HSProxCardCoordinator isUsingHAPCommunicationProtocol](self, "isUsingHAPCommunicationProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeManager"));
  v12 = objc_msgSend(v11, "hasOptedToHH2");

  v14 = HFLogForCategory(58, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0 || v8 || v12)
  {
    if (v16)
    {
      v23 = 136315906;
      v24 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
      v25 = 1024;
      v26 = v8 != 0;
      v27 = 1024;
      v28 = v9;
      v29 = 1024;
      v30 = v12;
      v18 = "%s Skipping HSProxCardSetupUIStepHomeHubUpgradeRequired - hasResident: [%d], isHAP: [%d], isHH2: [%d]";
      v19 = v15;
      v20 = 30;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, v20);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v16)
  {
    v23 = 136315906;
    v24 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
    v25 = 1024;
    v26 = 0;
    v27 = 1024;
    v28 = 0;
    v29 = 1024;
    v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Not skipping HSProxCardSetupUIStepHomeHubUpgradeRequired - hasResident: [%d], isHAP: [%d], isHH2: [%d]", (uint8_t *)&v23, 0x1Eu);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)stateMachineConfigurationShouldSkipAccessoryUpdateStep:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v6 = -[HSProxCardCoordinator isUsingCHIPCommunicationProtocol](self, "isUsingCHIPCommunicationProtocol");
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
    v8 = -[NSObject hf_hasNewValidSoftwareOrFirmwareUpdate](v7, "hf_hasNewValidSoftwareOrFirmwareUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

    v12 = HFLogForCategory(58, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((v6 & v8 & v10 & 1) != 0)
    {
      if (v14)
      {
        v21 = 136315650;
        v22 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
        v23 = 1024;
        v24 = 1;
        v25 = 1024;
        v26 = 1;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Not skipping HSProxCardSetupUIStepAccessoryUpdate - isMatter: [%{BOOL}d], hasValidUpdate: [%{BOOL}d]", (uint8_t *)&v21, 0x18u);
      }
    }
    else if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentUser"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hf_prettyDescription"));
      v21 = 136316162;
      v22 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
      v23 = 1024;
      v24 = v6;
      v25 = 1024;
      v26 = v8;
      v27 = 1024;
      v28 = v10;
      v29 = 2112;
      v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIStepAccessoryUpdate - isMatter: [%{BOOL}d], hasValidUpdate: [%{BOOL}d], isCurrentUserAdmin: %{BOOL}d for %@", (uint8_t *)&v21, 0x28u);

    }
    v18 = v6 & v8 & v10 ^ 1;
  }
  else
  {
    v20 = HFLogForCategory(58, v5);
    v7 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIStepAccessoryUpdate due to runtime FF disabled: [HOME_ENABLE_MATTER_IPHONE_ONLY_PAIRING]", (uint8_t *)&v21, 0xCu);
    }
    v18 = 1;
  }

  return v18;
}

- (BOOL)stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[HSProxCardCoordinator userDidSelectAccessories](self, "userDidSelectAccessories"))
    LOBYTE(v5) = 1;
  else
    v5 = !-[HSProxCardCoordinator stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:](self, "stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:", v4);

  return v5;
}

- (BOOL)stateMachineConfigurationShouldSkipBridgeAddedStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if ((id)-[HSProxCardCoordinator launchReason](self, "launchReason") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator nextUnconfiguredBridgedAccessory](self, "nextUnconfiguredBridgedAccessory"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator nextUnconfiguredBridgedAccessory](self, "nextUnconfiguredBridgedAccessory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
  if ((objc_msgSend(v9, "isBridged") & 1) == 0
    && (objc_msgSend(v9, "hf_isNetworkRouter") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_bridgedAccessories"));
    if (objc_msgSend(v9, "hf_isSprinkler"))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "na_filter:", &stru_1000A29B0));

      v10 = (void *)v11;
    }
    if (objc_msgSend(v10, "count"))
      v8 = 0;

  }
  return v8;
}

- (BOOL)stateMachineConfigurationShouldSkipDoneStep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));

  if (v6 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator bridgedAccessories](self, "bridgedAccessories"));
    LOBYTE(self) = v7 != 0;

  }
  else
  {
    LODWORD(self) = !-[HSProxCardCoordinator isConfiguringLastAccessoryOfSameCategory](self, "isConfiguringLastAccessoryOfSameCategory");
  }
  return (char)self;
}

- (BOOL)stateMachineConfigurationShouldSetupBridgedAccessories:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));

  if (v6 != v4)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator nextUnconfiguredBridgedAccessory](self, "nextUnconfiguredBridgedAccessory"));
  v7 = v8 != 0;

  return v7;
}

- (BOOL)stateMachineConfigurationShouldSetupRouters:(id)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "addedAccessory"));
  if (objc_msgSend(v4, "hf_isNetworkRouter"))
    v5 = -[HSProxCardCoordinator isConfiguringLastAccessoryOfSameCategory](self, "isConfiguringLastAccessoryOfSameCategory");
  else
    v5 = 0;

  return v5;
}

- (BOOL)stateMachineConfigurationShouldJumpToDoneStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if ((id)-[HSProxCardCoordinator launchReason](self, "launchReason") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pendingConfigurationIdentifier"));
      v8 = objc_msgSend(v7, "length") == 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInSetupContext
{
  return +[HUHomeUIServiceLaunchUserInfo isInSetupContext:](HUHomeUIServiceLaunchUserInfo, "isInSetupContext:", -[HSProxCardCoordinator launchReason](self, "launchReason"));
}

- (id)_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  id v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[5];
  _QWORD v38[4];
  __CFString *v39;
  id v40;
  _QWORD v41[4];
  __CFString *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  __CFString *v46;
  id location;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  void *v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));

  if (!v6)
  {
LABEL_9:
    v17 = v5;
    v5 = v17;
    goto LABEL_20;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  if (objc_msgSend(v7, "requiresSetupCode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupCode](self, "setupCode"));
    v9 = objc_msgSend(v8, "length") == 0;

  }
  else
  {
    v9 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator topAccessoryTuple](self, "topAccessoryTuple"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  v12 = objc_msgSend(v11, "isSetupInitiatedByOtherMatterEcosystem") & v9;

  if (v12 == 1)
  {
    v14 = HFLogForCategory(58, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
      *(_DWORD *)buf = 136315394;
      v49 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]";
      v50 = 2112;
      v51 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s setup code required for third-party Matter pairing of discoveredAccessory %@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v18 = "v32@0:8@\"HFAccessoryBrowsingManager\"16@\"SFDevice\"24" + 22;
  if (!v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    v20 = objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupCode](self, "setupCode"));
    v21 = (void *)v20;
    v22 = &stru_1000A3BA0;
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    if (-[HSProxCardCoordinator isUsingCHIPCommunicationProtocol](self, "isUsingCHIPCommunicationProtocol"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
      objc_msgSend(v24, "setRawSetupPayloadString:", v23);

      objc_initWeak(&location, self);
      v26 = HFLogForCategory(58, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
        *(_DWORD *)buf = 136315650;
        v49 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]";
        v50 = 2112;
        v51 = v23;
        v52 = 2112;
        v53 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s calling createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:%@ for discoveredAccessory %@]", buf, 0x20u);

      }
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100039288;
      v45[3] = &unk_1000A29F8;
      v29 = v23;
      v46 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v45));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100039308;
      v41[3] = &unk_1000A2A20;
      objc_copyWeak(&v44, &location);
      v42 = v29;
      v43 = v4;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "flatMap:", v41));

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
    else
    {
      v32 = objc_msgSend(objc_alloc((Class)HMSetupAccessoryPayload), "initWithHAPSetupCode:", v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v32));

    }
    objc_initWeak((id *)buf, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000394D0;
    v38[3] = &unk_1000A2A48;
    objc_copyWeak(&v40, (id *)buf);
    v33 = v23;
    v39 = v33;
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "flatMap:", v38));

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);

    v5 = (void *)v34;
    v18 = "owsingManager\"16@\"SFDevice\"24";
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = *((_QWORD *)v18 + 143);
  v37[2] = sub_100039768;
  v37[3] = &unk_1000A1620;
  v37[4] = self;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v37));
LABEL_20:
  v35 = v17;

  return v35;
}

- (void)setSetupCode:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *setupCode;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_extractDecimalDigits"));
  v5 = 1;
  if (objc_msgSend(v4, "length") == (id)8)
    v6 = 1;
  else
    v6 = 2;
  -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", v6);
  v7 = objc_msgSend(v4, "length");
  v8 = 3;
  v9 = 2;
  if (v7 != (id)11)
    v9 = 0;
  if (v7 != (id)21)
    v8 = v9;
  if (v7 != (id)8)
    v5 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v10, "logCodeInputMethod:", v5);

  setupCode = self->_setupCode;
  self->_setupCode = (NSString *)v4;

}

- (int64_t)accessoryCommunicationProtocol
{
  int64_t result;
  void *v4;
  void *v5;

  result = self->_accessoryCommunicationProtocol;
  if (!result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryPayload"));
    self->_accessoryCommunicationProtocol = (int64_t)objc_msgSend(v5, "communicationProtocol");

    return self->_accessoryCommunicationProtocol;
  }
  return result;
}

- (id)didReceiveDiscoveredAccessory:(id)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSString *v53;
  void *v54;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[4];
  id v59;
  HSProxCardCoordinator *v60;
  SEL v61;
  _QWORD v62[4];
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  unsigned int v71;
  __int16 v72;
  unsigned int v73;

  v6 = a3;
  objc_storeStrong((id *)&self->_discoveredAccessory, a3);
  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupCode](self, "setupCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));
    v14 = objc_msgSend(v13, "knownToSystemCommissioner");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
    *(_DWORD *)buf = 138413314;
    v65 = v11;
    v66 = 2112;
    v67 = v6;
    v68 = 2112;
    v69 = v12;
    v70 = 1024;
    v71 = v14;
    v72 = 1024;
    v73 = objc_msgSend(v15, "isSetupInitiatedByOtherMatterEcosystem");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ discoveredAccessory %@ setupCode %@ knownToSystemCommissioner %d isSetupInitiatedByOtherMatterEcosystem %d", buf, 0x2Cu);

  }
  if (!v6)
  {
    v41 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_16:
    v42 = (void *)v41;
    goto LABEL_25;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "category"));
  objc_msgSend(v16, "updateAccessoryCategory:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v20 = objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "name"));
  objc_msgSend(v19, "updateAccessoryName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));
  LOBYTE(v20) = objc_msgSend(v22, "knownToSystemCommissioner");

  if ((v20 & 1) == 0)
  {
    v41 = objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:](self, "_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:", 0));
    goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "deviceIdentifier"));

  v26 = HFLogForCategory(58, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138412546;
    v65 = v29;
    v66 = 2112;
    v67 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ discovered Matter accessory is known to system commissioner with identifier %@", buf, 0x16u);

  }
  -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  v31 = objc_msgSend(v30, "isSetupInitiatedByOtherMatterEcosystem");

  if (v31)
  {
    v33 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
    v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "configuration"));
    v36 = v35;
    if (v35)
    {
      if ((objc_opt_isKindOfClass(v35, v33) & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;
      if (!v38)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v33, objc_opt_class(v36, v40));

      }
    }
    else
    {
      v38 = 0;
    }

    objc_msgSend(v38, "setStagedCHIPPairingIdentifier:", v24);
    v51 = HFLogForCategory(58, v50);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      *(_DWORD *)buf = 138412290;
      v65 = v54;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@ set pairing identifier on setup configuration; will skip staging",
        buf,
        0xCu);

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:](self, "_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:", 0));
  }
  else
  {
    v43 = HFLogForCategory(58, v32);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138412546;
      v65 = v46;
      v66 = 2112;
      v67 = v24;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@ calling createCHIPSetupPayloadStringForStagedPairingWithIdentifier:%@", buf, 0x16u);

    }
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100039E84;
    v62[3] = &unk_1000A29F8;
    v63 = v24;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v62));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100039F04;
    v58[3] = &unk_1000A2A98;
    v61 = a2;
    v59 = v6;
    v60 = self;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "flatMap:", v58));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10003A410;
    v57[3] = &unk_1000A2AB8;
    v57[4] = a2;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "recover:", v57));
    -[HSProxCardCoordinator setMatterSetupPairingWindowReadyFuture:](self, "setMatterSetupPairingWindowReadyFuture:", v49);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    v38 = v63;
  }

LABEL_25:
  return v42;
}

- (id)didReceiveSetupCode:(id)a3 fromViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  SEL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  void *v38;

  v7 = a3;
  v8 = a4;
  -[HSProxCardCoordinator setSetupCode:](self, "setSetupCode:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupCode](self, "setupCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));

  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rawSetupPayloadString"));

    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:](HMAccessorySetupCoordinator, "communicationProtocolForSetupPayloadURLString:", v13));
      v15 = objc_msgSend(v14, "integerValue");

      -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", v15);
    }

  }
  v16 = HFLogForCategory(58, v11);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = -[HSProxCardCoordinator accessoryCommunicationProtocol](self, "accessoryCommunicationProtocol");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator discoveredAccessory](self, "discoveredAccessory"));
    *(_DWORD *)buf = 138413314;
    v30 = v19;
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v9;
    v35 = 2048;
    v36 = v20;
    v37 = 2112;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ receivedSetupCode %@ setupCode %@ accessoryCommunicationProtocol %ld discoveredAccessory %@", buf, 0x34u);

  }
  if (v9)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:](self, "_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:", v8));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003A708;
    v25[3] = &unk_1000A2B30;
    v25[4] = self;
    v28 = a2;
    v26 = v9;
    v27 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "flatMap:", v25));

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v23;
}

- (void)updateSetupAccessoryDescriptionWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator setupAccessoryDescription](self, "setupAccessoryDescription"));
  objc_msgSend(v5, "updateWithSetupAccessoryPayload:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupPayloadURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:](HMAccessorySetupCoordinator, "communicationProtocolForSetupPayloadURLString:", v7));
  v9 = objc_msgSend(v8, "integerValue");

  -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", v9);
}

- (id)showCustomCommissioningFlowAlertIfNecessaryForPayload:(id)a3 onViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[HSProxCardCoordinator didShowCustomCommissioningFlowAlertIfNecessary](self, "didShowCustomCommissioningFlowAlertIfNecessary")|| (-[HSProxCardCoordinator setDidShowCustomCommissioningFlowAlertIfNecessary:](self, "setDidShowCustomCommissioningFlowAlertIfNecessary:", 1), (objc_msgSend(v6, "requiresMatterCustomCommissioningFlow") & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v6));
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003B000;
    v10[3] = &unk_1000A15F8;
    v11 = v6;
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v10));

  }
  return v8;
}

- (HSProxCardCoordinatorDelegate)delegate
{
  return (HSProxCardCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)setupSpecificAccessory
{
  return self->_setupSpecificAccessory;
}

- (void)setAccessoryCommunicationProtocol:(int64_t)a3
{
  self->_accessoryCommunicationProtocol = a3;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (HFAccessoryBrowsingManager)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setAccessoryBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBrowser, a3);
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (NSUUID)suggestedRoomUUID
{
  return self->_suggestedRoomUUID;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, a3);
}

- (HSAccessoryTuple)topAccessoryTuple
{
  return self->_topAccessoryTuple;
}

- (void)setTopAccessoryTuple:(id)a3
{
  objc_storeStrong((id *)&self->_topAccessoryTuple, a3);
}

- (HSAccessoryTuple)activeTuple
{
  return self->_activeTuple;
}

- (void)setActiveTuple:(id)a3
{
  objc_storeStrong((id *)&self->_activeTuple, a3);
}

- (HSAccessoryPairingFuture)pairingFuture
{
  return self->_pairingFuture;
}

- (void)setPairingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_pairingFuture, a3);
}

- (NSArray)bridgedAccessories
{
  return self->_bridgedAccessories;
}

- (void)setBridgedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_bridgedAccessories, a3);
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (HFDiscoveredAccessory)discoveredAccessory
{
  return self->_discoveredAccessory;
}

- (NAFuture)matterSetupPairingWindowReadyFuture
{
  return self->_matterSetupPairingWindowReadyFuture;
}

- (void)setMatterSetupPairingWindowReadyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_matterSetupPairingWindowReadyFuture, a3);
}

- (BOOL)retryFlag
{
  return self->_retryFlag;
}

- (void)setRetryFlag:(BOOL)a3
{
  self->_retryFlag = a3;
}

- (unint64_t)pairingState
{
  return self->_pairingState;
}

- (void)setPairingState:(unint64_t)a3
{
  self->_pairingState = a3;
}

- (NSDictionary)bridgedAccessoryCategoryToArrayMap
{
  return self->_bridgedAccessoryCategoryToArrayMap;
}

- (void)setBridgedAccessoryCategoryToArrayMap:(id)a3
{
  objc_storeStrong((id *)&self->_bridgedAccessoryCategoryToArrayMap, a3);
}

- (BOOL)userDidSelectAccessories
{
  return self->_userDidSelectAccessories;
}

- (void)setUserDidSelectAccessories:(BOOL)a3
{
  self->_userDidSelectAccessories = a3;
}

- (BOOL)didShowCustomCommissioningFlowAlertIfNecessary
{
  return self->_didShowCustomCommissioningFlowAlertIfNecessary;
}

- (void)setDidShowCustomCommissioningFlowAlertIfNecessary:(BOOL)a3
{
  self->_didShowCustomCommissioningFlowAlertIfNecessary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedAccessoryCategoryToArrayMap, 0);
  objc_storeStrong((id *)&self->_matterSetupPairingWindowReadyFuture, 0);
  objc_storeStrong((id *)&self->_discoveredAccessory, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_bridgedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_activeTuple, 0);
  objc_storeStrong((id *)&self->_topAccessoryTuple, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUUID, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)requiresDismissalConfirmation
{
  HSProxCardCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  LOBYTE(v2) = -[HSProxCardCoordinator requiresDismissalConfirmation:](v2, "requiresDismissalConfirmation:", v3);

  return (char)v2;
}

- (BOOL)requiresDismissalConfirmation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateMachine"));
  v6 = objc_msgSend(v4, "currentStep");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));

  LOBYTE(self) = objc_msgSend(v5, "stepRequiresDismissalConfirmation:withCoordinator:configuration:", v6, self, v7);
  return (char)self;
}

- (BOOL)requiresIdentifyButton
{
  HSProxCardCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProxCardCoordinator activeTuple](self, "activeTuple"));
  LOBYTE(v2) = -[HSProxCardCoordinator requiresIdentifyButton:](v2, "requiresIdentifyButton:", v3);

  return (char)v2;
}

- (BOOL)requiresIdentifyButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
  if (objc_msgSend(v5, "hf_isIdentifiable"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateMachine"));
    v7 = objc_msgSend(v4, "currentStep");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v9 = objc_msgSend(v6, "stepRequiresIdentifyButton:withCoordinator:configuration:", v7, self, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isUsingCHIPCommunicationProtocol
{
  return (id)-[HSProxCardCoordinator accessoryCommunicationProtocol](self, "accessoryCommunicationProtocol") == (id)2;
}

- (BOOL)isUsingHAPCommunicationProtocol
{
  return (id)-[HSProxCardCoordinator accessoryCommunicationProtocol](self, "accessoryCommunicationProtocol") == (id)1;
}

@end
