@implementation COClusterRole

+ (id)roleForCoordinator
{
  return -[COClusterRole initWithRoleFlags:]([COClusterRole alloc], "initWithRoleFlags:", 8);
}

+ (id)roleForUnknown
{
  return -[COClusterRole initWithRoleFlags:]([COClusterRole alloc], "initWithRoleFlags:", 0);
}

+ (id)roleForParticipant
{
  return -[COClusterRole initWithRoleFlags:]([COClusterRole alloc], "initWithRoleFlags:", 16);
}

- (COClusterRole)initWithRoleFlags:(unint64_t)a3
{
  COClusterRole *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COClusterRole;
  result = -[COClusterRole init](&v5, sel_init);
  if (result)
    result->_flags = a3;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, flags = %#lx>"), v5, self, -[COClusterRole flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPrimary
{
  _BOOL8 v3;

  if ((-[COClusterRole flags](self, "flags") & 1) != 0)
    LOBYTE(v3) = 1;
  else
    return (-[COClusterRole flags](self, "flags") >> 1) & 1;
  return v3;
}

- (BOOL)isUnknown
{
  return -[COClusterRole flags](self, "flags") == 0;
}

- (BOOL)isEqual:(id)a3
{
  COClusterRole *v4;
  BOOL v5;

  v4 = (COClusterRole *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[COClusterRole isEqualToRole:](self, "isEqualToRole:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRole:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[COClusterRole flags](self, "flags");
  v6 = objc_msgSend(v4, "flags");

  return v5 == v6;
}

- (BOOL)satisfiesRole:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[COClusterRole flags](self, "flags");
  v6 = objc_msgSend(v4, "flags") & v5;
  v7 = objc_msgSend(v4, "flags");

  return v6 == v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COClusterRole)initWithCoder:(id)a3
{
  id v4;
  COClusterRole *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COClusterRole;
  v5 = -[COClusterRole init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flags = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[COClusterRole flags](self, "flags"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("flags"));

}

- (unint64_t)flags
{
  return self->_flags;
}

@end
