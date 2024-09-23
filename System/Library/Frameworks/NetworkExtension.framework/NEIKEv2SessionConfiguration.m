@implementation NEIKEv2SessionConfiguration

- (NEIKEv2SessionConfiguration)init
{
  NEIKEv2SessionConfiguration *v2;
  NEIKEv2SessionConfiguration *v3;
  NEIKEv2SessionConfiguration *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2SessionConfiguration;
  v2 = -[NEIKEv2SessionConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2SessionConfiguration setLocalPrivateKeyRef:](self, "setLocalPrivateKeyRef:", 0);
  -[NEIKEv2SessionConfiguration setRemotePublicKeyRef:](self, "setRemotePublicKeyRef:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2SessionConfiguration;
  -[NEIKEv2SessionConfiguration dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
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

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEIKEv2SessionConfiguration localIdentifier](self, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Local Identifier"), v5, a4);

  -[NEIKEv2SessionConfiguration remoteIdentifier](self, "remoteIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("Remote Identifier"), v5, a4);

  -[NEIKEv2SessionConfiguration configurationRequest](self, "configurationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Configuration Request"), v5, a4);

  -[NEIKEv2SessionConfiguration configurationReply](self, "configurationReply");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Configuration Reply"), v5, a4);

  -[NEIKEv2SessionConfiguration authenticationProtocol](self, "authenticationProtocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("Local Authentication"), v5, a4);

  -[NEIKEv2SessionConfiguration remoteAuthentication](self, "remoteAuthentication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("Remote Authentication"), v5, a4);

  if (-[NEIKEv2SessionConfiguration ppkIDType](self, "ppkIDType"))
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2SessionConfiguration ppkIDType](self, "ppkIDType"), CFSTR("PPK ID Type"), v5, a4);
    -[NEIKEv2SessionConfiguration ppkID](self, "ppkID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("PPK ID"), v5, a4);

  }
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2SessionConfiguration ppkMandatory](self, "ppkMandatory"), CFSTR("PPK Mandatory"), v5, a4);
  -[NEIKEv2SessionConfiguration customIKEAuthPrivateNotifies](self, "customIKEAuthPrivateNotifies");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Private Notifies"), v5, a4);

  -[NEIKEv2SessionConfiguration pduSessionID](self, "pduSessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("PDU Session ID"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEIKEv2SessionConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  id v38;
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
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2SessionConfiguration localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocalIdentifier:", v6);

  -[NEIKEv2SessionConfiguration remoteIdentifier](self, "remoteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setRemoteIdentifier:", v8);

  objc_msgSend(v4, "setInitialContactDisabled:", -[NEIKEv2SessionConfiguration initialContactDisabled](self, "initialContactDisabled"));
  objc_msgSend(v4, "setNegotiateMOBIKE:", -[NEIKEv2SessionConfiguration negotiateMOBIKE](self, "negotiateMOBIKE"));
  -[NEIKEv2SessionConfiguration additionalMOBIKEAddresses](self, "additionalMOBIKEAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2SessionConfiguration additionalMOBIKEAddresses](self, "additionalMOBIKEAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
    objc_msgSend(v4, "setAdditionalMOBIKEAddresses:", v12);

  }
  objc_msgSend(v4, "setNatTraversalKeepaliveDisabled:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveDisabled](self, "natTraversalKeepaliveDisabled"));
  objc_msgSend(v4, "setNatTraversalKeepaliveInterval:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveInterval](self, "natTraversalKeepaliveInterval"));
  objc_msgSend(v4, "setNatTraversalKeepaliveOffloadEnabled:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveOffloadEnabled](self, "natTraversalKeepaliveOffloadEnabled"));
  objc_msgSend(v4, "setNatTraversalKeepaliveOffloadInterval:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveOffloadInterval](self, "natTraversalKeepaliveOffloadInterval"));
  objc_msgSend(v4, "setDeadPeerDetectionEnabled:", -[NEIKEv2SessionConfiguration deadPeerDetectionEnabled](self, "deadPeerDetectionEnabled"));
  objc_msgSend(v4, "setDeadPeerDetectionInterval:", -[NEIKEv2SessionConfiguration deadPeerDetectionInterval](self, "deadPeerDetectionInterval"));
  objc_msgSend(v4, "setDeadPeerDetectionRetryIntervalMilliseconds:", -[NEIKEv2SessionConfiguration deadPeerDetectionRetryIntervalMilliseconds](self, "deadPeerDetectionRetryIntervalMilliseconds"));
  objc_msgSend(v4, "setDeadPeerDetectionMaxRetryCount:", -[NEIKEv2SessionConfiguration deadPeerDetectionMaxRetryCount](self, "deadPeerDetectionMaxRetryCount"));
  objc_msgSend(v4, "setDeadPeerDetectionMaxRetryCountBeforeReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionMaxRetryCountBeforeReporting](self, "deadPeerDetectionMaxRetryCountBeforeReporting"));
  objc_msgSend(v4, "setDeadPeerDetectionReceiveIntervalTriggerReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionReceiveIntervalTriggerReporting](self, "deadPeerDetectionReceiveIntervalTriggerReporting"));
  objc_msgSend(v4, "setDeadPeerDetectionReceiveMaxShortDPDBeforeReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionReceiveMaxShortDPDBeforeReporting](self, "deadPeerDetectionReceiveMaxShortDPDBeforeReporting"));
  objc_msgSend(v4, "setIdleTimeoutEnabled:", -[NEIKEv2SessionConfiguration idleTimeoutEnabled](self, "idleTimeoutEnabled"));
  objc_msgSend(v4, "setIdleTimeoutSeconds:", -[NEIKEv2SessionConfiguration idleTimeoutSeconds](self, "idleTimeoutSeconds"));
  objc_msgSend(v4, "setBlackholeDetectionEnabled:", -[NEIKEv2SessionConfiguration blackholeDetectionEnabled](self, "blackholeDetectionEnabled"));
  -[NEIKEv2SessionConfiguration authenticationProtocol](self, "authenticationProtocol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setAuthenticationProtocol:", v14);

  -[NEIKEv2SessionConfiguration localPrivateEAPIdentity](self, "localPrivateEAPIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLocalPrivateEAPIdentity:", v16);

  -[NEIKEv2SessionConfiguration localEncryptedEAPIdentity](self, "localEncryptedEAPIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setLocalEncryptedEAPIdentity:", v18);

  -[NEIKEv2SessionConfiguration username](self, "username");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setUsername:", v20);

  -[NEIKEv2SessionConfiguration password](self, "password");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setPassword:", v22);

  -[NEIKEv2SessionConfiguration passwordReference](self, "passwordReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setPasswordReference:", v24);

  -[NEIKEv2SessionConfiguration sharedSecret](self, "sharedSecret");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setSharedSecret:", v26);

  -[NEIKEv2SessionConfiguration sharedSecretReference](self, "sharedSecretReference");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setSharedSecretReference:", v28);

  -[NEIKEv2SessionConfiguration localCertificateName](self, "localCertificateName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setLocalCertificateName:", v30);

  -[NEIKEv2SessionConfiguration localCertificateReference](self, "localCertificateReference");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setLocalCertificateReference:", v32);

  -[NEIKEv2SessionConfiguration remoteCertificateHostname](self, "remoteCertificateHostname");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setRemoteCertificateHostname:", v34);

  -[NEIKEv2SessionConfiguration remoteCertificateAuthorityName](self, "remoteCertificateAuthorityName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setRemoteCertificateAuthorityName:", v36);

  -[NEIKEv2SessionConfiguration remoteCertificateAuthorityReferences](self, "remoteCertificateAuthorityReferences");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2SessionConfiguration remoteCertificateAuthorityReferences](self, "remoteCertificateAuthorityReferences");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithArray:copyItems:", v39, 1);
    objc_msgSend(v4, "setRemoteCertificateAuthorityReferences:", v40);

  }
  -[NEIKEv2SessionConfiguration remoteCertificateAuthorityHash](self, "remoteCertificateAuthorityHash");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setRemoteCertificateAuthorityHash:", v42);

  objc_msgSend(v4, "setEnableCertificateRevocationCheck:", -[NEIKEv2SessionConfiguration enableCertificateRevocationCheck](self, "enableCertificateRevocationCheck"));
  objc_msgSend(v4, "setStrictCertificateRevocationCheck:", -[NEIKEv2SessionConfiguration strictCertificateRevocationCheck](self, "strictCertificateRevocationCheck"));
  objc_msgSend(v4, "setDisableRemoteCertificateValidation:", -[NEIKEv2SessionConfiguration disableRemoteCertificateValidation](self, "disableRemoteCertificateValidation"));
  objc_msgSend(v4, "setLocalPrivateKeyRef:", -[NEIKEv2SessionConfiguration localPrivateKeyRef](self, "localPrivateKeyRef"));
  objc_msgSend(v4, "setRemotePublicKeyRef:", -[NEIKEv2SessionConfiguration remotePublicKeyRef](self, "remotePublicKeyRef"));
  -[NEIKEv2SessionConfiguration remoteAuthentication](self, "remoteAuthentication");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setRemoteAuthentication:", v44);

  -[NEIKEv2SessionConfiguration tlsMinimumVersion](self, "tlsMinimumVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setTlsMinimumVersion:", v46);

  -[NEIKEv2SessionConfiguration tlsMaximumVersion](self, "tlsMaximumVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setTlsMaximumVersion:", v48);

  -[NEIKEv2SessionConfiguration configurationRequest](self, "configurationRequest");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setConfigurationRequest:", v50);

  -[NEIKEv2SessionConfiguration configurationReply](self, "configurationReply");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v4, "setConfigurationReply:", v52);

  objc_opt_self();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "customIKEAuthPayloads");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v55 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2SessionConfiguration customIKEAuthPayloads](self, "customIKEAuthPayloads");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v55, "initWithArray:copyItems:", v56, 1);
    objc_msgSend(v4, "setCustomIKEAuthPayloads:", v57);

  }
  -[NEIKEv2SessionConfiguration customIKEAuthVendorPayloads](self, "customIKEAuthVendorPayloads");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v59 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2SessionConfiguration customIKEAuthVendorPayloads](self, "customIKEAuthVendorPayloads");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initWithArray:copyItems:", v60, 1);
    objc_msgSend(v4, "setCustomIKEAuthVendorPayloads:", v61);

  }
  -[NEIKEv2SessionConfiguration customIKEAuthPrivateNotifies](self, "customIKEAuthPrivateNotifies");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2SessionConfiguration customIKEAuthPrivateNotifies](self, "customIKEAuthPrivateNotifies");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v63, "initWithArray:copyItems:", v64, 1);
    objc_msgSend(v4, "setCustomIKEAuthPrivateNotifies:", v65);

  }
  -[NEIKEv2SessionConfiguration IMEI](self, "IMEI");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v66, "copy");
  objc_msgSend(v4, "setIMEI:", v67);

  -[NEIKEv2SessionConfiguration IMEISV](self, "IMEISV");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v68, "copy");
  objc_msgSend(v4, "setIMEISV:", v69);

  -[NEIKEv2SessionConfiguration ppk](self, "ppk");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v70, "copy");
  objc_msgSend(v4, "setPpk:", v71);

  -[NEIKEv2SessionConfiguration ppkReference](self, "ppkReference");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v72, "copy");
  objc_msgSend(v4, "setPpkReference:", v73);

  -[NEIKEv2SessionConfiguration ppkID](self, "ppkID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v74, "copy");
  objc_msgSend(v4, "setPpkID:", v75);

  objc_msgSend(v4, "setPpkIDType:", -[NEIKEv2SessionConfiguration ppkIDType](self, "ppkIDType"));
  objc_msgSend(v4, "setPpkMandatory:", -[NEIKEv2SessionConfiguration ppkMandatory](self, "ppkMandatory"));
  return v4;
}

