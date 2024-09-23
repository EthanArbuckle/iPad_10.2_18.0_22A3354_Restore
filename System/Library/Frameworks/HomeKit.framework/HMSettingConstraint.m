@implementation HMSettingConstraint

- (HMSettingConstraint)init
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

- (HMSettingConstraint)initWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  HMSettingConstraint *v7;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSCopying *value;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMSettingConstraint;
  v7 = -[HMSettingConstraint init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v7->_type = a3;
    v10 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSCopying *)v10;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMSettingConstraint *v4;
  int64_t v5;
  void *v6;
  void *v7;
  HMSettingConstraint *v8;

  v4 = +[HMSettingConstraint allocWithZone:](HMSettingConstraint, "allocWithZone:", a3);
  v5 = -[HMSettingConstraint type](self, "type");
  -[HMSettingConstraint value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[HMSettingConstraint initWithType:value:](v4, "initWithType:value:", v5, v7);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[HMSettingConstraint value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HMSettingConstraint type](self, "type") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HMSettingConstraint *v4;
  HMSettingConstraint *v5;
  HMSettingConstraint *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMSettingConstraint *)a3;
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
    if (v6 && (v7 = -[HMSettingConstraint type](self, "type"), v7 == -[HMSettingConstraint type](v6, "type")))
    {
      -[HMSettingConstraint value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingConstraint value](v6, "value");
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
  -[HMSettingConstraint identifier](self, "identifier");
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
  -[HMSettingConstraint identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMSettingConstraint type](self, "type") - 1;
  if (v10 > 3)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E3AB4340[v10];
  -[HMSettingConstraint value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Type = %@, Value = %@>"), v6, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HMSettingConstraint descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMSettingConstraint descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (HMSettingConstraint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMSettingConstraint *v8;
  uint64_t v9;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("HM.value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMSettingConstraint initWithType:value:](self, "initWithType:value:", objc_msgSend(v5, "integerValue"), v7);
  if (v8 && objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.identifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

  }
  return v8;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (NSCopying)value
{
  return (NSCopying *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken_44125 != -1)
    dispatch_once(&supportedValueClasses_onceToken_44125, &__block_literal_global_44126);
  return (id)supportedValueClasses_supportedValueClasses_44127;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __44__HMSettingConstraint_supportedValueClasses__block_invoke()
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
  v3 = (void *)supportedValueClasses_supportedValueClasses_44127;
  supportedValueClasses_supportedValueClasses_44127 = v2;

}

@end
