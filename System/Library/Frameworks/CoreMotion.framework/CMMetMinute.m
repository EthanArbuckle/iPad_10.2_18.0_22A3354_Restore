@implementation CMMetMinute

- (CMMetMinute)initWithStartDate:(id)a3 averageIntensity:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMMetMinute *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMMetMinute;
  v10 = -[CMMetMinute init](&v16, sel_init);
  if (v10)
  {
    v10->fStartDate = (NSDate *)objc_msgSend_copy(a3, v6, v7, v8, v9);
    v10->fAverageIntensity = (NSNumber *)objc_msgSend_copy(a4, v11, v12, v13, v14);
  }
  return v10;
}

- (CMMetMinute)initWithSample:(CLMetMinute)a3
{
  double var1;
  double var0;
  CMMetMinute *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  var1 = a3.var1;
  var0 = a3.var0;
  v17.receiver = self;
  v17.super_class = (Class)CMMetMinute;
  v5 = -[CMMetMinute init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, var0);
    v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v5->fAverageIntensity = (NSNumber *)objc_msgSend_initWithDouble_(v11, v12, v13, v14, v15, var1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMMetMinute;
  -[CMMetMinute dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMetMinute)initWithCoder:(id)a3
{
  CMMetMinute *v4;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CMMetMinute;
  v4 = -[CMMetMinute init](&v22, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStartDate"), v7);
    v4->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10, v11, v12);
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kMetMinuteDataCodingKeyAverageIntensity"), v15);
    v4->fAverageIntensity = (NSNumber *)objc_msgSend_copy(v16, v17, v18, v19, v20);
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
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_averageIntensity_, self->fStartDate, self->fAverageIntensity, v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kMetMinuteDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fAverageIntensity, (uint64_t)CFSTR("kMetMinuteDataCodingKeyAverageIntensity"), v7);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSNumber)averageIntensity
{
  return self->fAverageIntensity;
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = (void *)objc_msgSend_averageIntensity(self, v11, v12, v13, v14);
  objc_msgSend_doubleValue(v15, v16, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("%@, <startDate, %@, averageIntensity, %f>"), v21, v22, v5, started, v23);
}

@end
