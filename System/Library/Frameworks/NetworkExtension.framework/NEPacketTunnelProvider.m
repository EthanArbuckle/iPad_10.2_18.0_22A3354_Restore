@implementation NEPacketTunnelProvider

- (NEPacketTunnelProvider)init
{
  return -[NEPacketTunnelProvider initWithVirtualInterfaceType:](self, "initWithVirtualInterfaceType:", 1);
}

- (NEPacketTunnelProvider)initWithVirtualInterfaceType:(int64_t)a3
{
  NEPacketTunnelProvider *v4;
  NEPacketTunnelFlow *v5;
  NEPacketTunnelProvider *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NEExtensionProviderContext *context;
  NEPacketTunnelFlow *packetFlow;
  objc_super v13;
  objc_super v14;

  v13.receiver = self;
  v13.super_class = (Class)NEPacketTunnelProvider;
  v4 = -[NEProvider initAllowUnentitled:](&v13, sel_initAllowUnentitled_, 0);
  if (v4)
  {
    v5 = [NEPacketTunnelFlow alloc];
    if (v5)
    {
      v14.receiver = v5;
      v14.super_class = (Class)NEPacketTunnelFlow;
      v6 = -[NEProvider init](&v14, sel_init);
      if (v6)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v7 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = dispatch_queue_create("NEPacketTunnelFlow queue", v8);
        context = v6->super.super._context;
        v6->super.super._context = (NEExtensionProviderContext *)v9;

        v6[1].super.super._defaultPath = (NWPath *)a3;
      }
    }
    else
    {
      v6 = 0;
    }
    packetFlow = v4->_packetFlow;
    v4->_packetFlow = (NEPacketTunnelFlow *)v6;

  }
  return v4;
}

- (OS_nw_interface)virtualInterface
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = 0;
    v4 = 0;
LABEL_6:

    return (OS_nw_interface *)v4;
  }
  v4 = (void *)v3[11];

  if (v4)
  {
    -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v5 = *(_QWORD *)(v5 + 88);
    NEVirtualInterfaceGetIndex(v5);
    v4 = (void *)nw_interface_create_with_index();
    goto LABEL_6;
  }
  return (OS_nw_interface *)v4;
}

- (NWTCPConnection)createTCPConnectionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  _BOOL8 v7;
  NWTLSParameters *v10;
  objc_class *v11;
  id v12;
  NWEndpoint *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = enableTLS;
  v10 = TLSParameters;
  v11 = (objc_class *)MEMORY[0x1E0CCECA0];
  v12 = delegate;
  v13 = remoteEndpoint;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setEnableTLS:", v7);
  if (v10 && v7)
  {
    -[NWTLSParameters TLSSessionID](v10, "TLSSessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTLSSessionID:", v15);

    -[NWTLSParameters SSLCipherSuites](v10, "SSLCipherSuites");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSSLCipherSuites:", v16);

    objc_msgSend(v14, "setMinimumSSLProtocolVersion:", -[NWTLSParameters minimumSSLProtocolVersion](v10, "minimumSSLProtocolVersion"));
    objc_msgSend(v14, "setMaximumSSLProtocolVersion:", -[NWTLSParameters maximumSSLProtocolVersion](v10, "maximumSSLProtocolVersion"));
  }
  -[NEPacketTunnelProvider getTunnelInterface](self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRequiredInterface:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD0]), "initWithEndpoint:parameters:delegate:", v13, v14, v12);
  return (NWTCPConnection *)v18;
}

- (NWUDPSession)createUDPSessionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  NWHostEndpoint *v6;
  objc_class *v7;
  NWEndpoint *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = localEndpoint;
  v7 = (objc_class *)MEMORY[0x1E0CCECA0];
  v8 = remoteEndpoint;
  v9 = objc_alloc_init(v7);
  if (v6)
  {
    v10 = (void *)MEMORY[0x1E0CCEC58];
    -[NWHostEndpoint hostname](v6, "hostname");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWHostEndpoint port](v6, "port");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpointWithHostname:port:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocalAddress:", v13);

  }
  -[NEPacketTunnelProvider getTunnelInterface](self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequiredInterface:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD8]), "initWithEndpoint:parameters:", v8, v9);
  return (NWUDPSession *)v15;
}

- (void)cancelTunnelWithError:(NSError *)error
{
  NSError *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEPacketTunnelProvider *v8;
  __int16 v9;
  NSError *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = error;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: canceling with error %@", (uint8_t *)&v7, 0x16u);
  }

  -[NEProvider context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelWithError:", v4);

}

- (void)startTunnelWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  NSDictionary *v6;
  void (**v7)(void *, _QWORD);
  NSObject *v8;
  int v9;
  NEPacketTunnelProvider *v10;
  __int16 v11;
  NSDictionary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = options;
  v7 = completionHandler;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)stopTunnelWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  NEPacketTunnelProvider *v9;
  __int16 v10;
  NEProviderStopReason v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = completionHandler;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = reason;
    _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: Stopping with reason %ld", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6);
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  int v19;
  NEPacketTunnelProvider *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v10 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = "PFKey";
    v19 = 138412802;
    v20 = self;
    if (v10)
      v17 = "IKE";
    v21 = 2080;
    v22 = v17;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_INFO, "%@: Getting %s Socket for Interface %@", (uint8_t *)&v19, 0x20u);
  }

  -[NEProvider context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestSocket:interface:local:remote:completionHandler:", v10, v12, v15, v14, v13);

}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v7;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  objc_msgSend(v9, "IPv4Settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (objc_msgSend(v9, "IPv4Settings"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "configMethod") == 3))
  {
    objc_msgSend(v9, "IPv6Settings");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (v10)
      {

      }
      goto LABEL_16;
    }
    v12 = (void *)v11;
    objc_msgSend(v9, "IPv6Settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "configMethod");

    if (v10)
    {

    }
    if (v14 == 2)
    {
LABEL_16:
      v21.receiver = self;
      v21.super_class = (Class)NEPacketTunnelProvider;
      -[NETunnelProvider setTunnelNetworkSettings:completionHandler:](&v21, sel_setTunnelNetworkSettings_completionHandler_, v9, v8);
      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Non-manual IP addressing can only be used with NEEthernetTunnelNetworkSettings");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = (const __CFString **)v25;
    v18 = &v24;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v22 = *MEMORY[0x1E0CB2D50];
  v23 = CFSTR("Non-manual IP addressing can only be used with NEEthernetTunnelProvider");
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = &v23;
  v18 = &v22;
LABEL_13:
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v20);
LABEL_17:

}

- (NEPacketTunnelFlow)packetFlow
{
  return (NEPacketTunnelFlow *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPacketFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetFlow, 0);
}

- (id)getTunnelInterface
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  objc_msgSend(a1, "packetFlow");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = 0;
    v3 = 0;
LABEL_9:

    return v3;
  }
  v3 = (void *)v2[11];

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CCEC88]);
    objc_msgSend(a1, "packetFlow");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5 && (v7 = *(_QWORD *)(v5 + 88)) != 0)
      v8 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)(v7 + 265), 0x600u);
    else
      v8 = 0;
    v3 = (void *)objc_msgSend(v4, "initWithInterfaceName:", v8);

    goto LABEL_9;
  }
  return v3;
}

@end
