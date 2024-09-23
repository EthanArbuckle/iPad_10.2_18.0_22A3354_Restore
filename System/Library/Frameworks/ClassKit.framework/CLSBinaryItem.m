@implementation CLSBinaryItem

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSBinaryItem;
  return -[CLSActivityItem _init](&v3, sel__init);
}

- (CLSBinaryItem)initWithIdentifier:(id)a3 title:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSBinaryItem;
  return -[CLSActivityItem initWithIdentifier:title:](&v5, sel_initWithIdentifier_title_, a3, a4);
}

- (CLSBinaryItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(CLSBinaryValueType)valueType
{
  CLSBinaryItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSBinaryItem;
  result = -[CLSActivityItem initWithIdentifier:title:](&v7, sel_initWithIdentifier_title_, identifier, title);
  if (result)
    result->_valueType = valueType;
  return result;
}

- (CLSBinaryItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSBinaryItem *v6;
  const char *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSBinaryItem;
  v6 = -[CLSActivityItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_valueType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("valueType"));
    v6->_value = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)CFSTR("value"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSBinaryItem;
  v4 = a3;
  -[CLSActivityItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_valueType, CFSTR("valueType"), v7.receiver, v7.super_class);
  objc_msgSend_encodeBool_forKey_(v4, v6, self->_value, CFSTR("value"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v18.receiver = self;
  v18.super_class = (Class)CLSBinaryItem;
  -[CLSActivityItem description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  v9 = objc_msgSend_valueType(self, v7, v8);
  if (v9 > 3)
    objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (valueType: %@)"), 0);
  else
    objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (valueType: %@)"), off_1E974B970[v9]);
  if (objc_msgSend_value(self, v11, v12))
    objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (value: %@)"), CFSTR("TRUE"));
  else
    objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (value: %@)"), CFSTR("FALSE"));
  v16 = (void *)objc_msgSend_copy(v6, v14, v15);

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSBinaryItem;
  -[CLSActivityItem dictionaryRepresentation](&v16, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_valueType(self, v4, v5);
  if (v6 > 3)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v7, 0, CFSTR("valueType"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)off_1E974B970[v6], CFSTR("valueType"));
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_value(self, v8, v9);
  objc_msgSend_numberWithBool_(v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("value"));

  return v3;
}

- (BOOL)value
{
  uint64_t v2;
  BOOL value;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  value = self->_value;
  objc_msgSend_unlock(self, v5, v6);
  return value;
}

- (void)setValue:(BOOL)value
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = value;
  objc_msgSend_lock(self, a2, value);
  if (self->_value != v3)
  {
    self->_value = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (CLSBinaryValueType)valueType
{
  return self->_valueType;
}

- (void)setValueType:(int64_t)a3
{
  self->_valueType = a3;
}

@end
