@implementation NEVPNProtocolIKEv2

- (NEVPNProtocolIKEv2)init
{
  return (NEVPNProtocolIKEv2 *)-[NEVPNProtocolIKEv2 initWithPluginType:](self, 0);
}

- (NEVPNProtocolIKEv2)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocolIKEv2 *v5;
  uint64_t v6;
  NSString *serverCertificateIssuerCommonName;
  uint64_t v8;
  NSString *serverCertificateCommonName;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *IKESecurityAssociationParametersArray;
  NEVPNIKEv2SecurityAssociationParameters *IKESecurityAssociationParameters;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *childSecurityAssociationParametersArray;
  NEVPNIKEv2SecurityAssociationParameters *childSecurityAssociationParameters;
  uint64_t v23;
  uint64_t v24;
  NSString *providerBundleIdentifier;
  uint64_t v26;
  NSString *pluginType;
  uint64_t v28;
  NEVPNIKEv2PPKConfiguration *ppkConfiguration;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NEVPNProtocolIKEv2;
  v5 = -[NEVPNProtocolIPSec initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_deadPeerDetectionRate = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DeadPeerDetectionRate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerCertificateIssuer"));
    v6 = objc_claimAutoreleasedReturnValue();
    serverCertificateIssuerCommonName = v5->_serverCertificateIssuerCommonName;
    v5->_serverCertificateIssuerCommonName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerCertificateCommonName"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverCertificateCommonName = v5->_serverCertificateCommonName;
    v5->_serverCertificateCommonName = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("IKESAParametersArray"));
    v13 = objc_claimAutoreleasedReturnValue();
    IKESecurityAssociationParametersArray = v5->_IKESecurityAssociationParametersArray;
    v5->_IKESecurityAssociationParametersArray = (NSArray *)v13;

    if (v5->_IKESecurityAssociationParametersArray)
    {
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IKESAParameters"));
      v16 = objc_claimAutoreleasedReturnValue();
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v16;
    }

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("ChildSAParametersArray"));
    v20 = objc_claimAutoreleasedReturnValue();
    childSecurityAssociationParametersArray = v5->_childSecurityAssociationParametersArray;
    v5->_childSecurityAssociationParametersArray = (NSArray *)v20;

    if (v5->_childSecurityAssociationParametersArray)
    {
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ChildSAParameters"));
      v23 = objc_claimAutoreleasedReturnValue();
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v23;
    }

    v5->_wakeForRekey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WakeForRekey"));
    v5->_certificateType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CertificateType"));
    v5->_useConfigurationAttributeInternalIPSubnet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseConfigurationAttributeInternalIPSubnet"));
    v5->_disableMOBIKE = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableMOBIKE"));
    v5->_disableRedirect = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableRedirect"));
    v5->_enablePFS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnablePFS"));
    v5->_opportunisticPFS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OpportunisticPFS"));
    v5->_natKeepAliveOffloadEnable = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("NATKeepAliveOffloadEnable"));
    v5->_natKeepAliveOffloadInterval = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("NATKeepAliveOffloadInterval"));
    v5->_disableMOBIKERetryOnWake = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DisableMOBIKERetryOnWake"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProviderBundleIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PluginType"));
    v26 = objc_claimAutoreleasedReturnValue();
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v26;

    v5->_enableRevocationCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableRevocationCheck"));
    v5->_strictRevocationCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("StrictRevocationCheck"));
    v5->_minimumTLSVersion = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MinimumTLSVersion"));
    v5->_maximumTLSVersion = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MaximumTLSVersion"));
    v5->_tunnelKind = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TunnelType"));
    v5->_disableInitialContact = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableInitialContact"));
    v5->_enableFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableFallback"));
    v5->_mtu = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MTU"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PPKConfiguration"));
    v28 = objc_claimAutoreleasedReturnValue();
    ppkConfiguration = v5->_ppkConfiguration;
    v5->_ppkConfiguration = (NEVPNIKEv2PPKConfiguration *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 wakeForRekey;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"), CFSTR("DeadPeerDetectionRate"));
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ServerCertificateIssuer"));

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ServerCertificateCommonName"));

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("IKESAParameters"));

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ChildSAParameters"));

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("IKESAParametersArray"));

  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ChildSAParametersArray"));

  if (self)
    wakeForRekey = self->_wakeForRekey;
  else
    wakeForRekey = 0;
  objc_msgSend(v4, "encodeBool:forKey:", wakeForRekey, CFSTR("WakeForRekey"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 certificateType](self, "certificateType"), CFSTR("CertificateType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"), CFSTR("UseConfigurationAttributeInternalIPSubnet"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"), CFSTR("DisableMOBIKE"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"), CFSTR("DisableRedirect"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"), CFSTR("EnablePFS"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"), CFSTR("OpportunisticPFS"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"), CFSTR("NATKeepAliveOffloadEnable"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"), CFSTR("NATKeepAliveOffloadInterval"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"), CFSTR("DisableMOBIKERetryOnWake"));
  -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ProviderBundleIdentifier"));

  -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("PluginType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"), CFSTR("EnableRevocationCheck"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"), CFSTR("StrictRevocationCheck"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion"), CFSTR("MinimumTLSVersion"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion"), CFSTR("MaximumTLSVersion"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind"), CFSTR("TunnelType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact"), CFSTR("DisableInitialContact"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"), CFSTR("EnableFallback"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 mtu](self, "mtu"), CFSTR("MTU"));
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("PPKConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL wakeForRekey;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)NEVPNProtocolIKEv2;
  v4 = -[NEVPNProtocolIPSec copyWithZone:](&v31, sel_copyWithZone_, a3);
  -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNProtocolIKEv2 setPluginType:](v4, v5);

  objc_msgSend(v4, "setDeadPeerDetectionRate:", -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"));
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerCertificateIssuerCommonName:", v6);

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerCertificateCommonName:", v7);

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[37];
  v4[37] = v9;

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[38];
  v4[38] = v12;

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithArray:copyItems:", v16, 1);
    v18 = (void *)v4[44];
    v4[44] = v17;

  }
  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithArray:copyItems:", v21, 1);
    v23 = (void *)v4[45];
    v4[45] = v22;

  }
  if (self)
    wakeForRekey = self->_wakeForRekey;
  else
    wakeForRekey = 0;
  *((_BYTE *)v4 + 247) = wakeForRekey;
  v4[36] = -[NEVPNProtocolIKEv2 certificateType](self, "certificateType");
  *((_BYTE *)v4 + 240) = -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet");
  *((_BYTE *)v4 + 241) = -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE");
  *((_BYTE *)v4 + 242) = -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect");
  *((_BYTE *)v4 + 243) = -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS");
  *((_BYTE *)v4 + 248) = -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS");
  *((_DWORD *)v4 + 63) = -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable");
  *((_DWORD *)v4 + 64) = -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval");
  *((_DWORD *)v4 + 65) = -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake");
  -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v4[46];
  v4[46] = v25;

  *((_BYTE *)v4 + 244) = -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck");
  *((_BYTE *)v4 + 245) = -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck");
  v4[39] = -[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion");
  v4[40] = -[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion");
  v4[47] = -[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind");
  *((_BYTE *)v4 + 249) = -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact");
  *((_BYTE *)v4 + 246) = -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback");
  v4[41] = -[NEVPNProtocolIKEv2 mtu](self, "mtu");
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  v29 = (void *)v4[42];
  v4[42] = v28;

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NEVPNProtocolIKEv2;
  v5 = -[NEVPNProtocolIPSec checkValidityAndCollectErrors:](&v38, sel_checkValidityAndCollectErrors_, v4);
  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "checkValidityAndCollectErrors:", v4))
            LOBYTE(v5) = 0;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v10);
    }

    v13 = v5 & 1;
  }
  else
  {
    -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "checkValidityAndCollectErrors:", v4);

    v13 = v15 & v5;
  }
  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v13 &= objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "checkValidityAndCollectErrors:", v4);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v20);
    }

  }
  else
  {
    -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v13) = v24 & v13;
  }
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v13) = v28 & v13;
  }

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 wakeForRekey;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  objc_super v28;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v28.receiver = self;
  v28.super_class = (Class)NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec descriptionWithIndent:options:](&v28, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  v10 = a4 & 0xFFFFFFFFFFFFFFF7;
  if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"))
  {
    if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      v11 = a4 | 8;
      v12 = CFSTR("low");
    }
    else if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      v11 = a4 | 8;
      v12 = CFSTR("medium");
    }
    else
    {
      v11 = a4 | 8;
      if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") != NEVPNIKEv2DeadPeerDetectionRateHigh)
        goto LABEL_10;
      v12 = CFSTR("high");
    }
  }
  else
  {
    v11 = a4 | 8;
    v12 = CFSTR("none");
  }
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("deadPeerDetectionRate"), v5, v11);
LABEL_10:
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a4 | 9;
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("serverCertificateIssuer"), v5, v14);

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("serverCertificateCommonName"), v5, v14);

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("IKESAParameters"), v5, v11);

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("childSAParameters"), v5, v11);

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("IKESAParametersArray"), v5, v10);

  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("childSAParametersArray"), v5, v10);

  if (self)
    wakeForRekey = self->_wakeForRekey;
  else
    wakeForRekey = 0;
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", wakeForRekey, CFSTR("wakeForRekey"), v5, v10);
  if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeRSA)
  {
    v21 = CFSTR("RSA");
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA256)
  {
    v21 = CFSTR("ECDSA256");
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA384)
  {
    v21 = CFSTR("ECDSA384");
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA521)
  {
    v21 = CFSTR("ECDSA521");
  }
  else
  {
    if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") != NEVPNIKEv2CertificateTypeEd25519)
      goto LABEL_23;
    v21 = CFSTR("Ed25519");
  }
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v21, CFSTR("certificateType"), v5, v11);
LABEL_23:
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"), CFSTR("useConfigurationAttributeInternalIPSubnet"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"), CFSTR("disableMOBIKE"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"), CFSTR("disableRedirect"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"), CFSTR("enabledPFS"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"), CFSTR("opportunisticPFS"), v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"), CFSTR("natKeepAliveOffloadEnable"), v5, v10);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"), CFSTR("DisableMOBIKERetryOnWake"), v5, v10);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"), CFSTR("natKeepAliveOffloadInterval"), v5, v10);
  -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v22, CFSTR("providerBundleIdentifier"), v5, v10);

  -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v23, CFSTR("pluginType"), v5, v10);

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"), CFSTR("enableRevocationCheck"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"), CFSTR("strictRevocationCheck"), v5, v11);
  if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    v24 = CFSTR("1.0");
  }
  else if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    v24 = CFSTR("1.1");
  }
  else
  {
    if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") != NEVPNIKEv2TLSVersion1_2)
      goto LABEL_30;
    v24 = CFSTR("1.2");
  }
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v24, CFSTR("minimumTLSVersion"), v5, v11);
LABEL_30:
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    v25 = CFSTR("1.0");
LABEL_36:
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v25, CFSTR("maximumTLSVersion"), v5, v11);
    goto LABEL_37;
  }
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    v25 = CFSTR("1.1");
    goto LABEL_36;
  }
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_2)
  {
    v25 = CFSTR("1.2");
    goto LABEL_36;
  }
