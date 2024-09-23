@implementation HMDHomePodSetupLatencyLogEvent

- (id)initLogEventWithInitialState:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  BYTE4(v6) = 0;
  LODWORD(v6) = 0;
  LODWORD(v5) = 0;
  WORD2(v4) = 0;
  LODWORD(v4) = 0;
  return -[HMDHomePodSetupLatencyLogEvent initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:](self, "initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:", 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v4,
           0,
           *MEMORY[0x24BDD5BD8],
           0,
           *MEMORY[0x24BDD5BD8],
           &stru_24E79DB48,
           &stru_24E79DB48,
           v5,
           0,
           0,
           v6,
           0,
           *MEMORY[0x24BDD5BD8],
           0,
           *MEMORY[0x24BDD5BD8],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           *MEMORY[0x24BDD5BD8],
           0,
           *MEMORY[0x24BDD5BD8],
           a3);
}

- (HMDHomePodSetupLatencyLogEvent)initWithSessionSetupOpenMS_HH1:(int64_t)a3 controllerKeyExchangeMS_HH1:(int64_t)a4 newAccessoryTransferMS_HH1:(int64_t)a5 sessionSetupCloseMS_HH1:(int64_t)a6 sentinelZoneFetchMS_HH1:(int64_t)a7 totalDurationMS_HH1:(int64_t)a8 accountSettleWaitMS_HH2:(int64_t)a9 currentDeviceIDSWaitMS_HH2:(int64_t)a10 homeManagerReadyMS_HH2:(int64_t)a11 firstCoreDataImportMS_HH2:(int64_t)a12 accessoryAddMS_HH2:(int64_t)a13 settingsCreationMS_HH2:(int64_t)a14 pairingIdentityCreationMS_HH2:(int64_t)a15 siriReadyMS_HH2:(int64_t)a16 eventRouterServerConnectionMS_HH2:(int64_t)a17 primaryResidentElectionMS_HH2:(int64_t)a18 eventRouterFirstEventPushMS_HH2:(int64_t)a19 totalDurationMS_HH2:(int64_t)a20 iCloudAvailable_INT:(BOOL)a21 IDSAvailable_INT:(BOOL)a22 manateeAvailable_INT:(BOOL)a23 networkAvailable_INT:(BOOL)a24 controllerInHH2_INT:(BOOL)a25 controllerHasSentinelZone_INT:(BOOL)a26 errorCode:(int64_t)a27 errorDomain:(id)a28 underlyingErrorCode:(int64_t)a29 underlyingErrorDomain:(id)a30 errorStage_String:(id)a31 setupSessionIdentifier:(id)a32 numberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a33 lastPrimaryClientConnectedTime_HH2:(int64_t)a34 numberOfTimesPrimaryClientConnected_HH2:(unsigned int)a35 numberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a36 numberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a37 currentDeviceConfirmedPrimaryResident_INT:(BOOL)a38 lastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a39 lastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a40 lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a41 lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a42 primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a43 primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a44 primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a45 primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a46 primaryResidentElectionJoinMeshMS_HH2:(int64_t)a47 firstCoreDataContainerSetupDurationMS_HH2:(int64_t)a48 firstCoreDataContainerSetupErrorCode_HH2:(int64_t)a49 firstCoreDataContainerSetupErrorDomain_HH2:(id)a50 firstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a51 firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a52 savedEventState:(unint64_t)a53
{
  id v55;
  HMDHomePodSetupLatencyLogEvent *v56;
  HMDHomePodSetupLatencyLogEvent *v57;
  void *v58;
  void *v59;
  void *v60;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v55 = a28;
  v73 = a30;
  v72 = a31;
  v71 = a32;
  v70 = a40;
  v69 = a42;
  v68 = a50;
  v67 = a52;
  v74.receiver = self;
  v74.super_class = (Class)HMDHomePodSetupLatencyLogEvent;
  v56 = -[HMMLogEvent init](&v74, sel_init);
  v57 = v56;
  if (v56)
  {
    v56->_sessionSetupOpenMS_HH1 = a3;
    v56->_controllerKeyExchangeMS_HH1 = a4;
    v56->_newAccessoryTransferMS_HH1 = a5;
    v56->_sessionSetupCloseMS_HH1 = a6;
    v56->_sentinelZoneFetchMS_HH1 = a7;
    v56->_totalDurationMS_HH1 = a8;
    v56->_accountSettleWaitMS_HH2 = a9;
    v56->_currentDeviceIDSWaitMS_HH2 = a10;
    v56->_homeManagerReadyMS_HH2 = a11;
    v56->_firstCoreDataImportMS_HH2 = a12;
    v56->_accessoryAddMS_HH2 = a13;
    v56->_settingsCreationMS_HH2 = a14;
    v56->_pairingIdentityCreationMS_HH2 = a15;
    v56->_siriReadyMS_HH2 = a16;
    v56->_eventRouterServerConnectionMS_HH2 = a17;
    v56->_primaryResidentElectionMS_HH2 = a18;
    v56->_eventRouterFirstEventPushMS_HH2 = a19;
    v56->_totalDurationMS_HH2 = a20;
    v56->_iCloudAvailable_INT = a21;
    v56->_IDSAvailable_INT = a22;
    v56->_manateeAvailable_INT = a23;
    v56->_networkAvailable_INT = a24;
    v56->_controllerInHH2_INT = a25;
    v56->_controllerHasSentinelZone_INT = a26;
    objc_storeStrong((id *)&v56->_errorStage_String, a31);
    objc_storeStrong((id *)&v57->_setupSessionIdentifier, a32);
    v57->_numberOfTimesPrimaryResidentChanged_HH2 = a33;
    v57->_lastPrimaryClientConnectedTime_HH2 = a34;
    v57->_numberOfTimesPrimaryClientConnected_HH2 = a35;
    v57->_numberOfTimesPrimaryClientDisconnected_HH2 = a36;
    v57->_numberOfTimesPrimaryClientConnectMessageFailed_HH2 = a37;
    v57->_currentDeviceConfirmedPrimaryResident_INT = a38;
    v57->_lastPrimaryClientConnectMessageFailErrorCode_HH2 = a39;
    objc_storeStrong((id *)&v57->_lastPrimaryClientConnectMessageFailErrorDomain_HH2, a40);
    v57->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2 = a41;
    objc_storeStrong((id *)&v57->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2, a42);
    v57->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2 = a43;
    v57->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2 = a44;
    v57->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2 = a45;
    v57->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2 = a46;
    v57->_primaryResidentElectionJoinMeshMS_HH2 = a47;
    v57->_firstCoreDataContainerSetupDurationMS_HH2 = a48;
    v57->_firstCoreDataContainerSetupErrorCode_HH2 = a49;
    objc_storeStrong((id *)&v57->_firstCoreDataContainerSetupErrorDomain_HH2, a50);
    v57->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2 = a51;
    objc_storeStrong((id *)&v57->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2, a52);
    v57->_savedEventState = a53;
    if (v55)
    {
      if (v73)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v73, a29, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = *MEMORY[0x24BDD1398];
        v76[0] = v58;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v59 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v55, a27, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMLogEvent setError:](v57, "setError:", v60);

    }
  }

  return v57;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.homepod.current.accessory.setup.metric.event");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v52;
  void *v53;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self, "sessionSetupOpenMS_HH1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionSetupOpenMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self, "controllerKeyExchangeMS_HH1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("controllerKeyExchangeMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self, "newAccessoryTransferMS_HH1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("newAccessoryTransferMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self, "sessionSetupCloseMS_HH1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sessionSetupCloseMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sentinelZoneFetchMS_HH1](self, "sentinelZoneFetchMS_HH1"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sentinelZoneFetchMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent totalDurationMS_HH1](self, "totalDurationMS_HH1"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("totalDurationMS_HH1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent accountSettleWaitMS_HH2](self, "accountSettleWaitMS_HH2"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("accountSettleWaitMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent currentDeviceIDSWaitMS_HH2](self, "currentDeviceIDSWaitMS_HH2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("currentDeviceIDSWaitMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent homeManagerReadyMS_HH2](self, "homeManagerReadyMS_HH2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("homeManagerReadyMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataImportMS_HH2](self, "firstCoreDataImportMS_HH2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("firstCoreDataImportMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self, "accessoryAddMS_HH2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("accessoryAddMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self, "settingsCreationMS_HH2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("settingsCreationMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self, "pairingIdentityCreationMS_HH2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pairingIdentityCreationMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self, "siriReadyMS_HH2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("siriReadyMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent eventRouterServerConnectionMS_HH2](self, "eventRouterServerConnectionMS_HH2"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("eventRouterServerConnectionMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self, "primaryResidentElectionMS_HH2"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("primaryResidentElectionMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent eventRouterFirstEventPushMS_HH2](self, "eventRouterFirstEventPushMS_HH2"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("eventRouterFirstEventPushMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent totalDurationMS_HH2](self, "totalDurationMS_HH2"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("totalDurationMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent iCloudAvailable_INT](self, "iCloudAvailable_INT"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("iCloudAvailable_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent IDSAvailable_INT](self, "IDSAvailable_INT"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("IDSAvailable_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent IDSRegistrationStatus_INT](self, "IDSRegistrationStatus_INT"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("IDSRegistrationStatus_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent IDSRegistrationError_INT](self, "IDSRegistrationError_INT"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("IDSRegistrationError_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent manateeAvailable_INT](self, "manateeAvailable_INT"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("manateeAvailable_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent networkAvailable_INT](self, "networkAvailable_INT"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("networkAvailable_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent controllerInHH2_INT](self, "controllerInHH2_INT"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("controllerInHH2_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent controllerHasSentinelZone_INT](self, "controllerHasSentinelZone_INT"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("controllerHasSentinelZone_INT"));

  -[HMDHomePodSetupLatencyLogEvent errorStage_String](self, "errorStage_String");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("errorStage_String"));

  -[HMDHomePodSetupLatencyLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[HMDHomePodSetupLatencyLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("setupSessionIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryResidentChanged_HH2](self, "numberOfTimesPrimaryResidentChanged_HH2"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("numberOfTimesPrimaryResidentChanged"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectedTime_HH2](self, "lastPrimaryClientConnectedTime_HH2"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("lastPrimaryClientConnectedTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnected_HH2](self, "numberOfTimesPrimaryClientConnected_HH2"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("numberOfTimesPrimaryClientConnected"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientDisconnected_HH2](self, "numberOfTimesPrimaryClientDisconnected_HH2"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("numberOfTimesPrimaryClientDisconnected"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnectMessageFailed_HH2](self, "numberOfTimesPrimaryClientConnectMessageFailed_HH2"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("numberOfTimesPrimaryClientConnectMessageFailed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent currentDeviceConfirmedPrimaryResident_INT](self, "currentDeviceConfirmedPrimaryResident_INT"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("currentDeviceConfirmedPrimaryResident_INT"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailErrorCode_HH2](self, "lastPrimaryClientConnectMessageFailErrorCode_HH2"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("lastPrimaryClientConnectMessageFailErrorCode"));

  -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailErrorDomain_HH2](self, "lastPrimaryClientConnectMessageFailErrorDomain_HH2");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("lastPrimaryClientConnectMessageFailErrorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2](self, "lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("lastPrimaryClientConnectMessageFailUnderlyingErrorCode"));

  -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2](self, "lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("lastPrimaryClientConnectMessageFailUnderlyingErrorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2](self, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2](self, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2](self, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2](self, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionJoinMeshMS_HH2](self, "primaryResidentElectionJoinMeshMS_HH2"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("primaryResidentElectionJoinMeshMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupDurationMS_HH2](self, "firstCoreDataContainerSetupDurationMS_HH2"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("firstCoreDataContainerSetupDurationMS_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupErrorCode_HH2](self, "firstCoreDataContainerSetupErrorCode_HH2"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("firstCoreDataContainerSetupErrorCode_HH2"));

  -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupErrorDomain_HH2](self, "firstCoreDataContainerSetupErrorDomain_HH2");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("firstCoreDataContainerSetupErrorDomain_HH2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupUnderlyingErrorCode_HH2](self, "firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));

  -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupUnderlyingErrorDomain_HH2](self, "firstCoreDataContainerSetupUnderlyingErrorDomain_HH2");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("firstCoreDataContainerSetupUnderlyingErrorDomain_HH2"));

  v53 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v53;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (int64_t)sessionSetupOpenMS_HH1
{
  return self->_sessionSetupOpenMS_HH1;
}

- (void)setSessionSetupOpenMS_HH1:(int64_t)a3
{
  self->_sessionSetupOpenMS_HH1 = a3;
}

- (int64_t)controllerKeyExchangeMS_HH1
{
  return self->_controllerKeyExchangeMS_HH1;
}

- (void)setControllerKeyExchangeMS_HH1:(int64_t)a3
{
  self->_controllerKeyExchangeMS_HH1 = a3;
}

- (int64_t)newAccessoryTransferMS_HH1
{
  return self->_newAccessoryTransferMS_HH1;
}

- (void)setNewAccessoryTransferMS_HH1:(int64_t)a3
{
  self->_newAccessoryTransferMS_HH1 = a3;
}

- (int64_t)sessionSetupCloseMS_HH1
{
  return self->_sessionSetupCloseMS_HH1;
}

- (void)setSessionSetupCloseMS_HH1:(int64_t)a3
{
  self->_sessionSetupCloseMS_HH1 = a3;
}

- (int64_t)sentinelZoneFetchMS_HH1
{
  return self->_sentinelZoneFetchMS_HH1;
}

- (void)setSentinelZoneFetchMS_HH1:(int64_t)a3
{
  self->_sentinelZoneFetchMS_HH1 = a3;
}

- (int64_t)totalDurationMS_HH1
{
  return self->_totalDurationMS_HH1;
}

- (void)setTotalDurationMS_HH1:(int64_t)a3
{
  self->_totalDurationMS_HH1 = a3;
}

- (int64_t)accountSettleWaitMS_HH2
{
  return self->_accountSettleWaitMS_HH2;
}

- (void)setAccountSettleWaitMS_HH2:(int64_t)a3
{
  self->_accountSettleWaitMS_HH2 = a3;
}

- (int64_t)currentDeviceIDSWaitMS_HH2
{
  return self->_currentDeviceIDSWaitMS_HH2;
}

- (void)setCurrentDeviceIDSWaitMS_HH2:(int64_t)a3
{
  self->_currentDeviceIDSWaitMS_HH2 = a3;
}

- (int64_t)homeManagerReadyMS_HH2
{
  return self->_homeManagerReadyMS_HH2;
}

- (void)setHomeManagerReadyMS_HH2:(int64_t)a3
{
  self->_homeManagerReadyMS_HH2 = a3;
}

- (int64_t)firstCoreDataImportMS_HH2
{
  return self->_firstCoreDataImportMS_HH2;
}

- (void)setFirstCoreDataImportMS_HH2:(int64_t)a3
{
  self->_firstCoreDataImportMS_HH2 = a3;
}

- (int64_t)accessoryAddMS_HH2
{
  return self->_accessoryAddMS_HH2;
}

- (void)setAccessoryAddMS_HH2:(int64_t)a3
{
  self->_accessoryAddMS_HH2 = a3;
}

- (int64_t)settingsCreationMS_HH2
{
  return self->_settingsCreationMS_HH2;
}

- (void)setSettingsCreationMS_HH2:(int64_t)a3
{
  self->_settingsCreationMS_HH2 = a3;
}

- (int64_t)pairingIdentityCreationMS_HH2
{
  return self->_pairingIdentityCreationMS_HH2;
}

- (void)setPairingIdentityCreationMS_HH2:(int64_t)a3
{
  self->_pairingIdentityCreationMS_HH2 = a3;
}

- (int64_t)siriReadyMS_HH2
{
  return self->_siriReadyMS_HH2;
}

- (void)setSiriReadyMS_HH2:(int64_t)a3
{
  self->_siriReadyMS_HH2 = a3;
}

- (int64_t)eventRouterServerConnectionMS_HH2
{
  return self->_eventRouterServerConnectionMS_HH2;
}

- (void)setEventRouterServerConnectionMS_HH2:(int64_t)a3
{
  self->_eventRouterServerConnectionMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionMS_HH2
{
  return self->_primaryResidentElectionMS_HH2;
}

- (void)setPrimaryResidentElectionMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionMS_HH2 = a3;
}

- (int64_t)eventRouterFirstEventPushMS_HH2
{
  return self->_eventRouterFirstEventPushMS_HH2;
}

- (void)setEventRouterFirstEventPushMS_HH2:(int64_t)a3
{
  self->_eventRouterFirstEventPushMS_HH2 = a3;
}

- (int64_t)totalDurationMS_HH2
{
  return self->_totalDurationMS_HH2;
}

- (void)setTotalDurationMS_HH2:(int64_t)a3
{
  self->_totalDurationMS_HH2 = a3;
}

- (BOOL)iCloudAvailable_INT
{
  return self->_iCloudAvailable_INT;
}

- (void)setICloudAvailable_INT:(BOOL)a3
{
  self->_iCloudAvailable_INT = a3;
}

- (BOOL)IDSAvailable_INT
{
  return self->_IDSAvailable_INT;
}

- (void)setIDSAvailable_INT:(BOOL)a3
{
  self->_IDSAvailable_INT = a3;
}

- (int64_t)IDSRegistrationStatus_INT
{
  return self->_IDSRegistrationStatus_INT;
}

- (void)setIDSRegistrationStatus_INT:(int64_t)a3
{
  self->_IDSRegistrationStatus_INT = a3;
}

- (int64_t)IDSRegistrationError_INT
{
  return self->_IDSRegistrationError_INT;
}

- (void)setIDSRegistrationError_INT:(int64_t)a3
{
  self->_IDSRegistrationError_INT = a3;
}

- (BOOL)manateeAvailable_INT
{
  return self->_manateeAvailable_INT;
}

- (void)setManateeAvailable_INT:(BOOL)a3
{
  self->_manateeAvailable_INT = a3;
}

- (BOOL)networkAvailable_INT
{
  return self->_networkAvailable_INT;
}

- (void)setNetworkAvailable_INT:(BOOL)a3
{
  self->_networkAvailable_INT = a3;
}

- (BOOL)controllerInHH2_INT
{
  return self->_controllerInHH2_INT;
}

- (void)setControllerInHH2_INT:(BOOL)a3
{
  self->_controllerInHH2_INT = a3;
}

- (BOOL)controllerHasSentinelZone_INT
{
  return self->_controllerHasSentinelZone_INT;
}

- (void)setControllerHasSentinelZone_INT:(BOOL)a3
{
  self->_controllerHasSentinelZone_INT = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  self->_underlyingErrorCode = a3;
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingErrorDomain, a3);
}

- (NSString)errorStage_String
{
  return self->_errorStage_String;
}

- (void)setErrorStage_String:(id)a3
{
  objc_storeStrong((id *)&self->_errorStage_String, a3);
}

- (NSString)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (void)setSetupSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_setupSessionIdentifier, a3);
}

- (unsigned)numberOfTimesPrimaryResidentChanged_HH2
{
  return self->_numberOfTimesPrimaryResidentChanged_HH2;
}

- (void)setNumberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryResidentChanged_HH2 = a3;
}

- (unint64_t)lastPrimaryClientConnectedTime_HH2
{
  return self->_lastPrimaryClientConnectedTime_HH2;
}

- (void)setLastPrimaryClientConnectedTime_HH2:(unint64_t)a3
{
  self->_lastPrimaryClientConnectedTime_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientConnected_HH2
{
  return self->_numberOfTimesPrimaryClientConnected_HH2;
}

- (void)setNumberOfTimesPrimaryClientConnected_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientConnected_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected_HH2
{
  return self->_numberOfTimesPrimaryClientDisconnected_HH2;
}

- (void)setNumberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientDisconnected_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed_HH2
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed_HH2;
}

- (void)setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientConnectMessageFailed_HH2 = a3;
}

- (BOOL)currentDeviceConfirmedPrimaryResident_INT
{
  return self->_currentDeviceConfirmedPrimaryResident_INT;
}

- (void)setCurrentDeviceConfirmedPrimaryResident_INT:(BOOL)a3
{
  self->_currentDeviceConfirmedPrimaryResident_INT = a3;
}

- (int64_t)lastPrimaryClientConnectMessageFailErrorCode_HH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorCode_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a3
{
  self->_lastPrimaryClientConnectMessageFailErrorCode_HH2 = a3;
}

- (NSString)lastPrimaryClientConnectMessageFailErrorDomain_HH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomain_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomain_HH2, a3);
}

- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a3
{
  self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2 = a3;
}

- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2, a3);
}

- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2
{
  return self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionJoinMeshMS_HH2
{
  return self->_primaryResidentElectionJoinMeshMS_HH2;
}

- (void)setPrimaryResidentElectionJoinMeshMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionJoinMeshMS_HH2 = a3;
}

- (int64_t)firstCoreDataContainerSetupDurationMS_HH2
{
  return self->_firstCoreDataContainerSetupDurationMS_HH2;
}

- (void)setFirstCoreDataContainerSetupDurationMS_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupDurationMS_HH2 = a3;
}

- (int64_t)firstCoreDataContainerSetupErrorCode_HH2
{
  return self->_firstCoreDataContainerSetupErrorCode_HH2;
}

- (void)setFirstCoreDataContainerSetupErrorCode_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupErrorCode_HH2 = a3;
}

- (NSString)firstCoreDataContainerSetupErrorDomain_HH2
{
  return self->_firstCoreDataContainerSetupErrorDomain_HH2;
}

- (void)setFirstCoreDataContainerSetupErrorDomain_HH2:(id)a3
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomain_HH2, a3);
}

- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCode_HH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2 = a3;
}

- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomain_HH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a3
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2, a3);
}

- (unint64_t)savedEventState
{
  return self->_savedEventState;
}

- (void)setSavedEventState:(unint64_t)a3
{
  self->_savedEventState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_errorStage_String, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
