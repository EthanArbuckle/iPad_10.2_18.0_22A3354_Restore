@implementation NRDeviceOperationalProperties

- (NRDeviceOperationalProperties)init
{
  NRDeviceOperationalProperties *v2;
  NRDeviceOperationalProperties *v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NRDeviceOperationalProperties;
  v2 = -[NRDeviceOperationalProperties init](&v16, sel_init);
  if (!v2)
  {
    v5 = nrCopyLogObj_896();
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v14 = _os_log_pack_fill();
        *(_DWORD *)v14 = 136446210;
        *(_QWORD *)(v14 + 4) = "-[NRDeviceOperationalProperties init]";
        v15 = nrCopyLogObj_896();
        _NRLogAbortWithPack(v15);
      }
    }
    v8 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)");

    goto LABEL_8;
  }
  v3 = v2;
  -[NRDeviceOperationalProperties setVersion:](v2, "setVersion:", 1);
  -[NRDeviceOperationalProperties setAllowedLinkTypes:](v3, "setAllowedLinkTypes:", &unk_1EA4011B8);
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](v3, "setBluetoothEndpointType:", 3);
  -[NRDeviceOperationalProperties setIsReachableOverWiFi:](v3, "setIsReachableOverWiFi:", 1);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NRDeviceOperationalProperties version](self, "version");
      if (v6 != objc_msgSend(v5, "version"))
        goto LABEL_33;
      v7 = -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability");
      if (v7 != objc_msgSend(v5, "proxyCapability"))
        goto LABEL_33;
      v8 = -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole");
      if (v8 != objc_msgSend(v5, "bluetoothRole"))
        goto LABEL_33;
      v9 = -[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations");
      if (v9 != objc_msgSend(v5, "handlesLinkRecommendations"))
        goto LABEL_33;
      v10 = -[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability");
      if (v10 != objc_msgSend(v5, "requiresReachability"))
        goto LABEL_33;
      v11 = -[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi");
      if (v11 != objc_msgSend(v5, "proxyProviderRequiresWiFi"))
        goto LABEL_33;
      v12 = -[NRDeviceOperationalProperties usesTLS](self, "usesTLS");
      if (v12 != objc_msgSend(v5, "usesTLS"))
        goto LABEL_33;
      v13 = -[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport");
      if (v13 != objc_msgSend(v5, "providesPhoneCallRelaySupport"))
        goto LABEL_33;
      v14 = -[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly");
      if (v14 != objc_msgSend(v5, "allowsPermittedClientsOnly"))
        goto LABEL_33;
      v15 = -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType");
      if (v15 != objc_msgSend(v5, "bluetoothEndpointType"))
        goto LABEL_33;
      v16 = -[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud");
      if (v16 != objc_msgSend(v5, "allowsDirectToCloud"))
        goto LABEL_33;
      v17 = -[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery");
      if (v17 != objc_msgSend(v5, "allowsDeviceDiscovery"))
        goto LABEL_33;
      v18 = -[NRDeviceOperationalProperties allowedPeerDeviceType](self, "allowedPeerDeviceType");
      if (v18 != objc_msgSend(v5, "allowedPeerDeviceType"))
        goto LABEL_33;
      v19 = -[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection");
      if (v19 != objc_msgSend(v5, "allowsDeadPeerDetection"))
        goto LABEL_33;
      v20 = -[NRDeviceOperationalProperties isReachableOverWiFi](self, "isReachableOverWiFi");
      if (v20 != objc_msgSend(v5, "isReachableOverWiFi"))
        goto LABEL_33;
      v21 = -[NRDeviceOperationalProperties operationalScope](self, "operationalScope");
      if (v21 != objc_msgSend(v5, "operationalScope"))
        goto LABEL_33;
      -[NRDeviceOperationalProperties allowedLinkTypes](self, "allowedLinkTypes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

      }
      else
      {
        objc_msgSend(v5, "allowedLinkTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          goto LABEL_24;
      }
      -[NRDeviceOperationalProperties allowedLinkTypes](self, "allowedLinkTypes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allowedLinkTypes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_33;
LABEL_24:
      -[NRDeviceOperationalProperties allowedLinkSubtypes](self, "allowedLinkSubtypes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

      }
      else
      {
        objc_msgSend(v5, "allowedLinkSubtypes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
LABEL_28:
          -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {

          }
          else
          {
            objc_msgSend(v5, "proxyProviderCriteria");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
LABEL_32:
              v23 = 1;
LABEL_34:

              goto LABEL_35;
            }
          }
          -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "proxyProviderCriteria");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqual:", v36);

          if (v37)
            goto LABEL_32;
LABEL_33:
          v23 = 0;
          goto LABEL_34;
        }
      }
      -[NRDeviceOperationalProperties allowedLinkSubtypes](self, "allowedLinkSubtypes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allowedLinkSubtypes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_33;
      goto LABEL_28;
    }
  }
  v23 = 0;
LABEL_35:

  return v23;
}

- (void)mergeProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v4 = a3;
  v25 = v4;
  if (!v4)
  {
    v16 = nrCopyLogObj_896();
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v18 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

      if (!v18)
        goto LABEL_7;
    }
    v19 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v19, 17, (uint64_t)"%s called with null prop", v20, v21, v22, v23, v24, (uint64_t)"-[NRDeviceOperationalProperties mergeProperties:]");

    goto LABEL_7;
  }
  -[NRDeviceOperationalProperties setVersion:](self, "setVersion:", objc_msgSend(v4, "version"));
  -[NRDeviceOperationalProperties setProxyCapability:](self, "setProxyCapability:", objc_msgSend(v25, "proxyCapability"));
  -[NRDeviceOperationalProperties setBluetoothRole:](self, "setBluetoothRole:", objc_msgSend(v25, "bluetoothRole"));
  -[NRDeviceOperationalProperties setHandlesLinkRecommendations:](self, "setHandlesLinkRecommendations:", objc_msgSend(v25, "handlesLinkRecommendations"));
  -[NRDeviceOperationalProperties setRequiresReachability:](self, "setRequiresReachability:", objc_msgSend(v25, "requiresReachability"));
  -[NRDeviceOperationalProperties setProxyProviderRequiresWiFi:](self, "setProxyProviderRequiresWiFi:", objc_msgSend(v25, "proxyProviderRequiresWiFi"));
  -[NRDeviceOperationalProperties setUsesTLS:](self, "setUsesTLS:", objc_msgSend(v25, "usesTLS"));
  -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](self, "setProvidesPhoneCallRelaySupport:", objc_msgSend(v25, "providesPhoneCallRelaySupport"));
  -[NRDeviceOperationalProperties setAllowsPermittedClientsOnly:](self, "setAllowsPermittedClientsOnly:", objc_msgSend(v25, "allowsPermittedClientsOnly"));
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](self, "setBluetoothEndpointType:", objc_msgSend(v25, "bluetoothEndpointType"));
  -[NRDeviceOperationalProperties setAllowsDirectToCloud:](self, "setAllowsDirectToCloud:", objc_msgSend(v25, "allowsDirectToCloud"));
  -[NRDeviceOperationalProperties setAllowsDeviceDiscovery:](self, "setAllowsDeviceDiscovery:", objc_msgSend(v25, "allowsDeviceDiscovery"));
  -[NRDeviceOperationalProperties setAllowedPeerDeviceType:](self, "setAllowedPeerDeviceType:", objc_msgSend(v25, "allowedPeerDeviceType"));
  -[NRDeviceOperationalProperties setAllowsDeadPeerDetection:](self, "setAllowsDeadPeerDetection:", objc_msgSend(v25, "allowsDeadPeerDetection"));
  -[NRDeviceOperationalProperties setIsReachableOverWiFi:](self, "setIsReachableOverWiFi:", objc_msgSend(v25, "isReachableOverWiFi"));
  -[NRDeviceOperationalProperties setOperationalScope:](self, "setOperationalScope:", objc_msgSend(v25, "operationalScope"));
  objc_msgSend(v25, "allowedLinkTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NRDeviceOperationalProperties setAllowedLinkTypes:](self, "setAllowedLinkTypes:", v6);

  objc_msgSend(v25, "allowedLinkSubtypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[NRDeviceOperationalProperties setAllowedLinkSubtypes:](self, "setAllowedLinkSubtypes:", v8);

  objc_msgSend(v25, "proxyProviderCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[NRDeviceOperationalProperties setProxyProviderCriteria:](self, "setProxyProviderCriteria:", v10);

  if (nrCopyLogObj_onceToken_900 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_900, &__block_literal_global_347);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_901, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_901, 0, (uint64_t)"%s%.30s:%-4d merged properties: %@", v11, v12, v13, v14, v15, (uint64_t)");
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NRDeviceOperationalProperties;
  v4 = -[NRDeviceProperties copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setVersion:", -[NRDeviceOperationalProperties version](self, "version"));
  objc_msgSend(v4, "setProxyCapability:", -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"));
  objc_msgSend(v4, "setBluetoothRole:", -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole"));
  objc_msgSend(v4, "setHandlesLinkRecommendations:", -[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations"));
  objc_msgSend(v4, "setRequiresReachability:", -[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability"));
  objc_msgSend(v4, "setProxyProviderRequiresWiFi:", -[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi"));
  objc_msgSend(v4, "setUsesTLS:", -[NRDeviceOperationalProperties usesTLS](self, "usesTLS"));
  objc_msgSend(v4, "setProvidesPhoneCallRelaySupport:", -[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport"));
  objc_msgSend(v4, "setAllowsPermittedClientsOnly:", -[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly"));
  objc_msgSend(v4, "setBluetoothEndpointType:", -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType"));
  objc_msgSend(v4, "setAllowsDirectToCloud:", -[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud"));
  objc_msgSend(v4, "setAllowsDeviceDiscovery:", -[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery"));
  objc_msgSend(v4, "setAllowedPeerDeviceType:", -[NRDeviceOperationalProperties allowedPeerDeviceType](self, "allowedPeerDeviceType"));
  objc_msgSend(v4, "setAllowsDeadPeerDetection:", -[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection"));
  objc_msgSend(v4, "setIsReachableOverWiFi:", -[NRDeviceOperationalProperties isReachableOverWiFi](self, "isReachableOverWiFi"));
  objc_msgSend(v4, "setOperationalScope:", -[NRDeviceOperationalProperties operationalScope](self, "operationalScope"));
  -[NRDeviceOperationalProperties allowedLinkTypes](self, "allowedLinkTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAllowedLinkTypes:", v6);

  -[NRDeviceOperationalProperties allowedLinkSubtypes](self, "allowedLinkSubtypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAllowedLinkSubtypes:", v8);

  -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setProxyProviderCriteria:", v10);

  return v4;
}

- (NRDeviceOperationalProperties)initWithCoder:(id)a3
{
  id v4;
  NRDeviceOperationalProperties *v5;
  NRDeviceOperationalProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NRDeviceOperationalProperties;
  v5 = -[NRDeviceProperties initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (!v5)
  {
    v11 = nrCopyLogObj_896();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "-[NRDeviceOperationalProperties initWithCoder:]";
        v21 = nrCopyLogObj_896();
        _NRLogAbortWithPack(v21);
      }
    }
    v14 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super initWithCoder:] failed", v15, v16, v17, v18, v19, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceOperationalProperties setVersion:](v5, "setVersion:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version")));
  -[NRDeviceOperationalProperties setProxyCapability:](v6, "setProxyCapability:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("proxyCapability")));
  -[NRDeviceOperationalProperties setBluetoothRole:](v6, "setBluetoothRole:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bluetoothRole")));
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](v6, "setBluetoothEndpointType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bluetoothEndpointType")));
  -[NRDeviceOperationalProperties setHandlesLinkRecommendations:](v6, "setHandlesLinkRecommendations:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("handlesLinkRecommendations")));
  -[NRDeviceOperationalProperties setRequiresReachability:](v6, "setRequiresReachability:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresReachability")));
  -[NRDeviceOperationalProperties setProxyProviderRequiresWiFi:](v6, "setProxyProviderRequiresWiFi:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyProviderRequiresWiFi")));
  -[NRDeviceOperationalProperties setUsesTLS:](v6, "setUsesTLS:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesTLS")));
  -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](v6, "setProvidesPhoneCallRelaySupport:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("providesPhoneCallRelaySupport")));
  -[NRDeviceOperationalProperties setAllowsPermittedClientsOnly:](v6, "setAllowsPermittedClientsOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsPermittedClientsOnly")));
  -[NRDeviceOperationalProperties setAllowsDirectToCloud:](v6, "setAllowsDirectToCloud:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDirectToCloud")));
  -[NRDeviceOperationalProperties setAllowsDeviceDiscovery:](v6, "setAllowsDeviceDiscovery:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDeviceDiscovery")));
  -[NRDeviceOperationalProperties setAllowedPeerDeviceType:](v6, "setAllowedPeerDeviceType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("allowedPeerDeviceType")));
  -[NRDeviceOperationalProperties setAllowsDeadPeerDetection:](v6, "setAllowsDeadPeerDetection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDeadPeerDetection")));
  -[NRDeviceOperationalProperties setIsReachableOverWiFi:](v6, "setIsReachableOverWiFi:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isReachableOverWiFi")));
  -[NRDeviceOperationalProperties setOperationalScope:](v6, "setOperationalScope:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("operationalScope")));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("allowedLinkTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceOperationalProperties setAllowedLinkTypes:](v6, "setAllowedLinkTypes:", v7);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("allowedLinkSubtypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceOperationalProperties setAllowedLinkSubtypes:](v6, "setAllowedLinkSubtypes:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxyProviderCriteria"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceOperationalProperties setProxyProviderCriteria:](v6, "setProxyProviderCriteria:", v9);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRDeviceOperationalProperties;
  v4 = a3;
  -[NRDeviceProperties encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceOperationalProperties version](self, "version", v8.receiver, v8.super_class), CFSTR("version"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"), CFSTR("proxyCapability"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole"), CFSTR("bluetoothRole"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType"), CFSTR("bluetoothEndpointType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations"), CFSTR("handlesLinkRecommendations"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability"), CFSTR("requiresReachability"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi"), CFSTR("proxyProviderRequiresWiFi"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties usesTLS](self, "usesTLS"), CFSTR("usesTLS"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport"), CFSTR("providesPhoneCallRelaySupport"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly"), CFSTR("allowsPermittedClientsOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud"), CFSTR("allowsDirectToCloud"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery"), CFSTR("allowsDeviceDiscovery"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceOperationalProperties allowedPeerDeviceType](self, "allowedPeerDeviceType"), CFSTR("allowedPeerDeviceType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection"), CFSTR("allowsDeadPeerDetection"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties isReachableOverWiFi](self, "isReachableOverWiFi"), CFSTR("isReachableOverWiFi"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties operationalScope](self, "operationalScope"), CFSTR("operationalScope"));
  -[NRDeviceOperationalProperties allowedLinkTypes](self, "allowedLinkTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("allowedLinkTypes"));

  -[NRDeviceOperationalProperties allowedLinkSubtypes](self, "allowedLinkSubtypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allowedLinkSubtypes"));

  -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("proxyProviderCriteria"));

}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __CFString *StringFromNRLinkType;
  unsigned __int8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __CFString *StringFromNRLinkSubtype;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("["));
  objc_msgSend(v3, "appendFormat:", CFSTR(" v:%u"), -[NRDeviceOperationalProperties version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" prx:%llu"), -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", bt:%llu"), -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", bt-end:%llu"), -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NRDeviceOperationalProperties allowedLinkTypes](self, "allowedLinkTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedShortValue");
        if ((v11 - 1) < 4u)
          StringFromNRLinkType = off_1EA3F6D10[(v11 - 1)];
        else
          StringFromNRLinkType = (__CFString *)createStringFromNRLinkType(v11);
        objc_msgSend(v4, "appendFormat:", CFSTR(" %@ "), StringFromNRLinkType);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  v23 = v3;

  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NRDeviceOperationalProperties allowedLinkSubtypes](self, "allowedLinkSubtypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "unsignedShortValue");
        if ((v19 - 101) < 4u)
          StringFromNRLinkSubtype = off_1EA3F6D30[(v19 - 101)];
        else
          StringFromNRLinkSubtype = (__CFString *)createStringFromNRLinkSubtype(v19);
        objc_msgSend(v12, "appendFormat:", CFSTR(" %@ "), StringFromNRLinkSubtype);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  objc_msgSend(v23, "appendFormat:", CFSTR(", lnks:[%@][%@]"), v4, v12);
  if (-[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations"))
    objc_msgSend(v23, "appendString:", CFSTR(", lnkRec"));
  if (-[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability"))
    objc_msgSend(v23, "appendString:", CFSTR(", rch"));
  if (-[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi"))
    objc_msgSend(v23, "appendString:", CFSTR(", prx-wifi"));
  if (-[NRDeviceOperationalProperties usesTLS](self, "usesTLS"))
    objc_msgSend(v23, "appendString:", CFSTR(", tls"));
  if (-[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport"))
    objc_msgSend(v23, "appendString:", CFSTR(", pcr"));
  if (-[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly"))
    objc_msgSend(v23, "appendString:", CFSTR(", prm"));
  if (-[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud"))
    objc_msgSend(v23, "appendString:", CFSTR(", dtc"));
  if (-[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery"))
    objc_msgSend(v23, "appendString:", CFSTR(", disc"));
  if (-[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection"))
    objc_msgSend(v23, "appendString:", CFSTR(", dpd"));
  if (-[NRDeviceOperationalProperties hasCompanionDatapath](self, "hasCompanionDatapath"))
    objc_msgSend(v23, "appendString:", CFSTR(", cmpn-dp"));
  -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NRDeviceOperationalProperties proxyProviderCriteria](self, "proxyProviderCriteria");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendFormat:", CFSTR(", %@"), v21);

  }
  if (-[NRDeviceOperationalProperties operationalScope](self, "operationalScope"))
    objc_msgSend(v23, "appendFormat:", CFSTR(", sc %#llx"), -[NRDeviceOperationalProperties operationalScope](self, "operationalScope"));
  objc_msgSend(v23, "appendString:", CFSTR("]"));

  return v23;
}

- (BOOL)hasCompanionDatapath
{
  return !self->_usesTLS;
}

- (BOOL)hasPoliciesForProxyCriteria
{
  return self->_proxyProviderCriteria != 0;
}

- (unint64_t)proxyCapability
{
  return self->_proxyCapability;
}

- (void)setProxyCapability:(unint64_t)a3
{
  self->_proxyCapability = a3;
}

- (NRDeviceProxyProviderCriteria)proxyProviderCriteria
{
  return self->_proxyProviderCriteria;
}

- (void)setProxyProviderCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProviderCriteria, a3);
}

- (unint64_t)bluetoothRole
{
  return self->_bluetoothRole;
}

- (void)setBluetoothRole:(unint64_t)a3
{
  self->_bluetoothRole = a3;
}

- (unint64_t)bluetoothEndpointType
{
  return self->_bluetoothEndpointType;
}

- (void)setBluetoothEndpointType:(unint64_t)a3
{
  self->_bluetoothEndpointType = a3;
}

- (NSArray)allowedLinkTypes
{
  return self->_allowedLinkTypes;
}

- (void)setAllowedLinkTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedLinkTypes, a3);
}

- (NSArray)allowedLinkSubtypes
{
  return self->_allowedLinkSubtypes;
}

- (void)setAllowedLinkSubtypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedLinkSubtypes, a3);
}

- (BOOL)requiresReachability
{
  return self->_requiresReachability;
}

- (void)setRequiresReachability:(BOOL)a3
{
  self->_requiresReachability = a3;
}

- (BOOL)proxyProviderRequiresWiFi
{
  return self->_proxyProviderRequiresWiFi;
}

- (void)setProxyProviderRequiresWiFi:(BOOL)a3
{
  self->_proxyProviderRequiresWiFi = a3;
}

- (BOOL)usesTLS
{
  return self->_usesTLS;
}

- (void)setUsesTLS:(BOOL)a3
{
  self->_usesTLS = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)providesPhoneCallRelaySupport
{
  return self->_providesPhoneCallRelaySupport;
}

- (void)setProvidesPhoneCallRelaySupport:(BOOL)a3
{
  self->_providesPhoneCallRelaySupport = a3;
}

- (BOOL)isReachableOverWiFi
{
  return self->_isReachableOverWiFi;
}

- (void)setIsReachableOverWiFi:(BOOL)a3
{
  self->_isReachableOverWiFi = a3;
}

- (BOOL)handlesLinkRecommendations
{
  return self->_handlesLinkRecommendations;
}

- (void)setHandlesLinkRecommendations:(BOOL)a3
{
  self->_handlesLinkRecommendations = a3;
}

- (BOOL)allowsPermittedClientsOnly
{
  return self->_allowsPermittedClientsOnly;
}

- (void)setAllowsPermittedClientsOnly:(BOOL)a3
{
  self->_allowsPermittedClientsOnly = a3;
}

- (BOOL)allowsDirectToCloud
{
  return self->_allowsDirectToCloud;
}

- (void)setAllowsDirectToCloud:(BOOL)a3
{
  self->_allowsDirectToCloud = a3;
}

- (BOOL)allowsDeviceDiscovery
{
  return self->_allowsDeviceDiscovery;
}

- (void)setAllowsDeviceDiscovery:(BOOL)a3
{
  self->_allowsDeviceDiscovery = a3;
}

- (BOOL)allowsDeadPeerDetection
{
  return self->_allowsDeadPeerDetection;
}

- (void)setAllowsDeadPeerDetection:(BOOL)a3
{
  self->_allowsDeadPeerDetection = a3;
}

- (unsigned)allowedPeerDeviceType
{
  return self->_allowedPeerDeviceType;
}

- (void)setAllowedPeerDeviceType:(unsigned __int8)a3
{
  self->_allowedPeerDeviceType = a3;
}

- (unint64_t)operationalScope
{
  return self->_operationalScope;
}

- (void)setOperationalScope:(unint64_t)a3
{
  self->_operationalScope = a3;
}

- (unint64_t)activeOperationalScope
{
  return self->_activeOperationalScope;
}

- (void)setActiveOperationalScope:(unint64_t)a3
{
  self->_activeOperationalScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLinkSubtypes, 0);
  objc_storeStrong((id *)&self->_allowedLinkTypes, 0);
  objc_storeStrong((id *)&self->_proxyProviderCriteria, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)copyPropertiesForDefaultPairedPhone
{
  NRDeviceOperationalProperties *v2;

  v2 = objc_alloc_init(NRDeviceOperationalProperties);
  -[NRDeviceOperationalProperties setProxyCapability:](v2, "setProxyCapability:", 1);
  -[NRDeviceOperationalProperties setBluetoothRole:](v2, "setBluetoothRole:", 1);
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](v2, "setBluetoothEndpointType:", 2);
  -[NRDeviceOperationalProperties setAllowsPermittedClientsOnly:](v2, "setAllowsPermittedClientsOnly:", 1);
  -[NRDeviceOperationalProperties setIsReachableOverWiFi:](v2, "setIsReachableOverWiFi:", 1);
  -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](v2, "setProvidesPhoneCallRelaySupport:", 1);
  -[NRDeviceOperationalProperties setAllowedLinkTypes:](v2, "setAllowedLinkTypes:", &unk_1EA4011D0);
  -[NRDeviceOperationalProperties setAllowedLinkSubtypes:](v2, "setAllowedLinkSubtypes:", &unk_1EA4011E8);
  return v2;
}

+ (id)copyPropertiesForDefaultPairedWatch
{
  NRDeviceOperationalProperties *v2;

  v2 = objc_alloc_init(NRDeviceOperationalProperties);
  -[NRDeviceOperationalProperties setProxyCapability:](v2, "setProxyCapability:", 2);
  -[NRDeviceOperationalProperties setBluetoothRole:](v2, "setBluetoothRole:", 2);
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](v2, "setBluetoothEndpointType:", 1);
  -[NRDeviceOperationalProperties setHandlesLinkRecommendations:](v2, "setHandlesLinkRecommendations:", 1);
  -[NRDeviceOperationalProperties setRequiresReachability:](v2, "setRequiresReachability:", 1);
  -[NRDeviceOperationalProperties setAllowsDirectToCloud:](v2, "setAllowsDirectToCloud:", 1);
  -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](v2, "setProvidesPhoneCallRelaySupport:", 1);
  -[NRDeviceOperationalProperties setAllowedLinkTypes:](v2, "setAllowedLinkTypes:", &unk_1EA401200);
  -[NRDeviceOperationalProperties setAllowedLinkSubtypes:](v2, "setAllowedLinkSubtypes:", &unk_1EA401218);
  return v2;
}

@end
