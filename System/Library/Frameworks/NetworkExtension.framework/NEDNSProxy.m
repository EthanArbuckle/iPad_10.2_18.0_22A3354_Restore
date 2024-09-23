@implementation NEDNSProxy

- (NEDNSProxy)init
{
  NEDNSProxy *v2;
  NEDNSProxy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEDNSProxy;
  v2 = -[NEDNSProxy init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NEDNSProxy setEnabled:](v2, "setEnabled:", 0);
  return v3;
}

- (NEDNSProxy)initWithCoder:(id)a3
{
  id v4;
  NEDNSProxy *v5;
  uint64_t v6;
  NEDNSProxyProviderProtocol *protocol;
  uint64_t v8;
  NEPerApp *perApp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEDNSProxy;
  v5 = -[NEDNSProxy init](&v11, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Protocol"));
    v6 = objc_claimAutoreleasedReturnValue();
    protocol = v5->_protocol;
    v5->_protocol = (NEDNSProxyProviderProtocol *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PerApp"));
    v8 = objc_claimAutoreleasedReturnValue();
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSProxy isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  -[NEDNSProxy protocol](self, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Protocol"));

  -[NEDNSProxy perApp](self, "perApp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PerApp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEDNSProxy *v4;
  void *v5;
  void *v6;

  v4 = -[NEDNSProxy init](+[NEDNSProxy allocWithZone:](NEDNSProxy, "allocWithZone:", a3), "init");
  -[NEDNSProxy setEnabled:](v4, "setEnabled:", -[NEDNSProxy isEnabled](self, "isEnabled"));
  -[NEDNSProxy protocol](self, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSProxy setProtocol:](v4, "setProtocol:", v5);

  -[NEDNSProxy perApp](self, "perApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSProxy setPerApp:](v4, "setPerApp:", v6);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[NEDNSProxy protocol](self, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (!v5)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing protocol"), v4);
  -[NEDNSProxy protocol](self, "protocol");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NEDNSProxy protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "checkValidityAndCollectErrors:", v4);

    if (v5)
      v6 = v10;
    else
      v6 = 0;
  }
  -[NEDNSProxy perApp](self, "perApp");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[NEDNSProxy perApp](self, "perApp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "checkValidityAndCollectErrors:", v4);

    v6 &= v14;
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSProxy isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEDNSProxy protocol](self, "protocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("protocol"), v5, a4);

  -[NEDNSProxy perApp](self, "perApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("per-app"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEDNSProxy descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NEDNSProxyProviderProtocol)protocol
{
  return (NEDNSProxyProviderProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPerApp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perApp, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
