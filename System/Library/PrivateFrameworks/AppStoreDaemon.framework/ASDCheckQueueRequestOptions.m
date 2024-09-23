@implementation ASDCheckQueueRequestOptions

- (ASDCheckQueueRequestOptions)initWithReason:(unint64_t)a3
{
  ASDCheckQueueRequestOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDCheckQueueRequestOptions;
  result = -[ASDCheckQueueRequestOptions init](&v5, sel_init);
  if (result)
    result->_reason = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[ASDCheckQueueRequestOptions init](+[ASDCheckQueueRequestOptions allocWithZone:](ASDCheckQueueRequestOptions, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_reason;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDCheckQueueRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDCheckQueueRequestOptions *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDCheckQueueRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t reason;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v3, "numberWithInteger:", reason);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("reasonKey"));

}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end
