@implementation NTKFaceDescriptor

- (NTKFaceDescriptor)initWithBundleIdentifier:(id)a3
{
  id v4;
  NTKFaceDescriptor *v5;
  NTKFaceDescriptor *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceDescriptor;
  v5 = -[NTKFaceDescriptor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_faceStyle = 44;
    v7 = objc_msgSend(v4, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

  }
  return v6;
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithFaceStyle:(int64_t)a3 bundleIdentifier:(id)a4
{
  NTKFaceDescriptor *v4;
  NTKFaceDescriptor *v5;

  if (a3 == 44)
    v4 = -[NTKFaceDescriptor initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a4);
  else
    v4 = -[NTKFaceDescriptor initWithFaceStyle:](self, "initWithFaceStyle:", a3, a4);
  v5 = v4;

  return v5;
}

- (NTKFaceDescriptor)initWithFaceStyle:(int64_t)a3
{
  NTKFaceDescriptor *v4;
  NTKFaceDescriptor *v5;
  NSString *bundleIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKFaceDescriptor;
  v4 = -[NTKFaceDescriptor init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_faceStyle = a3;
    v4->_bundleIdentifier = 0;

  }
  return v5;
}

- (NTKFaceDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NTKFaceDescriptor *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceStyle"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NTKFaceDescriptor _initWithFaceStyle:bundleIdentifier:](self, "_initWithFaceStyle:bundleIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NTKFaceDescriptor faceStyle](self, "faceStyle"), CFSTR("faceStyle"));
  -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[NTKFaceDescriptor faceStyle](self, "faceStyle");
  -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "_initWithFaceStyle:bundleIdentifier:", v5, v6);

  return v7;
}

- (BOOL)isAvailableForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char IsAvailable;

  v4 = a3;
  v5 = -[NTKFaceDescriptor faceStyle](self, "faceStyle");
  if (v5 == 44)
  {
    -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceBundleForBundleIdentifier:onDevice:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    IsAvailable = v8 != 0;
  }
  else
  {
    IsAvailable = NTKFaceStyleIsAvailable(v5, v4);
  }

  return IsAvailable;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NTKFaceDescriptor faceStyle](self, "faceStyle");
  -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NTKFaceDescriptor faceStyle](self, "faceStyle"), v5 == objc_msgSend(v4, "faceStyle")))
  {
    -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = NTKEqualObjects(v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  int64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[NTKFaceDescriptor faceStyle](self, "faceStyle");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 44)
    -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
  else
    NTKFaceStyleDescription(-[NTKFaceDescriptor faceStyle](self, "faceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)faceClass
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKFaceDescriptor faceStyle](self, "faceStyle");
  if (v4 == 44)
  {
    -[NTKFaceDescriptor bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "faceBundleForBundleIdentifier:onDevice:", v5, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "faceClass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NTKFaceDescriptor faceClass].cold.1();

      v8 = 0;
    }

  }
  else
  {
    +[NTKFace _faceClassForStyle:onDevice:](NTKFace, "_faceClassForStyle:onDevice:", v4, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)faceClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Bundle ID is nil for descriptor %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
