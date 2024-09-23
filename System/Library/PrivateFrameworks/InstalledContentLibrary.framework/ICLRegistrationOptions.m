@implementation ICLRegistrationOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLRegistrationOptions)initWithTargetUID:(unsigned int)a3
{
  uint64_t v3;
  ICLRegistrationOptions *v4;
  ICLRegistrationOptions *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)ICLRegistrationOptions;
  v4 = -[ICLRegistrationOptions init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ICLRegistrationOptions setTargetUID:](v4, "setTargetUID:", v3);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("targetUID"));

}

- (ICLRegistrationOptions)initWithCoder:(id)a3
{
  id v4;
  ICLRegistrationOptions *v5;
  void *v6;

  v4 = a3;
  v5 = -[ICLRegistrationOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetUID = objc_msgSend(v6, "unsignedIntValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTargetUID:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ICLRegistrationOptions *v4;
  unsigned int v5;
  BOOL v6;

  v4 = (ICLRegistrationOptions *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ICLRegistrationOptions targetUID](v4, "targetUID");
      v6 = v5 == -[ICLRegistrationOptions targetUID](self, "targetUID");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (void)setTargetUID:(unsigned int)a3
{
  self->_targetUID = a3;
}

@end
