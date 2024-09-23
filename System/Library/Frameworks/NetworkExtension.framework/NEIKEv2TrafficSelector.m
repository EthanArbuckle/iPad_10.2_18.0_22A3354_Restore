@implementation NEIKEv2TrafficSelector

- (NEIKEv2TrafficSelector)init
{
  NEIKEv2TrafficSelector *v2;
  NEIKEv2TrafficSelector *v3;
  NEIKEv2TrafficSelector *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2TrafficSelector;
  v2 = -[NEIKEv2TrafficSelector init](&v8, sel_init);
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NEIKEv2TrafficSelector startAddress](self, "startAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEIKEv2TrafficSelector startPort](self, "startPort");
  -[NEIKEv2TrafficSelector endAddress](self, "endAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ : %u -> %@ : %u (%u)"), v5, v6, v8, -[NEIKEv2TrafficSelector endPort](self, "endPort"), -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol"));

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2TrafficSelector startAddress](self, "startAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStartAddress:", v6);

  -[NEIKEv2TrafficSelector endAddress](self, "endAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setEndAddress:", v8);

  objc_msgSend(v4, "setStartPort:", -[NEIKEv2TrafficSelector startPort](self, "startPort"));
  objc_msgSend(v4, "setEndPort:", -[NEIKEv2TrafficSelector endPort](self, "endPort"));
  objc_msgSend(v4, "setIpProtocol:", -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol"));
  return v4;
}

- (NWAddressEndpoint)startAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NWAddressEndpoint)endAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)startPort
{
  return self->_startPort;
}

- (void)setStartPort:(unsigned __int16)a3
{
  self->_startPort = a3;
}

- (unsigned)endPort
{
  return self->_endPort;
}

- (void)setEndPort:(unsigned __int16)a3
{
  self->_endPort = a3;
}

- (unsigned)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unsigned __int8)a3
{
  self->_ipProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
}

+ (id)copyAllIPv6
{
  NEIKEv2TrafficSelector *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(NEIKEv2TrafficSelector);
  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::"), CFSTR("0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setStartAddress:](v2, "setStartAddress:", v3);

  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"), CFSTR("0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setEndAddress:](v2, "setEndAddress:", v4);

  -[NEIKEv2TrafficSelector setStartPort:](v2, "setStartPort:", 0);
  -[NEIKEv2TrafficSelector setEndPort:](v2, "setEndPort:", 0xFFFFLL);
  -[NEIKEv2TrafficSelector setIpProtocol:](v2, "setIpProtocol:", 0);
  return v2;
}

+ (id)copyAllIPv4
{
  NEIKEv2TrafficSelector *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(NEIKEv2TrafficSelector);
  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("0.0.0.0"), CFSTR("0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setStartAddress:](v2, "setStartAddress:", v3);

  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("255.255.255.255"), CFSTR("0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setEndAddress:](v2, "setEndAddress:", v4);

  -[NEIKEv2TrafficSelector setStartPort:](v2, "setStartPort:", 0);
  -[NEIKEv2TrafficSelector setEndPort:](v2, "setEndPort:", 0xFFFFLL);
  -[NEIKEv2TrafficSelector setIpProtocol:](v2, "setIpProtocol:", 0);
  return v2;
}

- (uint64_t)type
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  if (result)
  {
    v1 = (void *)result;
    objc_msgSend((id)result, "startAddress");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(v1, "endAddress");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        objc_msgSend(v1, "startAddress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "addressFamily");
        objc_msgSend(v1, "endAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "addressFamily");

        if (v7 == v9)
        {
          objc_msgSend(v1, "startAddress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "addressFamily");

          if (v11 == 2)
            return 7;
          objc_msgSend(v1, "startAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "addressFamily");

          if (v13 == 30)
            return 8;
        }
      }
      else
      {

      }
    }
    return 0;
  }
  return result;
}

+ (id)copyConstrainedTrafficSelectorsForRequest:(void *)a3 reply:
{
  id v4;
  id v5;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (!a2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v5 = 0;
      goto LABEL_4;
    }
    v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    v8 = "%s called with null request";
LABEL_10:
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_8;
  }
  if (!v4)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    v8 = "%s called with null reply";
    goto LABEL_10;
  }
  v5 = v4;
LABEL_4:

  return v5;
}

@end
