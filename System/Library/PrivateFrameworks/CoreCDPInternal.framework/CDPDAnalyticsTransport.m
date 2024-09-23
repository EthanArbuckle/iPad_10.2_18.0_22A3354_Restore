@implementation CDPDAnalyticsTransport

- (CDPDAnalyticsTransport)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDAnalyticsTransport *v12;
  CDPDAnalyticsTransport *v13;
  void **p_clientBundleId;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  AAFAnalyticsTransportInProcessRTC *transport;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  CDPDTTRController *v22;
  CDPDTTRController *ttrController;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CDPDAnalyticsTransport;
  v12 = -[CDPDAnalyticsTransport init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientType, a3);
    p_clientBundleId = (void **)&v13->_clientBundleId;
    objc_storeStrong((id *)&v13->_clientBundleId, a4);
    objc_storeStrong((id *)&v13->_clientName, a5);
    if (!v10)
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[CDPDAnalyticsTransport initWithClientType:clientBundleId:clientName:].cold.1((uint64_t)v9, (uint64_t)v11, v15);

      v16 = *p_clientBundleId;
      *p_clientBundleId = CFSTR("unknown");

    }
    objc_msgSend(MEMORY[0x24BDFC2B8], "analyticsTransportRTCWithClientType:clientBundleId:clientName:", v9, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
    transport = v13->_transport;
    v13->_transport = (AAFAnalyticsTransportInProcessRTC *)v17;

    if (!v13->_transport)
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v25 = *p_clientBundleId;
        *(_DWORD *)buf = 138412802;
        v28 = v9;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v11;
        _os_log_fault_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_FAULT, "\"Underlying transport is nil. clientType = %@, clientBundleId = %@, clientName = %@\", buf, 0x20u);
      }

    }
    +[CDPDAnalyticsTransport getAllowedStringsForTelemetry](CDPDAnalyticsTransport, "getAllowedStringsForTelemetry");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)allowedStringsForTelemetry;
    allowedStringsForTelemetry = v20;

    v22 = objc_alloc_init(CDPDTTRController);
    ttrController = v13->_ttrController;
    v13->_ttrController = v22;

  }
  return v13;
}

+ (id)defaultTransport
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *MEMORY[0x24BE1A858];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transportForClientType:clientBundleId:clientName:", v3, v5, *MEMORY[0x24BE1A850]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)transportForEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  _CDPLogSystemAnalytics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CDPDAnalyticsTransport transportForEvent:].cold.2(v3);

  objc_msgSend(v3, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A850]);

  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC320]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "setClientName:", *MEMORY[0x24BE1A848]);
      _CDPLogSystemAnalytics();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[CDPDAnalyticsTransport transportForEvent:].cold.1(v3);

    }
  }
  objc_msgSend(v3, "clientType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPDAnalyticsTransport transportForClientType:clientBundleId:clientName:](CDPDAnalyticsTransport, "transportForClientType:clientBundleId:clientName:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)flushTransportCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "Flushing transport caches", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

+ (void)flushCaches
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "Flushing transport and sequence caches", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

+ (id)getAllowedSecurityEvents
{
  if (getAllowedSecurityEvents_onceToken != -1)
    dispatch_once(&getAllowedSecurityEvents_onceToken, &__block_literal_global_28);
  return (id)getAllowedSecurityEvents_approvedSecurityEvents;
}

