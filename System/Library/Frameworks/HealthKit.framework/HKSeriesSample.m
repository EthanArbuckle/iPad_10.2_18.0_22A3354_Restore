@implementation HKSeriesSample

- (void)_setCount:(unint64_t)a3
{
  atomic_store(a3, &self->_count);
}

- (BOOL)_isFrozen
{
  return self->_frozen;
}

- (NSUInteger)count
{
  return atomic_load(&self->_count);
}

- (BOOL)_shouldNotifyOnInsert
{
  return self->_frozen;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSeriesSample;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  v5 = atomic_load(&self->_count);
  objc_msgSend(v4, "encodeInt64:forKey:", v5, CFSTR("cnt"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_frozen, CFSTR("fzn"));

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSeriesSample;
  -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = objc_opt_class();
    objc_msgSend(v5, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v6, a2, CFSTR("Invalid data type %@"), objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)_validateSample
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSeriesSample;
  -[HKObject _validateConfiguration](&v3, sel__validateConfiguration);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_valueDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count=%lld"), -[HKSeriesSample count](self, "count"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSeriesSample)initWithCoder:(id)a3
{
  id v4;
  HKSeriesSample *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKSeriesSample;
  v5 = -[HKSample initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    atomic_store(objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cnt")), &v5->_count);
    v5->_frozen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fzn"));
  }

  return v5;
}

- (void)_setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

@end
