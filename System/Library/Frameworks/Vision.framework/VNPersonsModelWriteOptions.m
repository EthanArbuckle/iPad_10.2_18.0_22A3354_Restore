@implementation VNPersonsModelWriteOptions

- (VNPersonsModelWriteOptions)init
{
  VNPersonsModelWriteOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNPersonsModelWriteOptions;
  result = -[VNPersonsModelWriteOptions init](&v3, sel_init);
  if (result)
  {
    result->_version = 0;
    result->_readOnly = 0;
  }
  return result;
}

- (unint64_t)hash
{
  if (self->_readOnly)
    return 43690;
  else
    return 21845;
}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelWriteOptions *v4;
  VNPersonsModelWriteOptions *v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (VNPersonsModelWriteOptions *)a3;
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
      v6 = -[VNPersonsModelWriteOptions version](self, "version");
      if (v6 == -[VNPersonsModelWriteOptions version](v5, "version"))
      {
        v7 = -[VNPersonsModelWriteOptions readOnly](self, "readOnly");
        v8 = v7 ^ -[VNPersonsModelWriteOptions readOnly](v5, "readOnly") ^ 1;
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
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_readOnly, CFSTR("readonly"));

}

- (VNPersonsModelWriteOptions)initWithCoder:(id)a3
{
  id v4;
  VNPersonsModelWriteOptions *v5;
  VNPersonsModelWriteOptions *v6;

  v4 = a3;
  v5 = -[VNPersonsModelWriteOptions init](self, "init");
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
