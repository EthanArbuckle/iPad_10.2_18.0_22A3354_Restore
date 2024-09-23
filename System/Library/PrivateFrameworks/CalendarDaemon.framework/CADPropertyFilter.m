@implementation CADPropertyFilter

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 stringValue:(id)a5
{
  id v9;
  CADPropertyFilter *v10;
  CADPropertyFilter *v11;
  CADPropertyFilter *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CADPropertyFilter;
  v10 = -[CADPropertyFilter init](&v14, sel_init);
  v11 = v10;
  if (v10
    && (v10->_property = a3,
        v10->_comparison = a4,
        objc_storeStrong((id *)&v10->_stringValue, a5),
        !-[CADPropertyFilter validateWithRequiredPropertyType:](v11, "validateWithRequiredPropertyType:", 0)))
  {
    v12 = 0;
  }
  else
  {
    v12 = v11;
  }

  return v12;
}

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 integerValue:(int64_t)a5
{
  CADPropertyFilter *v8;
  CADPropertyFilter *v9;
  CADPropertyFilter *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CADPropertyFilter;
  v8 = -[CADPropertyFilter init](&v12, sel_init);
  v9 = v8;
  if (v8
    && (v8->_property = a3,
        v8->_comparison = a4,
        v8->_integerValue = a5,
        !-[CADPropertyFilter validateWithRequiredPropertyType:](v8, "validateWithRequiredPropertyType:", 1)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 dateValue:(id)a5
{
  id v8;
  CADPropertyFilter *v9;
  CADPropertyFilter *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSDate *dateValue;
  CADPropertyFilter *v15;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CADPropertyFilter;
  v9 = -[CADPropertyFilter init](&v17, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_5;
  v9->_property = a3;
  v9->_comparison = a4;
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:", floor(v12));
    v13 = objc_claimAutoreleasedReturnValue();
    dateValue = v10->_dateValue;
    v10->_dateValue = (NSDate *)v13;

  }
  if (!-[CADPropertyFilter validateWithRequiredPropertyType:](v10, "validateWithRequiredPropertyType:", 2))
    v15 = 0;
  else
LABEL_5:
    v15 = v10;

  return v15;
}

- (BOOL)validateWithRequiredPropertyType:(int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v8[16];

  v5 = -[CADPropertyFilter validate](self, "validate");
  if (v5)
  {
    if (*((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v6 = CADLogHandle;
      v5 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_ERROR, "Property is of the wrong type; you must use the initializer that matches the property type.",
          v8,
          2u);
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (BOOL)validate
{
  void *v3;
  NSObject *v4;
  int64_t v5;
  int64_t property;
  const char *v7;
  void *v8;
  int64_t comparison;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!getSearchPropertyInfo(self->_property))
  {
    v4 = CADLogHandle;
    LODWORD(v5) = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)v5)
      return v5;
    property = self->_property;
    v11 = 134217984;
    v12 = property;
    v7 = "property %li is invalid.";
    goto LABEL_6;
  }
  if (-[CADPropertyFilter isDate](self, "isDate"))
  {
    -[CADPropertyFilter dateValue](self, "dateValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CADPropertyFilter isString](self, "isString"))
    {
LABEL_10:
      LOBYTE(v5) = 1;
      return v5;
    }
    -[CADPropertyFilter stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v3;

  if (v8 || !-[CADPropertyFilter comparison](self, "comparison"))
    goto LABEL_10;
  v5 = -[CADPropertyFilter comparison](self, "comparison");
  if (v5 != 1)
  {
    v4 = CADLogHandle;
    LODWORD(v5) = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v5)
    {
      comparison = self->_comparison;
      v11 = 134217984;
      v12 = comparison;
      v7 = "comparison %li is invalid for null values.";
LABEL_6:
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)applicableToEntityType:(int)a3
{
  __CFString *v4;
  int v5;
  int isa;
  BOOL result;

  if (a3 == -1)
    return 0;
  v4 = getSearchPropertyInfo(self->_property)[2];
  do
  {
    isa = (int)v4->isa;
    v4 = (__CFString *)((char *)v4 + 4);
    v5 = isa;
    result = isa != -1;
  }
  while (isa != a3 && v5 != -1);
  return result;
}

- (BOOL)isString
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 0;
}

- (BOOL)isInteger
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 1;
}

- (BOOL)isDate
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 2;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString **SearchPropertyInfo;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  unint64_t v24;
  __CFString *v25;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  SearchPropertyInfo = getSearchPropertyInfo(-[CADPropertyFilter property](self, "property"));
  v14 = *((_DWORD *)SearchPropertyInfo + 2);
  if (v14)
  {
    if (v14 != 2)
    {
      if (v14 != 1)
      {
LABEL_10:
        v19 = -[CADPropertyFilter comparison](self, "comparison");
        if (v19 > 5)
          v20 = 0;
        else
          v20 = off_1E6A37FD8[v19];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ ?"), *SearchPropertyInfo, v20);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CADPropertyFilter integerValue](self, "integerValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1E6A50708;
LABEL_9:
      objc_msgSend(v10, "addObject:", v15);

      objc_msgSend(v11, "addObject:", v16);
      goto LABEL_10;
    }
    -[CADPropertyFilter dateValue](self, "dateValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CADPropertyFilter dateValue](self, "dateValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1E6A50720;
      goto LABEL_9;
    }
  }
  else
  {
    -[CADPropertyFilter stringValue](self, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[CADPropertyFilter stringValue](self, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1E6A50738;
      goto LABEL_9;
    }
  }
  v24 = -[CADPropertyFilter comparison](self, "comparison");
  if (v24 > 5)
    v25 = 0;
  else
    v25 = off_1E6A37FA8[v24];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ NULL"), *SearchPropertyInfo, v25);
LABEL_14:
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _CADPropertySearchPredicateExtendWhereClause(v12, a4, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CADPropertyFilter)initWithCoder:(id)a3
{
  id v4;
  CADPropertyFilter *v5;
  uint64_t v6;
  NSString *stringValue;
  uint64_t v8;
  NSDate *dateValue;
  CADPropertyFilter *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CADPropertyFilter;
  v5 = -[CADFilter initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v5->_property = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("property"));
  v5->_comparison = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparison"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v6 = objc_claimAutoreleasedReturnValue();
  stringValue = v5->_stringValue;
  v5->_stringValue = (NSString *)v6;

  v5->_integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("integerValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateValue"));
  v8 = objc_claimAutoreleasedReturnValue();
  dateValue = v5->_dateValue;
  v5->_dateValue = (NSDate *)v8;

  if (!-[CADPropertyFilter validate](v5, "validate"))
    v10 = 0;
  else
LABEL_3:
    v10 = v5;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADPropertyFilter;
  v4 = a3;
  -[CADFilter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_property, CFSTR("property"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_comparison, CFSTR("comparison"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_integerValue, CFSTR("integerValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateValue, CFSTR("dateValue"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)property
{
  return self->_property;
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
