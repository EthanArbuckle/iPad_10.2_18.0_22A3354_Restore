@implementation CMWalkingSteadinessClassificationData

- (CMWalkingSteadinessClassificationData)initWithLowerBound:(double)a3 upperBound:(double)a4 classificationType:(int64_t)a5
{
  CMWalkingSteadinessClassificationData *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMWalkingSteadinessClassificationData;
  result = -[CMWalkingSteadinessClassificationData init](&v9, sel_init);
  if (result)
  {
    result->_lowerBound = a3;
    result->_upperBound = a4;
    result->_classificationType = a5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMWalkingSteadinessClassificationData;
  -[CMWalkingSteadinessClassificationData dealloc](&v2, sel_dealloc);
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

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithLowerBound_upperBound_classificationType_(v9, v10, self->_classificationType, v11, v12, self->_lowerBound, self->_upperBound);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWalkingSteadinessClassificationData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWalkingSteadinessClassificationData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMWalkingSteadinessClassificationData;
  v7 = -[CMWalkingSteadinessClassificationData init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyLowerBound"), v5, v6);
    v7->_lowerBound = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyUpperBound"), v10, v11);
    v7->_upperBound = v12;
    v7->_classificationType = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyClassificationType"), v14, v15);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyLowerBound"), v3, v4, self->_lowerBound);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyUpperBound"), v8, v9, self->_upperBound);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_classificationType, (uint64_t)CFSTR("kCMWalkingSteadinessClassificationDataCodingKeyClassificationType"), v11);
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
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@,<lowerBound %f, upperBound %f, classificationType %ld, >"), v7, v8, v5, *(_QWORD *)&self->_lowerBound, *(_QWORD *)&self->_upperBound, self->_classificationType);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

@end