void __50__CDPDAnalyticsTransport_getAllowedSecurityEvents__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.security.primaryAccountAdded"), CFSTR("com.apple.security.idMSSecurityLevel"), CFSTR("com.apple.security.cloudKitAccountAvailability"), CFSTR("com.apple.security.initiatorCreatesPacket1"), CFSTR("com.apple.security.acceptorCreatesPacket2"), CFSTR("com.apple.security.kVSSyncAndWait"), CFSTR("com.apple.security.flush"), CFSTR("com.apple.security.validatedStashedAccountCredential"), CFSTR("com.apple.security.initiatorCreatesPacket3"), CFSTR("com.apple.security.fetchMachineID"), CFSTR("com.apple.security.prepareIdentityInTPH"), CFSTR("com.apple.security.createSOSApplication"), CFSTR("com.apple.security.acceptorCreatesPacket4"), CFSTR("com.apple.security.verifySOSApplication"), CFSTR("com.apple.security.createSOSCircleBlob"), CFSTR("com.apple.security.trustedDeviceListRefresh"), CFSTR("com.apple.security.cKKSTLKFetch"),
    CFSTR("com.apple.security.updateTrust"),
    CFSTR("com.apple.security.initiatorJoinsTrustSystems"),
    CFSTR("com.apple.security.initaitorJoinSOS"),
    CFSTR("com.apple.security.updateTDL"),
    CFSTR("com.apple.security.fetchAndPersistChanges"),
    CFSTR("com.apple.security.fetchPolicyDocument"),
    CFSTR("com.apple.security.join"),
    CFSTR("com.apple.security.initiatorWaitsForUpgrade"),
    CFSTR("com.apple.security.preApprovedJoin"),
    CFSTR("com.apple.security.acceptorCreatesPacket5"),
    CFSTR("com.apple.security.initiatorImportsInitialSyncData"),
    CFSTR("com.apple.security.acceptorCreatesVoucher"),
    CFSTR("com.apple.security.acceptorFetchesInitialSyncData"),
    CFSTR("com.apple.security.ckks.launchStart"),
    CFSTR("com.apple.security.ckks.syncingPolicySet"),
    CFSTR("com.apple.security.ckks.CKAccountLogin"),
    CFSTR("com.apple.security.ckks.zoneChangeFetch"),
    CFSTR("com.apple.security.ckks.zoneCreation"),
    CFSTR("com.apple.security.ckks.trustGain"),
    CFSTR("com.apple.security.ckks.trustLoss"),
    CFSTR("com.apple.security.ckks.healKeyHierarchy"),
    CFSTR("com.apple.security.ckks.healKeyHierarchy.healBrokenRecords"),
    CFSTR("com.apple.security.ckks.healKeyHierarchy.uploadHealedTLKShares"),
    CFSTR("com.apple.security.ckks.healTLKShares"),
    CFSTR("com.apple.security.ckks.healTLKShares.createMissingTLKShares"),
    CFSTR("com.apple.security.ckks.healTLKShares.uploadMissingTLKShares"),
    CFSTR("com.apple.security.ckks.processIncomingQueue"),
    CFSTR("com.apple.security.ckks.processIncomingQueue.loadAndProcessIQEs"),
    CFSTR("com.apple.security.ckks.processIncomingQueue.fixMismatchedViewItems"),
    CFSTR("com.apple.security.ckks.processReceivedKeys"),
    CFSTR("com.apple.security.ckks.scanLocalItems"),
    CFSTR("com.apple.security.ckks.scanLocalItems.querySyncableItems"),
    CFSTR("com.apple.security.ckks.scanLocalItems.onboardMissingItems"),
    CFSTR("com.apple.security.ckks.processOutgoingQueue"),
    CFSTR("com.apple.security.ckks.processOutgoingQueue.uploadOQEstoCK"),
    CFSTR("com.apple.security.ckks.processOutgoingQueue.saveCKMirrorEntries"),
    CFSTR("com.apple.security.ckks.firstManateeKeyFetch"),
    CFSTR("com.apple.security.ckks.localSyncFinish"),
    CFSTR("com.apple.security.ckks.contentSyncFinish"),
    CFSTR("com.apple.security.ckks.deviceLocked"),
    CFSTR("com.apple.security.ckks.deviceUnlocked"),
    CFSTR("com.apple.security.ckks.localReset"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAllowedSecurityEvents_approvedSecurityEvents;
  getAllowedSecurityEvents_approvedSecurityEvents = v0;

}

+ (id)getAllowedDNUEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CDPDAnalyticsTransport_getAllowedDNUEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowedDNUEvents_onceToken != -1)
    dispatch_once(&getAllowedDNUEvents_onceToken, block);
  return (id)getAllowedDNUEvents_approvedEvents;
}

void __45__CDPDAnalyticsTransport_getAllowedDNUEvents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.appleaccount.inheritance.preflightCheckEvent"), *MEMORY[0x24BE1A670], *MEMORY[0x24BE1A828], *MEMORY[0x24BE1A820], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getApprovedEventsForADPAndDNU");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v7)
  {
    objc_msgSend(v2, "unionSet:", v7);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)getAllowedDNUEvents_approvedEvents;
    getAllowedDNUEvents_approvedEvents = v4;

  }
  else
  {
    v6 = getAllowedDNUEvents_approvedEvents;
    getAllowedDNUEvents_approvedEvents = (uint64_t)v2;
    v3 = (void *)v6;
  }

}