LABEL_37:
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"), CFSTR("enableFallback"), v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", (int)-[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind"), CFSTR("tunnelKind"), v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact"), CFSTR("disableInitialContact"), v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", (int)-[NEVPNProtocolIKEv2 mtu](self, "mtu"), CFSTR("MTU"), v5, v11);
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v26, CFSTR("PPK"), v5, v11);

  return v9;
}

- (void)setDefaultsForUIConfiguration
{
  NEVPNIKEv2SecurityAssociationParameters *IKESecurityAssociationParameters;
  NEVPNIKEv2SecurityAssociationParameters *childSecurityAssociationParameters;
  NEVPNIKEv2SecurityAssociationParameters *v5;
  void *v6;
  NEVPNIKEv2SecurityAssociationParameters *v7;
  void *v8;
  NEVPNIKEv2SecurityAssociationParameters *v9;
  NEVPNIKEv2SecurityAssociationParameters *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  IKESecurityAssociationParameters = self->_IKESecurityAssociationParameters;
  self->_IKESecurityAssociationParameters = 0;

  childSecurityAssociationParameters = self->_childSecurityAssociationParameters;
  self->_childSecurityAssociationParameters = 0;

  v5 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v5, "setEncryptionAlgorithm:", 6);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v5, "setIntegrityAlgorithm:", 3);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v5, "setDiffieHellmanGroup:", 19);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v5, "setLifetimeMinutes:", 60);
  v6 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v5, "copy");
  objc_msgSend(v6, "setLifetimeMinutes:", 30);
  v7 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v7, "setEncryptionAlgorithm:", 6);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v7, "setIntegrityAlgorithm:", 3);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v7, "setDiffieHellmanGroup:", 14);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v7, "setLifetimeMinutes:", 60);
  v8 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v7, "copy");
  objc_msgSend(v8, "setLifetimeMinutes:", 30);
  v9 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v9, "setEncryptionAlgorithm:", 4);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v9, "setIntegrityAlgorithm:", 3);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v9, "setDiffieHellmanGroup:", 19);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v9, "setLifetimeMinutes:", 60);
  v14 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v9, "copy");
  objc_msgSend(v14, "setLifetimeMinutes:", 30);
  v10 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v10, "setEncryptionAlgorithm:", 4);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v10, "setIntegrityAlgorithm:", 3);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v10, "setDiffieHellmanGroup:", 14);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v10, "setLifetimeMinutes:", 60);
  v11 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v10, "copy");
  objc_msgSend(v11, "setLifetimeMinutes:", 30);
  v16[0] = v5;
  v16[1] = v7;
  v16[2] = v9;
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNProtocolIKEv2 setIKESecurityAssociationParametersArray:](self, "setIKESecurityAssociationParametersArray:", v12);

  v15[0] = v6;
  v15[1] = v8;
  v15[2] = v14;
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNProtocolIKEv2 setChildSecurityAssociationParametersArray:](self, "setChildSecurityAssociationParametersArray:", v13);

  -[NEVPNProtocolIKEv2 setEnablePFS:](self, "setEnablePFS:", 1);
  -[NEVPNProtocolIKEv2 setOpportunisticPFS:](self, "setOpportunisticPFS:", 1);

}

