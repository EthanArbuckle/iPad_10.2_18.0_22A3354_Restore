@implementation NETunnelNetworkSettings

- (NETunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address
{
  NSString *v5;
  NETunnelNetworkSettings *v6;
  NETunnelNetworkSettings *v7;
  objc_super v9;

  v5 = address;
  v9.receiver = self;
  v9.super_class = (Class)NETunnelNetworkSettings;
  v6 = -[NETunnelNetworkSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tunnelRemoteAddress, address);

  return v7;
}

- (NETunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4;
  NETunnelNetworkSettings *v5;
  uint64_t v6;
  NSString *tunnelRemoteAddress;
  uint64_t v8;
  NEDNSSettings *DNSSettings;
  uint64_t v10;
  NEProxySettings *proxySettings;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tunnelRemoteAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    tunnelRemoteAddress = v5->_tunnelRemoteAddress;
    v5->_tunnelRemoteAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNSSettings"));
    v8 = objc_claimAutoreleasedReturnValue();
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySettings"));
    v10 = objc_claimAutoreleasedReturnValue();
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tunnelRemoteAddress"));

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DNSSettings"));

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("proxySettings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTunnelRemoteAddress:", v5);

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDNSSettings:", v7);

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProxySettings:", v8);

  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  unsigned int v7;
  char v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = NEGetAddressFamilyFromString(v6);

    if (v7)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v9 = CFSTR("Invalid NETunnelNetworkSettings tunnelRemoteAddress");
  }
  else
  {
    v9 = CFSTR("Missing NETunnelNetworkSettings tunnelRemoteAddress");
  }
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v9, v4);
  v8 = 0;
LABEL_7:
  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4);

    v8 &= v13;
  }
  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "checkValidityAndCollectErrors:", v4);

    v8 &= v17;
  }

  return v8;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("tunnelRemoteAddress"), v5, a4 | 1);

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("DNSSettings"), v5, a4);

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("proxySettings"), v5, a4);

  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFString *v8;
  __CFString *v9;
  NETunnelNetworkSettings *v10;
  NETunnelNetworkSettings *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  id v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  NSObject *v17;
  const char *v19;
  const void *v20;
  const __CFArray *v21;
  objc_super v22;
  uint8_t buf[16];

  v4 = (const __CFDictionary *)a3;
  v5 = v4;
  if (!v4 || (v6 = CFDICTIONARY_TYPE, CFGetTypeID(v4) != v6))
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is not a valid dictionary";
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  v7 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E0CE8BB0], CFDICTIONARY_TYPE);
  if (!v7)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is missing a VPN dictionary";
      goto LABEL_23;
    }
LABEL_15:

    v11 = 0;
    goto LABEL_16;
  }
  v8 = (const __CFString *)NEGetValueWithType(v7, (const void *)*MEMORY[0x1E0CE90A0], CFSTRING_TYPE);
  if (!v8 || (v9 = (__CFString *)v8, !NEGetAddressFamilyFromString(v8)))
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary does not have a remote address string in its VPN dictionary";
LABEL_23:
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v19, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)NETunnelNetworkSettings;
  v10 = -[NETunnelNetworkSettings init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tunnelRemoteAddress, v9);
    v12 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E0CE8B70], CFDICTIONARY_TYPE);
    if (v12)
    {
      v13 = v12;
      if (CFDictionaryGetCount(v12) >= 1)
      {
        if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E0CE8C28])
          || (v20 = (const void *)*MEMORY[0x1E0CE8C20], CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E0CE8C20]))
          && (v21 = (const __CFArray *)NEGetValueWithType(v13, v20, CFARRAY_TYPE)) != 0
          && CFArrayGetCount(v21))
        {
          v14 = -[NEDNSSettings initFromLegacyDictionary:]([NEDNSSettings alloc], "initFromLegacyDictionary:", v13);
          -[NETunnelNetworkSettings setDNSSettings:](v11, "setDNSSettings:", v14);

        }
      }
    }
    v15 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E0CE8BA8], CFDICTIONARY_TYPE);
    if (v15)
    {
      v16 = v15;
      if (CFDictionaryGetCount(v15) >= 1)
      {
        self = -[NEProxySettings initFromLegacyDictionary:]([NEProxySettings alloc], "initFromLegacyDictionary:", v16);
        -[NETunnelNetworkSettings setProxySettings:](v11, "setProxySettings:", self);
LABEL_16:

      }
    }
  }

  return v11;
}

- (NSString)tunnelRemoteAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDNSSettings:(NEDNSSettings *)DNSSettings
{
  objc_setProperty_atomic_copy(self, a2, DNSSettings, 16);
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
{
  objc_setProperty_atomic_copy(self, a2, proxySettings, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySettings, 0);
  objc_storeStrong((id *)&self->_DNSSettings, 0);
  objc_storeStrong((id *)&self->_tunnelRemoteAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
