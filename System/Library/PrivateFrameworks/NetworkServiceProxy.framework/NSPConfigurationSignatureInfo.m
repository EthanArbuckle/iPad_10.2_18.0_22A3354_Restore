@implementation NSPConfigurationSignatureInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConfigurationSignatureInfo)initWithCoder:(id)a3
{
  id v4;
  NSPConfigurationSignatureInfo *v5;
  uint64_t v6;
  NSArray *certificates;
  uint64_t v8;
  NSData *signature;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSPConfigurationSignatureInfo;
  v5 = -[NSPConfigurationSignatureInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("certificates"));
    v6 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v8 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v8;

    v5->_signatureAlgorithm = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("signatureAlgorithm"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSPConfigurationSignatureInfo certificates](self, "certificates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("certificates"));

  -[NSPConfigurationSignatureInfo signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("signature"));

  objc_msgSend(v6, "encodeInt:forKey:", -[NSPConfigurationSignatureInfo signatureAlgorithm](self, "signatureAlgorithm"), CFSTR("signatureAlgorithm"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPConfigurationSignatureInfo *v4;
  void *v5;
  void *v6;

  v4 = -[NSPConfigurationSignatureInfo init](+[NSPConfigurationSignatureInfo allocWithZone:](NSPConfigurationSignatureInfo, "allocWithZone:", a3), "init");
  -[NSPConfigurationSignatureInfo certificates](self, "certificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfigurationSignatureInfo setCertificates:](v4, "setCertificates:", v5);

  -[NSPConfigurationSignatureInfo signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfigurationSignatureInfo setSignature:](v4, "setSignature:", v6);

  -[NSPConfigurationSignatureInfo setSignatureAlgorithm:](v4, "setSignatureAlgorithm:", -[NSPConfigurationSignatureInfo signatureAlgorithm](self, "signatureAlgorithm"));
  return v4;
}

- (BOOL)saveToPreferences
{
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  const char *v9;
  uint8_t *v10;
  uint8_t v12[16];
  uint8_t buf[2];
  __int16 v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  if (!v3)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v8 = 0;
      goto LABEL_9;
    }
    v14 = 0;
    v9 = "NSKeyedArchiver initialize failed";
    v10 = (uint8_t *)&v14;
LABEL_11:
    _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_8;
  }
  -[NSPConfigurationSignatureInfo encodeWithCoder:](self, "encodeWithCoder:", v3);
  v4 = (const __CFString *)*MEMORY[0x1E0C9B248];
  _CFPreferencesSetFileProtectionClass();
  objc_msgSend(v3, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("NSPSignatureInfo"), v5, v4);

  LODWORD(v5) = CFPreferencesAppSynchronize(v4);
  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!(_DWORD)v5)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v9 = "Failed to write nsp signature info to preference file";
    v10 = buf;
    goto LABEL_11;
  }
  v8 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "Saved signature info to preference file", v12, 2u);
  }
LABEL_9:

  return v8;
}

+ (void)removeFromPreferences
{
  const __CFString *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = (const __CFString *)*MEMORY[0x1E0C9B248];
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(CFSTR("NSPSignatureInfo"), 0, v2);
  v3 = CFPreferencesAppSynchronize(v2);
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Removed signature info to preference file", v6, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "Failed to remove signature info from preference file", buf, 2u);
  }

}

- (id)initFromPreferences
{
  CFPropertyListRef v3;
  const void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  NSPConfigurationSignatureInfo *v10;
  NSPConfigurationSignatureInfo *v11;
  NSObject *v13;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = CFPreferencesCopyAppValue(CFSTR("NSPSignatureInfo"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  if (v3)
  {
    v4 = v3;
    v15 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v15);
    v6 = v15;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      CFRelease(v4);
      v14.receiver = self;
      v14.super_class = (Class)NSPConfigurationSignatureInfo;
      v11 = -[NSPConfigurationSignatureInfo init](&v14, sel_init);
      if (!v11 || (v11 = -[NSPConfigurationSignatureInfo initWithCoder:](v11, "initWithCoder:", v5)) != 0)
      {
        self = v11;
        v10 = self;
        goto LABEL_16;
      }
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, "Failed to decode NSP signature info", buf, 2u);
      }

      self = 0;
    }
    else
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP signature info: %@", buf, 0xCu);
      }

      CFRelease(v4);
    }
    v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "no saved signature info", buf, 2u);
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_certificates, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (unint64_t)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (void)setSignatureAlgorithm:(unint64_t)a3
{
  self->_signatureAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
