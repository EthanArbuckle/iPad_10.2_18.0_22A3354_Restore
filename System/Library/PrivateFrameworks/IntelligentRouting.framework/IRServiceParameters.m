@implementation IRServiceParameters

- (IRServiceParameters)initWithServicePackage:(int64_t)a3
{
  IRServiceParameters *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IRServiceParameters;
  result = -[IRServiceParameters init](&v5, sel_init);
  if (result)
    result->_servicePackage = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServicePackage:", self->_servicePackage);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t servicePackage;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  servicePackage = self->_servicePackage;
  v5 = a3;
  objc_msgSend(v3, "numberWithInteger:", servicePackage);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("servicePackage"));

}

- (IRServiceParameters)initWithCoder:(id)a3
{
  id v4;
  IRServiceParameters *v5;
  IRServiceParameters *v6;
  IRServiceParameters *v7;
  int64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRServiceParameters;
  v5 = -[IRServiceParameters init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("servicePackage"));
    v6 = (IRServiceParameters *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (int)-[IRServiceParameters intValue](v6, "intValue");

      v5->_servicePackage = v8;
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

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", servicePackage: %ld"), self->_servicePackage);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IRServiceParameters servicePackage](self, "servicePackage");
    v7 = objc_msgSend(v5, "servicePackage");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_servicePackage;
}

- (IRServiceParameters)init
{
  __assert_rtn("-[IRServiceParameters init]", "IRServiceParameters.m", 86, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRServiceParameters new]", "IRServiceParameters.m", 91, "NO");
}

+ (BOOL)isServicePackageSupported:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

@end
