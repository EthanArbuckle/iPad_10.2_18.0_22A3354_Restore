@implementation CCDevice

- (unsigned)options
{
  return self->_options;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CCDevice)initWithIdentifier:(id)a3 options:(unsigned __int8)a4
{
  id v7;
  CCDevice *v8;
  CCDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDevice;
  v8 = -[CCDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_options = a4;
  }

  return v9;
}

- (CCDevice)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isLocal
{
  return self->_options & 1;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDevice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CCDevice isLocal](self, "isLocal");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@> identifier: %@ isLocal: %@"), v5, v6, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CCDevice *v4;
  CCDevice *v5;
  BOOL v6;

  v4 = (CCDevice *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCDevice isEqualToDevice:](self, "isEqualToDevice:", v5);

  return v6;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  int options;
  BOOL v8;

  v4 = a3;
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqual:](identifier, "isEqual:", v6))
  {
    options = self->_options;
    v8 = options == objc_msgSend(v4, "options");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_options);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("deviceIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_options);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("deviceOptions"));

}

- (CCDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CCDevice *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      self = -[CCDevice initWithIdentifier:options:](self, "initWithIdentifier:options:", v5, objc_msgSend(v6, "unsignedIntValue"));
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