+ (id)getAllowedADPEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CDPDAnalyticsTransport_getAllowedADPEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowedADPEvents_onceToken != -1)
    dispatch_once(&getAllowedADPEvents_onceToken, block);
  return (id)getAllowedADPEvents_approvedEvents;
}

void __45__CDPDAnalyticsTransport_getAllowedADPEvents__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "getApprovedEventsForADPAndDNU");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getAllowedADPEvents_approvedEvents;
  getAllowedADPEvents_approvedEvents = v1;

}

+ (id)getApprovedEventsForADPAndDNU
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CDPDAnalyticsTransport_getApprovedEventsForADPAndDNU__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getApprovedEventsForADPAndDNU_onceToken != -1)
    dispatch_once(&getApprovedEventsForADPAndDNU_onceToken, block);
  return (id)getApprovedEventsForADPAndDNU_approvedEvents;
}

void __55__CDPDAnalyticsTransport_getApprovedEventsForADPAndDNU__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", *MEMORY[0x24BE1A690], *MEMORY[0x24BE1A6C8], *MEMORY[0x24BE1A5D8], *MEMORY[0x24BE1A618], *MEMORY[0x24BE1A7D0], *MEMORY[0x24BE1A770], *MEMORY[0x24BE1A778], *MEMORY[0x24BE1A650], *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A630], *MEMORY[0x24BE1A7E8], *MEMORY[0x24BE1A6A0], *MEMORY[0x24BE1A780], *MEMORY[0x24BE1A720], *MEMORY[0x24BE1A668], *MEMORY[0x24BE1A678], *MEMORY[0x24BE1A7E0],
    *MEMORY[0x24BE1A7D8],
    *MEMORY[0x24BE1A5E0],
    *MEMORY[0x24BE1A5F0],
    *MEMORY[0x24BE1A5E8],
    *MEMORY[0x24BE1A628],
    *MEMORY[0x24BE1A710],
    *MEMORY[0x24BE1A718],
    *MEMORY[0x24BE1A750],
    *MEMORY[0x24BE1A708],
    *MEMORY[0x24BE1A700],
    *MEMORY[0x24BE1A6B0],
    *MEMORY[0x24BE1A798],
    *MEMORY[0x24BE1A7A0],
    *MEMORY[0x24BE1A7B8],
    *MEMORY[0x24BE1A7B0],
    *MEMORY[0x24BE1A7A8],
    *MEMORY[0x24BE1A790],
    *MEMORY[0x24BE1A810],
    *MEMORY[0x24BE1A818],
    *MEMORY[0x24BE1A740],
    *MEMORY[0x24BE1A738],
    *MEMORY[0x24BE1A730],
    kAKAnalyticsEventMIDInvalidation,
    CFSTR("com.apple.authkit.proximityAuthentication"),
    *MEMORY[0x24BE1A788],
    CFSTR("com.apple.appleaccount.iCloudAuthLoginAndUpdate"),
    CFSTR("com.apple.appleaccount.iCloudAuthPreflightSave"),
    *MEMORY[0x24BE1A698],
    CFSTR("com.apple.appleid.accountHealthEvent"),
    CFSTR("com.apple.appleaccount.iCloudAccountAdd"),
    *MEMORY[0x24BE1A808],
    *MEMORY[0x24BE1A728],
    *MEMORY[0x24BE04C28],
    *MEMORY[0x24BE04C30],
    *MEMORY[0x24BE04B70],
    *MEMORY[0x24BE04B68],
    *MEMORY[0x24BE04B80],
    *MEMORY[0x24BE04B88],
    *MEMORY[0x24BE04B90],
    *MEMORY[0x24BE04B78],
    *MEMORY[0x24BE04B60],
    CFSTR("com.apple.appleaccount.addRecoveryContactLanding"),
    CFSTR("com.apple.appleaccount.localSecretCollection"),
    CFSTR("com.apple.appleaccount.selectRecoveryContact"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getApprovedEventsForADPAndDNU_approvedEvents;
  getApprovedEventsForADPAndDNU_approvedEvents = v1;

  v3 = (void *)getApprovedEventsForADPAndDNU_approvedEvents;
  objc_msgSend(*(id *)(a1 + 32), "getAllowedSecurityEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

}

+ (id)getApprovedEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC320]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      +[CDPDAnalyticsTransport getAllowedADPEvents](CDPDAnalyticsTransport, "getAllowedADPEvents");
    else
      +[CDPDAnalyticsTransport getAllowedDNUEvents](CDPDAnalyticsTransport, "getAllowedDNUEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isEventPrivacyApproved:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CDPDAnalyticsTransport getApprovedEvents:](CDPDAnalyticsTransport, "getApprovedEvents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

+ (id)getAllowedLocalSecretType
{
  if (getAllowedLocalSecretType_onceToken != -1)
    dispatch_once(&getAllowedLocalSecretType_onceToken, &__block_literal_global_189);
  return (id)getAllowedLocalSecretType_approvedSecretTypes;
}

void __51__CDPDAnalyticsTransport_getAllowedLocalSecretType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("None"), CFSTR("Passcode"), CFSTR("Password"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAllowedLocalSecretType_approvedSecretTypes;
  getAllowedLocalSecretType_approvedSecretTypes = v0;

}

+ (id)getAllowedEscapeOffer
{
  if (getAllowedEscapeOffer_onceToken != -1)
    dispatch_once(&getAllowedEscapeOffer_onceToken, &__block_literal_global_196);
  return (id)getAllowedEscapeOffer_approvedEscapeOffers;
}

void __47__CDPDAnalyticsTransport_getAllowedEscapeOffer__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE1A880], *MEMORY[0x24BE1A888], *MEMORY[0x24BE1A898], *MEMORY[0x24BE1A8A8], *MEMORY[0x24BE1A8B0], *MEMORY[0x24BE1A8B8], *MEMORY[0x24BE1A968], *MEMORY[0x24BE1A970], *MEMORY[0x24BE1A978], *MEMORY[0x24BE1A868], *MEMORY[0x24BE1A870], *MEMORY[0x24BE1A878], *MEMORY[0x24BE1A8C0], *MEMORY[0x24BE1A8C8], *MEMORY[0x24BE1A8D8], *MEMORY[0x24BE1A8D0], *MEMORY[0x24BE1A8E8],
    *MEMORY[0x24BE1A8F0],
    *MEMORY[0x24BE1A8F8],
    *MEMORY[0x24BE1A900],
    *MEMORY[0x24BE1A908],
    *MEMORY[0x24BE1A910],
    *MEMORY[0x24BE1A918],
    *MEMORY[0x24BE1A920],
    *MEMORY[0x24BE1A928],
    *MEMORY[0x24BE1A930],
    *MEMORY[0x24BE1A938],
    *MEMORY[0x24BE1A940],
    *MEMORY[0x24BE1A948],
    *MEMORY[0x24BE1A950],
    *MEMORY[0x24BE1A960],
    *MEMORY[0x24BE1A8A0],
    *MEMORY[0x24BE1A958],
    *MEMORY[0x24BE1A890],
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAllowedEscapeOffer_approvedEscapeOffers;
  getAllowedEscapeOffer_approvedEscapeOffers = v0;

}

