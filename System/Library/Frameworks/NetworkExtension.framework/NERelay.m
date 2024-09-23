@implementation NERelay

- (NERelay)init
{
  NERelay *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NERelay;
  result = -[NERelay init](&v3, sel_init);
  if (result)
    result->_keychainDomain = 0;
  return result;
}

- (NERelay)initWithCoder:(id)a3
{
  id v4;
  NERelay *v5;
  uint64_t v6;
  NSURL *HTTP3RelayURL;
  uint64_t v8;
  NSURL *HTTP2RelayURL;
  uint64_t v10;
  NSURL *dnsOverHTTPSURL;
  uint64_t v12;
  NSString *syntheticDNSAnswerIPv4Prefix;
  uint64_t v14;
  NSString *syntheticDNSAnswerIPv6Prefix;
  uint64_t v16;
  NEIdentityKeychainItem *identity;
  uint64_t v18;
  NSData *identityDataInternal;
  uint64_t v20;
  NSString *identityDataPassword;
  uint64_t v22;
  NEKeychainItem *identityDataPasswordKeychainItem;
  uint64_t v24;
  NSData *identityDataHash;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *certificates;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSDictionary *additionalHTTPHeaderFields;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *rawPublicKeys;

  v4 = a3;
  v5 = -[NERelay init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HTTP3RelayURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    HTTP3RelayURL = v5->_HTTP3RelayURL;
    v5->_HTTP3RelayURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HTTP2RelayURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    HTTP2RelayURL = v5->_HTTP2RelayURL;
    v5->_HTTP2RelayURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNSOverHTTPSURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    dnsOverHTTPSURL = v5->_dnsOverHTTPSURL;
    v5->_dnsOverHTTPSURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyntheticIPv4Prefix"));
    v12 = objc_claimAutoreleasedReturnValue();
    syntheticDNSAnswerIPv4Prefix = v5->_syntheticDNSAnswerIPv4Prefix;
    v5->_syntheticDNSAnswerIPv4Prefix = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyntheticIPv6Prefix"));
    v14 = objc_claimAutoreleasedReturnValue();
    syntheticDNSAnswerIPv6Prefix = v5->_syntheticDNSAnswerIPv6Prefix;
    v5->_syntheticDNSAnswerIPv6Prefix = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identity"));
    v16 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityData"));
    v18 = objc_claimAutoreleasedReturnValue();
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataPassword"));
    v20 = objc_claimAutoreleasedReturnValue();
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataPasswordKeychainItem"));
    v22 = objc_claimAutoreleasedReturnValue();
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v22;

    v5->_identityDataImported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IdentityDataImported"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataHash"));
    v24 = objc_claimAutoreleasedReturnValue();
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("Certificates"));
    v29 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("AdditionalHTTPHeaders"));
    v34 = objc_claimAutoreleasedReturnValue();
    additionalHTTPHeaderFields = v5->_additionalHTTPHeaderFields;
    v5->_additionalHTTPHeaderFields = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("RawPublicKeys"));
    v39 = objc_claimAutoreleasedReturnValue();
    rawPublicKeys = v5->_rawPublicKeys;
    v5->_rawPublicKeys = (NSArray *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("HTTP3RelayURL"));

  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("HTTP2RelayURL"));

  -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("DNSOverHTTPSURL"));

  -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("SyntheticIPv4Prefix"));

  -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("SyntheticIPv6Prefix"));

  -[NERelay identity](self, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("Identity"));

  -[NERelay identityDataInternal](self, "identityDataInternal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("IdentityData"));

  -[NERelay identityDataPassword](self, "identityDataPassword");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("IdentityDataPassword"));

  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("IdentityDataPasswordKeychainItem"));

  objc_msgSend(v20, "encodeBool:forKey:", -[NERelay identityDataImported](self, "identityDataImported"), CFSTR("IdentityDataImported"));
  -[NERelay identityDataHash](self, "identityDataHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("IdentityDataHash"));

  if (self)
  {
    objc_msgSend(v20, "encodeObject:forKey:", objc_getProperty(self, v14, 96, 1), CFSTR("Certificates"));
    -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("AdditionalHTTPHeaders"));

    -[NERelay rawPublicKeys](self, "rawPublicKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("RawPublicKeys"));

    -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      self = 0;
    }
    else
    {
      -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      self = (NERelay *)(v18 != 0);

    }
  }
  else
  {
    objc_msgSend(v20, "encodeObject:forKey:", 0, CFSTR("Certificates"));
    objc_msgSend(0, "additionalHTTPHeaderFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("AdditionalHTTPHeaders"));

    objc_msgSend(0, "rawPublicKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("RawPublicKeys"));
  }

  objc_msgSend(v20, "encodeBool:forKey:", self, CFSTR("HTTP2Only"));
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
  void *v14;
  const char *v15;
  id Property;
  void *v17;
  void *v18;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTP3RelayURL:", v5);

  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTP2RelayURL:", v6);

  -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDnsOverHTTPSURL:", v7);

  -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyntheticDNSAnswerIPv4Prefix:", v8);

  -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyntheticDNSAnswerIPv6Prefix:", v9);

  -[NERelay identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v10);

  -[NERelay identityDataInternal](self, "identityDataInternal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityDataInternal:", v11);

  -[NERelay identityDataPassword](self, "identityDataPassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityDataPassword:", v12);

  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityDataPasswordKeychainItem:", v13);

  objc_msgSend(v4, "setIdentityDataImported:", -[NERelay identityDataImported](self, "identityDataImported"));
  -[NERelay identityDataHash](self, "identityDataHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityDataHash:", v14);

  if (!self)
  {
    Property = 0;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  Property = objc_getProperty(self, v15, 96, 1);
  if (v4)
LABEL_3:
    objc_setProperty_atomic(v4, v15, Property, 96);
LABEL_4:
  -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields", Property);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalHTTPHeaderFields:", v17);

  -[NERelay rawPublicKeys](self, "rawPublicKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRawPublicKeys:", v18);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    LOBYTE(v6) = 1;
    goto LABEL_5;
  }
  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing relay URL"), v4);
LABEL_5:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (isa_nsstring(v12))
        {
          -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = isa_nsstring(v14);

          if ((v15 & 1) != 0)
            continue;
        }
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid HTTP headers"), v4);
        LOBYTE(v6) = 0;
        goto LABEL_16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_16:

  return (char)v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  id Property;
  void *v27;
  void *v28;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 | 9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("HTTP3RelayURL"), v5, a4 | 9);

  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("HTTP2RelayURL"), v5, a4 | 9);

  -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("dnsOverHTTPSURL"), v5, a4 | 9);

  -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("syntheticDNSAnswerIPv4Prefix"), v5, a4 | 9);

  -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("syntheticDNSAnswerIPv6Prefix"), v5, a4 | 9);

  -[NERelay identity](self, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("identity"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NERelay identityDataInternal](self, "identityDataInternal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[NERelay identityDataInternal](self, "identityDataInternal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%lu bytes"), objc_msgSend(v18, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = a4 | 8;
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("identityData"), v5, v20);

  }
  else
  {
    v20 = a4 | 8;
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("identityData"), v5, v20);
  }

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelay identityDataImported](self, "identityDataImported"), CFSTR("identityDataImported"), v5, v8);
  -[NERelay identityDataHash](self, "identityDataHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v21, CFSTR("identityDataHash"), v5, v8);

  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v22, CFSTR("identityDataPassword"), v5, v8);

  -[NERelay identityReference](self, "identityReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v23, CFSTR("identityReference"), v5, v20);

  -[NERelay identityDataPassword](self, "identityDataPassword");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v24, CFSTR("identityDataPassword"), v5, v10);

  if (self)
    Property = objc_getProperty(self, v25, 96, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("certificates"), v5, v8);
  -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v27, CFSTR("additionalHTTPHeaderFields"), v5, v8);

  -[NERelay rawPublicKeys](self, "rawPublicKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v28, CFSTR("rawPublicKeys"), v5, v8);

  return v7;
}