- (NEIKEv2ConfigurationMessage)configurationRequest
{
  return self->_configurationRequest;
}

- (void)setConfigurationRequest:(id)a3
{
  NEIKEv2ConfigurationMessage *v4;
  NEIKEv2ConfigurationMessage *configurationRequest;

  v4 = (NEIKEv2ConfigurationMessage *)objc_msgSend(a3, "copy");
  if (v4)
    v4->_configurationType = 1;
  configurationRequest = self->_configurationRequest;
  self->_configurationRequest = v4;

}

- (NEIKEv2ConfigurationMessage)configurationReply
{
  return self->_configurationReply;
}

- (void)setConfigurationReply:(id)a3
{
  NEIKEv2ConfigurationMessage *v4;
  NEIKEv2ConfigurationMessage *configurationReply;

  v4 = (NEIKEv2ConfigurationMessage *)objc_msgSend(a3, "copy");
  if (v4)
    v4->_configurationType = 2;
  configurationReply = self->_configurationReply;
  self->_configurationReply = v4;

}

- (NEIKEv2Identifier)localIdentifier
{
  return (NEIKEv2Identifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NEIKEv2Identifier)remoteIdentifier
{
  return (NEIKEv2Identifier *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)initialContactDisabled
{
  return self->_initialContactDisabled;
}

- (void)setInitialContactDisabled:(BOOL)a3
{
  self->_initialContactDisabled = a3;
}

- (BOOL)negotiateMOBIKE
{
  return self->_negotiateMOBIKE;
}

- (void)setNegotiateMOBIKE:(BOOL)a3
{
  self->_negotiateMOBIKE = a3;
}

- (NSArray)additionalMOBIKEAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAdditionalMOBIKEAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)natTraversalKeepaliveDisabled
{
  return self->_natTraversalKeepaliveDisabled;
}

- (void)setNatTraversalKeepaliveDisabled:(BOOL)a3
{
  self->_natTraversalKeepaliveDisabled = a3;
}

- (BOOL)natTraversalKeepaliveEnabled
{
  return self->_natTraversalKeepaliveEnabled;
}

- (void)setNatTraversalKeepaliveEnabled:(BOOL)a3
{
  self->_natTraversalKeepaliveEnabled = a3;
}

- (unint64_t)natTraversalKeepaliveInterval
{
  return self->_natTraversalKeepaliveInterval;
}

- (void)setNatTraversalKeepaliveInterval:(unint64_t)a3
{
  self->_natTraversalKeepaliveInterval = a3;
}

- (BOOL)natTraversalKeepaliveOffloadEnabled
{
  return self->_natTraversalKeepaliveOffloadEnabled;
}

- (void)setNatTraversalKeepaliveOffloadEnabled:(BOOL)a3
{
  self->_natTraversalKeepaliveOffloadEnabled = a3;
}

- (unint64_t)natTraversalKeepaliveOffloadInterval
{
  return self->_natTraversalKeepaliveOffloadInterval;
}

- (void)setNatTraversalKeepaliveOffloadInterval:(unint64_t)a3
{
  self->_natTraversalKeepaliveOffloadInterval = a3;
}

- (BOOL)deadPeerDetectionEnabled
{
  return self->_deadPeerDetectionEnabled;
}

- (void)setDeadPeerDetectionEnabled:(BOOL)a3
{
  self->_deadPeerDetectionEnabled = a3;
}

- (unint64_t)deadPeerDetectionInterval
{
  return self->_deadPeerDetectionInterval;
}

- (void)setDeadPeerDetectionInterval:(unint64_t)a3
{
  self->_deadPeerDetectionInterval = a3;
}

- (unint64_t)deadPeerDetectionRetryIntervalMilliseconds
{
  return self->_deadPeerDetectionRetryIntervalMilliseconds;
}

- (void)setDeadPeerDetectionRetryIntervalMilliseconds:(unint64_t)a3
{
  self->_deadPeerDetectionRetryIntervalMilliseconds = a3;
}

- (unsigned)deadPeerDetectionMaxRetryCount
{
  return self->_deadPeerDetectionMaxRetryCount;
}

- (void)setDeadPeerDetectionMaxRetryCount:(unsigned int)a3
{
  self->_deadPeerDetectionMaxRetryCount = a3;
}

- (unsigned)deadPeerDetectionMaxRetryCountBeforeReporting
{
  return self->_deadPeerDetectionMaxRetryCountBeforeReporting;
}

- (void)setDeadPeerDetectionMaxRetryCountBeforeReporting:(unsigned int)a3
{
  self->_deadPeerDetectionMaxRetryCountBeforeReporting = a3;
}

- (unint64_t)deadPeerDetectionReceiveIntervalTriggerReporting
{
  return self->_deadPeerDetectionReceiveIntervalTriggerReporting;
}

- (void)setDeadPeerDetectionReceiveIntervalTriggerReporting:(unint64_t)a3
{
  self->_deadPeerDetectionReceiveIntervalTriggerReporting = a3;
}

- (unsigned)deadPeerDetectionReceiveMaxShortDPDBeforeReporting
{
  return self->_deadPeerDetectionReceiveMaxShortDPDBeforeReporting;
}

- (void)setDeadPeerDetectionReceiveMaxShortDPDBeforeReporting:(unsigned int)a3
{
  self->_deadPeerDetectionReceiveMaxShortDPDBeforeReporting = a3;
}

- (BOOL)idleTimeoutEnabled
{
  return self->_idleTimeoutEnabled;
}

- (void)setIdleTimeoutEnabled:(BOOL)a3
{
  self->_idleTimeoutEnabled = a3;
}

- (unint64_t)idleTimeoutSeconds
{
  return self->_idleTimeoutSeconds;
}

- (void)setIdleTimeoutSeconds:(unint64_t)a3
{
  self->_idleTimeoutSeconds = a3;
}

- (BOOL)blackholeDetectionEnabled
{
  return self->_blackholeDetectionEnabled;
}

- (void)setBlackholeDetectionEnabled:(BOOL)a3
{
  self->_blackholeDetectionEnabled = a3;
}

- (NEIKEv2AuthenticationProtocol)authenticationProtocol
{
  return (NEIKEv2AuthenticationProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAuthenticationProtocol:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NEIKEv2AuthenticationProtocol)remoteAuthentication
{
  return (NEIKEv2AuthenticationProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRemoteAuthentication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)localPrivateEAPIdentity
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLocalPrivateEAPIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSData)localEncryptedEAPIdentity
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLocalEncryptedEAPIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPasswordReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSData)sharedSecret
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSharedSecret:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)sharedSecretReference
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSharedSecretReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)localCertificateName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLocalCertificateName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSData)localCertificateReference
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLocalCertificateReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSData)localCertificateKeyReference
{
  return (NSData *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLocalCertificateKeyReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (BOOL)localCertificateIsModernSystem
{
  return self->_localCertificateIsModernSystem;
}

- (void)setLocalCertificateIsModernSystem:(BOOL)a3
{
  self->_localCertificateIsModernSystem = a3;
}

- (NSString)remoteCertificateHostname
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRemoteCertificateHostname:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)remoteCertificateAuthorityName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRemoteCertificateAuthorityName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)remoteCertificateAuthorityReferences
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRemoteCertificateAuthorityReferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSData)remoteCertificateAuthorityHash
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setRemoteCertificateAuthorityHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)enableCertificateRevocationCheck
{
  return self->_enableCertificateRevocationCheck;
}

