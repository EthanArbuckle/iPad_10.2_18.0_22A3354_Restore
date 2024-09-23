@implementation ASDManifestRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t archiveType;
  id v5;

  archiveType = self->_archiveType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", archiveType, CFSTR("ArchiveType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifest, CFSTR("Manifest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifestURL, CFSTR("ManifestURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificates, CFSTR("Certificates"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pinningRevocationCheckRequired, CFSTR("PinningRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("Request"));

}

- (ASDManifestRequest)initWithCoder:(id)a3
{
  id v4;
  ASDManifestRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *manifest;
  uint64_t v14;
  NSURL *manifestURL;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *certificates;
  uint64_t v21;
  NSUUID *requestIdentifier;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDManifestRequest;
  v5 = -[ASDManifestRequest init](&v24, sel_init);
  if (v5)
  {
    v5->_archiveType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ArchiveType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Manifest"));
    v12 = objc_claimAutoreleasedReturnValue();
    manifest = v5->_manifest;
    v5->_manifest = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ManifestURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("Certificates"));
    v19 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v19;

    v5->_pinningRevocationCheckRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PinningRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Request"));
    v21 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v21;

  }
  return v5;
}

- (NSDictionary)manifest
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManifest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManifestURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)archiveType
{
  return self->_archiveType;
}

- (void)setArchiveType:(int64_t)a3
{
  self->_archiveType = a3;
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (void)setPinningRevocationCheckRequired:(BOOL)a3
{
  self->_pinningRevocationCheckRequired = a3;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end
