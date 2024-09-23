@implementation HKConceptAttribute

- (HKConceptAttribute)init
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

- (HKConceptAttribute)initWithType:(int64_t)a3 value:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  id v10;
  HKConceptAttribute *v11;
  HKConceptAttribute *v12;
  uint64_t v13;
  NSString *stringValue;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKConceptAttribute;
  v11 = -[HKConceptAttribute init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v13 = objc_msgSend(v10, "copy");
    stringValue = v12->_stringValue;
    v12->_stringValue = (NSString *)v13;

    v12->_version = a5;
    v12->_deleted = a6;
  }

  return v12;
}

- (HKConceptAttribute)initWithType:(int64_t)a3 stringValue:(id)a4
{
  return -[HKConceptAttribute initWithType:value:version:deleted:](self, "initWithType:value:version:deleted:", a3, a4, 0, 0);
}

- (HKConceptAttribute)initWithType:(int64_t)a3 numberValue:(id)a4
{
  void *v6;
  HKConceptAttribute *v7;

  objc_msgSend(a4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKConceptAttribute initWithType:stringValue:](self, "initWithType:stringValue:", a3, v6);

  return v7;
}

- (HKConceptAttribute)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4
{
  __CFString **v4;

  v4 = HKConceptAttributeValueTrue;
  if (!a4)
    v4 = HKConceptAttributeValueFalse;
  return -[HKConceptAttribute initWithType:stringValue:](self, "initWithType:stringValue:", a3, *v4);
}

- (NSNumber)numberValue
{
  void *v2;
  void *v3;

  -[HKConceptAttribute stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (numberValue_onceToken != -1)
      dispatch_once(&numberValue_onceToken, &__block_literal_global_24);
    objc_msgSend((id)numberValue_numberFormatter, "numberFromString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

void __33__HKConceptAttribute_numberValue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)numberValue_numberFormatter;
  numberValue_numberFormatter = (uint64_t)v0;

}

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[HKConceptAttribute stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("true"));

  return v3;
}

- (int64_t)longLongValue
{
  void *v2;
  int64_t v3;

  -[HKConceptAttribute numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (%lld, '%@')>"), objc_opt_class(), self, self->_type, self->_stringValue);
}

- (unint64_t)hash
{
  int64_t type;

  type = self->_type;
  return -[NSString hash](self->_stringValue, "hash") ^ type;
}

- (BOOL)isEqual:(id)a3
{
  HKConceptAttribute *v4;
  HKConceptAttribute *v5;
  NSString *stringValue;
  NSString *v7;
  char v8;

  v4 = (HKConceptAttribute *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_type != v5->_type)
        goto LABEL_9;
      stringValue = self->_stringValue;
      v7 = v5->_stringValue;
      if (stringValue == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSString isEqual:](stringValue, "isEqual:");
      else
LABEL_9:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptAttribute)initWithCoder:(id)a3
{
  id v4;
  HKConceptAttribute *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKConceptAttribute;
  v5 = -[HKConceptAttribute init](&v9, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    v5->_version = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Version"));
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Deleted"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stringValue, CFSTR("Value"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("Deleted"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
