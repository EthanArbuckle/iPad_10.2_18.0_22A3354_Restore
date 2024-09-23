@implementation GDWeatherTypeValue

- (GDWeatherTypeValue)initWithType:(int64_t)a3 typeValue:(double)a4
{
  GDWeatherTypeValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDWeatherTypeValue;
  result = -[GDWeatherTypeValue init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_typeValue = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v6 = a3;
  objc_msgSend_numberWithInteger_(v4, v7, type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v10, (uint64_t)v8, v9);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v11, v12, self->_typeValue);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typeValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v14, (uint64_t)v15, v13);

}

- (GDWeatherTypeValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend_intValue(v8, v9, v10);

  v12 = objc_opt_class();
  NSStringFromSelector(sel_typeValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_doubleValue(v15, v16, v17);
  return (GDWeatherTypeValue *)MEMORY[0x1E0DE7D20](self, sel_initWithType_typeValue_, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend_allocWithZone_(GDWeatherTypeValue, a2, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithType_typeValue_, self->_type);
}

- (id)description
{
  unint64_t type;
  __CFString *v4;
  id v5;
  const char *v6;

  type = self->_type;
  if (type > 7)
    v4 = 0;
  else
    v4 = off_1E5DD95E8[type];
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v5, v6, (uint64_t)CFSTR("GDWeatherTypeValue<type: %@, typeValue: %lf>"), v4, *(_QWORD *)&self->_typeValue);
}

- (int64_t)type
{
  return self->_type;
}

- (double)typeValue
{
  return self->_typeValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
