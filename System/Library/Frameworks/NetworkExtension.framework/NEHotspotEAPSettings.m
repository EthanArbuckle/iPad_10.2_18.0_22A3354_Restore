@implementation NEHotspotEAPSettings

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  NEHotspotConfigurationEAPTLSVersion v17;
  const __CFString *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEHotspotEAPSettings supportedEAPTypes](self, "supportedEAPTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v4, CFSTR("Supported EAP Types"), 0, 0);

  -[NEHotspotEAPSettings username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[NEHotspotEAPSettings username](self, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v7, CFSTR("Username"), 0, 0);

  }
  -[NEHotspotEAPSettings password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[NEHotspotEAPSettings password](self, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Password"), 0, 3);

  }
  -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("Outer Identity"), 0, 0);

  }
  -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Trusted Server Names"), 0, 0);

  }
  if (-[NEHotspotEAPSettings isTLSClientCertificateRequired](self, "isTLSClientCertificateRequired"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("TLS Client Certificate Required"), 0, 0);
  v17 = -[NEHotspotEAPSettings preferredTLSVersion](self, "preferredTLSVersion");
  if ((unint64_t)v17 > NEHotspotConfigurationEAPTLSVersion_1_2)
    v18 = CFSTR("TLS 1.2");
  else
    v18 = off_1E3CC0978[v17];
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("Preferred TLS Version"), 0, 0);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEHotspotEAPSettings *v4;

  v4 = -[NEHotspotEAPSettings init](+[NEHotspotEAPSettings allocWithZone:](NEHotspotEAPSettings, "allocWithZone:", a3), "init");
  -[NEHotspotEAPSettings setSupportedEAPTypes:](v4, "setSupportedEAPTypes:", self->_supportedEAPTypes);
  -[NEHotspotEAPSettings setUsername:](v4, "setUsername:", self->_username);
  -[NEHotspotEAPSettings setOuterIdentity:](v4, "setOuterIdentity:", self->_outerIdentity);
  -[NEHotspotEAPSettings setTtlsInnerAuthenticationType:](v4, "setTtlsInnerAuthenticationType:", self->_ttlsInnerAuthenticationType);
  -[NEHotspotEAPSettings setPassword:](v4, "setPassword:", self->_password);
  -[NEHotspotEAPSettings setIdentityReference:](v4, "setIdentityReference:", self->_identityReference);
  -[NEHotspotEAPSettings setClientTrustChainReference:](v4, "setClientTrustChainReference:", self->_clientTrustChainReference);
  -[NEHotspotEAPSettings setTrustedServerNames:](v4, "setTrustedServerNames:", self->_trustedServerNames);
  -[NEHotspotEAPSettings setTrustedServerCertificateReferences:](v4, "setTrustedServerCertificateReferences:", self->_trustedServerCertificateReferences);
  -[NEHotspotEAPSettings setTlsClientCertificateRequired:](v4, "setTlsClientCertificateRequired:", self->_tlsClientCertificateRequired);
  -[NEHotspotEAPSettings setPreferredTLSVersion:](v4, "setPreferredTLSVersion:", self->_preferredTLSVersion);
  return v4;
}

