@implementation ASDInstallManifestRequestOptions

- (ASDInstallManifestRequestOptions)init
{
  return -[ASDInstallManifestRequestOptions initWithManifest:](self, "initWithManifest:", 0);
}

- (ASDInstallManifestRequestOptions)initWithManifest:(id)a3
{
  id v4;
  ASDInstallManifestRequestOptions *v5;
  uint64_t v6;
  NSObject *p_super;
  void *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDInstallManifestRequestOptions;
  v5 = -[ASDInstallManifestRequestOptions init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
      p_super = &v5->_manifest->super;
      v5->_manifest = (ASDJobManifest *)v6;
    }
    else
    {
      ASDLogHandleForCategory(12);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        v10 = v9;
        _os_log_error_impl(&dword_19A03B000, p_super, OS_LOG_TYPE_ERROR, "[%{public}@]: Request contained a nil manifest", buf, 0xCu);

      }
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASDInstallManifestRequestOptions initWithManifest:](+[ASDInstallManifestRequestOptions allocWithZone:](ASDInstallManifestRequestOptions, "allocWithZone:", a3), "initWithManifest:", self->_manifest);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDInstallManifestRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDInstallManifestRequestOptions *v5;
  uint64_t v6;
  ASDJobManifest *manifest;

  v4 = a3;
  v5 = -[ASDInstallManifestRequestOptions initWithManifest:](self, "initWithManifest:", 0);
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