+ (id)getAllowedErrorDomain
{
  if (getAllowedErrorDomain_onceToken != -1)
    dispatch_once(&getAllowedErrorDomain_onceToken, &__block_literal_global_197);
  return (id)getAllowedErrorDomain_approvedErrorDomains;
}

void __47__CDPDAnalyticsTransport_getAllowedErrorDomain__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDD0B88], *MEMORY[0x24BDD1100], *MEMORY[0x24BDD1128], *MEMORY[0x24BDD1308], *MEMORY[0x24BDE8430], *MEMORY[0x24BDB8EA8], *MEMORY[0x24BDB8EE0], *MEMORY[0x24BDBB568], *MEMORY[0x24BE1A368], *MEMORY[0x24BE0AB28], *MEMORY[0x24BE17C10], *MEMORY[0x24BE17B98], *MEMORY[0x24BE17B90], *MEMORY[0x24BE0AB08], CFSTR("securityd"), CFSTR("EscrowProxyErrorDomain"), CFSTR("FLErrorDomain"),
    CFSTR("SyncedDefaults"),
    CFSTR("AKUnderlyingADIErrors"),
    CFSTR("CKKSResultOperationError"),
    CFSTR("com.apple.security.trustedpeers"),
    CFSTR("com.apple.security.trustedpeers.EscrowKeys"),
    CFSTR("com.apple.security.trustedpeers.container"),
    CFSTR("com.apple.security.trustedpeers.peerstatus"),
    CFSTR("com.apple.security.sos.error"),
    CFSTR("com.apple.security.keychaincircle"),
    CFSTR("com.apple.LocalAuthentication"),
    CFSTR("com.apple.AppleIDAuthSupport"),
    CFSTR("com.apple.appleaccount"),
    CFSTR("com.apple.protectedcloudstorage"),
    CFSTR("com.apple.security.octagon"),
    CFSTR("com.apple.accounts"),
    CFSTR("com.apple.accounts.keychain"),
    CFSTR("AOSErrorDomain"),
    CFSTR("AKAuthenticationServerError"),
    CFSTR("com.apple.AppleAccount.Error"),
    CFSTR("com.apple.utilities.sqlite3"),
    CFSTR("com.apple.security.kcparingchannel"),
    CFSTR("com.apple.MobileActivation.ErrorDomain"),
    CFSTR("CKKSResultOperationDescriptionError"),
    CFSTR("com.appple.ckks.state"),
    CFSTR("com.apple.security.octagon.state"),
    CFSTR("AACustodianErrors"),
    CFSTR("AACustodianRecoveryErrors"),
    CFSTR("CKKSResultOperationDescriptionError"),
    CFSTR("com.apple.security.trustedpeers.RecoveryKeySetError"),
    CFSTR("com.apple.security.octagon.state"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAllowedErrorDomain_approvedErrorDomains;
  getAllowedErrorDomain_approvedErrorDomains = v0;

}