- (id)copyLegacyDictionary
{
  id v3;
  __CFString **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  __CFString **v13;
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
  __CFString **v24;
  __CFString **v25;
  void *v26;
  void *v27;
  void *v28;
  void *Property;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
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
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)NEVPNProtocolIKEv2;
  v3 = -[NEVPNProtocolIPSec copyLegacyDictionary](&v49, sel_copyLegacyDictionary);
  if (!v3)
    return v3;
  if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"))
  {
    if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      v4 = kNEIKEv2DeadPeerDetectionRateLowValue;
    }
    else if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      v4 = kNEIKEv2DeadPeerDetectionRateMediumValue;
    }
    else
    {
      if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") != NEVPNIKEv2DeadPeerDetectionRateHigh)
        goto LABEL_11;
      v4 = kNEIKEv2DeadPeerDetectionRateHighValue;
    }
  }
  else
  {
    v4 = kNEIKEv2DeadPeerDetectionRateNoneValue;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v4, CFSTR("DeadPeerDetectionRate"));
LABEL_11:
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ServerCertificateIssuerCommonName"));

  }
  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ServerCertificateCommonName"));

  }
  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v9);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("IKESecurityAssociationParameters"));

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v11);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ChildSecurityAssociationParameters"));

  if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeRSA)
  {
    v13 = kNEIKEv2CertificateTypeRSAValue;
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA256)
  {
    v13 = kNEIKEv2CertificateTypeECDSA256Value;
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA384)
  {
    v13 = kNEIKEv2CertificateTypeECDSA384Value;
  }
  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA521)
  {
    v13 = kNEIKEv2CertificateTypeECDSA521Value;
  }
  else
  {
    if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") != NEVPNIKEv2CertificateTypeEd25519)
      goto LABEL_26;
    v13 = kNEIKEv2CertificateTypeEd25519Value;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v13, CFSTR("CertificateType"));
