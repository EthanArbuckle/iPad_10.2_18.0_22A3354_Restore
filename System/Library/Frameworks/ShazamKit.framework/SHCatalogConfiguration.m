@implementation SHCatalogConfiguration

- (SHCatalogConfiguration)init
{
  SHCatalogConfiguration *v2;
  void *v3;
  uint64_t v4;
  NSString *installationID;
  uint64_t v6;
  SHRange *signatureDurationRange;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHCatalogConfiguration;
  v2 = -[SHCatalogConfiguration init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    installationID = v2->_installationID;
    v2->_installationID = (NSString *)v4;

    +[SHRange rangeWithLowerBound:upperBound:](SHRange, "rangeWithLowerBound:upperBound:", 3.0, 12.0);
    v6 = objc_claimAutoreleasedReturnValue();
    signatureDurationRange = v2->_signatureDurationRange;
    v2->_signatureDurationRange = (SHRange *)v6;

    v2->_streamingBufferDuration = 24.0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[SHCatalogConfiguration installationID](self, "installationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setInstallationID:", v6);

  -[SHCatalogConfiguration signatureDurationRange](self, "signatureDurationRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSignatureDurationRange:", v8);

  -[SHCatalogConfiguration streamingBufferDuration](self, "streamingBufferDuration");
  objc_msgSend(v4, "setStreamingBufferDuration:");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SHCatalogConfiguration installationID](self, "installationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SHCatalogConfigurationInstallationIDKey"));

  -[SHCatalogConfiguration streamingBufferDuration](self, "streamingBufferDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SHCatalogConfigurationBufferDurationKey"));
  -[SHCatalogConfiguration signatureDurationRange](self, "signatureDurationRange");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SHCatalogConfigurationSignatureDurationRangeKey"));

}

- (SHCatalogConfiguration)initWithCoder:(id)a3
{
  id v4;
  SHCatalogConfiguration *v5;
  uint64_t v6;
  NSString *installationID;
  double v8;
  uint64_t v9;
  SHRange *signatureDurationRange;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHCatalogConfiguration;
  v5 = -[SHCatalogConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHCatalogConfigurationInstallationIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    installationID = v5->_installationID;
    v5->_installationID = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SHCatalogConfigurationBufferDurationKey"));
    v5->_streamingBufferDuration = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHCatalogConfigurationSignatureDurationRangeKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    signatureDurationRange = v5->_signatureDurationRange;
    v5->_signatureDurationRange = (SHRange *)v9;

  }
  return v5;
}

- (NSString)installationID
{
  return self->_installationID;
}

- (void)setInstallationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SHRange)signatureDurationRange
{
  return self->_signatureDurationRange;
}

- (void)setSignatureDurationRange:(id)a3
{
  objc_storeStrong((id *)&self->_signatureDurationRange, a3);
}

- (double)streamingBufferDuration
{
  return self->_streamingBufferDuration;
}

- (void)setStreamingBufferDuration:(double)a3
{
  self->_streamingBufferDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDurationRange, 0);
  objc_storeStrong((id *)&self->_installationID, 0);
}

@end
