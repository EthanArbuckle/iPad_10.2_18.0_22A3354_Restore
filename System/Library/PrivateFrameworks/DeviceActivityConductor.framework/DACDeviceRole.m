@implementation DACDeviceRole

+ (id)unknownRole
{
  return -[DACDeviceRole _initWithRoleFlags:]([DACDeviceRole alloc], "_initWithRoleFlags:", 0);
}

- (id)_initWithRoleFlags:(unint64_t)a3
{
  DACDeviceRole *v4;
  DACDeviceRole *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  DACDeviceRole *v10;
  __int16 v11;
  DACDeviceRole *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)DACDeviceRole;
  v4 = -[DACDeviceRole init](&v8, sel_init);
  v5 = v4;
  if (v4)
    v4->_flags = a3;
  DACLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v10 = v5;
    v11 = 2114;
    v12 = v5;
    _os_log_debug_impl(&dword_224FBF000, v6, OS_LOG_TYPE_DEBUG, "%p created role %{public}@", buf, 0x16u);
  }

  return v5;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = -[DACDeviceRole flags](self, "flags");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((v3 & 2) != 0)
    v8 = 70;
  else
    v8 = 95;
  v9 = 76;
  if ((v3 & 1) == 0)
    v9 = 95;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, flags(%#lx) [%c%c]>"), v6, self, v3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (DACDeviceRole)initWithCoder:(id)a3
{
  id v4;
  DACDeviceRole *v5;
  DACDeviceRole *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flags"));
    v5 = (DACDeviceRole *)objc_claimAutoreleasedReturnValue();
    v6 = -[DACDeviceRole _initWithRoleFlags:](self, "_initWithRoleFlags:", -[DACDeviceRole unsignedIntegerValue](v5, "unsignedIntegerValue"));
    self = v5;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACDeviceRole flags](self, "flags"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("flags"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  DACDeviceRole *v4;
  DACDeviceRole *v5;
  char isKindOfClass;
  BOOL v7;
  DACDeviceRole *v8;
  unint64_t v9;
  uint64_t v10;

  v4 = (DACDeviceRole *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v7 = 0;
      if (self && (isKindOfClass & 1) != 0)
      {
        v8 = v5;
        v9 = -[DACDeviceRole flags](self, "flags");
        v10 = -[DACDeviceRole flags](v8, "flags");

        v7 = v9 == v10;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPrimary
{
  return (-[DACDeviceRole flags](self, "flags") & 1) != 0 || -[DACDeviceRole isUnknown](self, "isUnknown");
}

- (BOOL)isUnknown
{
  return -[DACDeviceRole flags](self, "flags") == 0;
}

- (BOOL)satisfiesRole:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[DACDeviceRole flags](self, "flags");
  v6 = objc_msgSend(v4, "flags") & v5;
  v7 = objc_msgSend(v4, "flags");

  return v6 == v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end
