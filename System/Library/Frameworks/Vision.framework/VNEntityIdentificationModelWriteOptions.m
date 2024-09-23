@implementation VNEntityIdentificationModelWriteOptions

- (VNEntityIdentificationModelWriteOptions)init
{
  VNEntityIdentificationModelWriteOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNEntityIdentificationModelWriteOptions;
  result = -[VNEntityIdentificationModelWriteOptions init](&v3, sel_init);
  if (result)
  {
    result->_version = 0;
    result->_readOnly = 0;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 357908480;
  if (!self->_readOnly)
    v2 = 178954240;
  return v2 ^ self->_version;
}

- (BOOL)isEqual:(id)a3
{
  VNEntityIdentificationModelWriteOptions *v4;
  VNEntityIdentificationModelWriteOptions *v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (VNEntityIdentificationModelWriteOptions *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNEntityIdentificationModelWriteOptions version](self, "version");
      if (v6 == -[VNEntityIdentificationModelWriteOptions version](v5, "version"))
      {
        v7 = -[VNEntityIdentificationModelWriteOptions readOnly](self, "readOnly");
        v8 = v7 ^ -[VNEntityIdentificationModelWriteOptions readOnly](v5, "readOnly") ^ 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
    else
    {
      LOBYTE(v8) = 0;
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
  {
    objc_msgSend(v4, "setVersion:", self->_version);
    objc_msgSend(v5, "setReadOnly:", self->_readOnly);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readOnly, CFSTR("readonly"));

}

- (VNEntityIdentificationModelWriteOptions)initWithCoder:(id)a3
{
  id v4;
  VNEntityIdentificationModelWriteOptions *v5;
  VNEntityIdentificationModelWriteOptions *v6;

  v4 = a3;
  v5 = -[VNEntityIdentificationModelWriteOptions init](self, "init");
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v5->_readOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("readonly"));
    v6 = v5;
  }

  return v5;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
