@implementation NISystemConfiguration

- (NISystemConfiguration)init
{
  NISystemConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NISystemConfiguration;
  result = -[NIConfiguration initInternal](&v3, sel_initInternal);
  if (result)
  {
    result->_prewarmUWB = 0;
    result->_prewarmSecureElementChannel = 0;
  }
  return result;
}

+ (id)new
{
  return objc_alloc_init(NISystemConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISystemConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPrewarmUWB:", self->_prewarmUWB);
  objc_msgSend(v4, "setPrewarmSecureElementChannel:", self->_prewarmSecureElementChannel);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISystemConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_prewarmUWB, CFSTR("prewarmUWB"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_prewarmSecureElementChannel, CFSTR("prewarmSecureElementChannel"));

}

- (NISystemConfiguration)initWithCoder:(id)a3
{
  id v4;
  NISystemConfiguration *v5;
  char v6;
  char v7;
  NISystemConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NISystemConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prewarmUWB"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prewarmSecureElementChannel"));
    v5->_prewarmUWB = v6;
    v5->_prewarmSecureElementChannel = v7;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NISystemConfiguration *v5;
  NISystemConfiguration *v6;
  int v7;
  int prewarmUWB;
  _BOOL4 v9;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NISystemConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v11 = 1;
    }
    else
    {
      v7 = -[NISystemConfiguration prewarmUWB](v5, "prewarmUWB");
      prewarmUWB = self->_prewarmUWB;
      v9 = -[NISystemConfiguration prewarmSecureElementChannel](v6, "prewarmSecureElementChannel");
      v11 = prewarmUWB == v7 && self->_prewarmSecureElementChannel == v9;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_prewarmUWB ^ self->_prewarmSecureElementChannel ^ 0x1Fu;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NISystemConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<prewarm [UWB: %d, secureElementChannel: %d]>"), self->_prewarmUWB, self->_prewarmSecureElementChannel);
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_prewarmSecureElementChannel = a3;
}

@end