- (void)setEnableCertificateRevocationCheck:(BOOL)a3
{
  self->_enableCertificateRevocationCheck = a3;
}

- (BOOL)strictCertificateRevocationCheck
{
  return self->_strictCertificateRevocationCheck;
}

- (void)setStrictCertificateRevocationCheck:(BOOL)a3
{
  self->_strictCertificateRevocationCheck = a3;
}

- (BOOL)disableRemoteCertificateValidation
{
  return self->_disableRemoteCertificateValidation;
}

- (void)setDisableRemoteCertificateValidation:(BOOL)a3
{
  self->_disableRemoteCertificateValidation = a3;
}

- (__SecKey)localPrivateKeyRef
{
  return (__SecKey *)objc_getProperty(self, a2, 256, 1);
}

- (void)setLocalPrivateKeyRef:(__SecKey *)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (__SecKey)remotePublicKeyRef
{
  return (__SecKey *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRemotePublicKeyRef:(__SecKey *)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)tlsMinimumVersion
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setTlsMinimumVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)tlsMaximumVersion
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTlsMaximumVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSArray)customIKEAuthPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setCustomIKEAuthPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSArray)customIKEAuthVendorPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCustomIKEAuthVendorPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSArray)customIKEAuthPrivateNotifies
{
  return self->_customIKEAuthPrivateNotifies;
}

