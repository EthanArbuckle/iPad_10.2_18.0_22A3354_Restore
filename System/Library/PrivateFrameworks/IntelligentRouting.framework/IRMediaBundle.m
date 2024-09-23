@implementation IRMediaBundle

- (IRMediaBundle)initWithBundleType:(int64_t)a3 andIdentifier:(id)a4
{
  IRMediaBundle *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRMediaBundle;
  result = -[IRBundle initWithIdentifier:](&v6, sel_initWithIdentifier_, a4);
  if (result)
    result->_bundleType = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  IRMediaBundle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IRMediaBundle;
  v4 = -[IRBundle copyWithZone:](&v7, sel_copyWithZone_, a3);
  v4[2] = -[IRMediaBundle bundleType](self, "bundleType");
  v5 = self;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRMediaBundle;
  v4 = a3;
  -[IRBundle encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bundleType, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleType"));

}

- (IRMediaBundle)initWithCoder:(id)a3
{
  id v4;
  IRMediaBundle *v5;
  IRMediaBundle *v6;
  IRMediaBundle *v7;
  int64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRMediaBundle;
  v5 = -[IRBundle initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleType"));
    v6 = (IRMediaBundle *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (int)-[IRMediaBundle intValue](v6, "intValue");

      v5->_bundleType = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IRMediaBundle)init
{
  __assert_rtn("-[IRMediaBundle init]", "IRBundle.m", 137, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRMediaBundle new]", "IRBundle.m", 142, "NO");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t bundleType;
  const __CFString *v9;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[IRBundle identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", identifier: %@"), v7);

  bundleType = self->_bundleType;
  if (bundleType > 2)
    v9 = CFSTR("Invalid");
  else
    v9 = off_25103F988[bundleType];
  objc_msgSend(v6, "appendFormat:", CFSTR(", bundleType: %@"), v9);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IRMediaBundle bundleType](self, "bundleType");
    if (v6 == objc_msgSend(v5, "bundleType"))
    {
      -[IRBundle identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {

        v9 = 1;
      }
      else
      {
        -[IRBundle identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 != v11;

        v9 = !v12;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IRMediaBundle;
  return -[IRBundle hash](&v3, sel_hash) ^ self->_bundleType ^ 0x1F;
}

- (int64_t)bundleType
{
  return self->_bundleType;
}

@end
