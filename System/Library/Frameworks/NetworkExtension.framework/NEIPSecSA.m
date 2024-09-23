@implementation NEIPSecSA

- (id)initOutboundSAWithSPI:(unsigned int)a3
{
  NEIPSecSA *v4;
  NEIPSecSA *v5;
  NEIPSecSA *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSA;
  v4 = -[NEIPSecSA init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 1;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)initInboundSAWithSPI:(unsigned int)a3
{
  NEIPSecSA *v4;
  NEIPSecSA *v5;
  NEIPSecSA *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSA;
  v4 = -[NEIPSecSA init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 2;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)initInboundSA
{
  NEIPSecSA *v2;
  NEIPSecSA *v3;
  NEIPSecSA *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIPSecSA;
  v2 = -[NEIPSecSA init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_direction = 2;
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v5 = objc_msgSend(v4, "spi"), v5 == -[NEIPSecSA spi](self, "spi"))
    && (v6 = objc_msgSend(v4, "direction"), v6 == -[NEIPSecSA direction](self, "direction"))
    && (v7 = objc_msgSend(v4, "mode"), v7 == -[NEIPSecSA mode](self, "mode")))
  {
    v8 = objc_msgSend(v4, "protocol");
    v9 = v8 == -[NEIPSecSA protocol](self, "protocol");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NEIPSecSA spi](self, "spi");
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5;
  NEIPSecSA *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int internalSAID;
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

  v5 = -[NEIPSecSA direction](self, "direction");
  v6 = +[NEIPSecSA allocWithZone:](NEIPSecSA, "allocWithZone:", a3);
  v7 = -[NEIPSecSA spi](self, "spi");
  if (v5 == 1)
    v8 = -[NEIPSecSA initOutboundSAWithSPI:](v6, "initOutboundSAWithSPI:", v7);
  else
    v8 = -[NEIPSecSA initInboundSAWithSPI:](v6, "initInboundSAWithSPI:", v7);
  v9 = (void *)v8;
  if (!self)
  {
    internalSAID = 0;
    if (v8)
      goto LABEL_6;
LABEL_9:
    -[NEIPSecSA spi](self, "spi");
    goto LABEL_7;
  }
  internalSAID = self->_internalSAID;
  if (!v8)
    goto LABEL_9;
LABEL_6:
  *(_DWORD *)(v8 + 48) = internalSAID;
  *(_DWORD *)(v8 + 20) = -[NEIPSecSA spi](self, "spi");
LABEL_7:
  objc_msgSend(v9, "setMode:", -[NEIPSecSA mode](self, "mode"));
  objc_msgSend(v9, "setProtocol:", -[NEIPSecSA protocol](self, "protocol"));
  -[NEIPSecSA localAddress](self, "localAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalAddress:", v11);

  -[NEIPSecSA remoteAddress](self, "remoteAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteAddress:", v12);

  -[NEIPSecSA boundInterfaceName](self, "boundInterfaceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  objc_msgSend(v9, "setBoundInterfaceName:", v14);

  -[NEIPSecSA tunnelInterfaceName](self, "tunnelInterfaceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v9, "setTunnelInterfaceName:", v16);

  objc_msgSend(v9, "setReplayWindowSize:", -[NEIPSecSA replayWindowSize](self, "replayWindowSize"));
  objc_msgSend(v9, "setLifetimeSeconds:", -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"));
  objc_msgSend(v9, "setEncryptionAlgorithm:", -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"));
  -[NEIPSecSA encryptionKey](self, "encryptionKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  objc_msgSend(v9, "setEncryptionKey:", v18);

  objc_msgSend(v9, "setAuthenticationAlgorithm:", -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"));
  -[NEIPSecSA authenticationKey](self, "authenticationKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyWithZone:", a3);
  objc_msgSend(v9, "setAuthenticationKey:", v20);

  objc_msgSend(v9, "setNatTraversalEnabled:", -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"));
  objc_msgSend(v9, "setNatDetectedOnPeer:", -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"));
  objc_msgSend(v9, "setNatKeepaliveEnabled:", -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"));
  objc_msgSend(v9, "setNatKeepaliveOffloadEnabled:", -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"));
  objc_msgSend(v9, "setNatKeepaliveIntervalSeconds:", -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"));
  objc_msgSend(v9, "setNatKeepaliveOffloadIntervalSeconds:", -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"));
  objc_msgSend(v9, "setNatTraversalPort:", -[NEIPSecSA natTraversalPort](self, "natTraversalPort"));
  objc_msgSend(v9, "setNatTraversalSrcPort:", -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"));
  objc_msgSend(v9, "setSequencePerTrafficClass:", -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  return v9;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  uint64_t internalSAID;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  unsigned int v13;
  __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = v7;
  if (self)
    internalSAID = self->_internalSAID;
  else
    internalSAID = 0;
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", internalSAID, CFSTR("Internal SAID"), v5, a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%08X"), bswap32(-[NEIPSecSA spi](self, "spi")));
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("SPI"), v5, a4);

  v11 = -[NEIPSecSA direction](self, "direction");
  if (v11 == 1)
  {
    v12 = CFSTR("Outbound");
  }
  else if (v11 == 2)
  {
    v12 = CFSTR("Inbound");
  }
  else
  {
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v11);
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("Direction"), v5, a4);

  v13 = -[NEIPSecSA mode](self, "mode");
  if (v13 == 1)
  {
    v14 = CFSTR("Transport");
  }
  else if (v13 == 2)
  {
    v14 = CFSTR("Tunnel");
  }
  else
  {
    v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v13);
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("Mode"), v5, a4);

  v15 = -[NEIPSecSA protocol](self, "protocol");
  if (v15 == 1)
  {
    v16 = CFSTR("ESP");
  }
  else if (v15 == 2)
  {
    v16 = CFSTR("AH");
  }
  else
  {
    v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v15);
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("Protocol"), v5, a4);

  -[NEIPSecSA localAddress](self, "localAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("Local"), v5, a4);

  -[NEIPSecSA remoteAddress](self, "remoteAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("Remote"), v5, a4);

  -[NEIPSecSA boundInterfaceName](self, "boundInterfaceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("Bound Interface"), v5, a4);

  -[NEIPSecSA tunnelInterfaceName](self, "tunnelInterfaceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("Tunnel Interface"), v5, a4);

  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA replayWindowSize](self, "replayWindowSize"), CFSTR("Replay Window Size"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"), CFSTR("Lifetime Seconds"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"), CFSTR("Encryption Algorithm"), v5, a4);
  -[NEIPSecSA encryptionKey](self, "encryptionKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", objc_msgSend(v21, "length"), CFSTR("Encryption Key Length"), v5, a4);

  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"), CFSTR("Authentication Algorithm"), v5, a4);
  -[NEIPSecSA authenticationKey](self, "authenticationKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", objc_msgSend(v22, "length"), CFSTR("Authentication Key Length"), v5, a4);

  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"), CFSTR("NAT Traversal Enabled"), v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"), CFSTR("NAT Detected on Peer"), v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"), CFSTR("NAT Keepalive Enabled"), v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"), CFSTR("NAT Keepalive Offload Enabled"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"), CFSTR("NAT Keepalive Interval Seconds"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"), CFSTR("NAT Keepalive Offload Interval Seconds"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natTraversalPort](self, "natTraversalPort"), CFSTR("NAT Traversal Port"), v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"), CFSTR("NAT Traversal Source Port"), v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"), CFSTR("Sequence Per Traffic Class"), v5, a4);
  return v8;
}

- (id)description
{
  return -[NEIPSecSA descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  NEIPSecSA *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "Invalidate %@", (uint8_t *)&v4, 0xCu);
  }

  -[NEIPSecSA setEncryptionKey:](self, "setEncryptionKey:", 0);
  -[NEIPSecSA setAuthenticationKey:](self, "setAuthenticationKey:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NEIPSecSA invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NEIPSecSA;
  -[NEIPSecSA dealloc](&v3, sel_dealloc);
}

- (unsigned)spi
{
  return self->_spi;
}

- (int)direction
{
  return self->_direction;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int)a3
{
  self->_protocol = a3;
}

- (NWAddressEndpoint)localAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NWAddressEndpoint)remoteAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)boundInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBoundInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)tunnelInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTunnelInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (int)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(int)a3
{
  self->_encryptionAlgorithm = a3;
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)authenticationAlgorithm
{
  return self->_authenticationAlgorithm;
}

- (void)setAuthenticationAlgorithm:(int)a3
{
  self->_authenticationAlgorithm = a3;
}

- (NSData)authenticationKey
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAuthenticationKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)natTraversalEnabled
{
  return self->_natTraversalEnabled;
}

- (void)setNatTraversalEnabled:(BOOL)a3
{
  self->_natTraversalEnabled = a3;
}

- (BOOL)natDetectedOnPeer
{
  return self->_natDetectedOnPeer;
}

- (void)setNatDetectedOnPeer:(BOOL)a3
{
  self->_natDetectedOnPeer = a3;
}

- (BOOL)natKeepaliveEnabled
{
  return self->_natKeepaliveEnabled;
}

- (void)setNatKeepaliveEnabled:(BOOL)a3
{
  self->_natKeepaliveEnabled = a3;
}

- (BOOL)natKeepaliveOffloadEnabled
{
  return self->_natKeepaliveOffloadEnabled;
}

- (void)setNatKeepaliveOffloadEnabled:(BOOL)a3
{
  self->_natKeepaliveOffloadEnabled = a3;
}

- (unint64_t)natKeepaliveIntervalSeconds
{
  return self->_natKeepaliveIntervalSeconds;
}

- (void)setNatKeepaliveIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveIntervalSeconds = a3;
}

- (unint64_t)natKeepaliveOffloadIntervalSeconds
{
  return self->_natKeepaliveOffloadIntervalSeconds;
}

- (void)setNatKeepaliveOffloadIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveOffloadIntervalSeconds = a3;
}

- (unsigned)natTraversalPort
{
  return self->_natTraversalPort;
}

- (void)setNatTraversalPort:(unsigned __int16)a3
{
  self->_natTraversalPort = a3;
}

- (unsigned)natTraversalSrcPort
{
  return self->_natTraversalSrcPort;
}

- (void)setNatTraversalSrcPort:(unsigned __int16)a3
{
  self->_natTraversalSrcPort = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_tunnelInterfaceName, 0);
  objc_storeStrong((id *)&self->_boundInterfaceName, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
}

- (id)createDictionary
{
  id v2;
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
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(a1, "spi"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(objc_msgSend(a1, "spi")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("SPIValue"));

  }
  objc_msgSend(a1, "localAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "localAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("LocalAddress"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "localAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "port");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("LocalPort"));

  }
  objc_msgSend(a1, "remoteAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "remoteAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostname");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("RemoteAddress"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "remoteAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "port");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("RemotePort"));

  }
  objc_msgSend(a1, "boundInterfaceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "boundInterfaceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("OutgoingInterface"));

  }
  objc_msgSend(a1, "tunnelInterfaceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(a1, "tunnelInterfaceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("IPSecInterface"));

  }
  if (objc_msgSend(a1, "mode") == 1)
  {
    v22 = CFSTR("Transport");
  }
  else
  {
    if (objc_msgSend(a1, "mode") != 2)
      goto LABEL_17;
    v22 = CFSTR("Tunnel");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("Mode"));
