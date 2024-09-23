@implementation CLSAggregatedValue

- (CLSAggregatedValue)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSAggregatedValue *v6;
  double v7;
  const char *v8;
  const char *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSAggregatedValue;
  v6 = -[CLSAggregatedValue init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("value"));
    v6->_value = v7;
    v6->_totalSampleCount = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("totalSampleCount"));
    v6->_aggregateType = objc_msgSend_decodeIntForKey_(v4, v9, (uint64_t)CFSTR("aggregateType"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double value;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  value = self->_value;
  v8 = a3;
  objc_msgSend_encodeDouble_forKey_(v8, v5, (uint64_t)CFSTR("value"), value);
  objc_msgSend_encodeInteger_forKey_(v8, v6, self->_totalSampleCount, CFSTR("totalSampleCount"));
  objc_msgSend_encodeInt_forKey_(v8, v7, self->_aggregateType, CFSTR("aggregateType"));

}

- (double)normalized
{
  int64_t totalSampleCount;

  totalSampleCount = self->_totalSampleCount;
  if (totalSampleCount <= 1)
    totalSampleCount = 1;
  return self->_value / (double)totalSampleCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLSAggregatedValue;
  v4 = -[CLSReportItem copyWithZone:](&v18, sel_copyWithZone_, a3);
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v7, v8);
  v11 = objc_msgSend_totalSampleCount(self, v9, v10);
  objc_msgSend_setTotalSampleCount_(v4, v12, v11);
  v15 = objc_msgSend_aggregateType(self, v13, v14);
  objc_msgSend_setAggregateType_(v4, v16, v15);
  return v4;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  int64_t v15;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (self->_totalSampleCount || objc_msgSend_totalSampleCount(v4, v5, v6) && self->_totalSampleCount)
  {
    if (objc_msgSend_totalSampleCount(v7, v5, v6))
    {
      objc_msgSend_normalized(self, v8, v9);
      v11 = v10;
      objc_msgSend_normalized(v7, v12, v13);
      if (v11 < v14)
        v15 = -1;
      else
        v15 = v11 > v14;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (void)add:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend_value(v4, v5, v6);
  self->_value = v7 + self->_value;
  v10 = objc_msgSend_totalSampleCount(v4, v8, v9);

  self->_totalSampleCount += v10;
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  objc_msgSend_value(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" value: %.3f"), v10);
  v13 = objc_msgSend_totalSampleCount(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" samples: %ld"), v13);
  objc_msgSend_appendString_(v6, v15, (uint64_t)CFSTR(">"));
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
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSAggregatedValue;
  -[CLSReportItem dictionaryRepresentation](&v19, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_numberWithDouble_(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("value"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_totalSampleCount(self, v12, v13);
  objc_msgSend_numberWithInteger_(v11, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, CFSTR("samples"));

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

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void)setTotalSampleCount:(int64_t)a3
{
  self->_totalSampleCount = a3;
}

- (int)aggregateType
{
  return self->_aggregateType;
}

- (void)setAggregateType:(int)a3
{
  self->_aggregateType = a3;
}

@end
