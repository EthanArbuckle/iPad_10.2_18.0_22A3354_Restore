@implementation MADImageSafetyClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 andAttributes:(id)a4
{
  id v6;
  MADImageSafetyClassificationResult *v7;
  MADImageSafetyClassificationResult *v8;
  uint64_t v9;
  NSDictionary *attributes;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADImageSafetyClassificationResult;
  v7 = -[MADResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_isSensitive = a3;
    v9 = objc_msgSend(v6, "copy");
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;

  }
  return v8;
}

- (MADImageSafetyClassificationResult)initWithCoder:(id)a3
{
  id v4;
  MADImageSafetyClassificationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *attributes;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADImageSafetyClassificationResult;
  v5 = -[MADResult init](&v12, sel_init);
  if (v5)
  {
    v5->_isSensitive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsSensitive"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Attributes"));
    v9 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isSensitive;
  id v5;

  isSensitive = self->_isSensitive;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isSensitive, CFSTR("IsSensitive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("Attributes"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("isSensitive: %d,"), self->_isSensitive);
  objc_msgSend(v3, "appendFormat:", CFSTR("attributes: %@>"), self->_attributes);
  return v3;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
