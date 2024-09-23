@implementation DTKPKDebugCodeWithName

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTKPKDebugCodeWithName)initWithCoder:(id)a3
{
  id v4;
  DTKPKDebugCodeWithName *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKPKDebugCodeWithName;
  v5 = -[DTKPKDebugCodeWithName init](&v9, sel_init);
  if (v5)
  {
    v5->_kdebugCode.value = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_kdebugCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t value;
  id v5;

  value = self->_kdebugCode.value;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", value, CFSTR("_kdebugCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));

}

- (DTKPKDebugCodeWithName)initWithValue:(unsigned int)a3 name:(id)a4
{
  id v7;
  DTKPKDebugCodeWithName *v8;
  DTKPKDebugCodeWithName *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DTKPKDebugCodeWithName;
  v8 = -[DTKPKDebugCodeWithName init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_kdebugCode.value = a3;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_kdebugCode.value;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  $8A52862366AC65815A37073D555FDE9A v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DTKPKDebugCodeWithName name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8.var0 = -[DTKPKDebugCodeWithName kdebugCode](self, "kdebugCode");
      v9 = v8.var0 == objc_msgSend(v5, "kdebugCode");
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

  return v9;
}

- ($8A52862366AC65815A37073D555FDE9A)kdebugCode
{
  return ($8A52862366AC65815A37073D555FDE9A)self->_kdebugCode.value;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
