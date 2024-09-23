@implementation MCVPNPayloadBase

+ (id)NEVPNPayloadBaseDelegateWithConfigurationDict:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  MCNEProfileIngestionClass();
  v4 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("NEProfilePayloadBaseVPN"))), "initWithPayload:", v3);

  return v4;
}

+ (id)NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  MCNEProfileIngestionClass();
  v4 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("NEProfilePayloadAOVPN"))), "initWithPayload:", v3);

  return v4;
}

- (MCVPNPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCVPNPayloadBase *v10;
  uint64_t v11;
  NSString *serviceName;
  uint64_t v13;
  id vpnType;
  uint64_t v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *configurationDictionary;
  NSString *displayName;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  uint64_t v37;
  NEProfilePayloadBaseDelegate *nePayloadBase;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSString *v54;
  NSString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  NSString *CellularSliceUUID;
  NSString *v67;
  uint64_t v68;
  NEProfilePayloadBaseDelegate *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  objc_super v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  _QWORD v93[13];
  _QWORD v94[13];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD v97[8];

  v97[6] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v88.receiver = self;
  v88.super_class = (Class)MCVPNPayloadBase;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v88, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if (objc_msgSend(v9, "isStub"))
    {
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ServiceName"), 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      serviceName = v10->_serviceName;
      v10->_serviceName = (NSString *)v11;

      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("VPNType"), 0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      vpnType = v10->_vpnType;
      v10->_vpnType = (NSString *)v13;
LABEL_10:

      goto LABEL_11;
    }
    v87 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("VPNType"), 1, &v87);
    v15 = objc_claimAutoreleasedReturnValue();
    vpnType = v87;
    v16 = v10->_vpnType;
    v10->_vpnType = (NSString *)v15;

    if (vpnType)
      goto LABEL_5;
    v97[0] = CFSTR("VPN");
    v97[1] = CFSTR("L2TP");
    v97[2] = CFSTR("PPTP");
    v97[3] = CFSTR("IPSec");
    v97[4] = CFSTR("IKEv2");
    v97[5] = CFSTR("AlwaysOn");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsObject:", v10->_vpnType);

    if ((v26 & 1) == 0)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("VPNType"));
      vpnType = (id)objc_claimAutoreleasedReturnValue();
      if (!vpnType)
        goto LABEL_11;
      goto LABEL_5;
    }
    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    configurationDictionary = v10->_configurationDictionary;
    v10->_configurationDictionary = v27;

    displayName = v10->super._displayName;
    if (displayName)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", displayName, CFSTR("PayloadDisplayName"));
    v30 = v10->_configurationDictionary;
    v95[0] = CFSTR("Enabled");
    v96[0] = objc_opt_class();
    v95[1] = CFSTR("VPNApplicationBundleID");
    v96[1] = objc_opt_class();
    v95[2] = CFSTR("VPNApplicationID");
    v96[2] = objc_opt_class();
    v95[3] = CFSTR("AppRules");
    v96[3] = objc_opt_class();
    v95[4] = CFSTR("PayloadCertificateHash");
    v96[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(v8, "MCMutableDictionaryContainingValidatedKeysAndClasses:removeKeys:outError:", v31, 1, &v86);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    vpnType = v86;
    -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v32);

    if (vpnType)
      goto LABEL_5;
    if (-[NSString isEqualToString:](v10->_vpnType, "isEqualToString:", CFSTR("AlwaysOn")))
    {
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserDefinedName"), 0, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v10->_serviceName;
      v10->_serviceName = (NSString *)v33;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v10->_vpnType, CFSTR("VPNType"));
      v35 = v10->_serviceName;
      if (v35)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v35, CFSTR("UserDefinedName"));
      v85 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AlwaysOn"), 1, &v85);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      vpnType = v85;
      if (!vpnType)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v36, CFSTR("AlwaysOn"));
        +[MCVPNPayloadBase NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:", v10->_configurationDictionary);
        v37 = objc_claimAutoreleasedReturnValue();
        nePayloadBase = v10->_nePayloadBase;
        v10->_nePayloadBase = (NEProfilePayloadBaseDelegate *)v37;

        -[NEProfilePayloadBaseDelegate validatePayload](v10->_nePayloadBase, "validatePayload");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v47 = (void *)v39;
          v48 = (void *)MEMORY[0x1E0CB35C8];
          MCErrorArray(CFSTR("ERROR_VPN_COULD_NOT_PARSE"), v40, v41, v42, v43, v44, v45, v46, 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCVPNErrorDomain"), 15005, v49, v47, CFSTR("MCFatalError"));
          vpnType = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          vpnType = 0;
        }
      }
      goto LABEL_46;
    }
    v50 = v10->_configurationDictionary;
    v93[0] = CFSTR("VendorConfig");
    v94[0] = objc_opt_class();
    v93[1] = CFSTR("OverridePrimary");
    v94[1] = objc_opt_class();
    v93[2] = CFSTR("OnDemandEnabled");
    v94[2] = objc_opt_class();
    v93[3] = CFSTR("OnDemandMatchDomainsAlways");
    v94[3] = objc_opt_class();
    v93[4] = CFSTR("OnDemandMatchDomainsNever");
    v94[4] = objc_opt_class();
    v93[5] = CFSTR("OnDemandMatchDomainsOnRetry");
    v94[5] = objc_opt_class();
    v93[6] = CFSTR("OnDemandRules");
    v94[6] = objc_opt_class();
    v93[7] = CFSTR("IPv4");
    v94[7] = objc_opt_class();
    v93[8] = CFSTR("PPP");
    v94[8] = objc_opt_class();
    v93[9] = CFSTR("IPSec");
    v94[9] = objc_opt_class();
    v93[10] = CFSTR("IKEv2");
    v94[10] = objc_opt_class();
    v93[11] = CFSTR("Proxies");
    v94[11] = objc_opt_class();
    v93[12] = CFSTR("DNS");
    v94[12] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 13);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    objc_msgSend(v8, "MCMutableDictionaryContainingValidatedKeysAndClasses:removeKeys:outError:", v51, 1, &v84);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    vpnType = v84;
    -[NSMutableDictionary addEntriesFromDictionary:](v50, "addEntriesFromDictionary:", v52);

    if (vpnType)
      goto LABEL_5;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v10->_vpnType, CFSTR("VPNType"));
    v83 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserDefinedName"), 0, &v83);
    v53 = objc_claimAutoreleasedReturnValue();
    vpnType = v83;
    v54 = v10->_serviceName;
    v10->_serviceName = (NSString *)v53;

    if (vpnType)
    {
LABEL_5:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", vpnType);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = (void *)objc_opt_class();
        v22 = v21;
        objc_msgSend(v18, "MCVerboseDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v90 = v21;
        v91 = 2114;
        v92 = v23;
        _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_10;
    }
    v55 = v10->_serviceName;
    if (v55)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v55, CFSTR("UserDefinedName"));
    v82 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPN"), 0, &v82);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    vpnType = v82;
    v36 = (void *)objc_msgSend(v56, "mutableCopy");

    if (vpnType)
    {
LABEL_46:

      if (!vpnType)
        goto LABEL_11;
      goto LABEL_5;
    }
    if (v36)
    {
      v57 = (void *)objc_msgSend(v36, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v57, CFSTR("VPN"));

    }
    if (-[NSString isEqualToString:](v10->_vpnType, "isEqualToString:", CFSTR("VPN"))
      || -[NSString isEqualToString:](v10->_vpnType, "isEqualToString:", CFSTR("IKEv2")))
    {
      v58 = -[NSString isEqualToString:](v10->_vpnType, "isEqualToString:", CFSTR("VPN"));
      v81 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("VPNSubType"), v58, &v81);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v81;
      if (v60)
      {
        vpnType = v60;
LABEL_45:

        goto LABEL_46;
      }
      if (v59)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v59, CFSTR("VPNSubType"));
      -[MCPayload type](v10, "type");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCAppLayerVPNPayload typeStrings](MCAppLayerVPNPayload, "typeStrings");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "firstObject");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v61, "isEqualToString:", v63);

      if (v64)
      {
        v80 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CellularSliceUUID"), 0, &v80);
        v65 = objc_claimAutoreleasedReturnValue();
        vpnType = v80;
        CellularSliceUUID = v10->_CellularSliceUUID;
        v10->_CellularSliceUUID = (NSString *)v65;

        if (vpnType)
          goto LABEL_45;
        v67 = v10->_CellularSliceUUID;
        if (v67)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_configurationDictionary, "setObject:forKeyedSubscript:", v67, CFSTR("CellularSliceUUID"));
      }

    }
    +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v10->_configurationDictionary);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = v10->_nePayloadBase;
    v10->_nePayloadBase = (NEProfilePayloadBaseDelegate *)v68;

    -[NEProfilePayloadBaseDelegate validatePayload](v10->_nePayloadBase, "validatePayload");
    vpnType = (id)objc_claimAutoreleasedReturnValue();
    if (!vpnType)
      goto LABEL_46;
    v77 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_VPN_COULD_NOT_PARSE"), v70, v71, v72, v73, v74, v75, v76, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCVPNErrorDomain"), 15005, v59, vpnType, CFSTR("MCFatalError"));
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = vpnType;
    vpnType = (id)v78;

    goto LABEL_45;
  }