- (NEHotspotEAPSettings)initWithCoder:(id)a3
{
  id v4;
  NEHotspotEAPSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *supportedEAPTypes;
  uint64_t v11;
  NSString *username;
  uint64_t v13;
  NSString *outerIdentity;
  uint64_t v15;
  NSString *password;
  uint64_t v17;
  NSData *identityReference;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *clientTrustChainReference;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *trustedServerNames;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *trustedServerCertificateReferences;

  v4 = a3;
  v5 = -[NEHotspotEAPSettings init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SupportedEAPTypes"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedEAPTypes = v5->_supportedEAPTypes;
    v5->_supportedEAPTypes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserName"));
    v11 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OuterIdentity"));
    v13 = objc_claimAutoreleasedReturnValue();
    outerIdentity = v5->_outerIdentity;
    v5->_outerIdentity = (NSString *)v13;

    v5->_ttlsInnerAuthenticationType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TTLSInnerAuthenticationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserPassword"));
    v15 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityReference"));
    v17 = objc_claimAutoreleasedReturnValue();
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("ClientTrustChainReference"));
    v22 = objc_claimAutoreleasedReturnValue();
    clientTrustChainReference = v5->_clientTrustChainReference;
    v5->_clientTrustChainReference = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("TrustedServerNames"));
    v27 = objc_claimAutoreleasedReturnValue();
    trustedServerNames = v5->_trustedServerNames;
    v5->_trustedServerNames = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("TrustedServerCertificateRefs"));
    v32 = objc_claimAutoreleasedReturnValue();
    trustedServerCertificateReferences = v5->_trustedServerCertificateReferences;
    v5->_trustedServerCertificateReferences = (NSArray *)v32;

    v5->_tlsClientCertificateRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TLSIsCertificateRequiredKey"));
    v5->_preferredTLSVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PreferredTLSVersion"));
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
  id v12;

  v12 = a3;
  -[NEHotspotEAPSettings supportedEAPTypes](self, "supportedEAPTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("SupportedEAPTypes"));

  -[NEHotspotEAPSettings username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("UserName"));

  -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("OuterIdentity"));

  objc_msgSend(v12, "encodeInt64:forKey:", -[NEHotspotEAPSettings ttlsInnerAuthenticationType](self, "ttlsInnerAuthenticationType"), CFSTR("TTLSInnerAuthenticationType"));
  -[NEHotspotEAPSettings password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("UserPassword"));

  -[NEHotspotEAPSettings identityReference](self, "identityReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("IdentityReference"));

  -[NEHotspotEAPSettings clientTrustChainReference](self, "clientTrustChainReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("ClientTrustChainReference"));

  -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("TrustedServerNames"));

  -[NEHotspotEAPSettings trustedServerCertificateReferences](self, "trustedServerCertificateReferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("TrustedServerCertificateRefs"));

  objc_msgSend(v12, "encodeBool:forKey:", -[NEHotspotEAPSettings isTLSClientCertificateRequired](self, "isTLSClientCertificateRequired"), CFSTR("TLSIsCertificateRequiredKey"));
  objc_msgSend(v12, "encodeInt64:forKey:", -[NEHotspotEAPSettings preferredTLSVersion](self, "preferredTLSVersion"), CFSTR("PreferredTLSVersion"));

}

- (BOOL)setTrustedServerCertificates:(NSArray *)certificates
{
  NSArray *v4;
  NSArray *v5;
  NSObject *v6;
  BOOL v7;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  CFTypeID v17;
  OSStatus v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  const char *v23;
  OSStatus v24;
  void *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  NEHotspotEAPSettings *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFTypeRef result;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  OSStatus v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = certificates;
  v5 = v4;
  result = 0;
  if (v4 && -[NSArray count](v4, "count") && -[NSArray count](v5, "count") < 0xB)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7020], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v5;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      v14 = *MEMORY[0x1E0CD70E8];
      v29 = self;
LABEL_10:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v16 = *(const void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        v17 = CFGetTypeID(v16);
        if (v17 != SecCertificateGetTypeID())
          break;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v14);
        v18 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
        if (v18)
        {
          v24 = v18;
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v36 = v25;
            v37 = 1024;
            v38 = v24;
            v22 = v25;
            v23 = "%@ failed to find persistent reference for trusted server certificate. status = %d";
            v26 = v20;
            v27 = 18;
            goto LABEL_30;
          }
LABEL_26:

          v7 = 0;
          goto LABEL_27;
        }
        if (!result)
        {
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          v28 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v36 = v28;
          v22 = v28;
          v23 = "%@ found nil persistent reference for trusted server certificate";
LABEL_29:
          v26 = v20;
          v27 = 12;
LABEL_30:
          _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, v23, buf, v27);

          goto LABEL_26;
        }
        -[NSObject addObject:](v6, "addObject:");
        CFRelease(result);
        if (v12 == ++v15)
        {
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          self = v29;
          if (v12)
            goto LABEL_10;
          goto LABEL_18;
        }
      }
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v36 = v21;
        v22 = v21;
        v23 = "%@ invalid certificate data type";
        goto LABEL_29;
      }
      goto LABEL_26;
    }