- (void)setIdentityReferenceInternal:(id)a3
{
  NERelay *v4;
  void *v5;
  id v6;
  const char *v7;
  NEIdentityKeychainItem *v8;
  int64_t keychainDomain;
  id Property;
  NEIdentityKeychainItem *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v12)
  {
    -[NERelay identity](v4, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NERelay identity](v4, "identity");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPersistentReference:", v12);
    }
    else
    {
      v8 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        keychainDomain = v4->_keychainDomain;
        Property = objc_getProperty(v4, v7, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v6 = Property;
      v11 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v8, "initWithPersistentReference:domain:accessGroup:", v12, keychainDomain, v6);
      -[NERelay setIdentity:](v4, "setIdentity:", v11);

    }
  }
  else
  {
    -[NERelay setIdentity:](v4, "setIdentity:", 0);
  }
  objc_sync_exit(v4);

}

- (void)setIdentityWithKey:(id)a3 keyRef:(id)a4
{
  id v6;
  NERelay *v7;
  const char *v8;
  NEIdentityKeychainItem *v9;
  int64_t keychainDomain;
  id Property;
  id v12;
  NEIdentityKeychainItem *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v9 = [NEIdentityKeychainItem alloc];
  if (v7)
  {
    keychainDomain = v7->_keychainDomain;
    Property = objc_getProperty(v7, v8, 88, 1);
  }
  else
  {
    keychainDomain = 0;
    Property = 0;
  }
  v12 = Property;
  v13 = -[NEKeychainItem initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:](v9, "initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:", v14, v6, 1, keychainDomain, v12);
  -[NERelay setIdentity:](v7, "setIdentity:", v13);

  objc_sync_exit(v7);
}

