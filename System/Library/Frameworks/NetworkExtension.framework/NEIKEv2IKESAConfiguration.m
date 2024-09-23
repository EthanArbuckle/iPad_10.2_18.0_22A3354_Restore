@implementation NEIKEv2IKESAConfiguration

- (NEIKEv2IKESAConfiguration)init
{
  NEIKEv2IKESAConfiguration *v2;
  NEIKEv2IKESAConfiguration *v3;
  NEIKEv2IKESAConfiguration *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2IKESAConfiguration;
  v2 = -[NEIKEv2IKESAConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2IKESAConfiguration setNonceSize:](v2, "setNonceSize:", 16);
    -[NEIKEv2IKESAConfiguration setMaximumPacketSize:](v3, "setMaximumPacketSize:", 0);
    -[NEIKEv2IKESAConfiguration setHeaderOverhead:](v3, "setHeaderOverhead:", 0xFFFFFFFFLL);
    v4 = v3;
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

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEIKEv2IKESAConfiguration localEndpoint](self, "localEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Local Endpoint"), v5, a4);

  -[NEIKEv2IKESAConfiguration remoteEndpoint](self, "remoteEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("Remote Endpoint"), v5, a4);

  -[NEIKEv2IKESAConfiguration outgoingInterfaceName](self, "outgoingInterfaceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Outgoing Interface"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"), CFSTR("Randomize Local Port"), v5, a4);
  -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Proposals"), v5, a4);

  -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("Custom Payloads"), v5, a4);

  -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("Vendor Payloads"), v5, a4);

  -[NEIKEv2IKESAConfiguration redirectedFromServer](self, "redirectedFromServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("Redirected From"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"), CFSTR("Allow Redirect"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"), CFSTR("Disable NAT Ports"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"), CFSTR("Force UDP Encapsulation"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"), CFSTR("Server Mode"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"), CFSTR("Prefer Initiator Proposal Order"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"), CFSTR("Nonce Size"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"), CFSTR("Request PPK"), v5, a4);
  -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Extra Supported Signature Hashes"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEIKEv2IKESAConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2IKESAConfiguration localEndpoint](self, "localEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocalEndpoint:", v6);

  -[NEIKEv2IKESAConfiguration remoteEndpoint](self, "remoteEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setRemoteEndpoint:", v8);

  -[NEIKEv2IKESAConfiguration outgoingInterfaceName](self, "outgoingInterfaceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setOutgoingInterfaceName:", v10);

  objc_msgSend(v4, "setRandomizeLocalPort:", -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"));
  objc_msgSend(v4, "setServerMode:", -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"));
  objc_msgSend(v4, "setAllowRedirect:", -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"));
  objc_msgSend(v4, "setDisableSwitchToNATTPorts:", -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"));
  objc_msgSend(v4, "setAllowTCPEncapsulation:", -[NEIKEv2IKESAConfiguration allowTCPEncapsulation](self, "allowTCPEncapsulation"));
  objc_msgSend(v4, "setUseTLSForTCPEncapsulation:", -[NEIKEv2IKESAConfiguration useTLSForTCPEncapsulation](self, "useTLSForTCPEncapsulation"));
  objc_msgSend(v4, "setForceUDPEncapsulation:", -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"));
  objc_msgSend(v4, "setPreferInitiatorProposalOrder:", -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  objc_msgSend(v4, "setTcpEncapsulationPort:", -[NEIKEv2IKESAConfiguration tcpEncapsulationPort](self, "tcpEncapsulationPort"));
  objc_msgSend(v4, "setNonceSize:", -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"));
  objc_msgSend(v4, "setStrictNonceSizeChecks:", -[NEIKEv2IKESAConfiguration strictNonceSizeChecks](self, "strictNonceSizeChecks"));
  -[NEIKEv2IKESAConfiguration redirectedFromServer](self, "redirectedFromServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setRedirectedFromServer:", v12);

  -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
    objc_msgSend(v4, "setProposals:", v16);

  }
  -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 1);
    objc_msgSend(v4, "setCustomIKESAInitPayloads:", v20);

  }
  -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArray:copyItems:", v23, 1);
    objc_msgSend(v4, "setCustomIKESAInitVendorPayloads:", v24);

  }
  objc_msgSend(v4, "setMaximumPacketSize:", -[NEIKEv2IKESAConfiguration maximumPacketSize](self, "maximumPacketSize"));
  objc_msgSend(v4, "setHeaderOverhead:", -[NEIKEv2IKESAConfiguration headerOverhead](self, "headerOverhead"));
  objc_msgSend(v4, "setRequestChildlessSA:", -[NEIKEv2IKESAConfiguration requestChildlessSA](self, "requestChildlessSA"));
  objc_msgSend(v4, "setRequestPPK:", -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"));
  -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithSet:copyItems:", v27, 1);
    objc_msgSend(v4, "setExtraSupportedSignatureHashes:", v28);

  }
  -[NEIKEv2IKESAConfiguration supportedSecurePasswordMethods](self, "supportedSecurePasswordMethods");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NEIKEv2IKESAConfiguration supportedSecurePasswordMethods](self, "supportedSecurePasswordMethods");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithSet:copyItems:", v31, 1);
    objc_msgSend(v4, "setSupportedSecurePasswordMethods:", v32);

  }
  return v4;
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (void)setProposals:(id)a3
{
  NSArray *v4;
  NSArray *proposals;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  proposals = self->_proposals;
  self->_proposals = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_proposals;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12)
          *(_BYTE *)(v12 + 8) = v9;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemoteEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)outgoingInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOutgoingInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)randomizeLocalPort
{
  return self->_randomizeLocalPort;
}

