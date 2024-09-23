@implementation HKAttributeConceptSelection

- (HKAttributeConceptSelection)init
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

- (HKAttributeConceptSelection)initWithAttribute:(int64_t)a3 operatorType:(unint64_t)a4 value:(id)a5
{
  id v8;
  HKAttributeConceptSelection *v9;
  HKAttributeConceptSelection *v10;
  uint64_t v11;
  NSCopying *value;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKAttributeConceptSelection;
  v9 = -[HKConceptSelection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_operatorType = a4;
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    value = v10->_value;
    v10->_value = (NSCopying *)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t type;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  HKStringFromPredicateOperatorType(self->_operatorType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %lld '%@' %@>"), v4, type, v6, self->_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAttributeConceptSelection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  HKAttributeConceptSelection *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AttributeTypeKey"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AttributeOperatorTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AttributeValueKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[HKAttributeConceptSelection initWithAttribute:operatorType:value:](self, "initWithAttribute:operatorType:value:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("AttributeTypeKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatorType, CFSTR("AttributeOperatorTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("AttributeValueKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKAttributeConceptSelection;
  if (-[HKConceptSelection isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[HKAttributeConceptSelection type](self, "type");
    if (v6 != objc_msgSend(v5, "type"))
      goto LABEL_12;
    v7 = -[HKAttributeConceptSelection operatorType](self, "operatorType");
    if (v7 != objc_msgSend(v5, "operatorType"))
      goto LABEL_12;
    -[HKAttributeConceptSelection value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "value");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

LABEL_12:
        v16 = 0;
        goto LABEL_13;
      }
      v12 = (void *)v11;
      -[HKAttributeConceptSelection value](self, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) == 0)
        goto LABEL_12;
    }
    v16 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (NSCopying)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
