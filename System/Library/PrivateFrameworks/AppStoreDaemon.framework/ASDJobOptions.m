@implementation ASDJobOptions

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
  -[ASDJobOptions manifest](self, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("purchaseManifest"));

  -[ASDJobOptions endpoint](self, "endpoint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endpoint"));

}

- (ASDJobOptions)initWithCoder:(id)a3
{
  id v4;
  ASDJobOptions *v5;
  uint64_t v6;
  ASDJobManifest *manifest;
  void *v8;
  uint64_t v9;
  NSXPCConnection *endpoint;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDJobOptions;
  v5 = -[ASDJobOptions init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseManifest"));
    v6 = objc_claimAutoreleasedReturnValue();
    manifest = v5->_manifest;
    v5->_manifest = (ASDJobManifest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v8);
      endpoint = v5->_endpoint;
      v5->_endpoint = (NSXPCConnection *)v9;

    }
  }

  return v5;
}

- (NSXPCConnection)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (ASDJobManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
