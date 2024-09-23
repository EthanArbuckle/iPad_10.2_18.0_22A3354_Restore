@implementation CMVO2MaxRetrocomputeState

- (CMVO2MaxRetrocomputeState)initWithStatus:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 meanDelta:(id)a6
{
  CMVO2MaxRetrocomputeState *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMVO2MaxRetrocomputeState;
  v10 = -[CMVO2MaxRetrocomputeState init](&v12, sel_init);
  if (v10)
  {
    v10->_startDate = (NSDate *)a4;
    v10->_endDate = (NSDate *)a5;
    v10->_meanDelta = (NSNumber *)a6;
    v10->_status = a3;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMVO2MaxRetrocomputeState;
  -[CMVO2MaxRetrocomputeState dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVO2MaxRetrocomputeState)initWithCoder:(id)a3
{
  CMVO2MaxRetrocomputeState *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMVO2MaxRetrocomputeState;
  v4 = -[CMVO2MaxRetrocomputeState init](&v33, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStartDate"), v7);
    v4->_startDate = (NSDate *)objc_msgSend_copy(v8, v9, v10, v11, v12);
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kMetMinuteDataCodingKeyEndDate"), v15);
    v4->_endDate = (NSDate *)objc_msgSend_copy(v16, v17, v18, v19, v20);
    v21 = objc_opt_class();
    v24 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("kMetMinuteDataCodingKeyMeanDelta"), v23);
    v4->_meanDelta = (NSNumber *)objc_msgSend_copy(v24, v25, v26, v27, v28);
    v4->_status = objc_msgSend_decodeInt64ForKey_(a3, v29, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStatus"), v30, v31);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStatus_startDate_endDate_meanDelta_, self->_status, self->_startDate, self->_endDate);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_endDate, (uint64_t)CFSTR("kMetMinuteDataCodingKeyEndDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_meanDelta, (uint64_t)CFSTR("kMetMinuteDataCodingKeyMeanDelta"), v9);
  objc_msgSend_encodeInt64_forKey_(a3, v10, self->_status, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStatus"), v11);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t started;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_meanDelta(self, v16, v17, v18, v19);
  v25 = objc_msgSend_status(self, v21, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("%@, <startDate, %@, endDate, %@, meanDelta, %@, status %ld>"), v27, v28, v5, started, v15, v20, v25);
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSNumber)meanDelta
{
  return self->_meanDelta;
}

@end
