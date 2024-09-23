@implementation ULUpdateConfiguration

- (ULUpdateConfiguration)initWithIsLowLatency:(BOOL)a3
{
  _BOOL8 v3;
  ULUpdateConfiguration *v4;
  ULUpdateConfiguration *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULUpdateConfiguration;
  v4 = -[ULUpdateConfiguration init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULUpdateConfiguration setIsLowLatency:](v4, "setIsLowLatency:", v3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIsLowLatency:", self->_isLowLatency);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  _BOOL8 isLowLatency;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  isLowLatency = self->_isLowLatency;
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", isLowLatency);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isLowLatency"));

}

- (ULUpdateConfiguration)initWithCoder:(id)a3
{
  id v4;
  ULUpdateConfiguration *v5;
  ULUpdateConfiguration *v6;
  ULUpdateConfiguration *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULUpdateConfiguration;
  v5 = -[ULUpdateConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLowLatency"));
    v6 = (ULUpdateConfiguration *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULUpdateConfiguration BOOLValue](v6, "BOOLValue");

      v5->_isLowLatency = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLowLatency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isLowLatency: %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULUpdateConfiguration isLowLatency](self, "isLowLatency");
    v7 = objc_msgSend(v5, "isLowLatency");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_isLowLatency;
}

- (ULUpdateConfiguration)init
{
  __assert_rtn("-[ULUpdateConfiguration init]", "ULConnectionTypes.m", 272, "NO");
}

+ (ULUpdateConfiguration)new
{
  __assert_rtn("+[ULUpdateConfiguration new]", "ULConnectionTypes.m", 277, "NO");
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

@end
