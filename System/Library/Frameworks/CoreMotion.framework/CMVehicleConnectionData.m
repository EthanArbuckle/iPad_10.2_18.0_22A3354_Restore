@implementation CMVehicleConnectionData

- (CMVehicleConnectionData)initWithStartDate:(double)a3 endDate:(double)a4
{
  CMVehicleConnectionData *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMVehicleConnectionData;
  v6 = -[CMVehicleConnectionData init](&v18, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    v6->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v7, v8, v9, v10, v11, a3);
    v12 = objc_alloc(MEMORY[0x1E0C99D68]);
    v6->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v12, v13, v14, v15, v16, a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMVehicleConnectionData;
  -[CMVehicleConnectionData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    v18[1] = objc_msgSend_copy(self->fStartDate, v14, v15, v16, v17);
    v18[2] = objc_msgSend_copy(self->fEndDate, v19, v20, v21, v22);
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVehicleConnectionData)initWithCoder:(id)a3
{
  CMVehicleConnectionData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMVehicleConnectionData;
  v4 = -[CMVehicleConnectionData init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMVehicleConnectionDataCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v4->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMVehicleConnectionDataCodingKeyEndDate"), v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMVehicleConnectionDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMVehicleConnectionDataCodingKeyEndDate"), v7);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  return (id)objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("%@,<startDate %@, endDate %@>"), v17, v18, v5, started, v15);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

@end
