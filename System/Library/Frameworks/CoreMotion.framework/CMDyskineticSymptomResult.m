@implementation CMDyskineticSymptomResult

- (CMDyskineticSymptomResult)initWithStartDate:(id)a3 endDate:(id)a4 percentDyskinesiaUnlikely:(float)a5 percentDyskinesiaLikely:(float)a6
{
  CMDyskineticSymptomResult *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMDyskineticSymptomResult;
  v10 = -[CMDyskineticSymptomResult init](&v12, sel_init);
  if (v10)
  {
    v10->_startDate = (NSDate *)a3;
    v10->_endDate = (NSDate *)a4;
    v10->_percentUnlikely = a5;
    v10->_percentLikely = a6;
  }
  return v10;
}

- (CMDyskineticSymptomResult)initWithParkinsonsResult:(const ParkinsonsResult *)a3
{
  CMDyskineticSymptomResult *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMDyskineticSymptomResult;
  v4 = -[CMDyskineticSymptomResult init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->_startDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v5, v6, v7, v8, v9, a3->var0);
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->_endDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v4->_percentUnlikely = 1.0 - a3->var3;
    v4->_percentLikely = a3->var3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMDyskineticSymptomResult;
  -[CMDyskineticSymptomResult dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDyskineticSymptomResult)initWithCoder:(id)a3
{
  CMDyskineticSymptomResult *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CMDyskineticSymptomResult;
  v4 = -[CMDyskineticSymptomResult init](&v20, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v4->_endDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyEndDate"), v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyNoObservation"), v12, v13);
    v4->_percentUnlikely = v14;
    objc_msgSend_decodeFloatForKey_(a3, v15, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyDyskinesiaLikely"), v16, v17);
    v4->_percentLikely = v18;
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
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_endDate_percentDyskinesiaUnlikely_percentDyskinesiaLikely_, self->_startDate, self->_endDate, v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_endDate, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyEndDate"), v7);
  *(float *)&v8 = self->_percentUnlikely;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyNoObservation"), v10, v11, v8);
  *(float *)&v12 = self->_percentLikely;
  objc_msgSend_encodeFloat_forKey_(a3, v13, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyDyskinesiaLikely"), v14, v15, v12);
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
  float v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  objc_msgSend_percentUnlikely(self, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_percentLikely(self, v22, v23, v24, v25);
  return (id)objc_msgSend_stringWithFormat_(v3, v27, (uint64_t)CFSTR("%@, <startDate %@, endDate %@, percentUnlikely %.2f, percentLikely %.2f"), v28, v29, v5, started, v15, *(_QWORD *)&v21, v26);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (float)percentUnlikely
{
  return self->_percentUnlikely;
}

- (float)percentLikely
{
  return self->_percentLikely;
}

@end
