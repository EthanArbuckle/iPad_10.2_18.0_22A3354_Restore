@implementation VNCVMLFaceprint_LegacySupportDoNotChange

- (VNCVMLFaceprint_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4;
  VNCVMLFaceprint_LegacySupportDoNotChange *v5;
  void *v6;
  VNCVMLFaceprint_LegacySupportDoNotChange *v7;
  uint64_t v8;
  NSData *faceprint;
  uint64_t v10;
  NSString *key;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNCVMLFaceprint_LegacySupportDoNotChange;
  v5 = -[VNCVMLFaceprint_LegacySupportDoNotChange init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLFaceprint_CodingVersionCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "unsignedIntegerValue"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLFaceprint_FaceprintCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    faceprint = v5->_faceprint;
    v5->_faceprint = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLFaceprint_KeyCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLFaceprint_PlatformCodingKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_platform = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLFaceprint_ProfileCodingKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_profile = objc_msgSend(v13, "unsignedIntegerValue");

LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }

  v7 = 0;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Exporting of legacy CVMLFaceprints is disabled.  Please convert to VNFaceprint and export"));
}

- (NSData)faceprint
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFaceprint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unsigned)profile
{
  return self->_profile;
}

- (void)setProfile:(unsigned int)a3
{
  self->_profile = a3;
}

- (NSString)faceprintInputPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFaceprintInputPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintInputPath, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