+ (id)getAllowedCfuType
{
  if (getAllowedCfuType_onceToken != -1)
    dispatch_once(&getAllowedCfuType_onceToken, &__block_literal_global_260);
  return (id)getAllowedCfuType_approvedCFUTypes;
}

void __43__CDPDAnalyticsTransport_getAllowedCfuType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("RepairCDPState"), CFSTR("OfflineLocalSecretChange"), CFSTR("RegenerateCDPRecoveryKey"), CFSTR("SecureTerms"), CFSTR("ConfirmExistingSecret"), CFSTR("kCDPConfirmExistingSecret"), CFSTR("SOSCompatibilityMode"), CFSTR("com.apple.AAFollowUpIdentifier.RenewCredentials"), CFSTR("com.apple.AAFollowUpIdentifier.custodianRemoved"), CFSTR("com.apple.AAFollowUpIdentifier.custodianWalrusNoLiveness"), CFSTR("com.apple.AAFollowUpIdentifier.custodianWalrusRemoved"), CFSTR("com.apple.AAFollowUpIdentifier.walrusUserRecoveryFactorsMissing"), CFSTR("com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch"), CFSTR("com.apple.CDPFollowUpIdentifier.adpStateHealing"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAllowedCfuType_approvedCFUTypes;
  getAllowedCfuType_approvedCFUTypes = v0;

}

+ (id)getAllowedStringsForTelemetry
{
  if (getAllowedStringsForTelemetry_onceToken != -1)
    dispatch_once(&getAllowedStringsForTelemetry_onceToken, &__block_literal_global_289);
  return (id)getAllowedStringsForTelemetry_allowedStringsDict;
}