- (void)setCustomIKEAuthPrivateNotifies:(id)a3
{
  objc_storeStrong((id *)&self->_customIKEAuthPrivateNotifies, a3);
}

- (NSNumber)pduSessionID
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPduSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)IMEI
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setIMEI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)IMEISV
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setIMEISV:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSData)ppk
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPpk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSData)ppkReference
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPpkReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (unint64_t)ppkIDType
{
  return self->_ppkIDType;
}

- (void)setPpkIDType:(unint64_t)a3
{
  self->_ppkIDType = a3;
}

- (NSData)ppkID
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setPpkID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (BOOL)ppkMandatory
{
  return self->_ppkMandatory;
}

- (void)setPpkMandatory:(BOOL)a3
{
  self->_ppkMandatory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppkID, 0);
  objc_storeStrong((id *)&self->_ppkReference, 0);
  objc_storeStrong((id *)&self->_ppk, 0);
  objc_storeStrong((id *)&self->_IMEISV, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_pduSessionID, 0);
  objc_storeStrong((id *)&self->_customIKEAuthPrivateNotifies, 0);
  objc_storeStrong((id *)&self->_customIKEAuthVendorPayloads, 0);
  objc_storeStrong((id *)&self->_customIKEAuthPayloads, 0);
  objc_storeStrong((id *)&self->_tlsMaximumVersion, 0);
  objc_storeStrong((id *)&self->_tlsMinimumVersion, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityHash, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityReferences, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityName, 0);
  objc_storeStrong((id *)&self->_remoteCertificateHostname, 0);
  objc_storeStrong((id *)&self->_localCertificateKeyReference, 0);
  objc_storeStrong((id *)&self->_localCertificateReference, 0);
  objc_storeStrong((id *)&self->_localCertificateName, 0);
  objc_storeStrong((id *)&self->_sharedSecretReference, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_localEncryptedEAPIdentity, 0);
  objc_storeStrong((id *)&self->_localPrivateEAPIdentity, 0);
  objc_storeStrong((id *)&self->_remoteAuthentication, 0);
  objc_storeStrong((id *)&self->_authenticationProtocol, 0);
  objc_storeStrong((id *)&self->_additionalMOBIKEAddresses, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationReply, 0);
  objc_storeStrong((id *)&self->_configurationRequest, 0);
}

- (void)copyRemoteAuthKey
{
  void *v1;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "remotePublicKeyRef"))
    {
      v1 = (void *)objc_msgSend(v1, "remotePublicKeyRef");
      CFRetain(v1);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

@end
