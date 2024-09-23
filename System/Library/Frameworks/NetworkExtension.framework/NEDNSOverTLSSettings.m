@implementation NEDNSOverTLSSettings

- (int64_t)dnsProtocol
{
  return 2;
}

- (NEDNSOverTLSSettings)initWithCoder:(id)a3
{
  id v4;
  NEDNSOverTLSSettings *v5;
  void *v6;
  uint64_t v7;
  NSString *serverName;
  uint64_t v9;
  NSData *identityReference;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverTLSSettings;
  v5 = -[NEDNSSettings initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("ServerName"));
    v7 = objc_claimAutoreleasedReturnValue();
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityReference"));
    v9 = objc_claimAutoreleasedReturnValue();
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEDNSOverTLSSettings;
  if (-[NEDNSOverTLSSettings isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEDNSOverTLSSettings serverName](self, "serverName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
    -[NEDNSOverTLSSettings identityReference](self, "identityReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "identityReference"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[NEDNSOverTLSSettings identityReference](self, "identityReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[NEDNSOverTLSSettings identityReference](self, "identityReference");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identityReference");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToData:", v13) ^ 1;

      }
      else
      {
        LOBYTE(v14) = 0;
      }

      if (v10)
        goto LABEL_15;
      v15 = 0;
    }
    else
    {
      LOBYTE(v14) = 1;
    }

LABEL_15:
    v9 = v8 & ~(_BYTE)v14;

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEDNSOverTLSSettings;
  v4 = a3;
  -[NEDNSSettings encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NEDNSOverTLSSettings serverName](self, "serverName", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ServerName"));

  -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("IdentityReference"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEDNSOverTLSSettings;
  v4 = -[NEDNSSettings copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[NEDNSOverTLSSettings serverName](self, "serverName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerName:", v5);

  -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityReference:", v6);

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)NEDNSOverTLSSettings;
  -[NEDNSSettings descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEDNSOverTLSSettings serverName](self, "serverName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("serverName"), v5, a4);

  -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("identityReference"), v5, a4);

  return v9;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEDNSOverTLSSettings;
  v5 = -[NEDNSSettings initFromLegacyDictionary:](&v10, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ServerName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsstring(v6))
    {

      v8 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v5[7];
    v5[7] = v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServerName:(NSString *)serverName
{
  objc_setProperty_atomic_copy(self, a2, serverName, 56);
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdentityReference:(NSData *)identityReference
{
  objc_setProperty_atomic_copy(self, a2, identityReference, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityReference, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