void __55__CDPDAnalyticsTransport_getAllowedStringsForTelemetry__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BE1A6D0];
  +[CDPDAnalyticsTransport getAllowedLocalSecretType](CDPDAnalyticsTransport, "getAllowedLocalSecretType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = *MEMORY[0x24BE1A648];
  +[CDPDAnalyticsTransport getAllowedEscapeOffer](CDPDAnalyticsTransport, "getAllowedEscapeOffer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = *MEMORY[0x24BE1A658];
  +[CDPDAnalyticsTransport getAllowedEscapeOffer](CDPDAnalyticsTransport, "getAllowedEscapeOffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = *MEMORY[0x24BDFC338];
  +[CDPDAnalyticsTransport getAllowedErrorDomain](CDPDAnalyticsTransport, "getAllowedErrorDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = *MEMORY[0x24BE1A608];
  +[CDPDAnalyticsTransport getAllowedCfuType](CDPDAnalyticsTransport, "getAllowedCfuType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = CFSTR("underlyingErrorDomain1");
  +[CDPDAnalyticsTransport getAllowedErrorDomain](CDPDAnalyticsTransport, "getAllowedErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = CFSTR("underlyingErrorDomain2");
  +[CDPDAnalyticsTransport getAllowedErrorDomain](CDPDAnalyticsTransport, "getAllowedErrorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = CFSTR("underlyingErrorDomain3");
  +[CDPDAnalyticsTransport getAllowedErrorDomain](CDPDAnalyticsTransport, "getAllowedErrorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)getAllowedStringsForTelemetry_allowedStringsDict;
  getAllowedStringsForTelemetry_allowedStringsDict = v8;

}

+ (id)transportForClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (transportCacheToken == -1)
  {
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&transportCacheToken, &__block_literal_global_297);
    if (!v8)
      goto LABEL_7;
  }
  if (v9 && v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@"), v10, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2;
    v15[3] = &unk_24C81C3D8;
    v16 = v11;
    v20 = a1;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    v12 = v11;
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2((uint64_t)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);

    goto LABEL_10;
  }
LABEL_7:
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[CDPDAnalyticsTransport transportForClientType:clientBundleId:clientName:].cold.1();
  v13 = 0;
LABEL_10:

  return v13;
}

void __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)transportCache;
  transportCache = (uint64_t)v0;

}

id __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;

  _CDPLogSystemAnalytics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_2();

  objc_msgSend((id)transportCache, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithClientType:clientBundleId:clientName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend((id)transportCache, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
  }
  _CDPLogSystemAnalytics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_1();

  return v3;
}

- (void)enforcePrivacyComplianceOnEvent:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  __int128 v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1A648]))
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v30 = v8;
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v15)
      {
        v17 = v15;
        v18 = *(_QWORD *)v32;
        v19 = *MEMORY[0x24BE1A980];
        *(_QWORD *)&v16 = 138412802;
        v28 = v16;
        v29 = v7;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v32 != v18)
              objc_enumerationMutation(v14);
            v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v9, "containsObject:", v21, v28) & 1) != 0)
            {
              objc_msgSend(v11, "addObject:", v21);
            }
            else
            {
              objc_msgSend(v11, "addObject:", v19);
              _CDPLogSystem();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v7, "eventName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v28;
                v36 = v21;
                v37 = 2112;
                v38 = v23;
                v39 = 2112;
                v40 = v30;
                _os_log_fault_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_FAULT, "\"Received not approved data %@ for event %@ attribute %@\", buf, 0x20u);

                v7 = v29;
              }

            }
          }
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        }
        while (v17);
      }

      objc_msgSend(v11, "aaf_arrayAsCommaSeperatedString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v30;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v30);

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v9, "containsObject:", v25);

      if ((v26 & 1) == 0)
      {
        _CDPLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[CDPDAnalyticsTransport enforcePrivacyComplianceOnEvent:key:value:].cold.1(v7, (uint64_t)v8, v27);

        objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x24BE1A980], v8);
      }
    }
  }

}

