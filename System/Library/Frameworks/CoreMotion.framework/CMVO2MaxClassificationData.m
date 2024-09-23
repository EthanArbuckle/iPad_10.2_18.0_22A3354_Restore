@implementation CMVO2MaxClassificationData

- (CMVO2MaxClassificationData)initWithBiologicalSex:(int64_t)a3 ageLowerBound:(int64_t)a4 ageUpperBound:(int64_t)a5 classificationType:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8
{
  CMVO2MaxClassificationData *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMVO2MaxClassificationData;
  result = -[CMVO2MaxClassificationData init](&v15, sel_init);
  if (result)
  {
    result->_biologicalSex = a3;
    result->_ageLowerBound = a4;
    result->_ageUpperBound = a5;
    result->_classificationType = a6;
    result->_vo2MaxLowerBound = a7;
    result->_vo2MaxUpperBound = a8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMVO2MaxClassificationData;
  -[CMVO2MaxClassificationData dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithBiologicalSex_ageLowerBound_ageUpperBound_classificationType_vo2MaxLowerBound_vo2MaxUpperBound_(v9, v10, self->_biologicalSex, self->_ageLowerBound, self->_ageUpperBound, self->_classificationType, self->_vo2MaxLowerBound, self->_vo2MaxUpperBound);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVO2MaxClassificationData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMVO2MaxClassificationData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMVO2MaxClassificationData;
  v7 = -[CMVO2MaxClassificationData init](&v36, sel_init);
  if (v7)
  {
    v7->_biologicalSex = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyBiologicalSex"), v5, v6);
    v7->_ageLowerBound = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyAgeLowerBound"), v9, v10);
    v7->_ageUpperBound = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyAgeUpperBound"), v12, v13);
    v7->_classificationType = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyClassificationType"), v15, v16);
    v17 = objc_opt_class();
    v20 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyVO2MaxLowerBound"), v19);
    objc_msgSend_doubleValue(v20, v21, v22, v23, v24);
    v7->_vo2MaxLowerBound = v25;
    v26 = objc_opt_class();
    v29 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyVO2MaxUpperBound"), v28);
    objc_msgSend_doubleValue(v29, v30, v31, v32, v33);
    v7->_vo2MaxUpperBound = v34;
  }
  return v7;
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_biologicalSex, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyBiologicalSex"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_ageLowerBound, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyAgeLowerBound"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_ageUpperBound, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyAgeUpperBound"), v9);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_classificationType, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyClassificationType"), v11);
  v16 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, v14, v15, self->_vo2MaxLowerBound);
  objc_msgSend_encodeObject_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyVO2MaxLowerBound"), v18);
  v23 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22, self->_vo2MaxUpperBound);
  objc_msgSend_encodeObject_forKey_(a3, v24, v23, (uint64_t)CFSTR("kCMVO2MaxClassificationDataCodingKeyVO2MaxUpperBound"), v25);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@,<biologicalSex %ld, ageLowerBound %lu, ageUpperBound %lu, classificationType %ld, vo2MaxLowerBound %f, vo2MaxUpperBound %f>"), v7, v8, v5, self->_biologicalSex, self->_ageLowerBound, self->_ageUpperBound, self->_classificationType, *(_QWORD *)&self->_vo2MaxLowerBound, *(_QWORD *)&self->_vo2MaxUpperBound);
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)ageLowerBound
{
  return self->_ageLowerBound;
}

- (int64_t)ageUpperBound
{
  return self->_ageUpperBound;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

- (double)vo2MaxLowerBound
{
  return self->_vo2MaxLowerBound;
}

- (double)vo2MaxUpperBound
{
  return self->_vo2MaxUpperBound;
}

@end
