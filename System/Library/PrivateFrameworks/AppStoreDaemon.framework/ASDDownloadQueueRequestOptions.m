@implementation ASDDownloadQueueRequestOptions

- (ASDDownloadQueueRequestOptions)initWithManifest:(id)a3
{
  id v5;
  ASDDownloadQueueRequestOptions *v6;
  ASDDownloadQueueRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDownloadQueueRequestOptions;
  v6 = -[ASDDownloadQueueRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_manifest, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDDownloadQueueRequestOptions *v5;
  ASDJobManifest *v6;
  ASDJobManifest *manifest;

  v5 = -[ASDDownloadQueueRequestOptions init](+[ASDDownloadQueueRequestOptions allocWithZone:](ASDDownloadQueueRequestOptions, "allocWithZone:"), "init");
  v6 = -[ASDJobManifest copyWithZone:](self->_manifest, "copyWithZone:", a3);
  manifest = v5->_manifest;
  v5->_manifest = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDDownloadQueueRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDDownloadQueueRequestOptions *v5;
  uint64_t v6;
  ASDJobManifest *manifest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDownloadQueueRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifest"));
    v6 = objc_claimAutoreleasedReturnValue();
    manifest = v5->_manifest;
    v5->_manifest = (ASDJobManifest *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_manifest, CFSTR("manifest"));
}

- (ASDJobManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end
