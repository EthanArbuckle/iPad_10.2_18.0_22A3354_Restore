@implementation ENRegionServerConfiguration

- (id)description
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  unsigned int v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  _BOOL4 v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  _BOOL4 v42;
  unint64_t v43;
  void *v44;
  void *v45;

  v44 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegionServerConfiguration region](self, "region");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[ENRegionServerConfiguration enVersion](self, "enVersion");
  v42 = -[ENRegionServerConfiguration enEnabled](self, "enEnabled");
  v3 = -[ENRegionServerConfiguration associatedDomainsEnabled](self, "associatedDomainsEnabled");
  v4 = -[ENRegionServerConfiguration textMessageVerificationEnabled](self, "textMessageVerificationEnabled");
  v5 = -[ENRegionServerConfiguration preArmTestVerificationEnabled](self, "preArmTestVerificationEnabled");
  v6 = -[ENRegionServerConfiguration variantOfConcernEnabled](self, "variantOfConcernEnabled");
  v7 = -[ENRegionServerConfiguration featureFlags](self, "featureFlags");
  if (!v7)
  {
    v41 = "[ None ]";
    goto LABEL_14;
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("(%lu) ["), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "appendString:", CFSTR(" VaccinationStatusInTEK"));
    if ((v8 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0)
        goto LABEL_5;
      goto LABEL_35;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v10, "appendString:", CFSTR(" Self-Report-Type"));
  if ((v8 & 4) == 0)
  {
LABEL_5:
    if ((v8 & 8) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v10, "appendString:", CFSTR(" Clinical-Report-Type"));
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v10, "appendString:", CFSTR(" Recursive-Report-Type"));
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    if ((v8 & 0x20) == 0)
      goto LABEL_8;
