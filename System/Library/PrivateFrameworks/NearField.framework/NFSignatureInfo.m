@implementation NFSignatureInfo

- (NFSignatureInfo)initWithDictionary:(id)a3
{
  id v4;
  NFSignatureInfo *v5;
  uint64_t v6;
  NSString *rsaCert;
  uint64_t v8;
  NSString *eccCert;
  uint64_t v10;
  NSString *eckaCert;
  uint64_t v12;
  NSString *seid;
  uint64_t v14;
  NSString *platformId;
  uint64_t v16;
  NSString *jsblCounter;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFSignatureInfo;
  v5 = -[NFSignatureInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsa"));
    v6 = objc_claimAutoreleasedReturnValue();
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecc"));
    v8 = objc_claimAutoreleasedReturnValue();
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecka"));
    v10 = objc_claimAutoreleasedReturnValue();
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seid"));
    v12 = objc_claimAutoreleasedReturnValue();
    seid = v5->_seid;
    v5->_seid = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformid"));
    v14 = objc_claimAutoreleasedReturnValue();
    platformId = v5->_platformId;
    v5->_platformId = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jsblCounter"));
    v16 = objc_claimAutoreleasedReturnValue();
    jsblCounter = v5->_jsblCounter;
    v5->_jsblCounter = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("certVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_certificateVersion = objc_msgSend(v18, "unsignedIntegerValue");

  }
  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *jsblCounter;
  const __CFString *seid;
  const __CFString *platformId;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)NFSignatureInfo;
  -[NFSignatureInfo description](&v11, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  jsblCounter = &stru_1E3B54F18;
  seid = (const __CFString *)self->_seid;
  platformId = (const __CFString *)self->_platformId;
  if (!seid)
    seid = &stru_1E3B54F18;
  if (!platformId)
    platformId = &stru_1E3B54F18;
  if (self->_jsblCounter)
    jsblCounter = (const __CFString *)self->_jsblCounter;
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { seid=%@ platformId=%@ jsblCounter=%@ certificateVersion=%lu }"), v4, seid, platformId, jsblCounter, self->_certificateVersion);

  return v9;
}

- (NFSignatureInfo)initWithCoder:(id)a3
{
  id v4;
  NFSignatureInfo *v5;
  uint64_t v6;
  NSString *rsaCert;
  uint64_t v8;
  NSString *eccCert;
  uint64_t v10;
  NSString *eckaCert;
  uint64_t v12;
  NSString *seid;
  uint64_t v14;
  NSString *platformId;
  uint64_t v16;
  NSString *jsblCounter;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NFSignatureInfo;
  v5 = -[NFSignatureInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsa"));
    v6 = objc_claimAutoreleasedReturnValue();
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecc"));
    v8 = objc_claimAutoreleasedReturnValue();
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecka"));
    v10 = objc_claimAutoreleasedReturnValue();
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seid"));
    v12 = objc_claimAutoreleasedReturnValue();
    seid = v5->_seid;
    v5->_seid = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformid"));
    v14 = objc_claimAutoreleasedReturnValue();
    platformId = v5->_platformId;
    v5->_platformId = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jsblCounter"));
    v16 = objc_claimAutoreleasedReturnValue();
    jsblCounter = v5->_jsblCounter;
    v5->_jsblCounter = (NSString *)v16;

    v5->_certificateVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("certVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *rsaCert;
  id v5;

  rsaCert = self->_rsaCert;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rsaCert, CFSTR("rsa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eccCert, CFSTR("ecc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eckaCert, CFSTR("ecka"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seid, CFSTR("seid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformId, CFSTR("platformid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jsblCounter, CFSTR("jsblCounter"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_certificateVersion, CFSTR("certVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rsaCert
{
  return self->_rsaCert;
}

- (NSString)eccCert
{
  return self->_eccCert;
}

- (NSString)eckaCert
{
  return self->_eckaCert;
}

- (NSString)seid
{
  return self->_seid;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)jsblCounter
{
  return self->_jsblCounter;
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsblCounter, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_eckaCert, 0);
  objc_storeStrong((id *)&self->_eccCert, 0);
  objc_storeStrong((id *)&self->_rsaCert, 0);
}

@end
