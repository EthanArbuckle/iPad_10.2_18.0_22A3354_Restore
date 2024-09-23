@implementation HMDMatterThirdPartyPairingLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.matter.pairing.thirdparty");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterThirdPartyPairingLogEvent pairingDuration](self, "pairingDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("pairingDuration"));

  -[HMDMatterThirdPartyPairingLogEvent success](self, "success");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("success"));

  -[HMDMatterThirdPartyPairingLogEvent errorDomain](self, "errorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  -[HMDMatterThirdPartyPairingLogEvent errorCode](self, "errorCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorCode"));

  -[HMDMatterThirdPartyPairingLogEvent underlyingErrorDomain](self, "underlyingErrorDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("underlyingErrorDomain"));

  -[HMDMatterThirdPartyPairingLogEvent underlyingErrorCode](self, "underlyingErrorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("underlyingErrorCode"));

  -[HMDMatterThirdPartyPairingLogEvent longestStateName](self, "longestStateName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("longestStateName"));

  -[HMDMatterThirdPartyPairingLogEvent longestStateDuration](self, "longestStateDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("longestStateDuration"));

  -[HMDMatterThirdPartyPairingLogEvent matterCategoryNumber](self, "matterCategoryNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("matterCategoryNumber"));

  -[HMDMatterThirdPartyPairingLogEvent matterVendorNumber](self, "matterVendorNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("matterVendorNumber"));

  -[HMDMatterThirdPartyPairingLogEvent matterProductNumber](self, "matterProductNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("matterProductNumber"));

  -[HMDMatterThirdPartyPairingLogEvent matterProductID](self, "matterProductID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("matterProductID"));

  -[HMDMatterThirdPartyPairingLogEvent firmwareVersion](self, "firmwareVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("firmwareVersion"));

  -[HMDMatterThirdPartyPairingLogEvent supportsSoftAP](self, "supportsSoftAP");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("supportsSoftAP"));

  -[HMDMatterThirdPartyPairingLogEvent hasShortDiscriminator](self, "hasShortDiscriminator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasShortDiscriminator"));

  -[HMDMatterThirdPartyPairingLogEvent client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("client"));

  -[HMDMatterThirdPartyPairingLogEvent communicationProtocol](self, "communicationProtocol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("communicationProtocol"));

  -[HMDMatterThirdPartyPairingLogEvent requiresMatterCustomCommissioningFlow](self, "requiresMatterCustomCommissioningFlow");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("requiresMatterCustomCommissioningFlow"));

  -[HMDMatterThirdPartyPairingLogEvent credentialsSentToClient](self, "credentialsSentToClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[HMDMatterThirdPartyPairingLogEvent credentialsSentToClient](self, "credentialsSentToClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("credentialsSentToClient"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("credentialsSentToClient"));
  }

  -[HMDMatterThirdPartyPairingLogEvent providedWiFiScanResults](self, "providedWiFiScanResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HMDMatterThirdPartyPairingLogEvent providedWiFiScanResults](self, "providedWiFiScanResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("providedWiFiScanResults"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("providedWiFiScanResults"));
  }

  -[HMDMatterThirdPartyPairingLogEvent providedThreadScanResults](self, "providedThreadScanResults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[HMDMatterThirdPartyPairingLogEvent providedThreadScanResults](self, "providedThreadScanResults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("providedThreadScanResults"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("providedThreadScanResults"));
  }

  -[HMDMatterThirdPartyPairingLogEvent discoveredOverBLE](self, "discoveredOverBLE");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[HMDMatterThirdPartyPairingLogEvent discoveredOverBLE](self, "discoveredOverBLE");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("discoveredOverBLE"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("discoveredOverBLE"));
  }

  -[HMDMatterThirdPartyPairingLogEvent knownToSystemCommissioner](self, "knownToSystemCommissioner");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[HMDMatterThirdPartyPairingLogEvent knownToSystemCommissioner](self, "knownToSystemCommissioner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("knownToSystemCommissioner"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("knownToSystemCommissioner"));
  }

  -[HMDMatterThirdPartyPairingLogEvent caseSessionSanityCheckPassed](self, "caseSessionSanityCheckPassed");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[HMDMatterThirdPartyPairingLogEvent caseSessionSanityCheckPassed](self, "caseSessionSanityCheckPassed");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("CASAESessionSanityCheckPassed"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("CASAESessionSanityCheckPassed"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDMatterThirdPartyPairingLogEvent cleanClose](self, "cleanClose"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("cleanClose"));

  -[HMDMatterThirdPartyPairingLogEvent threadSetupDuration](self, "threadSetupDuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("threadSetupDuration"));

  -[HMDMatterThirdPartyPairingLogEvent pairingWindowOpenedWithPasscodeDuration](self, "pairingWindowOpenedWithPasscodeDuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("pairingWindowOpenedWithPasscodeDuration"));

  -[HMDMatterThirdPartyPairingLogEvent accessoryTransportType](self, "accessoryTransportType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("accessoryTransport"));

  v38 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v38;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSNumber)pairingDuration
{
  return self->_pairingDuration;
}

- (void)setPairingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_pairingDuration, a3);
}

- (NSNumber)success
{
  return self->_success;
}

- (void)setSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_success, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setUnderlyingErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingErrorCode, a3);
}

- (NSString)longestStateName
{
  return self->_longestStateName;
}

- (void)setLongestStateName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)longestStateDuration
{
  return self->_longestStateDuration;
}

- (void)setLongestStateDuration:(id)a3
{
  objc_storeStrong((id *)&self->_longestStateDuration, a3);
}

- (NSNumber)matterCategoryNumber
{
  return self->_matterCategoryNumber;
}

- (void)setMatterCategoryNumber:(id)a3
{
  objc_storeStrong((id *)&self->_matterCategoryNumber, a3);
}

- (NSNumber)matterVendorNumber
{
  return self->_matterVendorNumber;
}

- (void)setMatterVendorNumber:(id)a3
{
  objc_storeStrong((id *)&self->_matterVendorNumber, a3);
}

- (NSNumber)matterProductNumber
{
  return self->_matterProductNumber;
}

- (void)setMatterProductNumber:(id)a3
{
  objc_storeStrong((id *)&self->_matterProductNumber, a3);
}

- (NSNumber)matterProductID
{
  return self->_matterProductID;
}

- (void)setMatterProductID:(id)a3
{
  objc_storeStrong((id *)&self->_matterProductID, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)threadSetupDuration
{
  return self->_threadSetupDuration;
}

- (void)setThreadSetupDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)pairingWindowOpenedWithPasscodeDuration
{
  return self->_pairingWindowOpenedWithPasscodeDuration;
}

- (void)setPairingWindowOpenedWithPasscodeDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)accessoryTransportType
{
  return self->_accessoryTransportType;
}

- (void)setAccessoryTransportType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)supportsSoftAP
{
  return self->_supportsSoftAP;
}

- (void)setSupportsSoftAP:(id)a3
{
  objc_storeStrong((id *)&self->_supportsSoftAP, a3);
}

- (NSNumber)hasShortDiscriminator
{
  return self->_hasShortDiscriminator;
}

- (void)setHasShortDiscriminator:(id)a3
{
  objc_storeStrong((id *)&self->_hasShortDiscriminator, a3);
}

- (NSString)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setCommunicationProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_communicationProtocol, a3);
}

- (NSNumber)requiresMatterCustomCommissioningFlow
{
  return self->_requiresMatterCustomCommissioningFlow;
}

- (void)setRequiresMatterCustomCommissioningFlow:(id)a3
{
  objc_storeStrong((id *)&self->_requiresMatterCustomCommissioningFlow, a3);
}

- (NSNumber)credentialsSentToClient
{
  return self->_credentialsSentToClient;
}

- (void)setCredentialsSentToClient:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsSentToClient, a3);
}