LABEL_38:
    objc_msgSend(v10, "appendString:", CFSTR(" Proxy-Disabled"));
    if ((v8 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_37:
  objc_msgSend(v10, "appendString:", CFSTR(" Revoked-Report-Type"));
  if ((v8 & 0x20) != 0)
    goto LABEL_38;
LABEL_8:
  if ((v8 & 0x40) != 0)
LABEL_9:
    objc_msgSend(v10, "appendString:", CFSTR(" Manual-Code-Disabled"));
LABEL_10:
  objc_msgSend(v10, "appendString:", CFSTR(" ]"));
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "cStringUsingEncoding:", 4);
  v13 = "?";
  if (v12)
    v13 = (const char *)v12;
  v41 = v13;

LABEL_14:
  if (v6)
    v14 = "yes";
  else
    v14 = "no";
  if (v5)
    v15 = "yes";
  else
    v15 = "no";
  v39 = v15;
  v40 = v14;
  if (v4)
    v16 = "yes";
  else
    v16 = "no";
  if (v3)
    v17 = "yes";
  else
    v17 = "no";
  v37 = v16;
  v38 = v17;
  v36 = -[ENRegionServerConfiguration hasSubdivisions](self, "hasSubdivisions");
  -[ENRegionServerConfiguration subdivisions](self, "subdivisions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerConfiguration applicationBackgroundRuntimeInterval](self, "applicationBackgroundRuntimeInterval");
  v20 = v19;
  -[ENRegionServerConfiguration rpiAdvertisementTolerance](self, "rpiAdvertisementTolerance");
  v22 = v21;
  v23 = -[ENRegionServerConfiguration dailyDetectExposureLimit](self, "dailyDetectExposureLimit");
  -[ENRegionServerConfiguration appBundleID](self, "appBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerConfiguration publicKey](self, "publicKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerConfiguration publicKeyVersion](self, "publicKeyVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerConfiguration callbackInterval](self, "callbackInterval");
  v28 = v27;
  -[ENRegionServerConfiguration legalConsentVersion](self, "legalConsentVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ENRegionServerConfiguration telemetryAuthorization](self, "telemetryAuthorization"))
    v30 = "yes";
  else
    v30 = "no";
  -[ENRegionServerConfiguration timeToResetAvailabilityAlert](self, "timeToResetAvailabilityAlert");
  v32 = v31;
  if (-[ENRegionServerConfiguration resetAvailabilityAlertForDeclinedUsers](self, "resetAvailabilityAlertForDeclinedUsers"))
  {
    v33 = "yes";
  }
  else
  {
    v33 = "no";
  }
  objc_msgSend(v44, "stringWithFormat:", CFSTR("Server - %@, version: %ld enEnabled: %d, domains: %s, textVerify: %s, textPreArm: %s, variantOfConcern: %s, supportedFeatures: %s, hasSubdivisions: %d, subdivisions: %@, runtime: %lf, RPI Adv: %lf, API Rate Limit: %ld, appID: %@, publicKey: %@, publicKeyVersion: %@, callbackInterval: %f, Legal Consent Version: %@, telemetryAuthorization: %s, timeToResetAvailabilityAlert: %f, resetAvailabilityAlertForDeclinedUsers: %s"), v45, v43, v42, v38, v37, v39, v40, v41, v36, v18, v20, v22, v23, v24, v25, v26,
    v28,
    v29,
    v30,
    v32,
    v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)supportsFeatures:(unsigned int)a3
{
  return (a3 & ~-[ENRegionServerConfiguration featureFlags](self, "featureFlags")) == 0;
}

- (ENRegionServerConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *appBundleID;
  NSString *v7;
  NSString *publicKey;
  NSString *v9;
  NSString *publicKeyVersion;
  void *v11;
  void *v12;
  ENRegion *v13;
  ENRegion *region;
  void *v15;
  uint64_t Int64;
  BOOL v17;
  BOOL v18;
  unsigned int Int64Ranged;
  unsigned int v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *subdivisions;
  double v38;
  uint64_t v39;
  BOOL v40;
  BOOL v41;
  int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned __int8 v54;
  int v55;
  uint64_t v56;
  BOOL v57;
  BOOL v58;
  double v59;
  unsigned int v60;
  unsigned int v61;
  char v62;
  char v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  BOOL v72;
  BOOL v73;
  unsigned int v74;
  unsigned int v75;
  NSString *v76;
  NSString *legalConsentVersion;
  NSString *v78;
  NSString *textMessagePublicKey;
  NSString *v80;
  NSString *textMessagePublicKeyVersion;
  double v82;
  double v83;
  unsigned int v84;
  unsigned int v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  ENRegionServerConfiguration *v88;
  void (**v89)(_QWORD, _QWORD);
  uint64_t v90;
  NSString *phaTelemetryPublicCertificateChain;
  uint64_t v92;
  NSString *phaTelemetryAppleCertificateChain;
  uint64_t v94;
  NSString *phaTelemetryEndpoint;
  uint64_t v96;
  NSString *partnerTelemetryPublicCertificateChain;
  uint64_t v98;
  NSString *partnerTelemetryAppleCertificateChain;
  uint64_t v100;
  NSString *partnerTelemetryEndpoint;
  uint64_t v102;
  NSString *appleTelemetryEndpoint;
  uint64_t v104;
  NSString *appleTelemetryEndpointCredentials;
  uint64_t v106;
  NSString *phaTelemetryOptInMessage;
  ENRegionServerConfiguration *v108;
  _QWORD v110[4];
  id v111;
  ENRegionServerConfiguration *v112;
  int v113;
  objc_super v114;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_117;
  v114.receiver = self;
  v114.super_class = (Class)ENRegionServerConfiguration;
  self = -[ENRegionServerConfiguration init](&v114, sel_init);
  if (!self)
    goto LABEL_117;
  v113 = 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleID = self->_appBundleID;
  self->_appBundleID = v5;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  self->_publicKey = v7;

  if (v113
    || (CFStringGetTypeID(),
        CFDictionaryGetTypedValue(),
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        publicKeyVersion = self->_publicKeyVersion,
        self->_publicKeyVersion = v9,
        publicKeyVersion,
        v113))
  {
LABEL_117:
    v108 = 0;
  }
  else
  {
    +[ENRegion regionFromServerResponseDictionary:](ENRegion, "regionFromServerResponseDictionary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (ENRegion *)objc_msgSend(v11, "copy");
      region = self->_region;
      self->_region = v13;

      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v113)
      {
        v108 = 0;
      }
      else
      {
        self->_enVersion = CFDictionaryGetInt64Ranged();
        Int64 = CFDictionaryGetInt64();
        if (v113)
          v17 = 0;
        else
          v17 = Int64 == 0;
        v18 = !v17;
        self->_enEnabled = v18;
        Int64Ranged = CFDictionaryGetInt64Ranged();
        if (v113)
          v20 = 0;
        else
          v20 = Int64Ranged;
        self->_featureFlags = v20;
        v21 = CFDictionaryGetInt64();
        if (v113)
          v22 = 0;
        else
          v22 = v21 == 0;
        v23 = !v22;
        self->_associatedDomainsEnabled = v23;
        v24 = CFDictionaryGetInt64();
        if (v113)
          v25 = 1;
        else
          v25 = v24 == 0;
        v26 = !v25;
        self->_textMessageVerificationEnabled = v26;
        v27 = CFDictionaryGetInt64();
        if (v113)
          v28 = 1;
        else
          v28 = v27 == 0;
        v29 = !v28;
        self->_preArmTestVerificationEnabled = v29;
        v30 = CFDictionaryGetInt64();
        if (v113)
          v31 = 1;
        else
          v31 = v30 == 0;
        v32 = !v31;
        self->_variantOfConcernEnabled = v32;
        v33 = CFDictionaryGetInt64();
        self->_hasSubdivisions = v33 != 0;
        if (v33)
        {
          CFDictionaryGetTypeID();
          CFDictionaryGetTypedValue();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            -[ENRegion countryCode](self->_region, "countryCode");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            NSDictionaryGetNSArrayOfClass();
            v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
            subdivisions = self->_subdivisions;
            self->_subdivisions = v36;

          }
        }
        CFDictionaryGetDouble();
        if (v113)
          v38 = 0.0;
        self->_timeToResetAvailabilityAlert = v38;
        v39 = CFDictionaryGetInt64();
        if (v113)
          v40 = 1;
        else
          v40 = v39 == 0;
        v41 = !v40;
        self->_resetAvailabilityAlertForDeclinedUsers = v41;
        v42 = 3600 * CFDictionaryGetInt64Ranged();
        if (v113)
          v43 = 14400;
        else
          v43 = v42;
        self->_applicationBackgroundRuntimeInterval = (double)v43;
        v44 = 60 * CFDictionaryGetInt64Ranged();
        if (v113)
          v45 = 86400;
        else
          v45 = v44;
        self->_callbackInterval = (double)v45;
        v46 = CFDictionaryGetInt64Ranged();
        if (v113)
          v47 = 15;
        else
          v47 = v46;
        self->_dailyDetectExposureLimit = v47;
        v48 = CFDictionaryGetInt64Ranged();
        if (v113)
          v49 = 1;
        else
          v49 = v48;
        self->_numberOfAdvSamplesForRPIThreshold = v49;
        v50 = 60 * CFDictionaryGetInt64Ranged();
        if (v113)
          v51 = 7200;
        else
          v51 = v50;
        self->_rpiAdvertisementTolerance = (double)v51;
        v52 = 60 * CFDictionaryGetInt64Ranged();
        if (v113)
          v53 = 1200;
        else
          v53 = v52;
        self->_rpiDuplicateAdvertisementTolerance = (double)v53;
        v54 = CFDictionaryGetInt64Ranged();
        if (v113)
          v55 = 300;
        else
          v55 = 60 * v54;
        self->_forceAPWakeIntervalThreshold = (double)v55;
        v56 = CFDictionaryGetInt64();
        if (v113)
          v57 = 0;
        else
          v57 = v56 == 0;
        v58 = !v57;
        self->_dynamicAlgorithmEnabled = v58;
        v59 = (double)CFDictionaryGetInt64Ranged();
        if (v113)
          v59 = 216.0;
        self->_dynamicThrottleDownDuration = v59;
        v60 = CFDictionaryGetInt64Ranged();
        if (v113)
          v61 = 6;
        else
          v61 = v60;
        self->_dynamicThrottleDownAdvDensity = v61;
        v62 = CFDictionaryGetInt64Ranged();
        if (v113)
          v63 = -55;
        else
          v63 = v62;
        self->_dynamicThrottleDownRSSI = v63;
        v64 = 60 * CFDictionaryGetInt64Ranged();
        if (v113)
          v65 = 54000;
        else
          v65 = v64;
        self->_dynamicThrottleUpDuration = (double)v65;
        v66 = CFDictionaryGetInt64Ranged();
        if (v113)
          v67 = 20;
        else
          v67 = v66;
        self->_dynamicThrottleUpAdvDensity = v67;
        v68 = (double)CFDictionaryGetInt64Ranged();
        if (v113)
          v68 = 300.0;
        self->_osTriggeredAppRunInterval = v68;
        v69 = (double)(60 * CFDictionaryGetInt64Ranged());
        if (v113)
          v69 = 10800.0;
        self->_regionTransitionGracePeriod = v69;
        v70 = (double)(60 * CFDictionaryGetInt64Ranged());
        if (v113)
          v70 = 86400.0;
        self->_regionDisabledTransitionGracePeriod = v70;
        v71 = CFDictionaryGetInt64();
        if (v113)
          v72 = 0;
        else
          v72 = v71 == 0;
        v73 = !v72;
        self->_enableV1 = v73;
        v74 = CFDictionaryGetInt64Ranged();
        if (v113)
          v75 = 6;
        else
          v75 = v74;
        self->_detectExposureNKDLimit = v75;
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v76 = (NSString *)objc_claimAutoreleasedReturnValue();
        legalConsentVersion = self->_legalConsentVersion;
        self->_legalConsentVersion = v76;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v78 = (NSString *)objc_claimAutoreleasedReturnValue();
        textMessagePublicKey = self->_textMessagePublicKey;
        self->_textMessagePublicKey = v78;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v80 = (NSString *)objc_claimAutoreleasedReturnValue();
        textMessagePublicKeyVersion = self->_textMessagePublicKeyVersion;
        self->_textMessagePublicKeyVersion = v80;

        self->_isChaffingEnabled = CFDictionaryGetInt64() != 0;
        CFDictionaryGetDouble();
        self->_chaffingSelectionPercentage = v82;
        CFDictionaryGetDouble();
        self->_chaffingSelectionPercentageAlternative = v83;
        v84 = CFDictionaryGetInt64Ranged();
        if (v113)
          v85 = 3;
        else
          v85 = v84;
        self->_maximumChaffsAllowedPerDay = v85;
        v86 = CFDictionaryGetInt64Ranged();
        if (v113)
          v87 = 90;
        else
          v87 = v86;
        self->_selfReportTimeoutDays = v87;
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = __64__ENRegionServerConfiguration_initWithServerResponseDictionary___block_invoke;
        v110[3] = &unk_24C38B190;
        v111 = v15;
        v88 = self;
        v112 = v88;
        v89 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](v110);
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v90 = objc_claimAutoreleasedReturnValue();
        phaTelemetryPublicCertificateChain = v88->_phaTelemetryPublicCertificateChain;
        v88->_phaTelemetryPublicCertificateChain = (NSString *)v90;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v92 = objc_claimAutoreleasedReturnValue();
        phaTelemetryAppleCertificateChain = v88->_phaTelemetryAppleCertificateChain;
        v88->_phaTelemetryAppleCertificateChain = (NSString *)v92;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v94 = objc_claimAutoreleasedReturnValue();
        phaTelemetryEndpoint = v88->_phaTelemetryEndpoint;
        v88->_phaTelemetryEndpoint = (NSString *)v94;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v96 = objc_claimAutoreleasedReturnValue();
        partnerTelemetryPublicCertificateChain = v88->_partnerTelemetryPublicCertificateChain;
        v88->_partnerTelemetryPublicCertificateChain = (NSString *)v96;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v98 = objc_claimAutoreleasedReturnValue();
        partnerTelemetryAppleCertificateChain = v88->_partnerTelemetryAppleCertificateChain;
        v88->_partnerTelemetryAppleCertificateChain = (NSString *)v98;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v100 = objc_claimAutoreleasedReturnValue();
        partnerTelemetryEndpoint = v88->_partnerTelemetryEndpoint;
        v88->_partnerTelemetryEndpoint = (NSString *)v100;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v102 = objc_claimAutoreleasedReturnValue();
        appleTelemetryEndpoint = v88->_appleTelemetryEndpoint;
        v88->_appleTelemetryEndpoint = (NSString *)v102;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v104 = objc_claimAutoreleasedReturnValue();
        appleTelemetryEndpointCredentials = v88->_appleTelemetryEndpointCredentials;
        v88->_appleTelemetryEndpointCredentials = (NSString *)v104;

        v88->_telemetryAuthorization = CFDictionaryGetInt64() != 0;
        ((void (**)(_QWORD, const __CFString *))v89)[2](v89, CFSTR("telemetryOptInMessage"));
        v106 = objc_claimAutoreleasedReturnValue();
        phaTelemetryOptInMessage = v88->_phaTelemetryOptInMessage;
        v88->_phaTelemetryOptInMessage = (NSString *)v106;

        v108 = v88;
      }

    }
    else
    {
      v108 = 0;
    }

  }
  return v108;
}

id __64__ENRegionServerConfiguration_initWithServerResponseDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = a1;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    v7 = CFSTR("_");
    v27 = v3;
    do
    {
      v8 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("agencyMessage")))
        {
          objc_msgSend(v9, "componentsSeparatedByString:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 3)
          {
            v11 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lowercaseString");
            v13 = v7;
            v14 = v6;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uppercaseString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v14;
            v7 = v13;

            v3 = v27;
            v5 = v29;
            objc_msgSend(v28, "addObject:", v18);

          }
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(v25 + 40), "preferredLocalizationsFromArray:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localeIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uppercaseString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_%@"), v26, v21);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)preferredLocalizationsFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredLocalizationsFromArray:forPreferences:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (ENRegionServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  ENRegionServerConfiguration *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSArray *subdivisions;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  NSString *legalConsentVersion;
  uint64_t v27;
  NSString *textMessagePublicKey;
  uint64_t v29;
  NSString *textMessagePublicKeyVersion;
  uint64_t v31;
  NSString *phaTelemetryPublicCertificateChain;
  uint64_t v33;
  NSString *phaTelemetryAppleCertificateChain;
  uint64_t v35;
  NSString *phaTelemetryEndpoint;
  uint64_t v37;
  NSString *phaTelemetryOptInMessage;
  uint64_t v39;
  NSString *partnerTelemetryPublicCertificateChain;
  uint64_t v41;
  NSString *partnerTelemetryAppleCertificateChain;
  uint64_t v43;
  NSString *partnerTelemetryEndpoint;
  uint64_t v45;
  NSString *appleTelemetryEndpoint;
  uint64_t v47;
  NSString *appleTelemetryEndpointCredentials;
  objc_super v50;
  uint64_t v51;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)ENRegionServerConfiguration;
  v5 = -[ENRegionServerConfiguration init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enVersion = objc_msgSend(v6, "unsignedIntegerValue");

    v5->_enEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enEnabled"));
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_featureFlags = v51;
    v5->_associatedDomainsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableAssociatedDomains"));
    v5->_textMessageVerificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableTextMessageVerification"));
    v5->_preArmTestVerificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enablePreArmVerification"));
    v5->_variantOfConcernEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("variantOfConcernEnabled"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStateRegions"));
    v5->_hasSubdivisions = v7;
    if (v7)
    {
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("stateRegionConfigs"));
      v8 = objc_claimAutoreleasedReturnValue();
      subdivisions = v5->_subdivisions;
      v5->_subdivisions = (NSArray *)v8;

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeToResetAvailabilityAlert"));
    v5->_timeToResetAvailabilityAlert = v10;
    v5->_resetAvailabilityAlertForDeclinedUsers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resetAvailabilityAlertForDeclinedUsers"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_appBundleID, v11);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_region, v12);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_publicKey, v13);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_publicKeyVersion, v14);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("callbackInterval"));
    v5->_callbackInterval = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("applicationBackgroundRuntimeIntervalInHours"));
    v5->_applicationBackgroundRuntimeInterval = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rpiAdvertisementToleranceInMinutes"));
    v5->_rpiAdvertisementTolerance = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rpiDuplicateAdvertisementToleranceInMinutes"));
    v5->_rpiDuplicateAdvertisementTolerance = v18;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_dailyDetectExposureLimit = v51;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_detectExposureNKDLimit = v51;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_numberOfAdvSamplesForRPIThreshold = v51;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("forceAPWakeIntervalInMinutesThreshold"));
    v5->_forceAPWakeIntervalThreshold = v19;
    v5->_dynamicAlgorithmEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dynamicAlgorithmEnabled"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dynamicThrottleDownDurationInSeconds"));
    v5->_dynamicThrottleDownDuration = v20;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_dynamicThrottleDownAdvDensity = v51;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_dynamicThrottleDownRSSI = v51;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dynamicThrottleUpDurationInMinutes"));
    v5->_dynamicThrottleUpDuration = v21;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_dynamicThrottleUpAdvDensity = v51;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("osTriggeredAppRunTimeInSeconds"));
    v5->_osTriggeredAppRunInterval = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionTransitionGracePeriodInMinutes"));
    v5->_regionTransitionGracePeriod = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionDisabledTransitionGracePeriodMinutes"));
    v5->_regionDisabledTransitionGracePeriod = v24;
    v51 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_selfReportTimeoutDays = v51;
    v5->_enableV1 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("V1Enable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legalConsentVersion"));
    v25 = objc_claimAutoreleasedReturnValue();
    legalConsentVersion = v5->_legalConsentVersion;
    v5->_legalConsentVersion = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textMessageVerificationPublicKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    textMessagePublicKey = v5->_textMessagePublicKey;
    v5->_textMessagePublicKey = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textMessageVerificationPublicKeyVersion"));
    v29 = objc_claimAutoreleasedReturnValue();
    textMessagePublicKeyVersion = v5->_textMessagePublicKeyVersion;
    v5->_textMessagePublicKeyVersion = (NSString *)v29;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("publicHealthAuthorityTelemetryPublicCertificateChain")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicHealthAuthorityTelemetryPublicCertificateChain"));
      v31 = objc_claimAutoreleasedReturnValue();
      phaTelemetryPublicCertificateChain = v5->_phaTelemetryPublicCertificateChain;
      v5->_phaTelemetryPublicCertificateChain = (NSString *)v31;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("publicHealthAuthorityTelemetryAppleCertificateChain")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicHealthAuthorityTelemetryAppleCertificateChain"));
      v33 = objc_claimAutoreleasedReturnValue();
      phaTelemetryAppleCertificateChain = v5->_phaTelemetryAppleCertificateChain;
      v5->_phaTelemetryAppleCertificateChain = (NSString *)v33;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("publicHealthAuthorityTelemetryEndpoint")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicHealthAuthorityTelemetryEndpoint"));
      v35 = objc_claimAutoreleasedReturnValue();
      phaTelemetryEndpoint = v5->_phaTelemetryEndpoint;
      v5->_phaTelemetryEndpoint = (NSString *)v35;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("telemetryOptInMessage")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("telemetryOptInMessage"));
      v37 = objc_claimAutoreleasedReturnValue();
      phaTelemetryOptInMessage = v5->_phaTelemetryOptInMessage;
      v5->_phaTelemetryOptInMessage = (NSString *)v37;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("partnerTelemetryPublicCertificateChain")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerTelemetryPublicCertificateChain"));
      v39 = objc_claimAutoreleasedReturnValue();
      partnerTelemetryPublicCertificateChain = v5->_partnerTelemetryPublicCertificateChain;
      v5->_partnerTelemetryPublicCertificateChain = (NSString *)v39;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("partnerTelemetryAppleCertificateChain")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerTelemetryAppleCertificateChain"));
      v41 = objc_claimAutoreleasedReturnValue();
      partnerTelemetryAppleCertificateChain = v5->_partnerTelemetryAppleCertificateChain;
      v5->_partnerTelemetryAppleCertificateChain = (NSString *)v41;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("partnerTelemetryEndpoint")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerTelemetryEndpoint"));
      v43 = objc_claimAutoreleasedReturnValue();
      partnerTelemetryEndpoint = v5->_partnerTelemetryEndpoint;
      v5->_partnerTelemetryEndpoint = (NSString *)v43;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appleTelemetryEndpoint")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleTelemetryEndpoint"));
      v45 = objc_claimAutoreleasedReturnValue();
      appleTelemetryEndpoint = v5->_appleTelemetryEndpoint;
      v5->_appleTelemetryEndpoint = (NSString *)v45;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appleTelemetryEndpointCredentials")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleTelemetryEndpointCredentials"));
      v47 = objc_claimAutoreleasedReturnValue();
      appleTelemetryEndpointCredentials = v5->_appleTelemetryEndpointCredentials;
      v5->_appleTelemetryEndpointCredentials = (NSString *)v47;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("telemetryAuthorization")))
      v5->_telemetryAuthorization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("telemetryAuthorization"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t featureFlags;
  uint64_t dailyDetectExposureLimit;
  uint64_t detectExposureNKDLimit;
  uint64_t numberOfAdvSamplesForRPIThreshold;
  void *v9;
  uint64_t dynamicThrottleDownAdvDensity;
  uint64_t dynamicThrottleUpAdvDensity;
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
  id v30;

  v30 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_enVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "encodeObject:forKey:", v4, CFSTR("enVersion"));

  objc_msgSend(v30, "encodeBool:forKey:", self->_enEnabled, CFSTR("enEnabled"));
  featureFlags = self->_featureFlags;
  if ((_DWORD)featureFlags)
    objc_msgSend(v30, "encodeInt64:forKey:", featureFlags, CFSTR("flags"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_associatedDomainsEnabled, CFSTR("enableAssociatedDomains"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_textMessageVerificationEnabled, CFSTR("enableTextMessageVerification"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_preArmTestVerificationEnabled, CFSTR("enablePreArmVerification"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_variantOfConcernEnabled, CFSTR("variantOfConcernEnabled"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_hasSubdivisions, CFSTR("hasStateRegions"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_subdivisions, CFSTR("stateRegionConfigs"));
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("timeToResetAvailabilityAlert"), self->_timeToResetAvailabilityAlert);
  objc_msgSend(v30, "encodeBool:forKey:", self->_resetAvailabilityAlertForDeclinedUsers, CFSTR("resetAvailabilityAlertForDeclinedUsers"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_appBundleID, CFSTR("appBundleId"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_publicKey, CFSTR("publicKey"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_publicKeyVersion, CFSTR("publicKeyVersion"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_textMessagePublicKey, CFSTR("textMessageVerificationPublicKey"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_textMessagePublicKeyVersion, CFSTR("textMessageVerificationPublicKeyVersion"));
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("callbackInterval"), self->_callbackInterval);
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("applicationBackgroundRuntimeIntervalInHours"), self->_applicationBackgroundRuntimeInterval);
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("rpiAdvertisementToleranceInMinutes"), self->_rpiAdvertisementTolerance);
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("rpiDuplicateAdvertisementToleranceInMinutes"), self->_rpiDuplicateAdvertisementTolerance);
  dailyDetectExposureLimit = self->_dailyDetectExposureLimit;
  if ((_DWORD)dailyDetectExposureLimit)
    objc_msgSend(v30, "encodeInt64:forKey:", dailyDetectExposureLimit, CFSTR("detectExposureDailyLimit"));
  detectExposureNKDLimit = self->_detectExposureNKDLimit;
  if ((_DWORD)detectExposureNKDLimit)
    objc_msgSend(v30, "encodeInt64:forKey:", detectExposureNKDLimit, CFSTR("detectExposureNKDLimit"));
  numberOfAdvSamplesForRPIThreshold = self->_numberOfAdvSamplesForRPIThreshold;
  v9 = v30;
  if ((_DWORD)numberOfAdvSamplesForRPIThreshold)
  {
    objc_msgSend(v30, "encodeInt64:forKey:", numberOfAdvSamplesForRPIThreshold, CFSTR("numberOfAdvSamplesForRPIThreshold"));
    v9 = v30;
  }
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("forceAPWakeIntervalInMinutesThreshold"), self->_forceAPWakeIntervalThreshold);
  objc_msgSend(v30, "encodeBool:forKey:", self->_dynamicAlgorithmEnabled, CFSTR("dynamicAlgorithmEnabled"));
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("dynamicThrottleDownDurationInSeconds"), self->_dynamicThrottleDownDuration);
  dynamicThrottleDownAdvDensity = self->_dynamicThrottleDownAdvDensity;
  if ((_DWORD)dynamicThrottleDownAdvDensity)
    objc_msgSend(v30, "encodeInt64:forKey:", dynamicThrottleDownAdvDensity, CFSTR("dynamicThrottleDownAdvDensity"));
  if (self->_dynamicThrottleDownRSSI)
    objc_msgSend(v30, "encodeInteger:forKey:");
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("dynamicThrottleUpDurationInMinutes"), self->_dynamicThrottleUpDuration);
  dynamicThrottleUpAdvDensity = self->_dynamicThrottleUpAdvDensity;
  if ((_DWORD)dynamicThrottleUpAdvDensity)
    objc_msgSend(v30, "encodeInt64:forKey:", dynamicThrottleUpAdvDensity, CFSTR("dynamicThrottleUpAdvDensity"));
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("osTriggeredAppRunTimeInSeconds"), self->_osTriggeredAppRunInterval);
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("regionTransitionGracePeriodInMinutes"), self->_regionTransitionGracePeriod);
  objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("regionDisabledTransitionGracePeriodMinutes"), self->_regionDisabledTransitionGracePeriod);
  if (self->_selfReportTimeoutDays)
    objc_msgSend(v30, "encodeInteger:forKey:");
  objc_msgSend(v30, "encodeBool:forKey:", self->_enableV1, CFSTR("V1Enable"));
  objc_msgSend(v30, "encodeObject:forKey:", self->_legalConsentVersion, CFSTR("legalConsentVersion"));
  -[ENRegionServerConfiguration phaTelemetryPublicCertificateChain](self, "phaTelemetryPublicCertificateChain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ENRegionServerConfiguration phaTelemetryPublicCertificateChain](self, "phaTelemetryPublicCertificateChain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v13, CFSTR("publicHealthAuthorityTelemetryPublicCertificateChain"));

  }
  -[ENRegionServerConfiguration phaTelemetryAppleCertificateChain](self, "phaTelemetryAppleCertificateChain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ENRegionServerConfiguration phaTelemetryAppleCertificateChain](self, "phaTelemetryAppleCertificateChain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v15, CFSTR("publicHealthAuthorityTelemetryAppleCertificateChain"));

  }
  -[ENRegionServerConfiguration phaTelemetryEndpoint](self, "phaTelemetryEndpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ENRegionServerConfiguration phaTelemetryEndpoint](self, "phaTelemetryEndpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v17, CFSTR("publicHealthAuthorityTelemetryEndpoint"));

  }
  -[ENRegionServerConfiguration phaTelemetryOptInMessage](self, "phaTelemetryOptInMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ENRegionServerConfiguration phaTelemetryOptInMessage](self, "phaTelemetryOptInMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v19, CFSTR("telemetryOptInMessage"));

  }
  -[ENRegionServerConfiguration partnerTelemetryPublicCertificateChain](self, "partnerTelemetryPublicCertificateChain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ENRegionServerConfiguration partnerTelemetryPublicCertificateChain](self, "partnerTelemetryPublicCertificateChain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v21, CFSTR("partnerTelemetryPublicCertificateChain"));

  }
  -[ENRegionServerConfiguration partnerTelemetryAppleCertificateChain](self, "partnerTelemetryAppleCertificateChain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ENRegionServerConfiguration partnerTelemetryAppleCertificateChain](self, "partnerTelemetryAppleCertificateChain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v23, CFSTR("partnerTelemetryAppleCertificateChain"));

  }
  -[ENRegionServerConfiguration partnerTelemetryEndpoint](self, "partnerTelemetryEndpoint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ENRegionServerConfiguration partnerTelemetryEndpoint](self, "partnerTelemetryEndpoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v25, CFSTR("partnerTelemetryEndpoint"));

  }
  -[ENRegionServerConfiguration appleTelemetryEndpoint](self, "appleTelemetryEndpoint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ENRegionServerConfiguration appleTelemetryEndpoint](self, "appleTelemetryEndpoint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v27, CFSTR("appleTelemetryEndpoint"));

  }
  -[ENRegionServerConfiguration appleTelemetryEndpointCredentials](self, "appleTelemetryEndpointCredentials");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[ENRegionServerConfiguration appleTelemetryEndpointCredentials](self, "appleTelemetryEndpointCredentials");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v29, CFSTR("appleTelemetryEndpointCredentials"));

  }
  objc_msgSend(v30, "encodeBool:forKey:", -[ENRegionServerConfiguration telemetryAuthorization](self, "telemetryAuthorization"), CFSTR("telemetryAuthorization"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)enVersion
{
  return self->_enVersion;
}

- (BOOL)enEnabled
{
  return self->_enEnabled;
}

- (BOOL)associatedDomainsEnabled
{
  return self->_associatedDomainsEnabled;
}

- (BOOL)textMessageVerificationEnabled
{
  return self->_textMessageVerificationEnabled;
}

- (BOOL)preArmTestVerificationEnabled
{
  return self->_preArmTestVerificationEnabled;
}

- (BOOL)variantOfConcernEnabled
{
  return self->_variantOfConcernEnabled;
}

- (unsigned)featureFlags
{
  return self->_featureFlags;
}

- (ENRegion)region
{
  return self->_region;
}

- (BOOL)hasSubdivisions
{
  return self->_hasSubdivisions;
}

- (NSArray)subdivisions
{
  return self->_subdivisions;
}

- (double)timeToResetAvailabilityAlert
{
  return self->_timeToResetAvailabilityAlert;
}

- (BOOL)resetAvailabilityAlertForDeclinedUsers
{
  return self->_resetAvailabilityAlertForDeclinedUsers;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (NSString)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (double)applicationBackgroundRuntimeInterval
{
  return self->_applicationBackgroundRuntimeInterval;
}

- (double)rpiAdvertisementTolerance
{
  return self->_rpiAdvertisementTolerance;
}

- (double)rpiDuplicateAdvertisementTolerance
{
  return self->_rpiDuplicateAdvertisementTolerance;
}

- (double)callbackInterval
{
  return self->_callbackInterval;
}

- (unsigned)dailyDetectExposureLimit
{
  return self->_dailyDetectExposureLimit;
}

- (unsigned)detectExposureNKDLimit
{
  return self->_detectExposureNKDLimit;
}

- (unsigned)numberOfAdvSamplesForRPIThreshold
{
  return self->_numberOfAdvSamplesForRPIThreshold;
}

- (double)forceAPWakeIntervalThreshold
{
  return self->_forceAPWakeIntervalThreshold;
}

- (BOOL)dynamicAlgorithmEnabled
{
  return self->_dynamicAlgorithmEnabled;
}

- (double)dynamicThrottleDownDuration
{
  return self->_dynamicThrottleDownDuration;
}

- (unsigned)dynamicThrottleDownAdvDensity
{
  return self->_dynamicThrottleDownAdvDensity;
}

- (char)dynamicThrottleDownRSSI
{
  return self->_dynamicThrottleDownRSSI;
}

- (double)dynamicThrottleUpDuration
{
  return self->_dynamicThrottleUpDuration;
}

- (unsigned)dynamicThrottleUpAdvDensity
{
  return self->_dynamicThrottleUpAdvDensity;
}

- (double)osTriggeredAppRunInterval
{
  return self->_osTriggeredAppRunInterval;
}

- (double)regionTransitionGracePeriod
{
  return self->_regionTransitionGracePeriod;
}

- (double)regionDisabledTransitionGracePeriod
{
  return self->_regionDisabledTransitionGracePeriod;
}

- (BOOL)enableV1
{
  return self->_enableV1;
}

- (NSString)legalConsentVersion
{
  return self->_legalConsentVersion;
}

- (void)setLegalConsentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)isChaffingEnabled
{
  return self->_isChaffingEnabled;
}

- (double)chaffingSelectionPercentage
{
  return self->_chaffingSelectionPercentage;
}

- (double)chaffingSelectionPercentageAlternative
{
  return self->_chaffingSelectionPercentageAlternative;
}

- (unsigned)maximumChaffsAllowedPerDay
{
  return self->_maximumChaffsAllowedPerDay;
}

- (NSString)textMessagePublicKey
{
  return self->_textMessagePublicKey;
}

- (NSString)textMessagePublicKeyVersion
{
  return self->_textMessagePublicKeyVersion;
}

- (unsigned)selfReportTimeoutDays
{
  return self->_selfReportTimeoutDays;
}

- (NSString)phaTelemetryPublicCertificateChain
{
  return self->_phaTelemetryPublicCertificateChain;
}

- (void)setPhaTelemetryPublicCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)phaTelemetryAppleCertificateChain
{
  return self->_phaTelemetryAppleCertificateChain;
}

- (void)setPhaTelemetryAppleCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)phaTelemetryEndpoint
{
  return self->_phaTelemetryEndpoint;
}

- (void)setPhaTelemetryEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)phaTelemetryOptInMessage
{
  return self->_phaTelemetryOptInMessage;
}

- (void)setPhaTelemetryOptInMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)partnerTelemetryPublicCertificateChain
{
  return self->_partnerTelemetryPublicCertificateChain;
}

- (void)setPartnerTelemetryPublicCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)partnerTelemetryAppleCertificateChain
{
  return self->_partnerTelemetryAppleCertificateChain;
}

- (void)setPartnerTelemetryAppleCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)partnerTelemetryEndpoint
{
  return self->_partnerTelemetryEndpoint;
}

- (void)setPartnerTelemetryEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)appleTelemetryEndpoint
{
  return self->_appleTelemetryEndpoint;
}

- (void)setAppleTelemetryEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)appleTelemetryEndpointCredentials
{
  return self->_appleTelemetryEndpointCredentials;
}

- (void)setAppleTelemetryEndpointCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)telemetryAuthorization
{
  return self->_telemetryAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTelemetryEndpointCredentials, 0);
  objc_storeStrong((id *)&self->_appleTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryAppleCertificateChain, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryPublicCertificateChain, 0);
  objc_storeStrong((id *)&self->_phaTelemetryOptInMessage, 0);
  objc_storeStrong((id *)&self->_phaTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_phaTelemetryAppleCertificateChain, 0);
  objc_storeStrong((id *)&self->_phaTelemetryPublicCertificateChain, 0);
  objc_storeStrong((id *)&self->_textMessagePublicKeyVersion, 0);
  objc_storeStrong((id *)&self->_textMessagePublicKey, 0);
  objc_storeStrong((id *)&self->_legalConsentVersion, 0);
  objc_storeStrong((id *)&self->_publicKeyVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_subdivisions, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