LABEL_26:
  if (-[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"))
    v14 = &unk_1E3D03820;
  else
    v14 = &unk_1E3D03838;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ExtendedAuthEnabled"));
  if (-[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("UseConfigurationAttributeInternalIPSubnet"));

  }
  if (-[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("DisableMOBIKE"));

  }
  if (-[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("DisableRedirect"));

  }
  if (-[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("EnablePFS"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("NATKeepAliveOffloadEnable"));

  if (-[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("NATKeepAliveInterval"));

  }
  if (-[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("DisableMOBIKERetryOnWake"));

  }
  if (-[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("EnableCertificateRevocationCheck"));

    if (-[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("StrictCertificateRevocationCheck"));

    }
  }
  if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    v24 = kNEIKEv2TLSVersion1_0Value;
  }
  else if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    v24 = kNEIKEv2TLSVersion1_1Value;
  }
  else
  {
    if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") != NEVPNIKEv2TLSVersion1_2)
      goto LABEL_51;
    v24 = kNEIKEv2TLSVersion1_2Value;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v24, CFSTR("TLSMinimumVersion"));
LABEL_51:
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    v25 = kNEIKEv2TLSVersion1_0Value;
LABEL_57:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *v25, CFSTR("TLSMaximumVersion"));
    goto LABEL_58;
  }
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    v25 = kNEIKEv2TLSVersion1_1Value;
    goto LABEL_57;
  }
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_2)
  {
    v25 = kNEIKEv2TLSVersion1_2Value;
    goto LABEL_57;
  }
