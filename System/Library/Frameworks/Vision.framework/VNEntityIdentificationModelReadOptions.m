@implementation VNEntityIdentificationModelReadOptions

- (unint64_t)hash
{
  return -[NSIndexSet hash](self->_acceptableVersions, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VNEntityIdentificationModelReadOptions *v4;
  VNEntityIdentificationModelReadOptions *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNEntityIdentificationModelReadOptions *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNEntityIdentificationModelReadOptions acceptableVersions](self, "acceptableVersions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNEntityIdentificationModelReadOptions acceptableVersions](v5, "acceptableVersions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setAcceptableVersions:", self->_acceptableVersions);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_acceptableVersions, CFSTR("acceptableVersions"));
}

- (VNEntityIdentificationModelReadOptions)initWithCoder:(id)a3
{
  id v4;
  VNEntityIdentificationModelReadOptions *v5;
  uint64_t v6;
  NSIndexSet *acceptableVersions;
  VNEntityIdentificationModelReadOptions *v8;

  v4 = a3;
  v5 = -[VNEntityIdentificationModelReadOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptableVersions"));
    v6 = objc_claimAutoreleasedReturnValue();
    acceptableVersions = v5->_acceptableVersions;
    v5->_acceptableVersions = (NSIndexSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSIndexSet)acceptableVersions
{
  return (NSIndexSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAcceptableVersions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptableVersions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