LABEL_18:

    if (-[NSObject count](v6, "count"))
      objc_storeStrong((id *)&self->_trustedServerCertificateReferences, v6);
    v7 = 1;
LABEL_27:

  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = (id)objc_opt_class();
      v19 = v36;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%@ invalid input data for trusted server certificates", buf, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)setIdentity:(SecIdentityRef)identity
{
  const __CFDictionary *v4;
  OSStatus v5;
  OSStatus v6;
  NSObject *p_super;
  BOOL v8;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  id v16;
  CFTypeRef result;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  OSStatus v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0;
  if (identity)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CD70E8], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7020], 0);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = SecItemCopyMatching(v4, &result);
    if (v5)
    {
      v6 = v5;
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 1024;
      v21 = v6;
      v11 = v15;
      v12 = "%@ failed to find persistent reference for identity. status = %d";
      v13 = p_super;
      v14 = 18;
    }
    else
    {
      if (result)
      {
        p_super = &self->_identityReference->super;
        self->_identityReference = (NSData *)result;
        v8 = 1;
        goto LABEL_10;
      }
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        v8 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      v11 = v10;
      v12 = "%@ found nil persistent reference for identity";
      v13 = p_super;
      v14 = 12;
    }
    _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);

    goto LABEL_4;
  }
  ne_log_obj();
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = (id)objc_opt_class();
    v16 = v19;
    _os_log_error_impl(&dword_19BD16000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "%@ invalid input data for identity", buf, 0xCu);

  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (NSArray)supportedEAPTypes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSupportedEAPTypes:(NSArray *)supportedEAPTypes
{
  objc_setProperty_atomic_copy(self, a2, supportedEAPTypes, 16);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUsername:(NSString *)username
{
  objc_setProperty_atomic_copy(self, a2, username, 24);
}

- (NSString)outerIdentity
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOuterIdentity:(NSString *)outerIdentity
{
  objc_setProperty_atomic_copy(self, a2, outerIdentity, 32);
}

- (NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  return self->_ttlsInnerAuthenticationType;
}

- (void)setTtlsInnerAuthenticationType:(NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  self->_ttlsInnerAuthenticationType = ttlsInnerAuthenticationType;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassword:(NSString *)password
{
  objc_setProperty_atomic_copy(self, a2, password, 48);
}

- (NSArray)trustedServerNames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTrustedServerNames:(NSArray *)trustedServerNames
{
  objc_setProperty_atomic_copy(self, a2, trustedServerNames, 56);
}

- (BOOL)isTLSClientCertificateRequired
{
  return self->_tlsClientCertificateRequired;
}

- (void)setTlsClientCertificateRequired:(BOOL)tlsClientCertificateRequired
{
  self->_tlsClientCertificateRequired = tlsClientCertificateRequired;
}

- (NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  return self->_preferredTLSVersion;
}

- (void)setPreferredTLSVersion:(NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  self->_preferredTLSVersion = preferredTLSVersion;
}

- (NSArray)clientTrustChainReference
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClientTrustChainReference:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentityReference:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSArray)trustedServerCertificateReferences
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTrustedServerCertificateReferences:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedServerCertificateReferences, 0);
  objc_storeStrong((id *)&self->_identityReference, 0);
  objc_storeStrong((id *)&self->_clientTrustChainReference, 0);
  objc_storeStrong((id *)&self->_trustedServerNames, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_outerIdentity, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_supportedEAPTypes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
