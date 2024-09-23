@implementation HMAccessorySettingConstraint

- (HMAccessorySettingConstraint)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMAccessorySettingConstraint)initWithType:(int64_t)a3 value:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  HMAccessorySettingConstraint *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMAccessorySettingConstraint initWithIdentifier:type:value:](self, "initWithIdentifier:type:value:", v8, a3, v7);

  return v9;
}

- (HMAccessorySettingConstraint)initWithIdentifier:(id)a3 type:(int64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  HMAccessorySettingConstraint *v10;
  HMAccessorySettingConstraint *v11;
  uint64_t v12;
  id value;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySettingConstraint;
  v10 = -[HMAccessorySettingConstraint init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v8, "getUUIDBytes:", v10->_identifierUUIDBytes);
    v11->_type = a4;
    v12 = objc_msgSend(v9, "copy");
    value = v11->_value;
    v11->_value = (id)v12;

  }
  return v11;
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_identifierUUIDBytes);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMAccessorySettingConstraint *v4;
  int64_t v5;
  void *v6;
  void *v7;
  HMAccessorySettingConstraint *v8;

  v4 = +[HMAccessorySettingConstraint allocWithZone:](HMAccessorySettingConstraint, "allocWithZone:", a3);
  v5 = -[HMAccessorySettingConstraint type](self, "type");
  -[HMAccessorySettingConstraint value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[HMAccessorySettingConstraint initWithType:value:](v4, "initWithType:value:", v5, v7);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[HMAccessorySettingConstraint value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HMAccessorySettingConstraint type](self, "type") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingConstraint *v4;
  HMAccessorySettingConstraint *v5;
  HMAccessorySettingConstraint *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMAccessorySettingConstraint *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (v7 = -[HMAccessorySettingConstraint type](self, "type"), v7 == -[HMAccessorySettingConstraint type](v6, "type")))
    {
      -[HMAccessorySettingConstraint value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingConstraint value](v6, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HMFEqualObjects();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingConstraint identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  -[HMAccessorySettingConstraint identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMAccessorySettingConstraint type](self, "type") - 1;
  if (v10 > 3)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E3AADA30[v10];
  -[HMAccessorySettingConstraint value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Type = %@, Value = %@>"), v6, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HMAccessorySettingConstraint descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMAccessorySettingConstraint descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (HMAccessorySettingConstraint)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMAccessorySettingConstraint *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.type"));
  objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("HM.value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMAccessorySettingConstraint initWithType:value:](self, "initWithType:value:", v5, v7);
  if (v8 && objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.identifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getUUIDBytes:", v8->_identifierUUIDBytes);

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessorySettingConstraint identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessorySettingConstraint type](self, "type"), CFSTR("HM.type"));
  -[HMAccessorySettingConstraint value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.value"));

}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (NSSet)supportedValueClasses
{
  if (supportedValueClasses_onceToken != -1)
    dispatch_once(&supportedValueClasses_onceToken, &__block_literal_global_782);
  return (NSSet *)(id)supportedValueClasses_supportedValueClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __53__HMAccessorySettingConstraint_supportedValueClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedValueClasses_supportedValueClasses;
  supportedValueClasses_supportedValueClasses = v2;

}

@end