LABEL_58:
  if (-[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("EnableFallback"));

  }
  if (-[NEVPNProtocolIKEv2 mtu](self, "mtu"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NEVPNProtocolIKEv2 mtu](self, "mtu"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("MTU"));

  }
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v31 = Property;
    if (Property)
      Property = objc_getProperty(Property, v30, 32, 1);
    objc_msgSend(Property, "data");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v33;
      if (v33)
        v33 = objc_getProperty(v33, v34, 32, 1);
      objc_msgSend(v33, "data");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("PPK"));

    }
    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("PPKIdentifier"));

    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "isMandatory"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("PPKMandatory"));

    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "keychainReference");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "keychainReference");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "copy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("PPKReference"));

    }
  }
  return v3;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8;
  id v9;
  void *Property;
  const char *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec syncWithKeychainInDomain:configuration:suffix:](&v17, sel_syncWithKeychainInDomain_configuration_suffix_, a3, v8, v9);
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v12 = Property;
  if (Property)
    Property = objc_getProperty(Property, v11, 32, 1);
  v13 = Property;

  if (v13 && objc_msgSend(v13, "domain") == a3)
  {
    if (v9)
    {
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".PPK"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("PPK");
    }
    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v8, v16, 2, v14);

  }
}

- (BOOL)needToUpdateKeychain
{
  BOOL v3;
  void *Property;
  const char *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolIKEv2;
  if (-[NEVPNProtocolIPSec needToUpdateKeychain](&v10, sel_needToUpdateKeychain))
    return 1;
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v6 = Property;
  if (Property)
    Property = objc_getProperty(Property, v5, 32, 1);
  v7 = Property;

  if (v7)
  {
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "length") != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  void *Property;
  const char *v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec removeKeychainItemsInDomain:keepIdentity:](&v10, sel_removeKeychainItemsInDomain_keepIdentity_, a3, a4);
  -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v8 = Property;
  if (Property)
    Property = objc_getProperty(Property, v7, 32, 1);
  v9 = Property;

  if (v9 && objc_msgSend(v9, "domain") == a3)
    objc_msgSend(v9, "setIdentifier:", 0);

}