- (NSNumber)providedWiFiScanResults
{
  return self->_providedWiFiScanResults;
}

- (void)setProvidedWiFiScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_providedWiFiScanResults, a3);
}

- (NSNumber)providedThreadScanResults
{
  return self->_providedThreadScanResults;
}

- (void)setProvidedThreadScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_providedThreadScanResults, a3);
}

- (NSNumber)knownToSystemCommissioner
{
  return self->_knownToSystemCommissioner;
}

- (void)setKnownToSystemCommissioner:(id)a3
{
  objc_storeStrong((id *)&self->_knownToSystemCommissioner, a3);
}

- (NSNumber)discoveredOverBLE
{
  return self->_discoveredOverBLE;
}

- (void)setDiscoveredOverBLE:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredOverBLE, a3);
}

- (NSNumber)caseSessionSanityCheckPassed
{
  return self->_caseSessionSanityCheckPassed;
}

- (void)setCaseSessionSanityCheckPassed:(id)a3
{
  objc_storeStrong((id *)&self->_caseSessionSanityCheckPassed, a3);
}

- (BOOL)cleanClose
{
  return self->_cleanClose;
}

- (void)setCleanClose:(BOOL)a3
{
  self->_cleanClose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseSessionSanityCheckPassed, 0);
  objc_storeStrong((id *)&self->_discoveredOverBLE, 0);
  objc_storeStrong((id *)&self->_knownToSystemCommissioner, 0);
  objc_storeStrong((id *)&self->_providedThreadScanResults, 0);
  objc_storeStrong((id *)&self->_providedWiFiScanResults, 0);
  objc_storeStrong((id *)&self->_credentialsSentToClient, 0);
  objc_storeStrong((id *)&self->_requiresMatterCustomCommissioningFlow, 0);
  objc_storeStrong((id *)&self->_communicationProtocol, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_hasShortDiscriminator, 0);
  objc_storeStrong((id *)&self->_supportsSoftAP, 0);
  objc_storeStrong((id *)&self->_accessoryTransportType, 0);
  objc_storeStrong((id *)&self->_pairingWindowOpenedWithPasscodeDuration, 0);
  objc_storeStrong((id *)&self->_threadSetupDuration, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_matterProductID, 0);
  objc_storeStrong((id *)&self->_matterProductNumber, 0);
  objc_storeStrong((id *)&self->_matterVendorNumber, 0);
  objc_storeStrong((id *)&self->_matterCategoryNumber, 0);
  objc_storeStrong((id *)&self->_longestStateDuration, 0);
  objc_storeStrong((id *)&self->_longestStateName, 0);
  objc_storeStrong((id *)&self->_underlyingErrorCode, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_pairingDuration, 0);
}

@end
