@implementation MXMSampleAttribute

- (NSString)stringValue
{
  if (self->_valueType == 1)
    return (NSString *)(id)objc_msgSend(self->_value, "copy");
  else
    return (NSString *)0;
}

- (NSNumber)numericValue
{
  if (self->_valueType == 2)
    return (NSNumber *)(id)objc_msgSend(self->_value, "copy");
  else
    return (NSNumber *)0;
}

+ (id)attributeWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeName:", v4);

  return v5;
}

+ (id)attributeWithName:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeName:stringValue:", v7, v6);

  return v8;
}

+ (id)attributeWithName:(id)a3 numericValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeName:numericValue:", v7, v6);

  return v8;
}

+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeName:valueType:value:", v6, a4, 0);

  return v7;
}

+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeName:valueType:value:", v9, a4, v8);

  return v10;
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3
{
  return -[MXMSampleAttribute initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, 0, 0);
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 numericValue:(id)a4
{
  return -[MXMSampleAttribute initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, 2, a4);
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 stringValue:(id)a4
{
  return -[MXMSampleAttribute initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, 1, a4);
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4
{
  return -[MXMSampleAttribute initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, a4, 0);
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v9;
  id v10;
  MXMSampleAttribute *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  void *v15;
  const __CFString *v16;
  SEL v17;
  MXMSampleAttribute *v18;
  uint64_t v19;
  id value;
  uint64_t v21;
  MXMSampleAttribute *v22;
  void *v24;
  objc_super v25;

  v9 = a3;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MXMSampleAttribute;
  v11 = -[MXMSampleAttribute init](&v25, sel_init);
  if (!v11)
    goto LABEL_13;
  v12 = objc_msgSend(v9, "copy");
  name = v11->_name;
  v11->_name = (NSString *)v12;

  v11->_valueType = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MXMSampleAttribute.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (!v10)
      goto LABEL_13;
LABEL_4:
    switch(a4)
    {
      case 0:
        value = v11->_value;
        v11->_value = 0;
LABEL_12:

        goto LABEL_13;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_11:
          v21 = objc_msgSend(v10, "copy");
          value = v11->_value;
          v11->_value = (id)v21;
          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Value is not of type Number.");
        v17 = a2;
        v18 = v11;
        v19 = 85;
        break;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Value is not of type String.");
        v17 = a2;
        v18 = v11;
        v19 = 81;
        break;
      default:
        v22 = 0;
        goto LABEL_14;
    }
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("MXMSampleAttribute.m"), v19, v16);

    goto LABEL_11;
  }
  if (v10)
    goto LABEL_4;
LABEL_13:
  v22 = v11;
LABEL_14:

  return v22;
}

- (id)copy
{
  return -[MXMSampleAttribute copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[MXMSampleAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MXMSampleAttribute valueType](self, "valueType");
  -[MXMSampleAttribute value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithAttributeName:valueType:value:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id value;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_valueType, CFSTR("valueType"));
  value = self->_value;
  if (value)
    objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));

}

- (MXMSampleAttribute)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  MXMSampleAttribute *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueType"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("value"))
    && (v6 == 1 || v6 == 2)
    && (v7 = objc_opt_class()) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[MXMSampleAttribute initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", v5, v6, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MXMSampleAttribute isEqualToAttribute:](self, "isEqualToAttribute:", v4);

  return v5;
}

- (BOOL)isEqualToAttribute:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleAttribute.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[attribute isKindOfClass:MXMSampleAttribute.class]"));

  }
  v6 = -[MXMSampleAttribute valueType](self, "valueType");
  if (v6 == objc_msgSend(v5, "valueType")
    && (-[MXMSampleAttribute name](self, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "name"),
        v8 = objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        (id)v8,
        v7,
        v9))
  {
    v10 = -[MXMSampleAttribute valueType](self, "valueType");
    switch(v10)
    {
      case 0:
        -[MXMSampleAttribute value](self, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(v5, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = v12 == 0;
LABEL_17:

LABEL_19:
          break;
        }
        goto LABEL_18;
      case 2:
        -[MXMSampleAttribute numericValue](self, "numericValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[MXMSampleAttribute numericValue](self, "numericValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "numericValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToNumber:", v13);
          goto LABEL_16;
        }
LABEL_18:
        LOBYTE(v8) = 0;
        goto LABEL_19;
      case 1:
        -[MXMSampleAttribute stringValue](self, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[MXMSampleAttribute stringValue](self, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);
LABEL_16:
          LOBYTE(v8) = v14;

          goto LABEL_17;
        }
        goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleAttribute name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleAttribute value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name='%@' value='%@'>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