- (NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  return self->_deadPeerDetectionRate;
}

- (void)setDeadPeerDetectionRate:(NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  self->_deadPeerDetectionRate = deadPeerDetectionRate;
}

- (NSString)serverCertificateIssuerCommonName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setServerCertificateIssuerCommonName:(NSString *)serverCertificateIssuerCommonName
{
  objc_setProperty_atomic_copy(self, a2, serverCertificateIssuerCommonName, 272);
}

- (NSString)serverCertificateCommonName
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setServerCertificateCommonName:(NSString *)serverCertificateCommonName
{
  objc_setProperty_atomic_copy(self, a2, serverCertificateCommonName, 280);
}

- (NEVPNIKEv2CertificateType)certificateType
{
  return self->_certificateType;
}

- (void)setCertificateType:(NEVPNIKEv2CertificateType)certificateType
{
  self->_certificateType = certificateType;
}

- (BOOL)useConfigurationAttributeInternalIPSubnet
{
  return self->_useConfigurationAttributeInternalIPSubnet;
}

- (void)setUseConfigurationAttributeInternalIPSubnet:(BOOL)useConfigurationAttributeInternalIPSubnet
{
  self->_useConfigurationAttributeInternalIPSubnet = useConfigurationAttributeInternalIPSubnet;
}

- (NEVPNIKEv2SecurityAssociationParameters)IKESecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 296, 1);
}

- (NEVPNIKEv2SecurityAssociationParameters)childSecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 304, 1);
}

- (BOOL)disableMOBIKE
{
  return self->_disableMOBIKE;
}

- (void)setDisableMOBIKE:(BOOL)disableMOBIKE
{
  self->_disableMOBIKE = disableMOBIKE;
}

- (BOOL)disableRedirect
{
  return self->_disableRedirect;
}

- (void)setDisableRedirect:(BOOL)disableRedirect
{
  self->_disableRedirect = disableRedirect;
}

- (BOOL)enablePFS
{
  return self->_enablePFS;
}

- (void)setEnablePFS:(BOOL)enablePFS
{
  self->_enablePFS = enablePFS;
}

- (BOOL)enableRevocationCheck
{
  return self->_enableRevocationCheck;
}

- (void)setEnableRevocationCheck:(BOOL)enableRevocationCheck
{
  self->_enableRevocationCheck = enableRevocationCheck;
}

- (BOOL)strictRevocationCheck
{
  return self->_strictRevocationCheck;
}

- (void)setStrictRevocationCheck:(BOOL)strictRevocationCheck
{
  self->_strictRevocationCheck = strictRevocationCheck;
}

- (NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  return self->_minimumTLSVersion;
}

- (void)setMinimumTLSVersion:(NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  self->_minimumTLSVersion = minimumTLSVersion;
}

- (NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  return self->_maximumTLSVersion;
}

- (void)setMaximumTLSVersion:(NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  self->_maximumTLSVersion = maximumTLSVersion;
}

- (BOOL)enableFallback
{
  return self->_enableFallback;
}

- (void)setEnableFallback:(BOOL)enableFallback
{
  self->_enableFallback = enableFallback;
}

- (NSUInteger)mtu
{
  return self->_mtu;
}

- (void)setMtu:(NSUInteger)mtu
{
  self->_mtu = mtu;
}

- (NEVPNIKEv2PPKConfiguration)ppkConfiguration
{
  return (NEVPNIKEv2PPKConfiguration *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPpkConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (NSArray)IKESecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)setIKESecurityAssociationParametersArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSArray)childSecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setChildSecurityAssociationParametersArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setProviderBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (int)natKeepAliveOffloadEnable
{
  return self->_natKeepAliveOffloadEnable;
}