LABEL_17:
  if (objc_msgSend(a1, "protocol") == 2)
  {
    v23 = CFSTR("AH");
  }
  else
  {
    if (objc_msgSend(a1, "protocol") != 1)
      goto LABEL_22;
    v23 = CFSTR("ESP");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("IPSecProtocol"));
LABEL_22:
  if (objc_msgSend(a1, "encryptionAlgorithm") == 1)
  {
    v24 = CFSTR("NULL");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 2)
  {
    v24 = CFSTR("DES");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 3)
  {
    v24 = CFSTR("3DES");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 4)
  {
    v24 = CFSTR("AES-128");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 5)
  {
    v24 = CFSTR("AES-256");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 6)
  {
    v24 = CFSTR("AES-128-GCM");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 7)
  {
    v24 = CFSTR("AES-256-GCM");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 8)
  {
    v24 = CFSTR("ChaCha20-Poly1305");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 9)
  {
    v24 = CFSTR("ChaCha20-Poly1305-IIV");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 10)
  {
    v24 = CFSTR("AES-128-GCM-IIV");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 11)
  {
    v24 = CFSTR("AES-256-GCM-IIV");
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 12)
  {
    v24 = CFSTR("NULL-With-AES-128-GMAC");
  }
  else
  {
    if (objc_msgSend(a1, "encryptionAlgorithm") != 13)
      goto LABEL_49;
    v24 = CFSTR("NULL-With-AES-256-GMAC");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("EncryptionAlgorithm"));
