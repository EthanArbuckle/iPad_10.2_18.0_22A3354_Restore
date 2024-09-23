@implementation HMFDigest

- (HMFDigest)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFDigest)initWithAlgorithm:(int64_t)a3 value:(id)a4
{
  id v6;
  HMFDigest *v7;
  HMFDigest *v8;
  uint64_t v9;
  NSData *value;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMFDigest;
  v7 = -[HMFDigest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_algorithm = a3;
    v9 = objc_msgSend(v6, "copy");
    value = v8->_value;
    v8->_value = (NSData *)v9;

  }
  return v8;
}

- (NSString)propertyDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMFDigest algorithm](self, "algorithm") - 2;
  if (v4 > 6)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E3B39520[v4];
  -[HMFDigest value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Algorithm = %@, Value = %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFDigest value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFDigest *v4;
  HMFDigest *v5;
  HMFDigest *v6;
  HMFDigest *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMFDigest *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6 && self->_algorithm == v6->_algorithm)
    {
      -[HMFDigest value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFDigest value](v7, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HMFEqualObjects(v8, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (int64_t)algorithm
{
  unint64_t algorithm;

  algorithm = self->_algorithm;
  if (algorithm > 8)
    return 0;
  else
    return qword_19B5C6A40[algorithm];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFDigest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMFDigest *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.algorithm"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.value;"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMFDigest initWithAlgorithm:value:](self, "initWithAlgorithm:value:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t algorithm;
  id v5;
  id v6;

  algorithm = self->_algorithm;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", algorithm, CFSTR("HM.algorithm"));
  -[HMFDigest value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("HM.value;"));

}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
