@implementation CLSScoreReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSScoreReportItem;
  v4 = -[CLSActivityReportItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v7, v8);
  objc_msgSend_maxValue(self, v9, v10);
  objc_msgSend_setMaxValue_(v4, v11, v12);
  return v4;
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  double value;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v7 = v5;
    value = self->_value;
    if (value > 2.22044605e-16)
      objc_msgSend_setValue_(v5, v6, 1);
    else
      objc_msgSend_setValue_(v5, v6, value < 0.0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend_setQuantity_(v7, v9, v10, self->_value);
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)CLSScoreReportItem;
      -[CLSReportItem convertToItemCompatibleWithItem:](&v12, sel_convertToItemCompatibleWithItem_, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (CLSScoreReportItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSScoreReportItem *v6;
  double v7;
  const char *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSScoreReportItem;
  v6 = -[CLSActivityReportItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("value"));
    v6->_value = v7;
    objc_msgSend_decodeDoubleForKey_(v4, v8, (uint64_t)CFSTR("maxValue"));
    v6->_maxValue = v9;
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
  v7.super_class = (Class)CLSScoreReportItem;
  v4 = a3;
  -[CLSActivityReportItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("value"), self->_value, v7.receiver, v7.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v6, (uint64_t)CFSTR("maxValue"), self->_maxValue);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)normalized
{
  double maxValue;

  maxValue = self->_maxValue;
  if (maxValue < 1.0)
    maxValue = 1.0;
  return self->_value / maxValue;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  double maxValue;
  double v9;
  int64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  maxValue = self->_maxValue;
  if (maxValue == 0.0)
  {
    objc_msgSend_maxValue(v4, v5, v6);
    if (v9 == 0.0)
    {
      v10 = 0;
      goto LABEL_12;
    }
    maxValue = self->_maxValue;
  }
  if (maxValue == 0.0)
  {
    v10 = -1;
  }
  else
  {
    objc_msgSend_maxValue(v7, v5, v6);
    if (v13 == 0.0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend_normalized(self, v11, v12);
      v15 = v14;
      objc_msgSend_normalized(v7, v16, v17);
      if (v15 < v18)
        v10 = -1;
      else
        v10 = v15 > v18;
    }
  }
LABEL_12:

  return v10;
}

- (void)add:(id)a3
{
  double value;
  const char *v5;
  uint64_t v6;
  double v7;
  double maxValue;
  const char *v9;
  uint64_t v10;
  double v11;
  id v12;

  objc_msgSend_convertToItemCompatibleWithItem_(a3, a2, (uint64_t)self);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  objc_msgSend_value(v12, v5, v6);
  self->_value = value + v7;
  maxValue = self->_maxValue;
  objc_msgSend_maxValue(v12, v9, v10);
  self->_maxValue = maxValue + v11;

}

- (void)scalarMultiply:(double)a3
{
  self->_value = self->_value * a3;
  self->_maxValue = self->_maxValue * a3;
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
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  objc_msgSend_title(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" title: %@"), v9);

  objc_msgSend_identifier(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" identifier: %@"), v13);

  objc_msgSend_value(self, v15, v16);
  objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR(" value: %.3f"), v18);
  objc_msgSend_maxValue(self, v19, v20);
  objc_msgSend_appendFormat_(v6, v21, (uint64_t)CFSTR(" maxValue: %.3f"), v22);
  objc_msgSend_appendString_(v6, v23, (uint64_t)CFSTR(">"));
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSScoreReportItem;
  -[CLSActivityReportItem dictionaryRepresentation](&v19, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_numberWithDouble_(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("value"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_maxValue(self, v12, v13);
  objc_msgSend_numberWithDouble_(v11, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, CFSTR("maxValue"));

  return v3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

@end