- (NSData)identityReferenceInternal
{
  NERelay *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NERelay identity](v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NERelay identity](v2, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setIdentityData:(NSData *)identityData
{
  NSData *v4;
  NSData *v5;
  void *v6;
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = identityData;
  -[NERelay setIdentityDataInternal:](self, "setIdentityDataInternal:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CC_SHA1_Init(&v7);
    v5 = objc_retainAutorelease(v4);
    CC_SHA1_Update(&v7, -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
    CC_SHA1_Final(md, &v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NERelay setIdentityDataHash:](self, "setIdentityDataHash:", v6);

  }
  else
  {
    -[NERelay setIdentityDataHash:](self, "setIdentityDataHash:", 0);
  }

}

- (void)setCertificateReferences:(id)a3
{
  id v4;
  NERelay *v5;
  const char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NEKeychainItem *v13;
  int64_t keychainDomain;
  id Property;
  id v16;
  NEKeychainItem *v17;
  uint64_t v18;
  const char *v19;
  id newValue;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
          v13 = [NEKeychainItem alloc];
          if (v5)
          {
            keychainDomain = v5->_keychainDomain;
            Property = objc_getProperty(v5, v12, 88, 1);
          }
          else
          {
            keychainDomain = 0;
            Property = 0;
          }
          v16 = Property;
          v17 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v13, "initWithPersistentReference:domain:accessGroup:", v11, keychainDomain, v16);

          if (v17)
            objc_msgSend(newValue, "addObject:", v17);

          ++v10;
        }
        while (v8 != v10);
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v8 = v18;
      }
      while (v18);
    }

    if (v5)
      objc_setProperty_atomic(v5, v19, newValue, 96);

  }
  else if (v5)
  {
    objc_setProperty_atomic(v5, v6, 0, 96);
  }
  objc_sync_exit(v5);

}

