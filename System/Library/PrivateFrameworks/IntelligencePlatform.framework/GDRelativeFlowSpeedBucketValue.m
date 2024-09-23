@implementation GDRelativeFlowSpeedBucketValue

- (GDRelativeFlowSpeedBucketValue)initWithBucket:(int64_t)a3 bucketValue:(double)a4
{
  GDRelativeFlowSpeedBucketValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDRelativeFlowSpeedBucketValue;
  result = -[GDRelativeFlowSpeedBucketValue init](&v7, sel_init);
  if (result)
  {
    result->_bucket = a3;
    result->_bucketValue = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t bucket;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  bucket = self->_bucket;
  v6 = a3;
  objc_msgSend_numberWithInteger_(v4, v7, bucket);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bucket);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v10, (uint64_t)v8, v9);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v11, v12, self->_bucketValue);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bucketValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v14, (uint64_t)v15, v13);

}

- (GDRelativeFlowSpeedBucketValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_bucket);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend_intValue(v8, v9, v10);

  v12 = objc_opt_class();
  NSStringFromSelector(sel_bucketValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_doubleValue(v15, v16, v17);
  return (GDRelativeFlowSpeedBucketValue *)MEMORY[0x1E0DE7D20](self, sel_initWithBucket_bucketValue_, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend_allocWithZone_(GDRelativeFlowSpeedBucketValue, a2, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithBucket_bucketValue_, self->_bucket);
}

- (id)description
{
  unint64_t bucket;
  __CFString *v4;
  id v5;
  const char *v6;

  bucket = self->_bucket;
  if (bucket > 6)
    v4 = 0;
  else
    v4 = off_1E5DD9540[bucket];
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v5, v6, (uint64_t)CFSTR("GDRelativeFlowSpeedBucketValue<bucket: %@, bucketValue: %lf>"), v4, *(_QWORD *)&self->_bucketValue);
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (double)bucketValue
{
  return self->_bucketValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
