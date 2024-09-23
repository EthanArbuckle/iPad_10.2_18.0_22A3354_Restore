@implementation HKUserDomainConceptNamedQuantity

- (HKUserDomainConceptNamedQuantity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptNamedQuantity)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The -%@ method is not available on %@"), v9, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 quantity:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  HKUserDomainConceptNamedQuantity *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "_value");
  v11 = v10;
  objc_msgSend(v8, "_unit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "unitString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKUserDomainConceptNamedQuantity initWithName:value:unitString:type:version:timestamp:deleted:](self, "initWithName:value:unitString:type:version:timestamp:deleted:", v9, v13, a5, 1, 0, v11, CFAbsoluteTimeGetCurrent());

  return v14;
}

- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 value:(double)a4 unitString:(id)a5 type:(int64_t)a6 version:(int64_t)a7 timestamp:(double)a8 deleted:(BOOL)a9
{
  _BOOL8 v9;
  id v17;
  id v18;
  void *v19;
  HKUserDomainConceptNamedQuantity *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *unitString;
  void *v26;
  objc_super v27;

  v9 = a9;
  v17 = a3;
  v18 = a5;
  v19 = v18;
  if (!v18 || !objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptNamedQuantity.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitString && unitString.length > 0"));

  }
  v27.receiver = self;
  v27.super_class = (Class)HKUserDomainConceptNamedQuantity;
  v20 = -[HKUserDomainConceptProperty initWithType:version:timestamp:deleted:](&v27, sel_initWithType_version_timestamp_deleted_, a6, a7, v9, a8);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v20->_value = a4;
    v23 = objc_msgSend(v19, "copy");
    unitString = v20->_unitString;
    v20->_unitString = (NSString *)v23;

    v20->_lock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

+ (id)nullPropertyWithType:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  +[HKUnit _nullUnit](HKUnit, "_nullUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)a1);
  objc_msgSend(v5, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:unitString:type:version:timestamp:deleted:", 0, v7, a3, 1, 1, 0.0, CFAbsoluteTimeGetCurrent());

  return v8;
}

- (HKQuantity)quantity
{
  os_unfair_lock_s *p_lock;
  HKQuantity *lock_quantity;
  void *v5;
  HKQuantity *v6;
  HKQuantity *v7;
  HKQuantity *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_quantity = self->_lock_quantity;
  if (!lock_quantity)
  {
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", self->_unitString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v5, self->_value);
      v6 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      v7 = self->_lock_quantity;
      self->_lock_quantity = v6;

    }
    lock_quantity = self->_lock_quantity;
  }
  v8 = lock_quantity;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKUserDomainConceptNamedQuantity;
  v3 = -[HKUserDomainConceptProperty hash](&v7, sel_hash);
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  value = (unint64_t)self->_value;
  return v4 ^ -[NSString hash](self->_unitString, "hash") ^ value;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKUserDomainConceptNamedQuantity *v5;
  HKUserDomainConceptNamedQuantity *v6;
  uint64_t v7;
  NSString *name;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  char v12;
  double value;
  double v14;
  NSString *unitString;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  objc_super v23;

  v5 = (HKUserDomainConceptNamedQuantity *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)HKUserDomainConceptNamedQuantity;
      if (-[HKUserDomainConceptProperty isEqual:](&v23, sel_isEqual_, v5))
      {
        v6 = v5;
        v7 = 56;
        name = self->_name;
        -[HKUserDomainConceptNamedQuantity name](v6, "name");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (name != v9)
        {
          -[HKUserDomainConceptNamedQuantity name](v6, "name");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v12 = 0;
            goto LABEL_20;
          }
          v3 = (void *)v10;
          v11 = self->_name;
          -[HKUserDomainConceptNamedQuantity name](v6, "name");
          v7 = objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqual:](v11, "isEqual:", v7))
          {
            v12 = 0;
LABEL_19:

            goto LABEL_20;
          }
        }
        value = self->_value;
        -[HKUserDomainConceptNamedQuantity value](v6, "value");
        if (value == v14)
        {
          unitString = self->_unitString;
          -[HKUserDomainConceptNamedQuantity unitString](v6, "unitString");
          v16 = objc_claimAutoreleasedReturnValue();
          if (unitString == (NSString *)v16)
          {

            v12 = 1;
            goto LABEL_18;
          }
          v17 = (void *)v16;
          -[HKUserDomainConceptNamedQuantity unitString](v6, "unitString");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            v20 = self->_unitString;
            -[HKUserDomainConceptNamedQuantity unitString](v6, "unitString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSString isEqual:](v20, "isEqual:", v21);

            goto LABEL_18;
          }

        }
        v12 = 0;
LABEL_18:
        if (name != v9)
          goto LABEL_19;
LABEL_20:

        goto LABEL_21;
      }
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)valueDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'(%@, %f, %@)'"), self->_name, *(_QWORD *)&self->_value, self->_unitString);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptNamedQuantity;
  v4 = a3;
  -[HKUserDomainConceptProperty encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("value"), self->_value);
  objc_msgSend(v4, "encodeObject:forKey:", self->_unitString, CFSTR("unit"));

}

- (HKUserDomainConceptNamedQuantity)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptNamedQuantity *v5;
  uint64_t v6;
  NSString *name;
  double v8;
  uint64_t v9;
  NSString *unitString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptNamedQuantity;
  v5 = -[HKUserDomainConceptProperty initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("value"));
    v5->_value = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unit"));
    v9 = objc_claimAutoreleasedReturnValue();
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v9;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (double)value
{
  return self->_value;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock_quantity, 0);
}

- (void)quantity
{
  uint64_t v4;

  v4 = *a2;
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "<%@>: Tried to instantiate an HKUnit with an unknown unit string: %@", buf, 0x16u);
}

@end
