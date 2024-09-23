@implementation CLSBinaryReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSBinaryReportItem;
  v4 = -[CLSActivityReportItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  v7 = objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v8, v7);
  v11 = objc_msgSend_valueType(self, v9, v10);
  objc_msgSend_setValueType_(v4, v12, v11);
  return v4;
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v8 = v5;
    v9 = 0.0;
    if (self->_value)
      v9 = 1.0;
    objc_msgSend_setQuantity_(v5, v6, v7, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend_maxValue(v4, v10, v11);
      objc_msgSend_setMaxValue_(v8, v12, v13);
      if (self->_value)
        v16 = 1.0;
      else
        v16 = 0.0;
      objc_msgSend_maxValue(v8, v14, v15);
      objc_msgSend_setValue_(v8, v18, v19, v17 * v16);
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)CLSBinaryReportItem;
      -[CLSReportItem convertToItemCompatibleWithItem:](&v21, sel_convertToItemCompatibleWithItem_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (CLSBinaryReportItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSBinaryReportItem *v6;
  const char *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSBinaryReportItem;
  v6 = -[CLSActivityReportItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_value = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("value"));
    v6->_valueType = (int)objc_msgSend_decodeIntForKey_(v4, v7, (uint64_t)CFSTR("valueType"));
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
  v7.super_class = (Class)CLSBinaryReportItem;
  v4 = a3;
  -[CLSActivityReportItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeBool_forKey_(v4, v5, self->_value, CFSTR("value"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v6, LODWORD(self->_valueType), CFSTR("valueType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  int value;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value == objc_msgSend_value(v4, v6, v7))
  {
    v10 = 0;
  }
  else if (self->_value || (objc_msgSend_value(v4, v8, v9) & 1) == 0)
  {
    v10 = 1;
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)add:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_convertToItemCompatibleWithItem_(a3, a2, (uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (self->_value)
  {
    self->_value = objc_msgSend_value(v4, v5, v6);
    v4 = v7;
  }
  self->_valueType = objc_msgSend_valueType(v4, v5, v6);

}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  objc_msgSend_title(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" title: %@"), v9);

  objc_msgSend_identifier(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" identifier: %@"), v13);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_value(self, v16, v17);
  objc_msgSend_numberWithBool_(v15, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v21, (uint64_t)CFSTR(" value: %@"), v20);

  v24 = objc_msgSend_valueType(self, v22, v23);
  NSStringFromBinaryValueType(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR(" valueType: %@"), v25);

  objc_msgSend_appendString_(v6, v27, (uint64_t)CFSTR(">"));
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSBinaryReportItem;
  -[CLSActivityReportItem dictionaryRepresentation](&v17, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_value(self, v5, v6);
  objc_msgSend_numberWithBool_(v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("value"));

  v13 = objc_msgSend_valueType(self, v11, v12);
  NSStringFromBinaryValueType(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("valueType"));

  return v3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(int64_t)a3
{
  self->_valueType = a3;
}

@end
