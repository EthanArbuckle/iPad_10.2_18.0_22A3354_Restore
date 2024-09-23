@implementation CMLiveSkiData

- (CMLiveSkiData)initWithDate:(id)a3 distance:(double)a4 averageSpeed:(double)a5 verticalDescent:(double)a6 runCount:(int)a7 maximumSpeed:(double)a8
{
  uint64_t v8;
  CMLiveSkiData *v16;
  void *v19;
  const char *v20;
  objc_super v21;

  if (!a3)
  {
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, *(uint64_t *)&a7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMLiveSkiData.mm"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));
  }
  v21.receiver = self;
  v21.super_class = (Class)CMLiveSkiData;
  v16 = -[CMLiveSkiData init](&v21, sel_init);
  if (v16)
  {
    v16->_date = (NSDate *)a3;
    v16->_distance = a4;
    v16->_averageSpeed = a5;
    v16->_verticalDescent = a6;
    v16->_runCount = a7;
    v16->_maximumSpeed = a8;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMLiveSkiData;
  -[CMLiveSkiData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLiveSkiData)initWithCoder:(id)a3
{
  CMLiveSkiData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CMLiveSkiData;
  v4 = -[CMLiveSkiData init](&v28, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyDate"), v7);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyDistance"), v9, v10);
    v4->_distance = v11;
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyAverageSpeed"), v13, v14);
    v4->_averageSpeed = v15;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyVerticalDescent"), v17, v18);
    v4->_verticalDescent = v19;
    v4->_runCount = objc_msgSend_decodeIntForKey_(a3, v20, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyRunCount"), v21, v22);
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyMaximumSpeed"), v24, v25);
    v4->_maximumSpeed = v26;
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
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithDate_distance_averageSpeed_verticalDescent_runCount_maximumSpeed_, self->_date, self->_runCount, v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_date, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyDate"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyDistance"), v7, v8, self->_distance);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyAverageSpeed"), v10, v11, self->_averageSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyVerticalDescent"), v13, v14, self->_verticalDescent);
  objc_msgSend_encodeInt_forKey_(a3, v15, self->_runCount, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyRunCount"), v16);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCMLiveSkiDataCodingKeyMaximumSpeed"), v18, v19, self->_maximumSpeed);
}

- (NSDate)date
{
  return self->_date;
}

- (double)distance
{
  return self->_distance;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (double)verticalDescent
{
  return self->_verticalDescent;
}

- (unint64_t)runCount
{
  return self->_runCount;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_date(self, v6, v7, v8, v9);
  objc_msgSend_distance(self, v11, v12, v13, v14);
  v16 = v15;
  objc_msgSend_averageSpeed(self, v17, v18, v19, v20);
  v22 = v21;
  objc_msgSend_verticalDescent(self, v23, v24, v25, v26);
  v28 = v27;
  v33 = objc_msgSend_runCount(self, v29, v30, v31, v32);
  objc_msgSend_maximumSpeed(self, v34, v35, v36, v37);
  return (id)objc_msgSend_stringWithFormat_(v3, v38, (uint64_t)CFSTR("%@, <date %@, distance %.2f, averageSpeed %.2f, verticalDescent %.2f, runCount %lu, maxSpeed %.2f>"), v39, v40, v5, v10, v16, v22, v28, v33, v41);
}

@end
