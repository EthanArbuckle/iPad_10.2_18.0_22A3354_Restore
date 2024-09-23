@implementation NSPropertyTransform

- (NSPropertyTransform)initWithPropertyName:(id)a3 valueExpression:(id)a4
{
  NSPropertyTransform *v6;
  const char *v7;
  NSPropertyTransform *v8;
  SEL v9;

  v6 = -[NSPropertyTransform init](self, "init");
  v8 = v6;
  if (v6)
  {
    objc_setProperty_nonatomic(v6, v7, a3, 16);
    objc_setProperty_nonatomic(v8, v9, a4, 8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_prerequisiteTransform = 0;
  self->_valueExpression = 0;

  self->_propertyName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPropertyTransform;
  -[NSPropertyTransform dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 replaceMissingValueOnly;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_valueExpression, CFSTR("NSValueExpression"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_propertyName, CFSTR("NSPropertyName"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_prerequisiteTransform, CFSTR("NSPrerequisiteTransform"));
    replaceMissingValueOnly = self->_replaceMissingValueOnly;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("NSValueExpression"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("NSPropertyName"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("NSPrerequisiteTransform"));
    replaceMissingValueOnly = 0;
  }
  objc_msgSend(a3, "encodeBool:forKey:", replaceMissingValueOnly, CFSTR("NSReplaceMissingValueOnly"));
}

- (NSPropertyTransform)initWithCoder:(id)a3
{
  NSPropertyTransform *v4;
  NSString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSPropertyTransform;
  v4 = -[NSPropertyTransform init](&v7, sel_init);
  if (v4)
  {
    v4->_replaceMissingValueOnly = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSReplaceMissingValueOnly"));
    v4->_prerequisiteTransform = (NSPropertyTransform *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPrerequisiteTransform"));
    v4->_valueExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSValueExpression"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSExpression allowEvaluation](v4->_valueExpression, "allowEvaluation");
    v5 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPropertyName"));
    v4->_propertyName = v5;
    if (v5 && (-[NSString isNSString](v5, "isNSString") & 1) == 0)
    {
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4ADB8));

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSString *propertyName;
  NSString *v6;
  int v7;
  NSExpression *valueExpression;
  NSExpression *v9;
  NSPropertyTransform *prerequisiteTransform;
  NSPropertyTransform *v11;
  uint64_t v12;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (!a3)
    goto LABEL_22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  if (!self)
  {
    if (!*((_QWORD *)a3 + 2))
    {
      v12 = *((_QWORD *)a3 + 1);
      if (!v12)
      {
        LOBYTE(v7) = 0;
        if (*((_QWORD *)a3 + 3))
          return v7;
        goto LABEL_18;
      }
    }
    goto LABEL_22;
  }
  propertyName = self->_propertyName;
  v6 = (NSString *)*((_QWORD *)a3 + 2);
  if (propertyName != v6)
  {
    LOBYTE(v7) = 0;
    if (!propertyName || !v6)
      return v7;
    if ((-[NSString isEqual:](self->_propertyName, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  valueExpression = self->_valueExpression;
  v9 = (NSExpression *)*((_QWORD *)a3 + 1);
  if (valueExpression != v9)
  {
    LOBYTE(v7) = 0;
    if (!valueExpression || !v9)
      return v7;
    if ((-[NSExpression isEqual:](self->_valueExpression, "isEqual:") & 1) == 0)
    {
LABEL_22:
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  prerequisiteTransform = self->_prerequisiteTransform;
  v11 = (NSPropertyTransform *)*((_QWORD *)a3 + 3);
  if (prerequisiteTransform == v11
    || (LOBYTE(v7) = 0, prerequisiteTransform)
    && v11
    && (v7 = -[NSPropertyTransform isEqual:](self->_prerequisiteTransform, "isEqual:")) != 0)
  {
    LOBYTE(v12) = self->_replaceMissingValueOnly;
LABEL_18:
    LOBYTE(v7) = v12 ^ (*((_BYTE *)a3 + 32) == 0);
  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  NSString *propertyName;
  NSExpression *valueExpression;
  NSPropertyTransform *prerequisiteTransform;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("NO");
  if (self)
  {
    valueExpression = self->_valueExpression;
    propertyName = self->_propertyName;
    prerequisiteTransform = self->_prerequisiteTransform;
    if (self->_replaceMissingValueOnly)
      v5 = CFSTR("YES");
  }
  else
  {
    valueExpression = 0;
    propertyName = 0;
    prerequisiteTransform = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@), propertyName %@, valueExpression %@, prerequisiteTransform %@, replaceMissingValueOnly %@"), v4, propertyName, valueExpression, prerequisiteTransform, v5);
}

@end