LABEL_11:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCVPNPayloadBase;
  -[MCPayload stubDictionary](&v9, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCVPNPayloadBase serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCVPNPayloadBase serviceName](self, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ServiceName"));

  }
  -[MCVPNPayloadBase vpnType](self, "vpnType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCVPNPayloadBase vpnType](self, "vpnType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("VPNType"));

  }
  return v3;
}

- (id)verboseDescription
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
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v13.receiver = self;
  v13.super_class = (Class)MCVPNPayloadBase;
  -[MCPayload verboseDescription](&v13, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCVPNPayloadBase serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCVPNPayloadBase serviceName](self, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Service name: %@\n"), v7);

  }
  -[MCVPNPayloadBase vpnType](self, "vpnType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCVPNPayloadBase vpnType](self, "vpnType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("VPN Type: %@\n"), v9);

  }
  -[MCPayload persistentResourceID](self, "persistentResourceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCPayload persistentResourceID](self, "persistentResourceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  ConfigID : %@\n"), v11);

  }
  return v5;
}

- (id)installationWarnings
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_VPN"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCVPNPayloadBase vpnType](self, "vpnType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PPTP"));

  if (v5)
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_PPTP_VPN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v3, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }
  MCLocalizedString(CFSTR("INSTALL_WARNING_VPN_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v8, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  MCKeyValue *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCVPNPayloadBase serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [MCKeyValue alloc];
    -[MCVPNPayloadBase serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("KEY_VPN_NAME"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", v6, v7);

    objc_msgSend(v3, "addObject:", v8);
  }
  -[MCVPNPayloadBase vpnType](self, "vpnType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [MCKeyValue alloc];
    -[MCVPNPayloadBase vpnType](self, "vpnType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("KEY_VPN_TYPE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v10, "initWithLocalizedString:localizedKey:", v11, v12);

    objc_msgSend(v3, "addObject:", v13);
  }
  if (objc_msgSend(v3, "count")
    && (+[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3),
        (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v14;
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSMutableDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void)setConfigurationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_configurationDictionary, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)vpnType
{
  return self->_vpnType;
}

- (void)setVpnType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NEProfilePayloadBaseDelegate)nePayloadBase
{
  return self->_nePayloadBase;
}

- (void)setNePayloadBase:(id)a3
{
  objc_storeStrong((id *)&self->_nePayloadBase, a3);
}

- (NSString)userNameKey
{
  return self->_userNameKey;
}

- (void)setUserNameKey:(id)a3
{
  objc_storeStrong((id *)&self->_userNameKey, a3);
}

- (NSString)passwordKey
{
  return self->_passwordKey;
}

- (void)setPasswordKey:(id)a3
{
  objc_storeStrong((id *)&self->_passwordKey, a3);
}

- (NSString)proxyUserNameKey
{
  return self->_proxyUserNameKey;
}

- (void)setProxyUserNameKey:(id)a3
{
  objc_storeStrong((id *)&self->_proxyUserNameKey, a3);
}

- (NSString)proxyPasswordKey
{
  return self->_proxyPasswordKey;
}

- (void)setProxyPasswordKey:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPasswordKey, a3);
}

- (NSString)sharedSecretKey
{
  return self->_sharedSecretKey;
}

- (void)setSharedSecretKey:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSecretKey, a3);
}

- (NSString)pinKey
{
  return self->_pinKey;
}

- (void)setPinKey:(id)a3
{
  objc_storeStrong((id *)&self->_pinKey, a3);
}

- (NSString)CellularSliceUUID
{
  return self->_CellularSliceUUID;
}

- (void)setCellularSliceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_CellularSliceUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_pinKey, 0);
  objc_storeStrong((id *)&self->_sharedSecretKey, 0);
  objc_storeStrong((id *)&self->_proxyPasswordKey, 0);
  objc_storeStrong((id *)&self->_proxyUserNameKey, 0);
  objc_storeStrong((id *)&self->_passwordKey, 0);
  objc_storeStrong((id *)&self->_userNameKey, 0);
  objc_storeStrong((id *)&self->_nePayloadBase, 0);
  objc_storeStrong((id *)&self->_vpnType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

@end
