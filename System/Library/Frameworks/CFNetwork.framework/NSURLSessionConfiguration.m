@implementation NSURLSessionConfiguration

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = xmmword_1841E37E0;
  *(_OWORD *)((char *)self + 24) = xmmword_1841E37F0;
  *((_QWORD *)self + 5) = 0x7800000078;
  return self;
}

- (_NSHTTPAlternativeServicesStorage)_alternativeServicesStorage
{
  _NSHTTPAlternativeServicesStorage *result;

  if (self->_phskip_alternativeServicesStorageSet)
    return -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage");
  if (self->_disposition == qword_1EDD006B8)
    result = -[_NSHTTPAlternativeServicesStorage initInMemoryStore]([_NSHTTPAlternativeServicesStorage alloc], "initInMemoryStore");
  else
    result = (_NSHTTPAlternativeServicesStorage *)+[_NSHTTPAlternativeServicesStorage sharedPersistentStore](_NSHTTPAlternativeServicesStorage, "sharedPersistentStore");
  self->_phskip_alternativeServicesStorage = result;
  self->_phskip_alternativeServicesStorageSet = 1;
  return result;
}

- (NSURLSessionConfiguration)initWithCoder:(id)a3
{
  NSURLSessionConfiguration *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[16];

  v4 = (NSURLSessionConfiguration *)-[NSURLSessionConfiguration initWithDisposition:](self, &unk_1EDD00680);
  if (v4)
  {
    -[NSURLSessionConfiguration setIdentifier:](v4, "setIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeoutIntervalForRequest"));
    -[NSURLSessionConfiguration setTimeoutIntervalForRequest:](v4, "setTimeoutIntervalForRequest:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeoutIntervalForResource"));
    -[NSURLSessionConfiguration setTimeoutIntervalForResource:](v4, "setTimeoutIntervalForResource:");
    -[NSURLSessionConfiguration setAllowsCellularAccess:](v4, "setAllowsCellularAccess:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsCellularAccess")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("allowsExpensiveNetworkAccessKey")))
      -[NSURLSessionConfiguration setAllowsExpensiveNetworkAccess:](v4, "setAllowsExpensiveNetworkAccess:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsExpensiveNetworkAccessKey")));
    -[NSURLSessionConfiguration setWaitsForConnectivity:](v4, "setWaitsForConnectivity:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("waitsForConnectivity")));
    -[NSURLSessionConfiguration setDiscretionary:](v4, "setDiscretionary:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("discretionary")));
    -[NSURLSessionConfiguration setShouldUseExtendedBackgroundIdleMode:](v4, "setShouldUseExtendedBackgroundIdleMode:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("shouldUseExtendedBackgroundIdleMode")));
    -[NSURLSessionConfiguration setSharedContainerIdentifier:](v4, "setSharedContainerIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedContainerIdentifier")));
    -[NSURLSessionConfiguration setSessionSendsLaunchEvents:](v4, "setSessionSendsLaunchEvents:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("sessionSendsLaunchEvents")));
    -[NSURLSessionConfiguration set_sessionSendsLaunchOnDemandEvents:](v4, "set_sessionSendsLaunchOnDemandEvents:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_sessionSendsLaunchOnDemandEvents")));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    -[NSURLSessionConfiguration setConnectionProxyDictionary:](v4, "setConnectionProxyDictionary:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithObjects:", v19, v18, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0), CFSTR("connectionProxyDictionary")));
    -[NSURLSessionConfiguration setTLSMinimumSupportedProtocol:](v4, "setTLSMinimumSupportedProtocol:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("TLSMinimumSupportedProtocol")));
    -[NSURLSessionConfiguration setTLSMaximumSupportedProtocol:](v4, "setTLSMaximumSupportedProtocol:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("TLSMaximumSupportedProtocol")));
    -[NSURLSessionConfiguration setHTTPAdditionalHeaders:](v4, "setHTTPAdditionalHeaders:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("HTTPAdditionalHeaders")));
    -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v4, "setHTTPMaximumConnectionsPerHost:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("HTTPMaximumConnectionsPerHost")));
    -[NSURLSessionConfiguration setNetworkServiceType:](v4, "setNetworkServiceType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NetworkServiceType")));
    -[NSURLSessionConfiguration setMultipathServiceType:](v4, "setMultipathServiceType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("multipathServiceType")));
    -[NSURLSessionConfiguration set_requiresPowerPluggedIn:](v4, "set_requiresPowerPluggedIn:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_requiresPowerPluggedIn")));
    -[NSURLSessionConfiguration set_directoryForDownloadedFiles:](v4, "set_directoryForDownloadedFiles:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directoryForDownloadedFiles")));
    -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:](v4, "set_sourceApplicationBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceApplicationBundleIdentifier")));
    -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:](v4, "set_sourceApplicationSecondaryIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceApplicationSecondaryIdentifier")));
    -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:](v4, "set_sourceApplicationAuditTokenData:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceApplicationAuditTokenData")));
    -[NSURLSessionConfiguration set_attributedBundleIdentifier:](v4, "set_attributedBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributedBundleIdentifier")));
    -[NSURLSessionConfiguration set_allowsRetryForBackgroundDataTasks:](v4, "set_allowsRetryForBackgroundDataTasks:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsRetryForBackgroundDataTasks")));
    -[NSURLSessionConfiguration set_onBehalfOfPairedDevice:](v4, "set_onBehalfOfPairedDevice:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_onBehalfOfPairedDevice")));
    -[NSURLSessionConfiguration set_clientIsNotExplicitlyDiscretionary:](v4, "set_clientIsNotExplicitlyDiscretionary:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_clientIsNotExplicitlyDiscretionary")));
    -[NSURLSessionConfiguration set_respectsAllowsCellularAccessForDiscretionaryTasks:](v4, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_respectsAllowsCellularAccessForDiscretionaryTasks")));
    -[NSURLSessionConfiguration set_infersDiscretionaryFromOriginatingClient:](v4, "set_infersDiscretionaryFromOriginatingClient:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_infersDiscretionaryFromOriginatingClient")));
    -[NSURLSessionConfiguration set_connectionPoolName:](v4, "set_connectionPoolName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_connectionPoolName")));
    -[NSURLSessionConfiguration set_allowsPowerNapScheduling:](v4, "set_allowsPowerNapScheduling:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsPowerNapScheduling")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("allowsConstrainedNetworkAccess")))
      -[NSURLSessionConfiguration setAllowsConstrainedNetworkAccess:](v4, "setAllowsConstrainedNetworkAccess:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsConstrainedNetworkAccess")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_allowsUCA")))
      -[NSURLSessionConfiguration _setAllowsUCA:](v4, "_setAllowsUCA:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsUCA")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_allowsVirtualInterfaces")))
      -[NSURLSessionConfiguration set_allowsVirtualInterfaces:](v4, "set_allowsVirtualInterfaces:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsVirtualInterfaces")));
    -[NSURLSessionConfiguration set_allowsMultipathTCP:](v4, "set_allowsMultipathTCP:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsMultipathTCP")));
    -[NSURLSessionConfiguration set_allowsResponseMonitoringDuringBodyTranmission:](v4, "set_allowsResponseMonitoringDuringBodyTranmission:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsResponseMonitoringDuringBodyTranmission")));
    -[NSURLSessionConfiguration set_allowsIndefiniteConnections:](v4, "set_allowsIndefiniteConnections:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsIndefiniteConnections")));
    -[NSURLSessionConfiguration set_allowsTCPFastOpen:](v4, "set_allowsTCPFastOpen:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTCPFastOpen")));
    -[NSURLSessionConfiguration set_allowsTLSSessionTickets:](v4, "set_allowsTLSSessionTickets:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTLSSessionTickets")));
    -[NSURLSessionConfiguration set_allowsTLSSessionResumption:](v4, "set_allowsTLSSessionResumption:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTLSSessionResumption")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_allowsTLSFalseStart")))
      -[NSURLSessionConfiguration set_allowsTLSFalseStart:](v4, "set_allowsTLSFalseStart:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTLSFalseStart")));
    -[NSURLSessionConfiguration set_tlsTrustPinningPolicyName:](v4, "set_tlsTrustPinningPolicyName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tlsTrustPinningPolicyName")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_allowsTLSFallback")))
      -[NSURLSessionConfiguration set_allowsTLSFallback:](v4, "set_allowsTLSFallback:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTLSFallback")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_allowsTLSECH")))
      -[NSURLSessionConfiguration set_allowsTLSECH:](v4, "set_allowsTLSECH:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowsTLSECH")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_reportsDataStalls")))
      -[NSURLSessionConfiguration set_reportsDataStalls:](v4, "set_reportsDataStalls:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_reportsDataStalls")));
    -[NSURLSessionConfiguration set_TCPAdaptiveReadTimeout:](v4, "set_TCPAdaptiveReadTimeout:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_TCPAdaptiveReadTimeout")));
    -[NSURLSessionConfiguration set_TCPAdaptiveWriteTimeout:](v4, "set_TCPAdaptiveWriteTimeout:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_TCPAdaptiveWriteTimeout")));
    -[NSURLSessionConfiguration set_customReadBufferSize:](v4, "set_customReadBufferSize:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_customReadBufferSize")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_customReadBufferTimeout"));
    -[NSURLSessionConfiguration set_customReadBufferTimeout:](v4, "set_customReadBufferTimeout:");
    -[NSURLSessionConfiguration set_preventsSystemHTTPProxyAuthentication:](v4, "set_preventsSystemHTTPProxyAuthentication:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preventsSystemHTTPProxyAuthentication")));
    -[NSURLSessionConfiguration set_requiresSecureHTTPSProxyConnection:](v4, "set_requiresSecureHTTPSProxyConnection:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_requiresSecureHTTPSProxyConnection")));
    -[NSURLSessionConfiguration set_preventsAppSSO:](v4, "set_preventsAppSSO:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preventsAppSSO")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_loggingPrivacyLevel")))
      -[NSURLSessionConfiguration set_loggingPrivacyLevel:](v4, "set_loggingPrivacyLevel:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("_loggingPrivacyLevel")));
    -[NSURLSessionConfiguration set_duetPreauthorized:](v4, "set_duetPreauthorized:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_duetPreauthorized")));
    -[NSURLSessionConfiguration set_duetPreClearedMode:](v4, "set_duetPreClearedMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_duetPreClearedMode")));
    -[NSURLSessionConfiguration set_xpcActivityBudgeted:](v4, "set_xpcActivityBudgeted:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("_xpcActivityBudgeted")));
    -[NSURLSessionConfiguration set_requiresSustainedDataDelivery:](v4, "set_requiresSustainedDataDelivery:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_requiresSustainedDataDelivery")));
    v12 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_IDSMessageTimeout"));
    if (v12 >= 1)
      v13 = v12;
    else
      v13 = 50;
    -[NSURLSessionConfiguration set_IDSMessageTimeout:](v4, "set_IDSMessageTimeout:", v13);
    -[NSURLSessionConfiguration set_ignoreDidReceiveResponseDisposition:](v4, "set_ignoreDidReceiveResponseDisposition:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_ignoreDidReceiveResponseDisposition")));
    -[NSURLSessionConfiguration set_alwaysPerformDefaultTrustEvaluation:](v4, "set_alwaysPerformDefaultTrustEvaluation:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_alwaysPerformDefaultTrustEvaluation")));
    -[NSURLSessionConfiguration set_expiredDNSBehavior:](v4, "set_expiredDNSBehavior:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("_expiredDNSBehavior")));
    -[NSURLSessionConfiguration setRequiresDNSSECValidation:](v4, "setRequiresDNSSECValidation:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresDNSSECValidation")));
    -[NSURLSessionConfiguration set_enableOAuthBearerTokenChallenges:](v4, "set_enableOAuthBearerTokenChallenges:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_enableOAuthBearerTokenChallenges")));
    -[NSURLSessionConfiguration set_supportsAVAssetDownloads:](v4, "set_supportsAVAssetDownloads:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_supportsAVAssetDownloads")));
    -[NSURLSessionConfiguration set_CTDataConnectionServiceType:](v4, "set_CTDataConnectionServiceType:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CTDataConnectionServiceType")));
    -[NSURLSessionConfiguration set_prefersInfraWiFi:](v4, "set_prefersInfraWiFi:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_prefersInfraWiFi")));
    -[NSURLSessionConfiguration set_shouldPreserveBackgroundSessionDisposition:](v4, "set_shouldPreserveBackgroundSessionDisposition:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_shouldPreserveBackgroundSessionDisposition")));
    -[NSURLSessionConfiguration set_disablesOutOfProcessDirectWiFiUsage:](v4, "set_disablesOutOfProcessDirectWiFiUsage:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_disablesOutOfProcessDirectWiFiUsage")));
    -[NSURLSessionConfiguration set_disablesUseOfProxySession:](v4, "set_disablesUseOfProxySession:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_disablesUseOfProxySession")));
    -[NSURLSessionConfiguration set_preventsDirectWiFiAccess:](v4, "set_preventsDirectWiFiAccess:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preventsDirectWiFiAccess")));
    -[NSURLSessionConfiguration set_allowTCPIOConnectionStreamTask:](v4, "set_allowTCPIOConnectionStreamTask:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_allowTCPIOConnectionStreamTask")));
    -[NSURLSessionConfiguration set_preventsIdleSleepOnceConnected:](v4, "set_preventsIdleSleepOnceConnected:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preventsIdleSleepOnceConnected")));
    -[NSURLSessionConfiguration set_shouldSkipPreferredClientCertificateLookup:](v4, "set_shouldSkipPreferredClientCertificateLookup:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_shouldSkipPreferredClientCertificateLookup")));
    -[NSURLSessionConfiguration set_performsEVCertCheck:](v4, "set_performsEVCertCheck:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_performsEVCertCheck")));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    -[NSURLSessionConfiguration set_authenticatorStatusCodes:](v4, "set_authenticatorStatusCodes:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), CFSTR("_authenticatorStatusCodes")));
    v16 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_atsContext"));
    if (v16)
      -[NSURLSessionConfiguration set_atsContext:](v4, "set_atsContext:", v16);
    if (!-[NSURLSessionConfiguration _atsContext](v4, "_atsContext")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Must have an ATS Context now", buf, 2u);
    }
    -[NSURLSessionConfiguration set_timingDataOptions:](v4, "set_timingDataOptions:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("_timingDataOptions")));
    -[NSURLSessionConfiguration set_companionAppBundleIdentifier:](v4, "set_companionAppBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_companionAppBundleIdentifier")));
    -[NSURLSessionConfiguration set_watchAppBundleIdentifier:](v4, "set_watchAppBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_watchAppBundleIdentifier")));
    -[NSURLSessionConfiguration set_watchExtensionBundleIdentifier:](v4, "set_watchExtensionBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_watchExtensionBundleIdentifier")));
    -[NSURLSessionConfiguration set_forcedNetworkServiceType:](v4, "set_forcedNetworkServiceType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_forcedNetworkServiceType")));
    -[NSURLSessionConfiguration set_maximumWatchCellularTransferSize:](v4, "set_maximumWatchCellularTransferSize:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maximumWatchCellularTransferSize")));
    -[NSURLSessionConfiguration set_multipathAlternatePort:](v4, "set_multipathAlternatePort:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_multipathAlternatePort")));
    -[NSURLSessionConfiguration set_allowsHTTP3Internal:](v4, "set_allowsHTTP3Internal:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("_allowsHTTP3Internal")));
    -[NSURLSessionConfiguration set_usesNWLoader:](v4, "set_usesNWLoader:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_usesNWLoader")));
    -[NSURLSessionConfiguration set_disablesNWLoader:](v4, "set_disablesNWLoader:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_disablesNWLoader")));
    -[NSURLSessionConfiguration set_downloadFileProtectionType:](v4, "set_downloadFileProtectionType:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_downloadFileProtectionType")));
    -[NSURLSessionConfiguration set_pidForHAR:](v4, "set_pidForHAR:", 0);
    -[NSURLSessionConfiguration set_enablesL4SInternal:](v4, "set_enablesL4SInternal:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("_enablesL4SInternal")));
    -[NSURLSessionConfiguration set_prohibitEncryptedDNS:](v4, "set_prohibitEncryptedDNS:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_prohibitEncryptedDNS")));
    -[NSURLSessionConfiguration set_neTrackerTCCResult:](v4, "set_neTrackerTCCResult:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("_neTrackerTCCResult")));
    -[NSURLSessionConfiguration set_disableAPWakeOnIdleConnections:](v4, "set_disableAPWakeOnIdleConnections:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_disableAPWakeOnIdleConnections")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration identifier](self, "identifier"), CFSTR("identifier"));
  -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeoutIntervalForRequest"));
  -[NSURLSessionConfiguration timeoutIntervalForResource](self, "timeoutIntervalForResource");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeoutIntervalForResource"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess"), CFSTR("allowsCellularAccess"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"), CFSTR("allowsExpensiveNetworkAccessKey"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"), CFSTR("allowsConstrainedNetworkAccess"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA"), CFSTR("_allowsUCA"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces"), CFSTR("_allowsVirtualInterfaces"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity"), CFSTR("waitsForConnectivity"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"), CFSTR("sharedContainerIdentifier"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary"), CFSTR("discretionary"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode"), CFSTR("shouldUseExtendedBackgroundIdleMode"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents"), CFSTR("sessionSendsLaunchEvents"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents"), CFSTR("_sessionSendsLaunchOnDemandEvents"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"), CFSTR("connectionProxyDictionary"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol"), CFSTR("TLSMinimumSupportedProtocol"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol"), CFSTR("TLSMaximumSupportedProtocol"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"), CFSTR("HTTPAdditionalHeaders"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost"), CFSTR("HTTPMaximumConnectionsPerHost"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType"), CFSTR("NetworkServiceType"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType"), CFSTR("multipathServiceType"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn"), CFSTR("_requiresPowerPluggedIn"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"), CFSTR("_directoryForDownloadedFiles"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"), CFSTR("_sourceApplicationBundleIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"), CFSTR("_sourceApplicationSecondaryIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"), CFSTR("_sourceApplicationAuditTokenData"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"), CFSTR("_attributedBundleIdentifier"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"), CFSTR("_allowsPowerNapScheduling"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate"), CFSTR("_allowsHSTSWithUntrustedRootCertificate"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"), CFSTR("_allowsRetryForBackgroundDataTasks"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice"), CFSTR("_onBehalfOfPairedDevice"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary"), CFSTR("_clientIsNotExplicitlyDiscretionary"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks"), CFSTR("_respectsAllowsCellularAccessForDiscretionaryTasks"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient"), CFSTR("_infersDiscretionaryFromOriginatingClient"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"), CFSTR("_connectionPoolName"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP"), CFSTR("_allowsMultipathTCP"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission"), CFSTR("_allowsResponseMonitoringDuringBodyTranmission"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections"), CFSTR("_allowsIndefiniteConnections"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"), CFSTR("_tlsTrustPinningPolicyName"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback"), CFSTR("_allowsTLSFallback"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH"), CFSTR("_allowsTLSECH"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"), CFSTR("_CTDataConnectionServiceType"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen"), CFSTR("_allowsTCPFastOpen"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets"), CFSTR("_allowsTLSSessionTickets"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption"), CFSTR("_allowsTLSSessionResumption"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart"), CFSTR("_allowsTLSFalseStart"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout"), CFSTR("_TCPAdaptiveReadTimeout"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout"), CFSTR("_TCPAdaptiveWriteTimeout"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls"), CFSTR("_reportsDataStalls"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize"), CFSTR("_customReadBufferSize"));
  -[NSURLSessionConfiguration _customReadBufferTimeout](self, "_customReadBufferTimeout");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_customReadBufferTimeout"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication"), CFSTR("_preventsSystemHTTPProxyAuthentication"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection"), CFSTR("_requiresSecureHTTPSProxyConnection"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO"), CFSTR("_preventsAppSSO"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel"), CFSTR("_loggingPrivacyLevel"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized"), CFSTR("_duetPreauthorized"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode"), CFSTR("_duetPreClearedMode"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted"), CFSTR("_xpcActivityBudgeted"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery"), CFSTR("_requiresSustainedDataDelivery"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout"), CFSTR("_IDSMessageTimeout"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition"), CFSTR("_ignoreDidReceiveResponseDisposition"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation"), CFSTR("_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior"), CFSTR("_expiredDNSBehavior"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"), CFSTR("requiresDNSSECValidation"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges"), CFSTR("_enableOAuthBearerTokenChallenges"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"), CFSTR("_supportsAVAssetDownloads"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi"), CFSTR("_prefersInfraWiFi"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition"), CFSTR("_shouldPreserveBackgroundSessionDisposition"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage"), CFSTR("_disablesOutOfProcessDirectWiFiUsage"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession"), CFSTR("_disablesUseOfProxySession"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess"), CFSTR("_preventsDirectWiFiAccess"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask"), CFSTR("_allowTCPIOConnectionStreamTask"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected"), CFSTR("_preventsIdleSleepOnceConnected"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup"), CFSTR("_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck"), CFSTR("_performsEVCertCheck"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"), CFSTR("_authenticatorStatusCodes"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _atsContext](self, "_atsContext"), CFSTR("_atsContext"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions"), CFSTR("_timingDataOptions"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"), CFSTR("_companionAppBundleIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"), CFSTR("_watchAppBundleIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"), CFSTR("_watchExtensionBundleIdentifier"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType"), CFSTR("_forcedNetworkServiceType"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"), CFSTR("_maximumWatchCellularTransferSize"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort"), CFSTR("_multipathAlternatePort"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"), CFSTR("_allowsHTTP3Internal"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"), CFSTR("_usesNWLoader"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader"), CFSTR("_disablesNWLoader"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"), CFSTR("_downloadFileProtectionType"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal"), CFSTR("_enablesL4SInternal"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"), CFSTR("_prohibitEncryptedDNS"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"), CFSTR("_neTrackerTCCResult"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"), CFSTR("_disableAPWakeOnIdleConnections"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], -[NSURLSessionConfiguration disposition](self, "disposition"));
  objc_msgSend(v4, "setAllowsCellularAccess:", -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess"));
  objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "setAllowsConstrainedNetworkAccess:", -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  objc_msgSend(v4, "_setAllowsUCA:", -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA"));
  objc_msgSend(v4, "set_allowsVirtualInterfaces:", -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces"));
  objc_msgSend(v4, "setWaitsForConnectivity:", -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity"));
  objc_msgSend(v4, "setDiscretionary:", -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary"));
  objc_msgSend(v4, "setSharedContainerIdentifier:", -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"));
  objc_msgSend(v4, "setSessionSendsLaunchEvents:", -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents"));
  objc_msgSend(v4, "setHTTPShouldUsePipelining:", -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining"));
  objc_msgSend(v4, "setHTTPShouldSetCookies:", -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies"));
  objc_msgSend(v4, "set_requiresPowerPluggedIn:", -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn"));
  objc_msgSend(v4, "set_allowsPowerNapScheduling:", -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"));
  objc_msgSend(v4, "set_allowsHSTSWithUntrustedRootCertificate:", -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate"));
  objc_msgSend(v4, "set_sessionSendsLaunchOnDemandEvents:", -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents"));
  objc_msgSend(v4, "set_timingDataOptions:", -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions"));
  objc_msgSend(v4, "set_shouldSkipPreferredClientCertificateLookup:", -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend(v4, "set_allowsRetryForBackgroundDataTasks:", -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"));
  objc_msgSend(v4, "set_onBehalfOfPairedDevice:", -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice"));
  objc_msgSend(v4, "set_clientIsNotExplicitlyDiscretionary:", -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary"));
  objc_msgSend(v4, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks"));
  objc_msgSend(v4, "set_infersDiscretionaryFromOriginatingClient:", -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient"));
  objc_msgSend(v4, "setBackgroundSession:", -[NSURLSessionConfiguration isBackgroundSession](self, "isBackgroundSession"));
  objc_msgSend(v4, "setSkip_download_unlink:", -[NSURLSessionConfiguration skip_download_unlink](self, "skip_download_unlink"));
  objc_msgSend(v4, "set_requiresClientToOpenFiles:", -[NSURLSessionConfiguration _requiresClientToOpenFiles](self, "_requiresClientToOpenFiles"));
  objc_msgSend(v4, "set_forcesNewConnections:", -[NSURLSessionConfiguration _forcesNewConnections](self, "_forcesNewConnections"));
  objc_msgSend(v4, "set_supportsAVAssetDownloads:", -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"));
  objc_msgSend(v4, "set_proxySession:", -[NSURLSessionConfiguration _isProxySession](self, "_isProxySession"));
  objc_msgSend(v4, "set_preventsIdleSleep:", -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep"));
  objc_msgSend(v4, "set_usePipeliningHeuristics:", -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics"));
  objc_msgSend(v4, "setTLSMinimumSupportedProtocol:", -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol"));
  objc_msgSend(v4, "setTLSMaximumSupportedProtocol:", -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol"));
  objc_msgSend(v4, "setIdentifier:", -[NSURLSessionConfiguration identifier](self, "identifier"));
  objc_msgSend(v4, "setRequestCachePolicy:", -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy"));
  -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  objc_msgSend(v4, "setTimeoutIntervalForRequest:");
  -[NSURLSessionConfiguration timeoutIntervalForResource](self, "timeoutIntervalForResource");
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
  objc_msgSend(v4, "setNetworkServiceType:", -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType"));
  objc_msgSend(v4, "setConnectionProxyDictionary:", -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"));
  objc_msgSend(v4, "setHTTPCookieAcceptPolicy:", -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy"));
  objc_msgSend(v4, "setHTTPAdditionalHeaders:", -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"));
  objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost"));
  objc_msgSend(v4, "setShouldUseExtendedBackgroundIdleMode:", -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode"));
  objc_msgSend(v4, "setProtocolClasses:", -[NSURLSessionConfiguration protocolClasses](self, "protocolClasses"));
  objc_msgSend(v4, "setMultipathServiceType:", -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType"));
  objc_msgSend(v4, "set_directoryForDownloadedFiles:", -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"));
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"));
  objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"));
  objc_msgSend(v4, "set_sourceApplicationAuditTokenData:", -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"));
  objc_msgSend(v4, "set_attributedBundleIdentifier:", -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"));
  objc_msgSend(v4, "set_TCPAdaptiveReadTimeout:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout"));
  objc_msgSend(v4, "set_TCPAdaptiveWriteTimeout:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout"));
  objc_msgSend(v4, "set_reportsDataStalls:", -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls"));
  -[NSURLSessionConfiguration _connectionCachePurgeTimeout](self, "_connectionCachePurgeTimeout");
  objc_msgSend(v4, "set_connectionCachePurgeTimeout:");
  -[NSURLSessionConfiguration _connectionCacheCellPurgeTimeout](self, "_connectionCacheCellPurgeTimeout");
  objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:");
  -[NSURLSessionConfiguration _longLivedConnectionCachePurgeTimeout](self, "_longLivedConnectionCachePurgeTimeout");
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:");
  -[NSURLSessionConfiguration _longLivedConnectionCacheCellPurgeTimeout](self, "_longLivedConnectionCacheCellPurgeTimeout");
  objc_msgSend(v4, "set_longLivedConnectionCacheCellPurgeTimeout:");
  objc_msgSend(v4, "set_connectionPoolName:", -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"));
  objc_msgSend(v4, "set_connectionCacheNumPriorityLevels:", -[NSURLSessionConfiguration _connectionCacheNumPriorityLevels](self, "_connectionCacheNumPriorityLevels"));
  objc_msgSend(v4, "set_connectionCacheNumFastLanes:", -[NSURLSessionConfiguration _connectionCacheNumFastLanes](self, "_connectionCacheNumFastLanes"));
  objc_msgSend(v4, "set_connectionCacheMinimumFastLanePriority:", -[NSURLSessionConfiguration _connectionCacheMinimumFastLanePriority](self, "_connectionCacheMinimumFastLanePriority"));
  objc_msgSend(v4, "set_tcpConnectionPoolName:", -[NSURLSessionConfiguration _tcpConnectionPoolName](self, "_tcpConnectionPoolName"));
  objc_msgSend(v4, "set_socketStreamProperties:", -[NSURLSessionConfiguration _socketStreamProperties](self, "_socketStreamProperties"));
  objc_msgSend(v4, "set_preventsIdleSleepOnceConnected:", -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected"));
  objc_msgSend(v4, "set_overridesBackgroundSessionAutoRedirect:", -[NSURLSessionConfiguration _overridesBackgroundSessionAutoRedirect](self, "_overridesBackgroundSessionAutoRedirect"));
  objc_msgSend(v4, "set_performsEVCertCheck:", -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck"));
  objc_msgSend(v4, "set_appleIDContext:", -[NSURLSessionConfiguration _appleIDContext](self, "_appleIDContext"));
  objc_msgSend(v4, "set_authenticatorStatusCodes:", -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"));
  objc_msgSend(v4, "set_atsContext:", -[NSURLSessionConfiguration _atsContext](self, "_atsContext"));
  objc_msgSend(v4, "set_prefersInfraWiFi:", -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi"));
  objc_msgSend(v4, "set_shouldPreserveBackgroundSessionDisposition:", -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition"));
  objc_msgSend(v4, "set_disablesOutOfProcessDirectWiFiUsage:", -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage"));
  objc_msgSend(v4, "set_disablesUseOfProxySession:", -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession"));
  objc_msgSend(v4, "set_CTDataConnectionServiceType:", -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"));
  objc_msgSend(v4, "set_preventsDirectWiFiAccess:", -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess"));
  objc_msgSend(v4, "set_allowTCPIOConnectionStreamTask:", -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask"));
  objc_msgSend(v4, "set_customReadBufferSize:", -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize"));
  -[NSURLSessionConfiguration _customReadBufferTimeout](self, "_customReadBufferTimeout");
  objc_msgSend(v4, "set_customReadBufferTimeout:");
  objc_msgSend(v4, "set_preventsSystemHTTPProxyAuthentication:", -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication"));
  objc_msgSend(v4, "set_requiresSecureHTTPSProxyConnection:", -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection"));
  objc_msgSend(v4, "set_proxyConfigurations:", -[NSURLSessionConfiguration _proxyConfigurations](self, "_proxyConfigurations"));
  objc_msgSend(v4, "set_preventsAppSSO:", -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO"));
  objc_msgSend(v4, "set_loggingPrivacyLevel:", -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel"));
  objc_msgSend(v4, "set_duetPreauthorized:", -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized"));
  objc_msgSend(v4, "set_duetPreClearedMode:", -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode"));
  objc_msgSend(v4, "set_xpcActivityBudgeted:", -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted"));
  objc_msgSend(v4, "set_requiresSustainedDataDelivery:", -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery"));
  objc_msgSend(v4, "set_IDSMessageTimeout:", -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout"));
  objc_msgSend(v4, "set_ignoreDidReceiveResponseDisposition:", -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition"));
  objc_msgSend(v4, "set_alwaysPerformDefaultTrustEvaluation:", -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend(v4, "set_allowsMultipathTCP:", -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP"));
  objc_msgSend(v4, "set_allowsResponseMonitoringDuringBodyTranmission:", -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission"));
  objc_msgSend(v4, "set_allowsIndefiniteConnections:", -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections"));
  objc_msgSend(v4, "set_allowsTCPFastOpen:", -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen"));
  objc_msgSend(v4, "set_allowsTLSSessionTickets:", -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets"));
  objc_msgSend(v4, "set_allowsTLSSessionResumption:", -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption"));
  objc_msgSend(v4, "set_allowsTLSFalseStart:", -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart"));
  objc_msgSend(v4, "set_tlsTrustPinningPolicyName:", -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"));
  objc_msgSend(v4, "set_allowsTLSFallback:", -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback"));
  objc_msgSend(v4, "set_allowsTLSECH:", -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH"));
  objc_msgSend(v4, "set_companionAppBundleIdentifier:", -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"));
  objc_msgSend(v4, "set_watchAppBundleIdentifier:", -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"));
  objc_msgSend(v4, "set_watchExtensionBundleIdentifier:", -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"));
  objc_msgSend(v4, "set_forcedNetworkServiceType:", -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType"));
  objc_msgSend(v4, "set_overriddenDelegateOptions:", -[NSURLSessionConfiguration _overriddenDelegateOptions](self, "_overriddenDelegateOptions"));
  objc_msgSend(v4, "set_suppressedAutoAddedHTTPHeaders:", -[NSURLSessionConfiguration _suppressedAutoAddedHTTPHeaders](self, "_suppressedAutoAddedHTTPHeaders"));
  objc_msgSend(v4, "set_expiredDNSBehavior:", -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior"));
  objc_msgSend(v4, "setRequiresDNSSECValidation:", -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"));
  objc_msgSend(v4, "set_maximumWatchCellularTransferSize:", -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"));
  objc_msgSend(v4, "set_multipathAlternatePort:", -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort"));
  if (self->_phskip_credStorageSet)
    objc_msgSend(v4, "setURLCredentialStorage:", -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage"));
  if (self->_phskip_urlCacheSet)
    objc_msgSend(v4, "setURLCache:", -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache"));
  if (self->_phskip_cookieStorageSet)
    objc_msgSend(v4, "setHTTPCookieStorage:", -[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage"));
  if (self->_phskip_hstsStorageSet)
    objc_msgSend(v4, "set_hstsStorage:", -[NSURLSessionConfiguration _hstsStorage](self, "_hstsStorage"));
  objc_msgSend(v4, "set_allowsHTTP3Internal:", -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"));
  if (self->_phskip_alternativeServicesStorageSet)
    objc_msgSend(v4, "set_alternativeServicesStorage:", -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage"));
  objc_msgSend(v4, "set_usesNWLoader:", -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"));
  objc_msgSend(v4, "set_disablesNWLoader:", -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader"));
  objc_msgSend(v4, "set_downloadFileProtectionType:", -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"));
  objc_msgSend(v4, "set_pidForHAR:", -[NSURLSessionConfiguration _pidForHAR](self, "_pidForHAR"));
  objc_msgSend(v4, "set_enablesL4SInternal:", -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal"));
  objc_msgSend(v4, "set_prohibitEncryptedDNS:", -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"));
  objc_msgSend(v4, "set_enableOAuthBearerTokenChallenges:", -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges"));
  objc_msgSend(v4, "set_neTrackerTCCResult:", -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"));
  objc_msgSend(v4, "set_disableAPWakeOnIdleConnections:", -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"));
  return v4;
}

- (NSData)_sourceApplicationAuditTokenData
{
  return self->_sourceApplicationAuditTokenData;
}

- (NSString)disposition
{
  return self->_disposition;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)_tlsTrustPinningPolicyName
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (BOOL)_disableAPWakeOnIdleConnections
{
  return self->_disableAPWakeOnIdleConnections;
}

- (BOOL)_isProxySession
{
  return self->_proxySession;
}

- (int)_loggingPrivacyLevel
{
  return self->_loggingPrivacyLevel;
}

- (BOOL)_requiresSustainedDataDelivery
{
  return self->_requiresSustainedDataDelivery;
}

- (int)_pidForHAR
{
  return self->_pidForHAR;
}

- (NSTimeInterval)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (BOOL)_preventsIdleSleepOnceConnected
{
  return self->_preventsIdleSleepOnceConnected;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 304, 1);
}

- (NSArray)_proxyConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (int64_t)_timingDataOptions
{
  return self->_timingDataOptions;
}

- (BOOL)_allowsTLSFallback
{
  return self->_allowsTLSFallback;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->_shouldSkipPreferredClientCertificateLookup;
}

- (NSSet)_authenticatorStatusCodes
{
  return (NSSet *)objc_getProperty(self, a2, 464, 1);
}

- (NSData)_atsContext
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return self->_preventsSystemHTTPProxyAuthentication;
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (BOOL)_allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)_requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (BOOL)_allowsVirtualInterfaces
{
  return self->_allowsVirtualInterfaces;
}

- (unint64_t)_multipathAlternatePort
{
  return self->_multipathAlternatePort;
}

- (BOOL)_allowsTLSFalseStart
{
  return self->_allowsTLSFalseStart;
}

- (BOOL)_allowsTLSECH
{
  return self->_allowsTLSECH;
}

- (unint64_t)_TCPAdaptiveWriteTimeout
{
  return self->_TCPAdaptiveWriteTimeout;
}

- (unint64_t)_TCPAdaptiveReadTimeout
{
  return self->_TCPAdaptiveReadTimeout;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)_allowsTLSSessionTickets
{
  return self->_allowsTLSSessionTickets;
}

- (BOOL)_allowsTCPFastOpen
{
  return self->_allowsTCPFastOpen;
}

- (BOOL)waitsForConnectivity
{
  return self->_waitsForConnectivity;
}

- (NSURLSessionMultipathServiceType)multipathServiceType
{
  return self->_multipathServiceType;
}

- (double)_customReadBufferTimeout
{
  return self->_customReadBufferTimeout;
}

- (unint64_t)_customReadBufferSize
{
  return self->_customReadBufferSize;
}

- (BOOL)shouldUseExtendedBackgroundIdleMode
{
  return self->_shouldUseExtendedBackgroundIdleMode;
}

- (unint64_t)_forcedNetworkServiceType
{
  return self->_forcedNetworkServiceType;
}

- (int)_enablesL4SInternal
{
  return self->_enablesL4SInternal;
}

- (NSString)_companionAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 472, 1);
}

- (NSString)_attributedBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)_allowsTLSSessionResumption
{
  return self->_allowsTLSSessionResumption;
}

- (BOOL)_allowsResponseMonitoringDuringBodyTranmission
{
  return self->_allowsResponseMonitoringDuringBodyTranmission;
}

- (BOOL)_allowsMultipathTCP
{
  return self->_allowsMultipathTCP;
}

- (NSString)_CTDataConnectionServiceType
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (int64_t)_expiredDNSBehavior
{
  return self->_expiredDNSBehavior;
}

- (BOOL)_allowsIndefiniteConnections
{
  return self->_allowsIndefiniteConnections;
}

- (BOOL)requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (BOOL)_prohibitEncryptedDNS
{
  return self->_prohibitEncryptedDNS;
}

- (int)_allowsHTTP3Internal
{
  return self->_allowsHTTP3Internal;
}

- (void)_copyAttribute:(__CFString *)a3
{
  void *v5;
  int ExactString;
  unint64_t v7;
  const __CFAllocator *v8;
  CFNumberType v9;
  NSDictionary *v10;
  _BOOL4 v11;
  SSLProtocol v12;
  NSURLRequestNetworkServiceType v13;
  NSDictionary **v14;
  void *v15;
  void *v16;
  unint64_t valuePtr;

  v5 = (void *)MEMORY[0x186DB8C8C](self, a2);
  ExactString = _findExactString(a3, 0xEu);
  if (ExactString > 573799699)
  {
    if (ExactString > 577035584)
    {
      if (ExactString <= 580164974)
      {
        if (ExactString != 577035585)
        {
          if (ExactString == 579091806)
          {
            -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
            valuePtr = v7;
            v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v9 = kCFNumberDoubleType;
LABEL_41:
            v15 = CFNumberCreate(v8, v9, &valuePtr);
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        v11 = -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics");
        goto LABEL_33;
      }
      if (ExactString == 580164975)
      {
        if (-[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol") == kSSLProtocolUnknown)
        {
LABEL_44:
          v16 = 0;
          goto LABEL_45;
        }
        v12 = -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol");
        goto LABEL_39;
      }
      if (ExactString == 581213570)
      {
        v12 = -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol");
LABEL_39:
        valuePtr = v12;
        goto LABEL_40;
      }
LABEL_43:
      CFLog();
      goto LABEL_44;
    }
    switch(ExactString)
    {
      case 573799700:
        v13 = -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType");
        break;
      case 574848290:
        v13 = -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy");
        break;
      case 575946032:
        v11 = -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep");
LABEL_33:
        v14 = (NSDictionary **)MEMORY[0x1E0C9AE50];
        if (!v11)
          v14 = (NSDictionary **)MEMORY[0x1E0C9AE40];
        v10 = *v14;
        if (!*v14)
          goto LABEL_44;
        goto LABEL_36;
      default:
        goto LABEL_43;
    }
    goto LABEL_31;
  }
  if (ExactString > 570686691)
  {
    if (ExactString != 570686692)
    {
      if (ExactString == 571718900)
      {
        v11 = -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies");
      }
      else
      {
        if (ExactString != 572792067)
          goto LABEL_43;
        v11 = -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining");
      }
      goto LABEL_33;
    }
    v13 = -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy");
LABEL_31:
    valuePtr = v13;
LABEL_40:
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = kCFNumberCFIndexType;
    goto LABEL_41;
  }
  switch(ExactString)
  {
    case 564378771:
      v11 = -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess");
      goto LABEL_33;
    case 566516909:
      v10 = -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary");
      if (!v10)
        goto LABEL_44;
      break;
    case 569629908:
      v10 = -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders");
      if (!v10)
        goto LABEL_44;
      break;
    default:
      goto LABEL_43;
  }
LABEL_36:
  v15 = (void *)CFRetain(v10);
LABEL_42:
  v16 = v15;
LABEL_45:
  objc_autoreleasePoolPop(v5);
  return v16;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSDictionary)HTTPAdditionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (NSDictionary)connectionProxyDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (SSLProtocol)TLSMaximumSupportedProtocol
{
  return self->_TLSMaximumSupportedProtocol;
}

- (SSLProtocol)TLSMinimumSupportedProtocol
{
  return self->_TLSMinimumSupportedProtocol;
}

- (NSURLRequestNetworkServiceType)networkServiceType
{
  return self->_networkServiceType;
}

- (BOOL)_preventsIdleSleep
{
  return self->_preventsIdleSleep;
}

- (NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  return self->_HTTPCookieAcceptPolicy;
}

- (BOOL)HTTPShouldUsePipelining
{
  return self->_HTTPShouldUsePipelining;
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (BOOL)_usePipeliningHeuristics
{
  return self->_usePipeliningHeuristics;
}

- (NSURLRequestCachePolicy)requestCachePolicy
{
  return self->_requestCachePolicy;
}

- (BOOL)HTTPShouldSetCookies
{
  return self->_HTTPShouldSetCookies;
}

- (NSArray)protocolClasses
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)_disablesNWLoader
{
  return self->_disablesNWLoader;
}

- (BOOL)_usesNWLoader
{
  return self->_usesNWLoader;
}

- (BOOL)_reportsDataStalls
{
  return self->_reportsDataStalls;
}

- (NSSet)_suppressedAutoAddedHTTPHeaders
{
  return (NSSet *)objc_getProperty(self, a2, 512, 1);
}

- (BOOL)_allowsHSTSWithUntrustedRootCertificate
{
  return self->_allowsHSTSWithUntrustedRootCertificate;
}

- (BOOL)_alwaysPerformDefaultTrustEvaluation
{
  return self->_alwaysPerformDefaultTrustEvaluation;
}

- (BOOL)_duetPreauthorized
{
  return self->_duetPreauthorized;
}

- (NSURL)_directoryForDownloadedFiles
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)_tcpConnectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (NSDictionary)_socketStreamProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 456, 1);
}

- (BOOL)_forcesNewConnections
{
  return self->_forcesNewConnections;
}

- (int64_t)_duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (NSNumber)_maximumWatchCellularTransferSize
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (NSString)_connectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType
{
  self->_networkServiceType = networkServiceType;
}

- (BOOL)_supportsAVAssetDownloads
{
  return self->_supportsAVAssetDownloads;
}

- (int)_xpcActivityBudgeted
{
  return self->_xpcActivityBudgeted;
}

- (BOOL)_onBehalfOfPairedDevice
{
  return self->_onBehalfOfPairedDevice;
}

- (void)setHTTPAdditionalHeaders:(NSDictionary *)HTTPAdditionalHeaders
{
  objc_setProperty_atomic_copy(self, a2, HTTPAdditionalHeaders, 216);
}

- (BOOL)_prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (int64_t)_IDSMessageTimeout
{
  return self->_IDSMessageTimeout;
}

- (NSInteger)HTTPMaximumConnectionsPerHost
{
  return self->_limits.fHTTPLoadWidth;
}

- (void)set_alwaysPerformDefaultTrustEvaluation:(BOOL)a3
{
  self->_alwaysPerformDefaultTrustEvaluation = a3;
}

- (BOOL)sessionSendsLaunchEvents
{
  return self->_sessionSendsLaunchEvents;
}

- (void)set_tlsTrustPinningPolicyName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (void)set_timingDataOptions:(int64_t)a3
{
  self->_timingDataOptions = a3;
}

- (void)set_pidForHAR:(int)a3
{
  self->_pidForHAR = a3;
}

- (BOOL)_respectsAllowsCellularAccessForDiscretionaryTasks
{
  return self->_respectsAllowsCellularAccessForDiscretionaryTasks;
}

- (BOOL)_performsEVCertCheck
{
  return self->_performsEVCertCheck;
}

- (BOOL)_infersDiscretionaryFromOriginatingClient
{
  return self->_infersDiscretionaryFromOriginatingClient;
}

- (BOOL)_allowsRetryForBackgroundDataTasks
{
  return self->_allowsRetryForBackgroundDataTasks;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  self->_allowsCellularAccess = allowsCellularAccess;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  self->_timeoutIntervalForResource = timeoutIntervalForResource;
}

- (int)_neTrackerTCCResult
{
  return self->_neTrackerTCCResult;
}

- (void)setHTTPMaximumConnectionsPerHost:(NSInteger)HTTPMaximumConnectionsPerHost
{
  self->_limits.fHTTPLoadWidth = HTTPMaximumConnectionsPerHost;
}

- (BOOL)_sessionSendsLaunchOnDemandEvents
{
  return self->_sessionSendsLaunchOnDemandEvents;
}

- (void)set_authenticatorStatusCodes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSString)_downloadFileProtectionType
{
  return (NSString *)objc_getProperty(self, a2, 536, 1);
}

- (BOOL)_clientIsNotExplicitlyDiscretionary
{
  return self->_clientIsNotExplicitlyDiscretionary;
}

- (void)set_watchExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (void)set_sourceApplicationAuditTokenData:(id)a3
{
  double v5;
  double *v6;
  uint64_t v7;

  if (objc_msgSend(a3, "length") == 32)
  {
    self->_sourceApplicationAuditTokenData = (NSData *)objc_msgSend(a3, "copy");
    objc_msgSend(a3, "bytes");
    if (!self->_sourceApplicationBundleIdentifier)
    {
      gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromAuditToken(v5);
      if (*(_QWORD *)(v7 + 560))
        CPCopyBundleIdentifierAndTeamFromAuditToken_delayInitStub(*v6);
    }
  }
  else
  {

    self->_sourceApplicationAuditTokenData = 0;
  }
}

- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3
{
  self->_shouldSkipPreferredClientCertificateLookup = a3;
}

- (void)set_requiresSustainedDataDelivery:(BOOL)a3
{
  self->_requiresSustainedDataDelivery = a3;
}

- (void)set_requiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (void)set_reportsDataStalls:(BOOL)a3
{
  self->_reportsDataStalls = a3;
}

- (void)set_preventsIdleSleepOnceConnected:(BOOL)a3
{
  self->_preventsIdleSleepOnceConnected = a3;
}

- (void)set_prefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (void)set_onBehalfOfPairedDevice:(BOOL)a3
{
  self->_onBehalfOfPairedDevice = a3;
}

- (void)set_multipathAlternatePort:(unint64_t)a3
{
  self->_multipathAlternatePort = a3;
}

- (void)set_maximumWatchCellularTransferSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (void)set_loggingPrivacyLevel:(int)a3
{
  self->_loggingPrivacyLevel = a3;
}

- (void)set_duetPreauthorized:(BOOL)a3
{
  self->_duetPreauthorized = a3;
}

- (void)set_duetPreClearedMode:(int64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (void)set_directoryForDownloadedFiles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (void)set_atsContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void)set_allowsVirtualInterfaces:(BOOL)a3
{
  self->_allowsVirtualInterfaces = a3;
}

- (void)set_allowsTLSFalseStart:(BOOL)a3
{
  self->_allowsTLSFalseStart = a3;
}

- (void)set_allowsTLSFallback:(BOOL)a3
{
  self->_allowsTLSFallback = a3;
}

- (void)set_allowsTLSECH:(BOOL)a3
{
  self->_allowsTLSECH = a3;
}

- (void)set_allowsPowerNapScheduling:(BOOL)a3
{
  self->_allowsPowerNapScheduling = a3;
}

- (void)set_TCPAdaptiveWriteTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveWriteTimeout = a3;
}

- (void)set_TCPAdaptiveReadTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveReadTimeout = a3;
}

- (void)set_IDSMessageTimeout:(int64_t)a3
{
  self->_IDSMessageTimeout = a3;
}

- (void)setWaitsForConnectivity:(BOOL)waitsForConnectivity
{
  self->_waitsForConnectivity = waitsForConnectivity;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  self->_timeoutIntervalForRequest = timeoutIntervalForRequest;
}

- (void)setTLSMinimumSupportedProtocol:(SSLProtocol)TLSMinimumSupportedProtocol
{
  self->_TLSMinimumSupportedProtocol = TLSMinimumSupportedProtocol;
}

- (void)setTLSMaximumSupportedProtocol:(SSLProtocol)TLSMaximumSupportedProtocol
{
  self->_TLSMaximumSupportedProtocol = TLSMaximumSupportedProtocol;
}

- (void)setShouldUseExtendedBackgroundIdleMode:(BOOL)shouldUseExtendedBackgroundIdleMode
{
  self->_shouldUseExtendedBackgroundIdleMode = shouldUseExtendedBackgroundIdleMode;
}

- (void)setConnectionProxyDictionary:(NSDictionary *)connectionProxyDictionary
{
  objc_setProperty_atomic_copy(self, a2, connectionProxyDictionary, 200);
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess
{
  self->_allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess
{
  self->_allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess;
}

- (NSString)_watchExtensionBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (NSString)_watchAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (BOOL)_shouldPreserveBackgroundSessionDisposition
{
  return self->_shouldPreserveBackgroundSessionDisposition;
}

- (BOOL)_preventsDirectWiFiAccess
{
  return self->_preventsDirectWiFiAccess;
}

- (BOOL)_ignoreDidReceiveResponseDisposition
{
  return self->_ignoreDidReceiveResponseDisposition;
}

- (BOOL)_enableOAuthBearerTokenChallenges
{
  return self->_enableOAuthBearerTokenChallenges;
}

- (BOOL)_disablesUseOfProxySession
{
  return self->_disablesUseOfProxySession;
}

- (BOOL)_disablesOutOfProcessDirectWiFiUsage
{
  return self->_disablesOutOfProcessDirectWiFiUsage;
}

- (BOOL)_allowTCPIOConnectionStreamTask
{
  return self->_allowTCPIOConnectionStreamTask;
}

- (void)setSessionSendsLaunchEvents:(BOOL)sessionSendsLaunchEvents
{
  self->_sessionSendsLaunchEvents = sessionSendsLaunchEvents;
}

- (void)setDiscretionary:(BOOL)discretionary
{
  self->_discretionary = discretionary;
}

- (void)set_infersDiscretionaryFromOriginatingClient:(BOOL)a3
{
  self->_infersDiscretionaryFromOriginatingClient = a3;
}

- (void)set_allowsTLSSessionTickets:(BOOL)a3
{
  self->_allowsTLSSessionTickets = a3;
}

- (void)set_allowsTCPFastOpen:(BOOL)a3
{
  self->_allowsTCPFastOpen = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)set_neTrackerTCCResult:(int)a3
{
  self->_neTrackerTCCResult = a3;
}

- (void)set_forcedNetworkServiceType:(unint64_t)a3
{
  self->_forcedNetworkServiceType = a3;
}

- (void)set_attributedBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void)set_clientIsNotExplicitlyDiscretionary:(BOOL)a3
{
  self->_clientIsNotExplicitlyDiscretionary = a3;
}

- (void)set_supportsAVAssetDownloads:(BOOL)a3
{
  self->_supportsAVAssetDownloads = a3;
}

- (void)set_xpcActivityBudgeted:(int)a3
{
  self->_xpcActivityBudgeted = a3;
}

- (void)set_watchAppBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (void)set_usesNWLoader:(BOOL)a3
{
  self->_usesNWLoader = a3;
}

- (void)set_shouldPreserveBackgroundSessionDisposition:(BOOL)a3
{
  self->_shouldPreserveBackgroundSessionDisposition = a3;
}

- (void)set_sessionSendsLaunchOnDemandEvents:(BOOL)a3
{
  self->_sessionSendsLaunchOnDemandEvents = a3;
}

- (void)set_respectsAllowsCellularAccessForDiscretionaryTasks:(BOOL)a3
{
  self->_respectsAllowsCellularAccessForDiscretionaryTasks = a3;
}

- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self->_requiresSecureHTTPSProxyConnection = a3;
}

- (void)set_prohibitEncryptedDNS:(BOOL)a3
{
  self->_prohibitEncryptedDNS = a3;
}

- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self->_preventsSystemHTTPProxyAuthentication = a3;
}

- (void)set_preventsDirectWiFiAccess:(BOOL)a3
{
  self->_preventsDirectWiFiAccess = a3;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (void)set_performsEVCertCheck:(BOOL)a3
{
  self->_performsEVCertCheck = a3;
}

- (void)set_ignoreDidReceiveResponseDisposition:(BOOL)a3
{
  self->_ignoreDidReceiveResponseDisposition = a3;
}

- (void)set_expiredDNSBehavior:(int64_t)a3
{
  self->_expiredDNSBehavior = a3;
}

- (void)set_enablesL4SInternal:(int)a3
{
  self->_enablesL4SInternal = a3;
}

- (void)set_enableOAuthBearerTokenChallenges:(BOOL)a3
{
  self->_enableOAuthBearerTokenChallenges = a3;
}

- (void)set_downloadFileProtectionType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 536);
}

- (void)set_disablesUseOfProxySession:(BOOL)a3
{
  self->_disablesUseOfProxySession = a3;
}

- (void)set_disablesOutOfProcessDirectWiFiUsage:(BOOL)a3
{
  self->_disablesOutOfProcessDirectWiFiUsage = a3;
}

- (void)set_disablesNWLoader:(BOOL)a3
{
  self->_disablesNWLoader = a3;
}

- (void)set_disableAPWakeOnIdleConnections:(BOOL)a3
{
  self->_disableAPWakeOnIdleConnections = a3;
}

- (void)set_customReadBufferTimeout:(double)a3
{
  self->_customReadBufferTimeout = a3;
}

- (void)set_customReadBufferSize:(unint64_t)a3
{
  self->_customReadBufferSize = a3;
}

- (void)set_connectionPoolName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (void)set_companionAppBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (void)set_allowsTLSSessionResumption:(BOOL)a3
{
  self->_allowsTLSSessionResumption = a3;
}

- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3
{
  self->_allowsRetryForBackgroundDataTasks = a3;
}

- (void)set_allowsResponseMonitoringDuringBodyTranmission:(BOOL)a3
{
  self->_allowsResponseMonitoringDuringBodyTranmission = a3;
}

- (void)set_allowsMultipathTCP:(BOOL)a3
{
  self->_allowsMultipathTCP = a3;
}

- (void)set_allowsIndefiniteConnections:(BOOL)a3
{
  self->_allowsIndefiniteConnections = a3;
}

- (void)set_allowsHTTP3Internal:(int)a3
{
  self->_allowsHTTP3Internal = a3;
}

- (void)set_allowTCPIOConnectionStreamTask:(BOOL)a3
{
  self->_allowTCPIOConnectionStreamTask = a3;
}

- (void)set_CTDataConnectionServiceType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (void)setSharedContainerIdentifier:(NSString *)sharedContainerIdentifier
{
  objc_setProperty_atomic_copy(self, a2, sharedContainerIdentifier, 192);
}

- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation
{
  self->_requiresDNSSECValidation = requiresDNSSECValidation;
}

- (void)setMultipathServiceType:(NSURLSessionMultipathServiceType)multipathServiceType
{
  self->_multipathServiceType = multipathServiceType;
}

- (void)set_allowsHSTSWithUntrustedRootCertificate:(BOOL)a3
{
  self->_allowsHSTSWithUntrustedRootCertificate = a3;
}

- (void)set_socketStreamProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (void)set_tcpConnectionPoolName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (void)set_longLivedConnectionCachePurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCachePurgeTimeout = (int)a3;
  if ((int)a3 != 120)
    self->_limits.fLongLivedConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)set_connectionCachePurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCachePurgeTimeout = (int)a3;
  if ((int)a3 != 30)
    self->_limits.fHTTPConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)setSkip_download_unlink:(BOOL)a3
{
  self->_skip_download_unlink = a3;
}

- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining
{
  self->_HTTPShouldUsePipelining = HTTPShouldUsePipelining;
}

- (NSDictionary)_overriddenDelegateOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 504, 1);
}

- (void)setBackgroundSession:(BOOL)a3
{
  self->_backgroundSession = a3;
}

- (void)setHTTPShouldSetCookies:(BOOL)HTTPShouldSetCookies
{
  self->_HTTPShouldSetCookies = HTTPShouldSetCookies;
}

- (BOOL)_requiresClientToOpenFiles
{
  return self->_requiresClientToOpenFiles;
}

- (void)setHTTPCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  self->_HTTPCookieAcceptPolicy = HTTPCookieAcceptPolicy;
}

- (BOOL)skip_download_unlink
{
  return self->_skip_download_unlink;
}

- (double)_longLivedConnectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCacheCellPurgeTimeout;
}

- (void)setRequestCachePolicy:(NSURLRequestCachePolicy)requestCachePolicy
{
  self->_requestCachePolicy = requestCachePolicy;
}

- (BOOL)isBackgroundSession
{
  return self->_backgroundSession;
}

- (BOOL)_overridesBackgroundSessionAutoRedirect
{
  return self->_overridesBackgroundSessionAutoRedirect;
}

- (double)_longLivedConnectionCachePurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCachePurgeTimeout;
}

- (double)_connectionCachePurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCachePurgeTimeout;
}

- (int64_t)_connectionCacheNumPriorityLevels
{
  return self->_limits.fHTTPPriorityNumLevels;
}

- (int64_t)_connectionCacheNumFastLanes
{
  return self->_limits.fHTTPNumFastLanes;
}

- (int64_t)_connectionCacheMinimumFastLanePriority
{
  return self->_limits.fHTTPMinimumFastLanePriority;
}

- (double)_connectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCacheCellPurgeTimeout;
}

- (void)set_overridesBackgroundSessionAutoRedirect:(BOOL)a3
{
  self->_overridesBackgroundSessionAutoRedirect = a3;
}

- (void)set_proxyConfigurations:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (void)set_appleIDContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void)set_usePipeliningHeuristics:(BOOL)a3
{
  self->_usePipeliningHeuristics = a3;
}

- (void)set_suppressedAutoAddedHTTPHeaders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (void)set_requiresClientToOpenFiles:(BOOL)a3
{
  self->_requiresClientToOpenFiles = a3;
}

- (void)set_proxySession:(BOOL)a3
{
  self->_proxySession = a3;
}

- (void)set_preventsIdleSleep:(BOOL)a3
{
  self->_preventsIdleSleep = a3;
}

- (void)set_overriddenDelegateOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (void)set_longLivedConnectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)set_forcesNewConnections:(BOOL)a3
{
  self->_forcesNewConnections = a3;
}

- (void)set_connectionCacheNumPriorityLevels:(int64_t)a3
{
  if ((int)a3 >= 1)
    self->_limits.fHTTPPriorityNumLevels = a3;
}

- (void)set_connectionCacheNumFastLanes:(int64_t)a3
{
  if ((a3 & 0x80000000) == 0 && self->_limits.fHTTPLoadWidth > (int)a3)
    self->_limits.fHTTPNumFastLanes = a3;
}

- (void)set_connectionCacheMinimumFastLanePriority:(int64_t)a3
{
  self->_limits.fHTTPMinimumFastLanePriority = a3;
}

- (void)set_connectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)setProtocolClasses:(NSArray *)protocolClasses
{
  objc_setProperty_atomic_copy(self, a2, protocolClasses, 224);
}

- (NSURLCache)_phskip_urlCache
{
  return (NSURLCache *)objc_getProperty(self, a2, 424, 1);
}

- (void)setURLCache:(NSURLCache *)URLCache
{
  -[NSURLSessionConfiguration set_phskip_urlCache:](self, "set_phskip_urlCache:", URLCache);
  self->_phskip_urlCacheSet = 1;
}

- (void)set_phskip_urlCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (_CFHSTSPolicy)copyHSTSPolicy
{
  _CFHSTSPolicy *result;

  result = -[_NSHSTSStorage _policyRef](-[NSURLSessionConfiguration _hstsStorage](self, "_hstsStorage"), "_policyRef");
  if (result)
    return (_CFHSTSPolicy *)CFRetain(result);
  return result;
}

- (_NSHSTSStorage)_phskip_hstsStorage
{
  return (_NSHSTSStorage *)objc_getProperty(self, a2, 440, 1);
}

- (_NSHSTSStorage)_hstsStorage
{
  id v3;

  if (!self->_phskip_hstsStorageSet)
  {
    if (self->_disposition == qword_1EDD006B8)
      v3 = -[_NSHSTSStorage initInMemoryStore]([_NSHSTSStorage alloc], "initInMemoryStore");
    else
      v3 = +[_NSHSTSStorage sharedPersistentStore](_NSHSTSStorage, "sharedPersistentStore");
    -[NSURLSessionConfiguration set_hstsStorage:](self, "set_hstsStorage:", v3);
  }
  return -[NSURLSessionConfiguration _phskip_hstsStorage](self, "_phskip_hstsStorage");
}

- (_NSHTTPAlternativeServicesStorage)_phskip_alternativeServicesStorage
{
  return (_NSHTTPAlternativeServicesStorage *)objc_getProperty(self, a2, 528, 1);
}

- (void)setHTTPCookieStorage:(NSHTTPCookieStorage *)HTTPCookieStorage
{
  -[NSURLSessionConfiguration set_phskip_cookieStorage:](self, "set_phskip_cookieStorage:", HTTPCookieStorage);
  self->_phskip_cookieStorageSet = 1;
}

- (void)set_phskip_cookieStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void)set_hstsStorage:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (self->_disposition == qword_1EDD006B8)
  {
    v5 = objc_msgSend(a3, "_policyRef");
    if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
      dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
    v6 = v5 + 16;
    if (!v5)
      v6 = 0;
    if (*(_BYTE *)(*(_QWORD *)(v6 + 16) + 73))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Ephemeral sessions must use ephemeral HSTS storage."), 0));
  }
  -[NSURLSessionConfiguration set_phskip_hstsStorage:](self, "set_phskip_hstsStorage:", a3);
  self->_phskip_hstsStorageSet = 1;
}

- (void)set_phskip_hstsStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSHTTPCookieStorage)_phskip_cookieStorage
{
  return (NSHTTPCookieStorage *)objc_getProperty(self, a2, 432, 1);
}

- (NSURLCredentialStorage)_phskip_credStorage
{
  return (NSURLCredentialStorage *)objc_getProperty(self, a2, 416, 1);
}

- (void)setURLCredentialStorage:(NSURLCredentialStorage *)URLCredentialStorage
{
  -[NSURLSessionConfiguration set_phskip_credStorage:](self, "set_phskip_credStorage:", URLCredentialStorage);
  self->_phskip_credStorageSet = 1;
}

- (void)set_phskip_credStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (char)initWithDisposition:(void *)a1
{
  char *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  int v10;
  int v11;
  StrictSecurityPolicy *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)NSURLSessionConfiguration;
  v3 = (char *)objc_msgSendSuper2(&v14, sel_init);
  if (v3)
  {
    v4 = (void *)MEMORY[0x186DB8C8C]();
    if (objc_msgSend(a2, "isEqualToString:", 0x1EDD008B0))
    {
      if (mutableGlobalLimits(void)::sOnce != -1)
        dispatch_once(&mutableGlobalLimits(void)::sOnce, &__block_literal_global_10_10234);
      v5 = &mutableGlobalLimits(void)::gLimits;
    }
    else
    {
      if (defaultConnectionCacheLimits(void)::sOnce != -1)
        dispatch_once(&defaultConnectionCacheLimits(void)::sOnce, &__block_literal_global_10235);
      v5 = &defaultConnectionCacheLimits(void)::sImmutableLimits;
    }
    v6 = *v5;
    v7 = *(_QWORD *)(v6 + 32);
    v8 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)(v3 + 8) = *(_OWORD *)v6;
    *(_OWORD *)(v3 + 24) = v8;
    *((_QWORD *)v3 + 5) = v7;
    objc_msgSend(v3, "setDisposition:", a2);
    v3[94] = 0;
    *((_QWORD *)v3 + 19) = 0;
    *((_QWORD *)v3 + 20) = 0;
    *(_OWORD *)(v3 + 168) = xmmword_1841E3980;
    *((_QWORD *)v3 + 23) = 0;
    v3[48] = 1;
    *((_QWORD *)v3 + 49) = 0;
    v3[52] = 0;
    *(_QWORD *)(v3 + 116) = 4;
    *((_QWORD *)v3 + 25) = 0;
    *((_QWORD *)v3 + 26) = 2;
    *((_QWORD *)v3 + 27) = 0;
    *(_DWORD *)(v3 + 54) = 0x10000;
    *(_DWORD *)(v3 + 95) = 0;
    *((_OWORD *)v3 + 26) = 0u;
    *((_OWORD *)v3 + 27) = 0u;
    *((_QWORD *)v3 + 28) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultProtocolClasses"), "copy");
    *((_QWORD *)v3 + 29) = 0;
    *(_WORD *)(v3 + 49) = 257;
    v3[93] = 0;
    v3[51] = 1;
    *((_QWORD *)v3 + 42) = 0;
    *(_DWORD *)(v3 + 79) = 65537;
    if (*((_QWORD *)v3 + 51) == 0x1EDD006B8)
    {
      *((_DWORD *)v3 + 31) = 3;
    }
    else
    {
      v9 = (void *)nw_context_copy_implicit_context();
      *((_DWORD *)v3 + 31) = nw_context_get_privacy_level();
      if (v9)
        nw_release(v9);
    }
    v3[60] = 1;
    if (__CFNGetHTTP3Override::onceToken != -1)
      dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_45);
    if (__CFNGetHTTP3Override::value)
      v10 = 1;
    else
      v10 = 2;
    if (__CFNGetHTTP3Override::value == 255)
      v11 = 0;
    else
      v11 = v10;
    *((_DWORD *)v3 + 33) = v11;
    v3[110] = 0;
    v12 = (StrictSecurityPolicy *)objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "copy");
    *((_QWORD *)v3 + 67) = v12;
    *((_DWORD *)v3 + 35) = 0;
    *((_WORD *)v3 + 56) = 0;
    v3[99] = 0;
    *((_QWORD *)v3 + 39) = StrictSecurityPolicy::CopyATSState(v12);
    *((_QWORD *)v3 + 48) = 50;
    *((_DWORD *)v3 + 34) = getpid();
    objc_autoreleasePoolPop(v4);
  }
  return v3;
}

+ (id)_defaultProtocolClasses
{
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0C99D20];
  gotLoadHelper_x8__SOErrorDomain(v2);
  v5 = *(_QWORD *)(v4 + 1776);
  v6 = v6 || v5 == 0;
  if (v6)
  {
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    return (id)objc_msgSend(v3, "arrayWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0, v17);
  }
  else
  {
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    return (id)objc_msgSend(v3, "arrayWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  }
}

- (void)setDisposition:(id)a3
{
  self->_disposition = (NSString *)a3;
}

- (void)set_alternativeServicesStorage:(id)a3
{
  -[NSURLSessionConfiguration set_phskip_alternativeServicesStorage:](self, "set_phskip_alternativeServicesStorage:", a3);
  self->_phskip_alternativeServicesStorageSet = 1;
}

- (void)set_phskip_alternativeServicesStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSURLCredentialStorage)URLCredentialStorage
{
  if (self->_phskip_credStorageSet)
    return -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage");
  else
    return +[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage");
}

- (NSURLCache)URLCache
{
  if (self->_phskip_urlCacheSet)
    return -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache");
  else
    return +[NSURLCache sharedURLCache](NSURLCache, "sharedURLCache");
}

- (NSHTTPCookieStorage)HTTPCookieStorage
{
  if (self->_phskip_cookieStorageSet)
    return -[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage");
  else
    return +[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorage, "sharedHTTPCookieStorage");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionConfiguration;
  -[NSURLSessionConfiguration dealloc](&v3, sel_dealloc);
}

+ (NSURLSessionConfiguration)defaultSessionConfiguration
{
  if (+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce != -1)
    dispatch_once(&+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce, &__block_literal_global_19668);
  return (NSURLSessionConfiguration *)(id)objc_msgSend((id)+[NSURLSessionConfiguration defaultSessionConfiguration]::sDefaultConfiguration, "copy");
}

- (id)copyImmutableVariant:(id)a3
{
  void *v4;

  v4 = (void *)-[NSURLSessionConfiguration copy](self, "copy");
  if (a3)
    (*((void (**)(id, void *))a3 + 2))(a3, v4);
  return v4;
}

- (BOOL)proxiesRequireNWLoader
{
  NSArray *proxyConfigurations;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  proxyConfigurations = self->_proxyConfigurations;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](proxyConfigurations, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(proxyConfigurations);
        if ((nw_proxy_config_stack_requires_http_protocols() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](proxyConfigurations, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (HTTPConnectionCacheLimits)getConnectionCacheLimits
{
  __int128 v3;

  v3 = *(_OWORD *)&self->fHTTPConnectionCachePurgeTimeout;
  *(_OWORD *)&retstr->fHTTPLoadWidth = *(_OWORD *)&self->fHTTPPipeliningLowWatermark;
  *(_OWORD *)&retstr->fHTTPNumFastLanes = v3;
  *(_QWORD *)&retstr->fLongLivedConnectionCachePurgeTimeout = *(_QWORD *)&self[1].fHTTPLoadWidth;
  return self;
}

+ (id)immutableEffectiveConfigurationFromConfig:(id)a3
{
  return (id)objc_msgSend(a3, "copy");
}

+ (NSURLSessionConfiguration)ephemeralSessionConfiguration
{
  char *v2;
  void *v3;
  uint64_t v4;

  v2 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], qword_1EDD006B8);
  if (newCookieStorageEnabled(void)::onceToken != -1)
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
  if (newCookieStorageEnabled(void)::enabled)
    v3 = -[NSHTTPCookieStorageToCookie2Storage initMemoryCookieStore]([NSHTTPCookieStorageToCookie2Storage alloc]);
  else
    v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setHTTPCookieStorage:", v3);
  if (dyld_program_sdk_at_least())
    v4 = 512000;
  else
    v4 = 0;
  objc_msgSend(v2, "setURLCache:", -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:]([NSURLCache alloc], "initWithMemoryCapacity:diskCapacity:diskPath:", v4, 0, 0));
  objc_msgSend(v2, "setURLCredentialStorage:", (id)objc_opt_new());
  return (NSURLSessionConfiguration *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_self() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("__NSCFURLSessionConfiguration"));
    objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("__NSCFURLSessionConfiguration_Mutable"));
    objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("__NSCFURLSessionConfiguration_Immutable"));
  }
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSString *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  SSLProtocol v38;
  SSLProtocol v39;
  NSString *v40;
  uint64_t v41;
  NSURLRequestCachePolicy v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSURLRequestNetworkServiceType v49;
  NSDictionary *v50;
  uint64_t v51;
  NSHTTPCookieAcceptPolicy v52;
  NSDictionary *v53;
  uint64_t v54;
  NSInteger v55;
  int v56;
  NSArray *v57;
  uint64_t v58;
  NSURLSessionMultipathServiceType v59;
  NSURL *v60;
  uint64_t v61;
  NSString *v62;
  uint64_t v63;
  NSString *v64;
  uint64_t v65;
  NSData *v66;
  uint64_t v67;
  NSString *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  NSString *v85;
  uint64_t v86;
  int64_t v87;
  int64_t v88;
  int64_t v89;
  NSString *v90;
  uint64_t v91;
  NSDictionary *v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
  NSURLSessionAppleIDContext *v97;
  uint64_t v98;
  NSSet *v99;
  uint64_t v100;
  NSData *v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  int v106;
  NSString *v107;
  uint64_t v108;
  int v109;
  int v110;
  unint64_t v111;
  double v112;
  double v113;
  double v114;
  int v115;
  int v116;
  NSArray *v117;
  uint64_t v118;
  int v119;
  int v120;
  int v121;
  int64_t v122;
  int v123;
  int v124;
  int64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  NSString *v135;
  uint64_t v136;
  int v137;
  int v138;
  NSString *v139;
  uint64_t v140;
  NSString *v141;
  uint64_t v142;
  NSString *v143;
  uint64_t v144;
  unint64_t v145;
  NSDictionary *v146;
  uint64_t v147;
  NSSet *v148;
  uint64_t v149;
  NSNumber *v150;
  uint64_t v151;
  unint64_t v152;
  NSString *v153;
  uint64_t v154;
  int v155;
  int v156;
  int v157;
  int v158;
  NSURLCredentialStorage *v159;
  int v160;
  NSURLCache *v161;
  int v162;
  NSHTTPCookieStorage *v163;
  int v164;
  _NSHSTSStorage *v165;
  int64_t v166;
  int v167;
  int v168;
  int v169;
  _NSHTTPAlternativeServicesStorage *v170;
  int v171;
  int v172;
  int v173;
  int v174;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!self)
    return 0;
  v5 = -[NSURLSessionConfiguration disposition](self, "disposition");
  v6 = objc_msgSend(a3, "disposition");
  if (v5 != (NSString *)v6 && (-[NSString isEqual:](v5, "isEqual:", v6) & 1) == 0)
    return 0;
  v7 = -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess", v6);
  if (v7 != objc_msgSend(a3, "allowsCellularAccess"))
    return 0;
  v8 = -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess");
  if (v8 != objc_msgSend(a3, "allowsExpensiveNetworkAccess"))
    return 0;
  v9 = -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess");
  if (v9 != objc_msgSend(a3, "allowsConstrainedNetworkAccess"))
    return 0;
  v10 = -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA");
  if (v10 != objc_msgSend(a3, "_allowsUCA"))
    return 0;
  v11 = -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces");
  if (v11 != objc_msgSend(a3, "_allowsVirtualInterfaces"))
    return 0;
  v12 = -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity");
  if (v12 != objc_msgSend(a3, "waitsForConnectivity"))
    return 0;
  v13 = -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary");
  if (v13 != objc_msgSend(a3, "isDiscretionary"))
    return 0;
  v14 = -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier");
  v15 = objc_msgSend(a3, "sharedContainerIdentifier");
  if (v14 != (NSString *)v15 && (-[NSString isEqual:](v14, "isEqual:", v15) & 1) == 0)
    return 0;
  v16 = -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents", v15);
  if (v16 != objc_msgSend(a3, "sessionSendsLaunchEvents"))
    return 0;
  v17 = -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining");
  if (v17 != objc_msgSend(a3, "HTTPShouldUsePipelining"))
    return 0;
  v18 = -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies");
  if (v18 != objc_msgSend(a3, "HTTPShouldSetCookies"))
    return 0;
  v19 = -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn");
  if (v19 != objc_msgSend(a3, "_requiresPowerPluggedIn"))
    return 0;
  v20 = -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling");
  if (v20 != objc_msgSend(a3, "_allowsPowerNapScheduling"))
    return 0;
  v21 = -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate");
  if (v21 != objc_msgSend(a3, "_allowsHSTSWithUntrustedRootCertificate"))
    return 0;
  v22 = -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents");
  if (v22 != objc_msgSend(a3, "_sessionSendsLaunchOnDemandEvents"))
    return 0;
  v23 = -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions");
  if (v23 != objc_msgSend(a3, "_timingDataOptions"))
    return 0;
  v24 = -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup");
  if (v24 != objc_msgSend(a3, "_shouldSkipPreferredClientCertificateLookup"))
    return 0;
  v25 = -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks");
  if (v25 != objc_msgSend(a3, "_allowsRetryForBackgroundDataTasks"))
    return 0;
  v26 = -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice");
  if (v26 != objc_msgSend(a3, "_onBehalfOfPairedDevice"))
    return 0;
  v27 = -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary");
  if (v27 != objc_msgSend(a3, "_clientIsNotExplicitlyDiscretionary"))
    return 0;
  v28 = -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks");
  if (v28 != objc_msgSend(a3, "_respectsAllowsCellularAccessForDiscretionaryTasks"))
    return 0;
  v29 = -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient");
  if (v29 != objc_msgSend(a3, "_infersDiscretionaryFromOriginatingClient"))
    return 0;
  v30 = -[NSURLSessionConfiguration isBackgroundSession](self, "isBackgroundSession");
  if (v30 != objc_msgSend(a3, "isBackgroundSession"))
    return 0;
  v31 = -[NSURLSessionConfiguration skip_download_unlink](self, "skip_download_unlink");
  if (v31 != objc_msgSend(a3, "skip_download_unlink"))
    return 0;
  v32 = -[NSURLSessionConfiguration _requiresClientToOpenFiles](self, "_requiresClientToOpenFiles");
  if (v32 != objc_msgSend(a3, "_requiresClientToOpenFiles"))
    return 0;
  v33 = -[NSURLSessionConfiguration _forcesNewConnections](self, "_forcesNewConnections");
  if (v33 != objc_msgSend(a3, "_forcesNewConnections"))
    return 0;
  v34 = -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads");
  if (v34 != objc_msgSend(a3, "_supportsAVAssetDownloads"))
    return 0;
  v35 = -[NSURLSessionConfiguration _isProxySession](self, "_isProxySession");
  if (v35 != objc_msgSend(a3, "_isProxySession"))
    return 0;
  v36 = -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep");
  if (v36 != objc_msgSend(a3, "_preventsIdleSleep"))
    return 0;
  v37 = -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics");
  if (v37 != objc_msgSend(a3, "_usePipeliningHeuristics"))
    return 0;
  v38 = -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol");
  if (v38 != objc_msgSend(a3, "TLSMinimumSupportedProtocol"))
    return 0;
  v39 = -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol");
  if (v39 != objc_msgSend(a3, "TLSMaximumSupportedProtocol"))
    return 0;
  v40 = -[NSURLSessionConfiguration identifier](self, "identifier");
  v41 = objc_msgSend(a3, "identifier");
  if (v40 != (NSString *)v41 && (-[NSString isEqual:](v40, "isEqual:", v41) & 1) == 0)
    return 0;
  v42 = -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy", v41);
  if (v42 != objc_msgSend(a3, "requestCachePolicy"))
    return 0;
  -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  v44 = v43;
  objc_msgSend(a3, "timeoutIntervalForRequest");
  if (v44 != v45)
    return 0;
  -[NSURLSessionConfiguration timeoutIntervalForResource](self, "timeoutIntervalForResource");
  v47 = v46;
  objc_msgSend(a3, "timeoutIntervalForResource");
  if (v47 != v48)
    return 0;
  v49 = -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType");
  if (v49 != objc_msgSend(a3, "networkServiceType"))
    return 0;
  v50 = -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary");
  v51 = objc_msgSend(a3, "connectionProxyDictionary");
  if (v50 != (NSDictionary *)v51 && (-[NSDictionary isEqual:](v50, "isEqual:", v51) & 1) == 0)
    return 0;
  v52 = -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy", v51);
  if (v52 != objc_msgSend(a3, "HTTPCookieAcceptPolicy"))
    return 0;
  v53 = -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders");
  v54 = objc_msgSend(a3, "HTTPAdditionalHeaders");
  if (v53 != (NSDictionary *)v54 && (-[NSDictionary isEqual:](v53, "isEqual:", v54) & 1) == 0)
    return 0;
  v55 = -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost", v54);
  if (v55 != objc_msgSend(a3, "HTTPMaximumConnectionsPerHost"))
    return 0;
  v56 = -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode");
  if (v56 != objc_msgSend(a3, "shouldUseExtendedBackgroundIdleMode"))
    return 0;
  v57 = -[NSURLSessionConfiguration protocolClasses](self, "protocolClasses");
  v58 = objc_msgSend(a3, "protocolClasses");
  if (v57 != (NSArray *)v58 && (-[NSArray isEqual:](v57, "isEqual:", v58) & 1) == 0)
    return 0;
  v59 = -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType", v58);
  if (v59 != objc_msgSend(a3, "multipathServiceType"))
    return 0;
  v60 = -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles");
  v61 = objc_msgSend(a3, "_directoryForDownloadedFiles");
  if (v60 != (NSURL *)v61 && (-[NSURL isEqual:](v60, "isEqual:", v61) & 1) == 0)
    return 0;
  v62 = -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier", v61);
  v63 = objc_msgSend(a3, "_sourceApplicationBundleIdentifier");
  if (v62 != (NSString *)v63 && (-[NSString isEqual:](v62, "isEqual:", v63) & 1) == 0)
    return 0;
  v64 = -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier", v63);
  v65 = objc_msgSend(a3, "_sourceApplicationSecondaryIdentifier");
  if (v64 != (NSString *)v65 && (-[NSString isEqual:](v64, "isEqual:", v65) & 1) == 0)
    return 0;
  v66 = -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData", v65);
  v67 = objc_msgSend(a3, "_sourceApplicationAuditTokenData");
  if (v66 != (NSData *)v67 && (-[NSData isEqual:](v66, "isEqual:", v67) & 1) == 0)
    return 0;
  v68 = -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier", v67);
  v69 = objc_msgSend(a3, "_attributedBundleIdentifier");
  if (v68 != (NSString *)v69 && (-[NSString isEqual:](v68, "isEqual:", v69) & 1) == 0)
    return 0;
  v70 = -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout", v69);
  if (v70 != objc_msgSend(a3, "_TCPAdaptiveReadTimeout"))
    return 0;
  v71 = -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout");
  if (v71 != objc_msgSend(a3, "_TCPAdaptiveWriteTimeout"))
    return 0;
  v72 = -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls");
  if (v72 != objc_msgSend(a3, "_reportsDataStalls"))
    return 0;
  -[NSURLSessionConfiguration _connectionCachePurgeTimeout](self, "_connectionCachePurgeTimeout");
  v74 = v73;
  objc_msgSend(a3, "_connectionCachePurgeTimeout");
  if (v74 != v75)
    return 0;
  -[NSURLSessionConfiguration _connectionCacheCellPurgeTimeout](self, "_connectionCacheCellPurgeTimeout");
  v77 = v76;
  objc_msgSend(a3, "_connectionCacheCellPurgeTimeout");
  if (v77 != v78)
    return 0;
  -[NSURLSessionConfiguration _longLivedConnectionCachePurgeTimeout](self, "_longLivedConnectionCachePurgeTimeout");
  v80 = v79;
  objc_msgSend(a3, "_longLivedConnectionCachePurgeTimeout");
  if (v80 != v81)
    return 0;
  -[NSURLSessionConfiguration _longLivedConnectionCacheCellPurgeTimeout](self, "_longLivedConnectionCacheCellPurgeTimeout");
  v83 = v82;
  objc_msgSend(a3, "_longLivedConnectionCacheCellPurgeTimeout");
  if (v83 != v84)
    return 0;
  v85 = -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName");
  v86 = objc_msgSend(a3, "_connectionPoolName");
  if (v85 != (NSString *)v86 && (-[NSString isEqual:](v85, "isEqual:", v86) & 1) == 0)
    return 0;
  v87 = -[NSURLSessionConfiguration _connectionCacheNumPriorityLevels](self, "_connectionCacheNumPriorityLevels", v86);
  if (v87 != objc_msgSend(a3, "_connectionCacheNumPriorityLevels"))
    return 0;
  v88 = -[NSURLSessionConfiguration _connectionCacheNumFastLanes](self, "_connectionCacheNumFastLanes");
  if (v88 != objc_msgSend(a3, "_connectionCacheNumFastLanes"))
    return 0;
  v89 = -[NSURLSessionConfiguration _connectionCacheMinimumFastLanePriority](self, "_connectionCacheMinimumFastLanePriority");
  if (v89 != objc_msgSend(a3, "_connectionCacheMinimumFastLanePriority"))
    return 0;
  v90 = -[NSURLSessionConfiguration _tcpConnectionPoolName](self, "_tcpConnectionPoolName");
  v91 = objc_msgSend(a3, "_tcpConnectionPoolName");
  if (v90 != (NSString *)v91 && (-[NSString isEqual:](v90, "isEqual:", v91) & 1) == 0)
    return 0;
  v92 = -[NSURLSessionConfiguration _socketStreamProperties](self, "_socketStreamProperties", v91);
  v93 = objc_msgSend(a3, "_socketStreamProperties");
  if (v92 != (NSDictionary *)v93 && (-[NSDictionary isEqual:](v92, "isEqual:", v93) & 1) == 0)
    return 0;
  v94 = -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected", v93);
  if (v94 != objc_msgSend(a3, "_preventsIdleSleepOnceConnected"))
    return 0;
  v95 = -[NSURLSessionConfiguration _overridesBackgroundSessionAutoRedirect](self, "_overridesBackgroundSessionAutoRedirect");
  if (v95 != objc_msgSend(a3, "_overridesBackgroundSessionAutoRedirect"))
    return 0;
  v96 = -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck");
  if (v96 != objc_msgSend(a3, "_performsEVCertCheck"))
    return 0;
  v97 = -[NSURLSessionConfiguration _appleIDContext](self, "_appleIDContext");
  v98 = objc_msgSend(a3, "_appleIDContext");
  if (v97 != (NSURLSessionAppleIDContext *)v98
    && (-[NSURLSessionAppleIDContext isEqual:](v97, "isEqual:", v98) & 1) == 0)
  {
    return 0;
  }
  v99 = -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes", v98);
  v100 = objc_msgSend(a3, "_authenticatorStatusCodes");
  if (v99 != (NSSet *)v100 && (-[NSSet isEqual:](v99, "isEqual:", v100) & 1) == 0)
    return 0;
  v101 = -[NSURLSessionConfiguration _atsContext](self, "_atsContext", v100);
  v102 = objc_msgSend(a3, "_atsContext");
  if (v101 != (NSData *)v102 && (-[NSData isEqual:](v101, "isEqual:", v102) & 1) == 0)
    return 0;
  v103 = -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi", v102);
  if (v103 != objc_msgSend(a3, "_prefersInfraWiFi"))
    return 0;
  v104 = -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition");
  if (v104 != objc_msgSend(a3, "_shouldPreserveBackgroundSessionDisposition"))
    return 0;
  v105 = -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage");
  if (v105 != objc_msgSend(a3, "_disablesOutOfProcessDirectWiFiUsage"))
    return 0;
  v106 = -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession");
  if (v106 != objc_msgSend(a3, "_disablesUseOfProxySession"))
    return 0;
  v107 = -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType");
  v108 = objc_msgSend(a3, "_CTDataConnectionServiceType");
  if (v107 != (NSString *)v108 && (-[NSString isEqual:](v107, "isEqual:", v108) & 1) == 0)
    return 0;
  v109 = -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess", v108);
  if (v109 != objc_msgSend(a3, "_preventsDirectWiFiAccess"))
    return 0;
  v110 = -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask");
  if (v110 != objc_msgSend(a3, "_allowTCPIOConnectionStreamTask"))
    return 0;
  v111 = -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize");
  if (v111 != objc_msgSend(a3, "_customReadBufferSize"))
    return 0;
  -[NSURLSessionConfiguration _customReadBufferTimeout](self, "_customReadBufferTimeout");
  v113 = v112;
  objc_msgSend(a3, "_customReadBufferTimeout");
  if (v113 != v114)
    return 0;
  v115 = -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication");
  if (v115 != objc_msgSend(a3, "_preventsSystemHTTPProxyAuthentication"))
    return 0;
  v116 = -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection");
  if (v116 != objc_msgSend(a3, "_requiresSecureHTTPSProxyConnection"))
    return 0;
  v117 = -[NSURLSessionConfiguration _proxyConfigurations](self, "_proxyConfigurations");
  v118 = objc_msgSend(a3, "_proxyConfigurations");
  if (v117 != (NSArray *)v118 && (-[NSArray isEqual:](v117, "isEqual:", v118) & 1) == 0)
    return 0;
  v119 = -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO", v118);
  if (v119 != objc_msgSend(a3, "_preventsAppSSO"))
    return 0;
  v120 = -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel");
  if (v120 != objc_msgSend(a3, "_loggingPrivacyLevel"))
    return 0;
  v121 = -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized");
  if (v121 != objc_msgSend(a3, "_duetPreauthorized"))
    return 0;
  v122 = -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode");
  if (v122 != objc_msgSend(a3, "_duetPreClearedMode"))
    return 0;
  v123 = -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted");
  if (v123 != objc_msgSend(a3, "_xpcActivityBudgeted"))
    return 0;
  v124 = -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery");
  if (v124 != objc_msgSend(a3, "_requiresSustainedDataDelivery"))
    return 0;
  v125 = -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout");
  if (v125 != objc_msgSend(a3, "_IDSMessageTimeout"))
    return 0;
  v126 = -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition");
  if (v126 != objc_msgSend(a3, "_ignoreDidReceiveResponseDisposition"))
    return 0;
  v127 = -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation");
  if (v127 != objc_msgSend(a3, "_alwaysPerformDefaultTrustEvaluation"))
    return 0;
  v128 = -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP");
  if (v128 != objc_msgSend(a3, "_allowsMultipathTCP"))
    return 0;
  v129 = -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission");
  if (v129 != objc_msgSend(a3, "_allowsResponseMonitoringDuringBodyTranmission"))
    return 0;
  v130 = -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections");
  if (v130 != objc_msgSend(a3, "_allowsIndefiniteConnections"))
    return 0;
  v131 = -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen");
  if (v131 != objc_msgSend(a3, "_allowsTCPFastOpen"))
    return 0;
  v132 = -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets");
  if (v132 != objc_msgSend(a3, "_allowsTLSSessionTickets"))
    return 0;
  v133 = -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption");
  if (v133 != objc_msgSend(a3, "_allowsTLSSessionResumption"))
    return 0;
  v134 = -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart");
  if (v134 != objc_msgSend(a3, "_allowsTLSFalseStart"))
    return 0;
  v135 = -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName");
  v136 = objc_msgSend(a3, "_tlsTrustPinningPolicyName");
  if (v135 != (NSString *)v136 && (-[NSString isEqual:](v135, "isEqual:", v136) & 1) == 0)
    return 0;
  v137 = -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback", v136);
  if (v137 != objc_msgSend(a3, "_allowsTLSFallback"))
    return 0;
  v138 = -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH");
  if (v138 != objc_msgSend(a3, "_allowsTLSECH"))
    return 0;
  v139 = -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier");
  v140 = objc_msgSend(a3, "_companionAppBundleIdentifier");
  if (v139 != (NSString *)v140 && (-[NSString isEqual:](v139, "isEqual:", v140) & 1) == 0)
    return 0;
  v141 = -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier", v140);
  v142 = objc_msgSend(a3, "_watchAppBundleIdentifier");
  if (v141 != (NSString *)v142 && (-[NSString isEqual:](v141, "isEqual:", v142) & 1) == 0)
    return 0;
  v143 = -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier", v142);
  v144 = objc_msgSend(a3, "_watchExtensionBundleIdentifier");
  if (v143 != (NSString *)v144 && (-[NSString isEqual:](v143, "isEqual:", v144) & 1) == 0)
    return 0;
  v145 = -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType", v144);
  if (v145 != objc_msgSend(a3, "_forcedNetworkServiceType"))
    return 0;
  v146 = -[NSURLSessionConfiguration _overriddenDelegateOptions](self, "_overriddenDelegateOptions");
  v147 = objc_msgSend(a3, "_overriddenDelegateOptions");
  if (v146 != (NSDictionary *)v147 && (-[NSDictionary isEqual:](v146, "isEqual:", v147) & 1) == 0)
    return 0;
  v148 = -[NSURLSessionConfiguration _suppressedAutoAddedHTTPHeaders](self, "_suppressedAutoAddedHTTPHeaders", v147);
  v149 = objc_msgSend(a3, "_suppressedAutoAddedHTTPHeaders");
  if (v148 != (NSSet *)v149 && (-[NSSet isEqual:](v148, "isEqual:", v149) & 1) == 0)
    return 0;
  v150 = -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize", v149);
  v151 = objc_msgSend(a3, "_maximumWatchCellularTransferSize");
  if (v150 != (NSNumber *)v151 && (-[NSNumber isEqual:](v150, "isEqual:", v151) & 1) == 0)
    return 0;
  v152 = -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort", v151);
  if (v152 != objc_msgSend(a3, "_multipathAlternatePort"))
    return 0;
  v153 = -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType");
  v154 = objc_msgSend(a3, "_downloadFileProtectionType");
  if (v153 != (NSString *)v154 && (-[NSString isEqual:](v153, "isEqual:", v154) & 1) == 0)
    return 0;
  v155 = -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges", v154);
  if (v155 != objc_msgSend(a3, "_enableOAuthBearerTokenChallenges"))
    return 0;
  v156 = -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader");
  if (v156 != objc_msgSend(a3, "_disablesNWLoader"))
    return 0;
  v157 = -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal");
  if (v157 != objc_msgSend(a3, "_enablesL4SInternal"))
    return 0;
  v158 = -[NSURLSessionConfiguration _phskip_credStorageSet](self, "_phskip_credStorageSet");
  if (v158 != objc_msgSend(a3, "_phskip_credStorageSet"))
    return 0;
  if (-[NSURLSessionConfiguration _phskip_credStorageSet](self, "_phskip_credStorageSet"))
  {
    v159 = -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage");
    if (v159 != (NSURLCredentialStorage *)objc_msgSend(a3, "_phskip_credStorage"))
      return 0;
  }
  v160 = -[NSURLSessionConfiguration _phskip_urlCacheSet](self, "_phskip_urlCacheSet");
  if (v160 != objc_msgSend(a3, "_phskip_urlCacheSet"))
    return 0;
  if (-[NSURLSessionConfiguration _phskip_urlCacheSet](self, "_phskip_urlCacheSet"))
  {
    v161 = -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache");
    if (v161 != (NSURLCache *)objc_msgSend(a3, "_phskip_urlCache"))
      return 0;
  }
  v162 = -[NSURLSessionConfiguration _phskip_cookieStorageSet](self, "_phskip_cookieStorageSet");
  if (v162 != objc_msgSend(a3, "_phskip_cookieStorageSet"))
    return 0;
  if (-[NSURLSessionConfiguration _phskip_cookieStorageSet](self, "_phskip_cookieStorageSet"))
  {
    v163 = -[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage");
    if (v163 != (NSHTTPCookieStorage *)objc_msgSend(a3, "_phskip_cookieStorage"))
      return 0;
  }
  v164 = -[NSURLSessionConfiguration _phskip_hstsStorageSet](self, "_phskip_hstsStorageSet");
  if (v164 != objc_msgSend(a3, "_phskip_hstsStorageSet"))
    return 0;
  if (-[NSURLSessionConfiguration _phskip_hstsStorageSet](self, "_phskip_hstsStorageSet"))
  {
    v165 = -[NSURLSessionConfiguration _phskip_hstsStorage](self, "_phskip_hstsStorage");
    if (v165 != (_NSHSTSStorage *)objc_msgSend(a3, "_phskip_hstsStorage"))
      return 0;
  }
  v166 = -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior");
  if (v166 != objc_msgSend(a3, "_expiredDNSBehavior"))
    return 0;
  v167 = -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation");
  if (v167 != objc_msgSend(a3, "requiresDNSSECValidation"))
    return 0;
  v168 = -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal");
  if (v168 != objc_msgSend(a3, "_allowsHTTP3Internal"))
    return 0;
  v169 = -[NSURLSessionConfiguration _phskip_alternativeServicesStorageSet](self, "_phskip_alternativeServicesStorageSet");
  if (v169 != objc_msgSend(a3, "_phskip_alternativeServicesStorageSet"))
    return 0;
  if (-[NSURLSessionConfiguration _phskip_alternativeServicesStorageSet](self, "_phskip_alternativeServicesStorageSet"))
  {
    v170 = -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage");
    if (v170 != (_NSHTTPAlternativeServicesStorage *)objc_msgSend(a3, "_phskip_alternativeServicesStorage"))
      return 0;
  }
  v171 = -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader");
  if (v171 == objc_msgSend(a3, "_usesNWLoader")
    && (v172 = -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"),
        v172 == objc_msgSend(a3, "_prohibitEncryptedDNS"))
    && (v173 = -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"),
        v173 == objc_msgSend(a3, "_neTrackerTCCResult"))
    && (v174 = -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"),
        v174 == objc_msgSend(a3, "_disableAPWakeOnIdleConnections")))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_phskip_credStorageSet
{
  return self->_phskip_credStorageSet;
}

- (BOOL)_phskip_urlCacheSet
{
  return self->_phskip_urlCacheSet;
}

- (BOOL)_phskip_hstsStorageSet
{
  return self->_phskip_hstsStorageSet;
}

- (BOOL)_phskip_cookieStorageSet
{
  return self->_phskip_cookieStorageSet;
}

+ (NSURLSessionConfiguration)backgroundSessionConfigurationWithIdentifier:(NSString *)identifier
{
  char *v4;

  if (!identifier)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Background session configuration must have a non-nil identifier"), 0));
  v4 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &unk_1EDD00610);
  objc_msgSend(v4, "setURLCache:", 0);
  objc_msgSend(v4, "setIdentifier:", identifier);
  objc_msgSend(v4, "setBackgroundSession:", 1);
  objc_msgSend(v4, "setSessionSendsLaunchEvents:", 1);
  return (NSURLSessionConfiguration *)v4;
}

char *__56__NSURLSessionConfiguration_defaultSessionConfiguration__block_invoke()
{
  char *result;

  result = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &unk_1EDD00680);
  +[NSURLSessionConfiguration defaultSessionConfiguration]::sDefaultConfiguration = (uint64_t)result;
  return result;
}

- (void)set_allowsConstrainedNetworkAccess:(BOOL)a3
{
  self->_allowsConstrainedNetworkAccess = a3;
}

- (BOOL)_allowsExpensiveAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (id)_initWithConfiguration:(id)a3
{

  return a3;
}

- (void)set_allowsHTTP3:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  self->_allowsHTTP3Internal = v3;
}

char *__65__NSURLSessionConfiguration_sessionConfigurationForSharedSession__block_invoke()
{
  char *result;

  result = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &qword_1EDD006B8[63]);
  +[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sSharedConfiguration = (uint64_t)result;
  return result;
}

- (void)set_skipsStackTraceCapture:(BOOL)a3
{
  self->__skipsStackTraceCapture = a3;
}

- (void)set_allowsExpensiveAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (void)setTLSMinimumSupportedProtocolVersion:(tls_protocol_version_t)TLSMinimumSupportedProtocolVersion
{
  self->_TLSMinimumSupportedProtocol = SSLProtocolFromVersionCodepoint();
}

+ (id)sessionConfigurationForSharedSession
{
  if (+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sOnce != -1)
    dispatch_once(&+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sOnce, &__block_literal_global_19_19667);
  return (id)objc_msgSend((id)+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sSharedConfiguration, "copy");
}

- (NSURLSessionConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionConfiguration;
  return -[NSURLSessionConfiguration init](&v3, sel_init);
}

- (tls_protocol_version_t)TLSMinimumSupportedProtocolVersion
{
  return (unsigned __int16)tlsProtocolVersionForSSLProtocol((SSLProtocol)self->_TLSMinimumSupportedProtocol, 1);
}

- (tls_protocol_version_t)TLSMaximumSupportedProtocolVersion
{
  return (unsigned __int16)tlsProtocolVersionForSSLProtocol((SSLProtocol)self->_TLSMaximumSupportedProtocol, 0);
}

- (void)setTLSMaximumSupportedProtocolVersion:(tls_protocol_version_t)TLSMaximumSupportedProtocolVersion
{
  self->_TLSMaximumSupportedProtocol = SSLProtocolFromVersionCodepoint();
}

- (BOOL)_allowsSensitiveLogging
{
  return self->_loggingPrivacyLevel < 3;
}

- (void)set_allowsSensitiveLogging:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 4;
  self->_loggingPrivacyLevel = v3;
}

- (BOOL)_allowsHTTP3
{
  return self->_allowsHTTP3Internal != 2;
}

- (BOOL)_enablesL4S
{
  return self->_enablesL4SInternal == 1;
}

- (void)set_enablesL4S:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  self->_enablesL4SInternal = v3;
}

- (OS_xpc_object)_xpcActivity
{
  return self->_xpcActivity;
}

- (void)set_xpcActivity:(id)a3
{
  int v5;

  self->_xpcActivity = (OS_xpc_object *)a3;
  if (a3)
  {
    if (xpc_activity_should_be_data_budgeted())
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  self->_xpcActivityBudgeted = v5;
}

- (BOOL)_allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (BOOL)_allowsUCA
{
  return self->_allowsUCA;
}

- (void)_setAllowsUCA:(BOOL)a3
{
  self->_allowsUCA = a3;
}

- (BOOL)_allowsReachabilityCheck
{
  return 0;
}

- (BOOL)_inPrivateBrowsing
{
  return -[NSString isEqualToString:](-[NSURLSessionConfiguration disposition](self, "disposition"), "isEqualToString:", 0x1EDD006B8);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  double v38;
  NSUInteger v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSInteger v45;
  NSInteger v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  double v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  unint64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSUInteger v104;
  NSUInteger v105;
  NSUInteger v106;
  NSUInteger v107;
  NSUInteger v108;
  NSUInteger v109;
  NSUInteger v110;
  NSUInteger v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSUInteger v115;
  NSUInteger v116;
  NSUInteger v117;
  uint64_t v118;
  unint64_t v119;

  v3 = -[NSString hash](-[NSURLSessionConfiguration disposition](self, "disposition"), "hash");
  v4 = v3 + -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess");
  v5 = v4 + -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess");
  v6 = v5 + -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess");
  v7 = v6 + -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA");
  v8 = v7 + -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces");
  v9 = v8 + -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity");
  v10 = v9 + -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary");
  v11 = v10
      + -[NSString hash](-[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"), "hash");
  v12 = v11 + -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents");
  v13 = v12 + -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining");
  v14 = v13 + -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies");
  v15 = v14 + -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn");
  v16 = v15 + -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling");
  v17 = v16
      + -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate");
  v18 = v17 + -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents");
  v19 = v18 + -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions");
  v20 = v19
      + -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup");
  v21 = v20
      + -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks");
  v22 = v21 + -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice");
  v23 = v22
      + -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary");
  v24 = v23
      + -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks");
  v25 = v24
      + -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient");
  v26 = v25 + -[NSURLSessionConfiguration isBackgroundSession](self, "isBackgroundSession");
  v27 = v26 + -[NSURLSessionConfiguration skip_download_unlink](self, "skip_download_unlink");
  v28 = v27 + -[NSURLSessionConfiguration _requiresClientToOpenFiles](self, "_requiresClientToOpenFiles");
  v29 = v28 + -[NSURLSessionConfiguration _forcesNewConnections](self, "_forcesNewConnections");
  v30 = v29 + -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads");
  v31 = v30 + -[NSURLSessionConfiguration _isProxySession](self, "_isProxySession");
  v32 = v31 + -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep");
  v33 = v32 + -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics");
  v34 = v33 + (int)-[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol");
  v35 = v34 + (int)-[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol");
  v36 = -[NSString hash](-[NSURLSessionConfiguration identifier](self, "identifier"), "hash");
  v37 = v36 + -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy");
  -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  v39 = v37 + (uint64_t)v38;
  -[NSURLSessionConfiguration timeoutIntervalForResource](self, "timeoutIntervalForResource");
  v41 = v39 + (uint64_t)v40 + -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType");
  v42 = v41
      + -[NSDictionary hash](-[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"), "hash");
  v43 = v42 + -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy");
  v44 = v43
      + -[NSDictionary hash](-[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"), "hash");
  v45 = v35 + v44 + -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost");
  v46 = v45
      + -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode");
  v47 = -[NSArray hash](-[NSURLSessionConfiguration protocolClasses](self, "protocolClasses"), "hash");
  v48 = v47 + -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType");
  v49 = v48
      + -[NSURL hash](-[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"), "hash");
  v50 = v49
      + -[NSString hash](-[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"), "hash");
  v51 = v50
      + -[NSString hash](-[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"), "hash");
  v52 = v51
      + -[NSData hash](-[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"), "hash");
  v53 = v52
      + -[NSString hash](-[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"), "hash");
  v54 = v53 + -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout");
  v55 = v46 + v54 + -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout");
  v56 = v55 + -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls");
  -[NSURLSessionConfiguration _connectionCachePurgeTimeout](self, "_connectionCachePurgeTimeout");
  v58 = (uint64_t)v57;
  -[NSURLSessionConfiguration _connectionCacheCellPurgeTimeout](self, "_connectionCacheCellPurgeTimeout");
  v60 = v58 + (uint64_t)v59;
  -[NSURLSessionConfiguration _longLivedConnectionCachePurgeTimeout](self, "_longLivedConnectionCachePurgeTimeout");
  v62 = v60 + (uint64_t)v61;
  -[NSURLSessionConfiguration _longLivedConnectionCacheCellPurgeTimeout](self, "_longLivedConnectionCacheCellPurgeTimeout");
  v64 = v62
      + (uint64_t)v63
      + -[NSString hash](-[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"), "hash");
  v65 = v64 + -[NSURLSessionConfiguration _connectionCacheNumPriorityLevels](self, "_connectionCacheNumPriorityLevels");
  v66 = v65 + -[NSURLSessionConfiguration _connectionCacheNumFastLanes](self, "_connectionCacheNumFastLanes");
  v67 = v66
      + -[NSURLSessionConfiguration _connectionCacheMinimumFastLanePriority](self, "_connectionCacheMinimumFastLanePriority");
  v68 = v67
      + -[NSString hash](-[NSURLSessionConfiguration _tcpConnectionPoolName](self, "_tcpConnectionPoolName"), "hash");
  v69 = v56
      + v68
      + -[NSDictionary hash](-[NSURLSessionConfiguration _socketStreamProperties](self, "_socketStreamProperties"), "hash");
  v70 = v69 + -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected");
  v71 = v70
      + -[NSURLSessionConfiguration _overridesBackgroundSessionAutoRedirect](self, "_overridesBackgroundSessionAutoRedirect");
  v72 = v71 + -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck");
  v73 = -[NSURLSessionAppleIDContext hash](-[NSURLSessionConfiguration _appleIDContext](self, "_appleIDContext"), "hash");
  v74 = v73
      + -[NSSet hash](-[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"), "hash");
  v75 = v72 + v74 + -[NSData hash](-[NSURLSessionConfiguration _atsContext](self, "_atsContext"), "hash");
  v76 = v75 + -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi");
  v77 = v76
      + -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition");
  v78 = v77
      + -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage");
  v79 = v78 + -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession");
  v80 = v79
      + -[NSString hash](-[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"), "hash");
  v81 = v80 + -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess");
  v82 = v81 + -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask");
  v83 = -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize");
  -[NSURLSessionConfiguration _customReadBufferTimeout](self, "_customReadBufferTimeout");
  v85 = v82
      + v83
      + (uint64_t)v84
      + -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication");
  v86 = v85
      + -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection");
  v87 = v86 + -[NSArray hash](-[NSURLSessionConfiguration _proxyConfigurations](self, "_proxyConfigurations"), "hash");
  v88 = v87 + -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO");
  v89 = v88 + -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel");
  v90 = v89 + -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized");
  v91 = v90 + -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode");
  v92 = v91 + -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted");
  v93 = v92 + -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery");
  v94 = v93 + -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout");
  v95 = v94
      + -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition");
  v96 = v95
      + -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation");
  v97 = v96 + -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP");
  v98 = v97
      + -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission");
  v99 = v98 + -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections");
  v100 = v99 + -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen");
  v101 = v100 + -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets");
  v102 = v101 + -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption");
  v103 = v102 + -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart");
  v104 = v103
       + -[NSString hash](-[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"), "hash");
  v105 = v104 + -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback");
  v106 = v105 + -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH");
  v107 = -[NSString hash](-[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"), "hash");
  v108 = v107
       + -[NSString hash](-[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"), "hash");
  v109 = v108
       + -[NSString hash](-[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"), "hash");
  v110 = v109 + -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType");
  v111 = v110
       + -[NSDictionary hash](-[NSURLSessionConfiguration _overriddenDelegateOptions](self, "_overriddenDelegateOptions"), "hash");
  v112 = v111
       + -[NSSet hash](-[NSURLSessionConfiguration _suppressedAutoAddedHTTPHeaders](self, "_suppressedAutoAddedHTTPHeaders"), "hash");
  v113 = v112
       + -[NSNumber hash](-[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"), "hash");
  v114 = v113 + -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort");
  v115 = v106
       + v114
       + -[NSString hash](-[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"), "hash");
  v116 = v115
       + -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges");
  v117 = v116 + -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader");
  v118 = v117 + -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal") + 1;
  if (-[NSURLSessionConfiguration _phskip_credStorageSet](self, "_phskip_credStorageSet"))
    v118 += -[NSURLCredentialStorage hash](-[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage"), "hash");
  if (-[NSURLSessionConfiguration _phskip_urlCacheSet](self, "_phskip_urlCacheSet"))
    v118 += -[NSURLCache hash](-[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache"), "hash");
  if (-[NSURLSessionConfiguration _phskip_cookieStorageSet](self, "_phskip_cookieStorageSet"))
    v118 += -[NSHTTPCookieStorage hash](-[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage"), "hash");
  if (-[NSURLSessionConfiguration _phskip_hstsStorageSet](self, "_phskip_hstsStorageSet"))
    v118 += (uint64_t)-[NSURLSessionConfiguration _phskip_hstsStorage](self, "_phskip_hstsStorage");
  if (-[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"))
    v118 += -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal");
  v119 = -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior") + v118;
  if (-[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"))
    v119 += -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation");
  if (-[NSURLSessionConfiguration _phskip_alternativeServicesStorageSet](self, "_phskip_alternativeServicesStorageSet"))
    v119 += -[_NSHTTPAlternativeServicesStorage hash](-[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage"), "hash");
  if (-[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"))
    v119 += -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader");
  if (-[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"))
    v119 += -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS");
  if (-[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"))
    v119 += -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult");
  if (-[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"))
    v119 += -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections");
  return v119;
}

- (void)set_phskip_credStorageSet:(BOOL)a3
{
  self->_phskip_credStorageSet = a3;
}

- (void)set_phskip_urlCacheSet:(BOOL)a3
{
  self->_phskip_urlCacheSet = a3;
}

- (void)set_phskip_cookieStorageSet:(BOOL)a3
{
  self->_phskip_cookieStorageSet = a3;
}

- (void)set_phskip_hstsStorageSet:(BOOL)a3
{
  self->_phskip_hstsStorageSet = a3;
}

- (BOOL)_phskip_alternativeServicesStorageSet
{
  return self->_phskip_alternativeServicesStorageSet;
}

- (void)set_phskip_alternativeServicesStorageSet:(BOOL)a3
{
  self->_phskip_alternativeServicesStorageSet = a3;
}

- (BOOL)_allowsWCA
{
  return self->__allowsWCA;
}

- (void)set_allowsWCA:(BOOL)a3
{
  self->__allowsWCA = a3;
}

- (int64_t)_companionProxyPreference
{
  return self->__companionProxyPreference;
}

- (void)set_companionProxyPreference:(int64_t)a3
{
  self->__companionProxyPreference = a3;
}

- (BOOL)_skipsStackTraceCapture
{
  return self->__skipsStackTraceCapture;
}

+ (id)_AVBackgroundSessionConfigurationWithIdentifier:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:", a3);
  objc_msgSend(v3, "set_supportsAVAssetDownloads:", 1);
  return v3;
}

+ (NSURLSessionConfiguration)backgroundSessionConfiguration:(NSString *)identifier
{
  if (+[NSURLSessionConfiguration backgroundSessionConfiguration:]::onceToken != -1)
    dispatch_once(&+[NSURLSessionConfiguration backgroundSessionConfiguration:]::onceToken, &__block_literal_global_27_19659);
  return (NSURLSessionConfiguration *)objc_msgSend((id)objc_opt_class(), "backgroundSessionConfigurationWithIdentifier:", identifier);
}

uint64_t __60__NSURLSessionConfiguration_backgroundSessionConfiguration___block_invoke()
{
  return CFLog();
}

@end
