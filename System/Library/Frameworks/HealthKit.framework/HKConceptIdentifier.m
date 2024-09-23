@implementation HKConceptIdentifier

- (HKConceptIdentifier)initWithRawIdentifier:(int64_t)a3
{
  HKConceptIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKConceptIdentifier;
  result = -[HKConceptIdentifier init](&v5, sel_init);
  if (result)
    result->_rawIdentifier = a3;
  return result;
}

- (HKConceptIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (HKConceptIdentifier)identifierWithRawIdentifier:(int64_t)a3
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", a3);
}

+ (HKConceptIdentifier)identifierWithNumber:(id)a3
{
  id v3;
  HKConceptIdentifier *v4;
  uint64_t v5;

  v3 = a3;
  v4 = [HKConceptIdentifier alloc];
  v5 = objc_msgSend(v3, "longLongValue");

  return -[HKConceptIdentifier initWithRawIdentifier:](v4, "initWithRawIdentifier:", v5);
}

+ (HKConceptIdentifier)inMemoryConceptIdentifier
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", 0x7FFFFFFFFFFFFFFFLL);
}

+ (HKConceptIdentifier)root
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", 105);
}

+ (HKConceptIdentifier)medication
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", 1001);
}

+ (HKConceptIdentifier)diastolicBloodPressure
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", 27146);
}

+ (HKConceptIdentifier)systolicBloodPressure
{
  return -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", 10793);
}

- (NSNumber)numberRepresentation
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rawIdentifier);
}

- (BOOL)isInMemory
{
  return self->_rawIdentifier == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isAdHoc
{
  return (unint64_t)(self->_rawIdentifier - 0x1000000000000) < 0x7FFEFFFFFFFFFFFFLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_rawIdentifier, CFSTR("identifier"));
}

- (HKConceptIdentifier)initWithCoder:(id)a3
{
  return -[HKConceptIdentifier initWithRawIdentifier:](self, "initWithRawIdentifier:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("identifier")));
}

- (BOOL)isEqual:(id)a3
{
  HKConceptIdentifier *v4;
  BOOL v5;

  v4 = (HKConceptIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKConceptIdentifier rawIdentifier](v4, "rawIdentifier") == self->_rawIdentifier;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_rawIdentifier;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %lld>"), objc_opt_class(), self, self->_rawIdentifier);
}

- (int64_t)rawIdentifier
{
  return self->_rawIdentifier;
}

@end
