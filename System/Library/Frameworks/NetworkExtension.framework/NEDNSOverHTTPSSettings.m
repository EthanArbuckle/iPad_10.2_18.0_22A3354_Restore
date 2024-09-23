@implementation NEDNSOverHTTPSSettings

- (int64_t)dnsProtocol
{
  return 3;
}

- (NEDNSOverHTTPSSettings)initWithCoder:(id)a3
{
  id v4;
  NEDNSOverHTTPSSettings *v5;
  void *v6;
  uint64_t v7;
  NSURL *serverURL;
  uint64_t v9;
  NSData *identityReference;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverHTTPSSettings;
  v5 = -[NEDNSSettings initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("ServerURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    serverURL = v5->_serverURL;
    v5->_serverURL = (NSURL *)v7;

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
  v17.super_class = (Class)NEDNSOverHTTPSSettings;
  if (-[NEDNSOverHTTPSSettings isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEDNSOverHTTPSSettings serverURL](self, "serverURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
    -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "identityReference"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
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
  v7.super_class = (Class)NEDNSOverHTTPSSettings;
  v4 = a3;
  -[NEDNSSettings encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NEDNSOverHTTPSSettings serverURL](self, "serverURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ServerURL"));

  -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
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
  v8.super_class = (Class)NEDNSOverHTTPSSettings;
  v4 = -[NEDNSSettings copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[NEDNSOverHTTPSSettings serverURL](self, "serverURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerURL:", v5);

  -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
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
  v13.super_class = (Class)NEDNSOverHTTPSSettings;
  -[NEDNSSettings descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEDNSOverHTTPSSettings serverURL](self, "serverURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("serverURL"), v5, a4);

  -[NEDNSOverHTTPSSettings identityReference](self, "identityReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("identityReference"), v5, a4);

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverHTTPSSettings;
  v5 = -[NEDNSSettings checkValidityAndCollectErrors:](&v12, sel_checkValidityAndCollectErrors_, v4);
  -[NEDNSOverHTTPSSettings serverURL](self, "serverURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = CFSTR("Missing server URL");
    goto LABEL_5;
  }
  -[NEDNSOverHTTPSSettings serverURL](self, "serverURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("https"));

  if ((v9 & 1) == 0)
  {
    v10 = CFSTR("Server URL does not have HTTPS scheme");
LABEL_5:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v10, v4);
    v5 = 0;
  }

  return v5;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEDNSOverHTTPSSettings;
  v5 = -[NEDNSSettings initFromLegacyDictionary:](&v11, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ServerURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v6))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {

        v9 = 0;
        goto LABEL_7;
      }
      v8 = (void *)v5[7];
      v5[7] = v7;

    }
  }
  v9 = v5;
LABEL_7:

  return v9;
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServerURL:(NSURL *)serverURL
{
  objc_setProperty_atomic_copy(self, a2, serverURL, 56);
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
  objc_storeStrong((id *)&self->_serverURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