- (void)setNatKeepAliveOffloadEnable:(int)a3
{
  self->_natKeepAliveOffloadEnable = a3;
}

- (int)natKeepAliveOffloadInterval
{
  return self->_natKeepAliveOffloadInterval;
}

- (void)setNatKeepAliveOffloadInterval:(int)a3
{
  self->_natKeepAliveOffloadInterval = a3;
}

- (int)disableMOBIKERetryOnWake
{
  return self->_disableMOBIKERetryOnWake;
}

- (void)setDisableMOBIKERetryOnWake:(int)a3
{
  self->_disableMOBIKERetryOnWake = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (BOOL)disableInitialContact
{
  return self->_disableInitialContact;
}

- (void)setDisableInitialContact:(BOOL)a3
{
  self->_disableInitialContact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_childSecurityAssociationParametersArray, 0);
  objc_storeStrong((id *)&self->_IKESecurityAssociationParametersArray, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_ppkConfiguration, 0);
  objc_storeStrong((id *)&self->_childSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_IKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_serverCertificateCommonName, 0);
  objc_storeStrong((id *)&self->_serverCertificateIssuerCommonName, 0);
}

- (void)setPluginType:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v14 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)a1[43];
    a1[43] = v4;

    v7 = a1[10];
    if (v14)
    {
      if (v7 != 1)
      {
        a1[10] = 1;
        v8 = objc_getProperty(a1, v6, 96, 1);
        objc_msgSend(v8, "setDomain:", 1);

        objc_msgSend(a1, "passwordKeychainItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDomain:", 1);

      }
      v10 = CFSTR("com.apple.managed.vpn.shared");
      v11 = a1;
    }
    else
    {
      if (v7)
      {
        a1[10] = 0;
        v12 = objc_getProperty(a1, v6, 96, 1);
        objc_msgSend(v12, "setDomain:", 0);

        objc_msgSend(a1, "passwordKeychainItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDomain:", 0);

      }
      v11 = a1;
      v10 = 0;
    }
    objc_setProperty_atomic(v11, v6, v10, 88);
    v3 = v14;
  }

}

- (_QWORD)initWithPluginType:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;
  NEVPNIKEv2SecurityAssociationParameters *v5;
  void *v6;
  NEVPNIKEv2SecurityAssociationParameters *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)NEVPNProtocolIKEv2;
    v4 = objc_msgSendSuper2(&v11, sel_initWithType_, 5);
    a1 = v4;
    if (v4)
    {
      -[NEVPNProtocolIKEv2 setPluginType:](v4, v3);
      a1[33] = 2;
      v5 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
      v6 = (void *)a1[37];
      a1[37] = v5;

      v7 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
      v8 = (void *)a1[38];
      a1[38] = v7;

      objc_msgSend((id)a1[37], "setLifetimeMinutes:", 60);
      objc_msgSend((id)a1[38], "setLifetimeMinutes:", 30);
      *((_BYTE *)a1 + 247) = 0;
      a1[36] = 1;
      *((_BYTE *)a1 + 240) = 0;
      *((_BYTE *)a1 + 241) = 0;
      *((_BYTE *)a1 + 242) = 0;
      *((_BYTE *)a1 + 243) = 0;
      *((_BYTE *)a1 + 248) = 0;
      *((_DWORD *)a1 + 63) = 0;
      *((_DWORD *)a1 + 64) = 0;
      v9 = (void *)a1[46];
      a1[46] = 0;

      *((_DWORD *)a1 + 65) = 0;
      objc_msgSend(a1, "setDisconnectOnWake:", 0);
      objc_msgSend(a1, "setUseExtendedAuthentication:", 0);
      a1[47] = 1;
      *((_BYTE *)a1 + 249) = 0;
      *((_BYTE *)a1 + 246) = 0;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
