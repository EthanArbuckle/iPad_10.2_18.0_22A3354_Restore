@implementation NEPacketTunnelNetworkSettings

- (NEPacketTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4;
  NEPacketTunnelNetworkSettings *v5;
  uint64_t v6;
  NEIPv4Settings *IPv4Settings;
  uint64_t v8;
  NEIPv6Settings *IPv6Settings;
  uint64_t v10;
  NSNumber *tunnelOverheadBytes;
  uint64_t v12;
  NSNumber *MTU;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IPv4Settings"));
    v6 = objc_claimAutoreleasedReturnValue();
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IPv6Settings"));
    v8 = objc_claimAutoreleasedReturnValue();
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TunnelOverheadBytes"));
    v10 = objc_claimAutoreleasedReturnValue();
    tunnelOverheadBytes = v5->_tunnelOverheadBytes;
    v5->_tunnelOverheadBytes = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTU"));
    v12 = objc_claimAutoreleasedReturnValue();
    MTU = v5->_MTU;
    v5->_MTU = (NSNumber *)v12;

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEPacketTunnelNetworkSettings;
  v4 = a3;
  -[NETunnelNetworkSettings encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("IPv4Settings"));

  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("IPv6Settings"));

  -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("TunnelOverheadBytes"));

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MTU"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEPacketTunnelNetworkSettings;
  v4 = -[NETunnelNetworkSettings copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIPv4Settings:", v5);

  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIPv6Settings:", v6);

  -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTunnelOverheadBytes:", v7);

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMTU:", v8);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings checkValidityAndCollectErrors:](&v15, sel_checkValidityAndCollectErrors_, v4);
  -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "checkValidityAndCollectErrors:", v4);

    v5 &= v9;
  }
  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4);

    v5 &= v13;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  -[NETunnelNetworkSettings descriptionWithIndent:options:](&v15, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("IPv4Settings"), v5, a4);

  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("IPv6Settings"), v5, a4);

  -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("tunnelOverheadBytes"), v5, a4);

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("MTU"), v5, a4);

  return v9;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("{"));
  -[NEPacketTunnelNetworkSettings descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v4;
  _QWORD *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const void *v13;
  __CFDictionary *MutableCopy;
  __CFDictionary *v15;
  id v16;
  NSObject *v17;
  _QWORD *v18;
  id v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  const void *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  id v25;
  id v26;
  uint8_t v28[16];
  objc_super v29;

  v4 = (const __CFDictionary *)a3;
  v29.receiver = self;
  v29.super_class = (Class)NEPacketTunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings initFromLegacyDictionary:](&v29, sel_initFromLegacyDictionary_, v4);
  if (!v5)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_22;
  }
  v6 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8BB0], CFDICTIONARY_TYPE);
  if (!v6)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "legacy dictionary is missing a VPN dictionary", v28, 2u);
    }

    goto LABEL_13;
  }
  v7 = v6;
  v8 = (const void *)*MEMORY[0x1E0CE9000];
  if (NEGetValueWithType(v6, (const void *)*MEMORY[0x1E0CE9000], CFNUMBER_TYPE))
  {
    NEGetValueWithType(v7, v8, CFNUMBER_TYPE);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v5[7];
    v5[7] = v9;

  }
  v11 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8B78], CFDICTIONARY_TYPE);
  if (v11)
  {
    v12 = v11;
    if (CFDictionaryGetCount(v11) >= 1)
    {
      v13 = (const void *)*MEMORY[0x1E0CE8CD8];
      if (CFDictionaryContainsKey(v12, (const void *)*MEMORY[0x1E0CE8CD8]))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12);
        if (MutableCopy)
        {
          v15 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, v13);
          v16 = -[NEIPv4Settings initFromLegacyDictionary:]([NEIPv4Settings alloc], "initFromLegacyDictionary:", v15);
          objc_msgSend(v5, "setIPv4Settings:", v16);

          CFRelease(v15);
        }
      }
      else
      {
        v19 = -[NEIPv4Settings initFromLegacyDictionary:]([NEIPv4Settings alloc], "initFromLegacyDictionary:", v12);
        objc_msgSend(v5, "setIPv4Settings:", v19);

      }
    }
  }
  v20 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8B80], CFDICTIONARY_TYPE);
  if (v20)
  {
    v21 = v20;
    if (CFDictionaryGetCount(v20) >= 1)
    {
      v22 = (const void *)*MEMORY[0x1E0CE8D30];
      if (CFDictionaryContainsKey(v21, (const void *)*MEMORY[0x1E0CE8D30]))
      {
        v23 = CFDictionaryCreateMutableCopy(0, 0, v21);
        if (v23)
        {
          v24 = v23;
          CFDictionaryRemoveValue(v23, v22);
          v25 = -[NEIPv6Settings initFromLegacyDictionary:]([NEIPv6Settings alloc], "initFromLegacyDictionary:", v24);
          objc_msgSend(v5, "setIPv6Settings:", v25);

          CFRelease(v24);
        }
      }
      else
      {
        v26 = -[NEIPv6Settings initFromLegacyDictionary:]([NEIPv6Settings alloc], "initFromLegacyDictionary:", v21);
        objc_msgSend(v5, "setIPv6Settings:", v26);

      }
    }
  }
  v18 = v5;
LABEL_22:

  return v18;
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIPv4Settings:(NEIPv4Settings *)IPv4Settings
{
  objc_setProperty_atomic_copy(self, a2, IPv4Settings, 32);
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIPv6Settings:(NEIPv6Settings *)IPv6Settings
{
  objc_setProperty_atomic_copy(self, a2, IPv6Settings, 40);
}

- (NSNumber)tunnelOverheadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTunnelOverheadBytes:(NSNumber *)tunnelOverheadBytes
{
  objc_setProperty_atomic_copy(self, a2, tunnelOverheadBytes, 48);
}

- (NSNumber)MTU
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMTU:(NSNumber *)MTU
{
  objc_setProperty_atomic_copy(self, a2, MTU, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MTU, 0);
  objc_storeStrong((id *)&self->_tunnelOverheadBytes, 0);
  objc_storeStrong((id *)&self->_IPv6Settings, 0);
  objc_storeStrong((id *)&self->_IPv4Settings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