LABEL_49:
  objc_msgSend(a1, "encryptionKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("EncryptionKey"));

  if (objc_msgSend(a1, "authenticationAlgorithm") == 1)
  {
    v26 = CFSTR("MD5-96");
LABEL_59:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("AuthAlgorithm"));
    goto LABEL_60;
  }
  if (objc_msgSend(a1, "authenticationAlgorithm") == 2)
  {
    v26 = CFSTR("SHA1-96");
    goto LABEL_59;
  }
  if (objc_msgSend(a1, "authenticationAlgorithm") == 3)
  {
    v26 = CFSTR("SHA2-256");
    goto LABEL_59;
  }
  if (objc_msgSend(a1, "authenticationAlgorithm") == 4)
  {
    v26 = CFSTR("SHA2-384");
    goto LABEL_59;
  }
  if (objc_msgSend(a1, "authenticationAlgorithm") == 5)
  {
    v26 = CFSTR("SHA2-512");
    goto LABEL_59;
  }
LABEL_60:
  objc_msgSend(a1, "authenticationKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("AuthKey"));

  if (objc_msgSend(a1, "replayWindowSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "replayWindowSize"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("ReplayWindowSize"));

  }
  if (objc_msgSend(a1, "lifetimeSeconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "lifetimeSeconds"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v29, CFSTR("LifeTimeinSeconds"));

  }
  v30 = objc_msgSend(a1, "natTraversalEnabled");
  v31 = *MEMORY[0x1E0C9AE50];
  v32 = *MEMORY[0x1E0C9AE40];
  if (v30)
    v33 = *MEMORY[0x1E0C9AE50];
  else
    v33 = *MEMORY[0x1E0C9AE40];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v33, CFSTR("NATTraversal"));
  if (objc_msgSend(a1, "natDetectedOnPeer"))
    v34 = v31;
  else
    v34 = v32;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, CFSTR("NATTDetectedPeer"));
  if (objc_msgSend(a1, "natKeepaliveEnabled"))
    v35 = v31;
  else
    v35 = v32;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v35, CFSTR("NATTKeepAlive"));
  if (objc_msgSend(a1, "natKeepaliveOffloadEnabled"))
    v36 = v31;
  else
    v36 = v32;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v36, CFSTR("NATTKeepAliveOffload"));
  if (objc_msgSend(a1, "natTraversalPort"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a1, "natTraversalPort"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, CFSTR("NATTPort"));

  }
  if (objc_msgSend(a1, "natTraversalSrcPort"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a1, "natTraversalSrcPort"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v38, CFSTR("NATTSourcePort"));

  }
  if (objc_msgSend(a1, "natKeepaliveIntervalSeconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "natKeepaliveIntervalSeconds"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v39, CFSTR("NATTKeepAliveInterval"));

  }
  if (objc_msgSend(a1, "natKeepaliveOffloadIntervalSeconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "natKeepaliveOffloadIntervalSeconds"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v40, CFSTR("NATTKeepAliveOffloadInterval"));

  }
  if (objc_msgSend(a1, "sequencePerTrafficClass"))
  {
    if (objc_msgSend(a1, "sequencePerTrafficClass"))
      v41 = MEMORY[0x1E0C9AAB0];
    else
      v41 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v41, CFSTR("sequencePerTrafficClass"));
  }
  return v2;
}

@end