- (void)setRandomizeLocalPort:(BOOL)a3
{
  self->_randomizeLocalPort = a3;
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (BOOL)allowRedirect
{
  return self->_allowRedirect;
}

- (void)setAllowRedirect:(BOOL)a3
{
  self->_allowRedirect = a3;
}

- (BOOL)disableSwitchToNATTPorts
{
  return self->_disableSwitchToNATTPorts;
}

- (void)setDisableSwitchToNATTPorts:(BOOL)a3
{
  self->_disableSwitchToNATTPorts = a3;
}

- (BOOL)allowTCPEncapsulation
{
  return self->_allowTCPEncapsulation;
}

- (void)setAllowTCPEncapsulation:(BOOL)a3
{
  self->_allowTCPEncapsulation = a3;
}

- (BOOL)useTLSForTCPEncapsulation
{
  return self->_useTLSForTCPEncapsulation;
}

- (void)setUseTLSForTCPEncapsulation:(BOOL)a3
{
  self->_useTLSForTCPEncapsulation = a3;
}

- (BOOL)forceUDPEncapsulation
{
  return self->_forceUDPEncapsulation;
}

- (void)setForceUDPEncapsulation:(BOOL)a3
{
  self->_forceUDPEncapsulation = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (unsigned)tcpEncapsulationPort
{
  return self->_tcpEncapsulationPort;
}

- (void)setTcpEncapsulationPort:(unsigned __int16)a3
{
  self->_tcpEncapsulationPort = a3;
}

- (unsigned)nonceSize
{
  return self->_nonceSize;
}

- (void)setNonceSize:(unsigned int)a3
{
  self->_nonceSize = a3;
}

- (BOOL)strictNonceSizeChecks
{
  return self->_strictNonceSizeChecks;
}

- (void)setStrictNonceSizeChecks:(BOOL)a3
{
  self->_strictNonceSizeChecks = a3;
}

- (NWAddressEndpoint)redirectedFromServer
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRedirectedFromServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)customIKESAInitPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCustomIKESAInitPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)customIKESAInitVendorPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCustomIKESAInitVendorPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unsigned)maximumPacketSize
{
  return self->_maximumPacketSize;
}

- (void)setMaximumPacketSize:(unsigned int)a3
{
  self->_maximumPacketSize = a3;
}

- (unsigned)headerOverhead
{
  return self->_headerOverhead;
}

- (void)setHeaderOverhead:(unsigned int)a3
{
  self->_headerOverhead = a3;
}

- (BOOL)requestChildlessSA
{
  return self->_requestChildlessSA;
}

- (void)setRequestChildlessSA:(BOOL)a3
{
  self->_requestChildlessSA = a3;
}

- (BOOL)requestPPK
{
  return self->_requestPPK;
}

- (void)setRequestPPK:(BOOL)a3
{
  self->_requestPPK = a3;
}

- (NSSet)extraSupportedSignatureHashes
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExtraSupportedSignatureHashes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)supportedSecurePasswordMethods
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSupportedSecurePasswordMethods:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSecurePasswordMethods, 0);
  objc_storeStrong((id *)&self->_extraSupportedSignatureHashes, 0);
  objc_storeStrong((id *)&self->_customIKESAInitVendorPayloads, 0);
  objc_storeStrong((id *)&self->_customIKESAInitPayloads, 0);
  objc_storeStrong((id *)&self->_redirectedFromServer, 0);
  objc_storeStrong((id *)&self->_outgoingInterfaceName, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_proposals, 0);
}

@end