- (NSArray)certificateReferences
{
  NERelay *v2;
  const char *v3;
  id v4;
  SEL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96, 1))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_getProperty(v2, v5, 96, 1);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "persistentReference", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[NERelay identity](self, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NERelay identity](self, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "domain");

    if (v8 == a3)
    {
      -[NERelay identity](self, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sync");

    }
  }
  if (!a3)
    -[NERelay setIdentityDataPassword:](self, "setIdentityDataPassword:", 0);
}

- (void)clearKeychainItemsInDomain:(int64_t)a3 removeItems:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  id Property;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "domain");

    if (v10 == a3)
    {
      -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIdentifier:", 0);

    }
  }
  if (v4)
  {
    -[NERelay identity](self, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remove");

    -[NERelay setIdentityData:](self, "setIdentityData:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    if (self)
      Property = objc_getProperty(self, v13, 96, 1);
    else
      Property = 0;
    v15 = Property;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "remove", (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

  }
  else
  {
    -[NERelay setIdentityData:](self, "setIdentityData:", 0);
  }
  if (self)
    objc_setProperty_atomic(self, v20, 0, 96);
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (!a3)
  {
    -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "copyPassword");
      -[NERelay setIdentityDataPassword:](self, "setIdentityDataPassword:", v5);

    }
  }
}

- (id)description
{
  return -[NERelay descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (NSURL)HTTP3RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHTTP3RelayURL:(NSURL *)HTTP3RelayURL
{
  objc_setProperty_atomic_copy(self, a2, HTTP3RelayURL, 16);
}

- (NSURL)HTTP2RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHTTP2RelayURL:(NSURL *)HTTP2RelayURL
{
  objc_setProperty_atomic_copy(self, a2, HTTP2RelayURL, 24);
}

- (NSURL)dnsOverHTTPSURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDnsOverHTTPSURL:(NSURL *)dnsOverHTTPSURL
{
  objc_setProperty_atomic_copy(self, a2, dnsOverHTTPSURL, 32);
}

- (NSString)syntheticDNSAnswerIPv4Prefix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSyntheticDNSAnswerIPv4Prefix:(NSString *)syntheticDNSAnswerIPv4Prefix
{
  objc_setProperty_atomic_copy(self, a2, syntheticDNSAnswerIPv4Prefix, 40);
}

- (NSString)syntheticDNSAnswerIPv6Prefix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyntheticDNSAnswerIPv6Prefix:(NSString *)syntheticDNSAnswerIPv6Prefix
{
  objc_setProperty_atomic_copy(self, a2, syntheticDNSAnswerIPv6Prefix, 48);
}

- (NSDictionary)additionalHTTPHeaderFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdditionalHTTPHeaderFields:(NSDictionary *)additionalHTTPHeaderFields
{
  objc_setProperty_atomic_copy(self, a2, additionalHTTPHeaderFields, 56);
}

- (NSArray)rawPublicKeys
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRawPublicKeys:(NSArray *)rawPublicKeys
{
  objc_setProperty_atomic_copy(self, a2, rawPublicKeys, 64);
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
  objc_setProperty_atomic_copy(self, a2, identityDataPassword, 72);
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdentityDataInternal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIdentityDataHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NEIdentityKeychainItem)identity
{
  return (NEIdentityKeychainItem *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identityDataPasswordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identityDataHash, 0);
  objc_storeStrong((id *)&self->_identityDataInternal, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_identityDataPassword, 0);
  objc_storeStrong((id *)&self->_rawPublicKeys, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaderFields, 0);
  objc_storeStrong((id *)&self->_syntheticDNSAnswerIPv6Prefix, 0);
  objc_storeStrong((id *)&self->_syntheticDNSAnswerIPv4Prefix, 0);
  objc_storeStrong((id *)&self->_dnsOverHTTPSURL, 0);
  objc_storeStrong((id *)&self->_HTTP2RelayURL, 0);
  objc_storeStrong((id *)&self->_HTTP3RelayURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