- (BOOL)shouldEnforcePrivacyComplianceForEvent:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "eventCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE1A860]);

  }
  return v4;
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  if (sendEvent__onceToken != -1)
    dispatch_once(&sendEvent__onceToken, &__block_literal_global_307);
  -[CDPDAnalyticsTransport _updateEventWithDefaultMetadata:](self, "_updateEventWithDefaultMetadata:", v4);
  _CDPLogSystemAnalytics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDAnalyticsTransport sendEvent:].cold.2(v4);

  v6 = (void *)os_transaction_create();
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_310;
  aBlock[3] = &unk_24C81C448;
  aBlock[4] = self;
  v8 = v6;
  v18 = v8;
  v9 = _Block_copy(aBlock);
  -[CDPDAnalyticsTransport transport](self, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_2549F3960);

  if ((v11 & 1) != 0)
  {
    v12 = sendEvent__telemetryQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374;
    block[3] = &unk_24C81C470;
    block[4] = self;
    v15 = v4;
    v16 = v9;
    dispatch_async(v12, block);

  }
  else
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CDPDAnalyticsTransport sendEvent:].cold.1();

  }
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)flowToSequenceMap;
  flowToSequenceMap = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.cdpd.telemetryQueue", v4);
  v3 = (void *)sendEvent__telemetryQueue;
  sendEvent__telemetryQueue = (uint64_t)v2;

}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_310(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  _CDPLogSystemAnalytics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __36__CDPDAnalyticsTransport_sendEvent___block_invoke_310_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "_sendEvent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = dispatch_time(0, 300000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_311;
    block[3] = &unk_24C81C420;
    v8 = *(id *)(a1 + 40);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

  }
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_311()
{
  NSObject *v0;

  _CDPLogSystemAnalytics();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __36__CDPDAnalyticsTransport_sendEvent___block_invoke_311_cold_1();

}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionState");

  switch(v4)
  {
    case 3:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      break;
    case 2:
      _CDPLogSystemAnalytics();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "transport");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

      _CDPLogSystemAnalytics();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374_cold_1(v2);

      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "configureSessionForEvent:sendEventBlock:telemetryQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), sendEvent__telemetryQueue);
      break;
  }
}

- (void)configureSessionForEvent:(id)a3 sendEventBlock:(id)a4 telemetryQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  CDPDAnalyticsTransport *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _CDPLogSystemAnalytics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPDAnalyticsTransport configureSessionForEvent:sendEventBlock:telemetryQueue:].cold.2();

  -[CDPDAnalyticsTransport transport](self, "transport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSessionState:", 2);

  -[CDPDAnalyticsTransport transport](self, "transport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke;
  v19[3] = &unk_24C81C4E0;
  v20 = v10;
  v21 = self;
  v22 = v9;
  v14 = v9;
  v15 = v10;
  objc_msgSend(v13, "configureReportingSessionWithCompletion:", v19);

  _CDPLogSystemAnalytics();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CDPDAnalyticsTransport configureSessionForEvent:sendEventBlock:telemetryQueue:].cold.1();

  -[CDPDAnalyticsTransport transport](self, "transport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "eventQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v8);

}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2;
  v8 = &unk_24C81C1E8;
  v2 = *(NSObject **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  dispatch_async(v2, &v5);
  objc_msgSend(*(id *)(a1 + 40), "transport", v5, v6, v7, v8, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 1000000000 * objc_msgSend(v3, "sessionGracePeriod"));
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_378);

}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  _CDPLogSystemAnalytics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionState:", 3);

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_375;
  v8[3] = &unk_24C81C498;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

uint64_t __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_375(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_377()
{
  NSObject *v0;

  _CDPLogSystemAnalytics();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_377_cold_1();

  return +[CDPDAnalyticsTransport flushTransportCache](CDPDAnalyticsTransport, "flushTransportCache");
}

- (void)_updateEventWithDefaultMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v3 = a3;
  v4 = *MEMORY[0x24BE1A830];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE1A830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "aaf_processName");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v4);

      }
    }

  }
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  v31 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC348]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v25 = __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke;
    v26 = &unk_24C81C508;
    v29 = v30;
    v27 = v10;
    v28 = v3;
    v12 = v24;
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    v25((uint64_t)v12);

    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild"))
  {
    v13 = *MEMORY[0x24BDFC358];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC358]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)CFPreferencesCopyAppValue(CFSTR("TelemetryInternalSignature"), CFSTR("com.apple.AAAFoundation"));
      if (v15)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "primaryAuthKitAccount");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "DSIDForAccount:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serialNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;%@"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v13);

      }
    }
  }
  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "isVirtualMachine") & 1) != 0)
  {
    v23 = CFSTR("VM");
LABEL_18:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE1A638]);
    goto LABEL_19;
  }
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isDemoDevice"))
  {
    v23 = CFSTR("Demo");
    goto LABEL_18;
  }
LABEL_19:

  _Block_object_dispose(v30, 8);
}

void __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  objc_msgSend((id)flowToSequenceMap, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v6, "longValue") + 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    *(_QWORD *)(v5 + 40) = &unk_24C836680;
  }

  objc_msgSend((id)flowToSequenceMap, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *MEMORY[0x24BE1A838]);
  _CDPLogSystemAnalytics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke_cold_1();

}

- (id)_sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AAFAnalyticsTransportInProcessRTC *transport;
  NSObject *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  CDPDAnalyticsTransport *v16;
  id v17;

  v4 = a3;
  if (-[CDPDAnalyticsTransport shouldEnforcePrivacyComplianceForEvent:](self, "shouldEnforcePrivacyComplianceForEvent:", v4))
  {
    if (!+[CDPDAnalyticsTransport isEventPrivacyApproved:](CDPDAnalyticsTransport, "isEventPrivacyApproved:", v4))
    {
      v6 = 0;
      goto LABEL_18;
    }
    v5 = (void *)allowedStringsForTelemetry;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __37__CDPDAnalyticsTransport__sendEvent___block_invoke;
    v15 = &unk_24C81C530;
    v16 = self;
    v17 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v12);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE1A838], v12, v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _CDPLogSystemAnalytics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDPDAnalyticsTransport _sendEvent:].cold.3(v4);

  }
  transport = self->_transport;
  if (!transport)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[CDPDAnalyticsTransport _sendEvent:].cold.2();

    transport = self->_transport;
  }
  -[AAFAnalyticsTransportInProcessRTC sendEvent:](transport, "sendEvent:", v4);
  if (v6)
  {
    _CDPLogSystemAnalytics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CDPDAnalyticsTransport _sendEvent:].cold.1(v4);

  }
  -[CDPDTTRController requestTTRIfSupportedForEvent:](self->_ttrController, "requestTTRIfSupportedForEvent:", v4);
LABEL_18:

  return v6;
}

uint64_t __37__CDPDAnalyticsTransport__sendEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "enforcePrivacyComplianceOnEvent:key:value:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[AAFAnalyticsTransportInProcessRTC debugDescription](self->_transport, "debugDescription");
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CDPDTTRController)ttrController
{
  return self->_ttrController;
}

- (void)setTtrController:(id)a3
{
  objc_storeStrong((id *)&self->_ttrController, a3);
}

- (AAFAnalyticsTransportInProcessRTC)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_ttrController, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (void)initWithClientType:(uint64_t)a1 clientBundleId:(uint64_t)a2 clientName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_20DB2C000, log, OS_LOG_TYPE_FAULT, "\"clientBundleID is nil, transport will not be initialized properly. clientType = %@, clientName = %@\", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)transportForEvent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "Enabling Opt-In collection for event: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)transportForEvent:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "Fetching telemetry transport for event: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)transportForClientType:clientBundleId:clientName:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_ERROR, "\"Failed to initialize CDPDAnalyticsTransport. Please check if all required parameters are provided and consider using default transport.\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_20DB2C000, v1, OS_LOG_TYPE_DEBUG, "Returning transport for key: %@ - %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "Fetching Analytics transport for key: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)enforcePrivacyComplianceOnEvent:(void *)a1 key:(uint64_t)a2 value:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_fault_impl(&dword_20DB2C000, a3, OS_LOG_TYPE_FAULT, "\"Received not approved data %@ for event %@ attribute %@\", (uint8_t *)&v8, 0x20u);

}

- (void)sendEvent:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6_0();
  _os_log_fault_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_FAULT, "\"Non-conforming transport protocol passed to the telemetry system.  Likely build mismatch with AAAFoundation\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendEvent:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "Dispatching event to telemetry queue: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_310_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sessionState");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "Session state is (%lu), proceeding with send...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_311_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "Releasing analytics transaction upon timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "eventQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v3, v4, "Event added to the queue, current queue size: %lu", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_374_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "Session is still being configured... queuing event: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)configureSessionForEvent:sendEventBlock:telemetryQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "Adding event to queue: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)configureSessionForEvent:sendEventBlock:telemetryQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "Session configuration required...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "eventQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v3, v4, "Session is configured... event queue size: %lu", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_377_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "Telemetry grace period timeout expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "Event sequence map: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_sendEvent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v2, v3, "[%@] [%@] DELIVERY END", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_sendEvent:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_FAULT, "@\"Transport is nil, event: %@ will not be sent.\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)_sendEvent:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v2, v3, "[%@] [%@] DELIVERY BEGIN", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
