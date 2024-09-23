@implementation NSPhoneNumberCheckingResult

- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4 underlyingResult:(void *)a5
{
  NSUInteger length;
  NSUInteger location;
  NSPhoneNumberCheckingResult *v9;
  NSPhoneNumberCheckingResult *v10;
  objc_super v12;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSPhoneNumberCheckingResult;
  v9 = -[NSPhoneNumberCheckingResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_range.location = location;
    v9->_range.length = length;
    v9->_phoneNumber = (NSString *)objc_msgSend(a4, "copy");
    v10->_underlyingResult = a5;
  }
  return v10;
}

- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4
{
  return -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:underlyingResult:](self, "initWithRange:phoneNumber:underlyingResult:", a3.location, a3.length, a4, 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSPhoneNumberCheckingResult;
  -[NSPhoneNumberCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSPhoneNumberCheckingResult;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@}"), -[NSTextCheckingResult description](&v3, sel_description), -[NSPhoneNumberCheckingResult phoneNumber](self, "phoneNumber"));
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  char v6;

  v5 = -[NSPhoneNumberCheckingResult phoneNumber](self, "phoneNumber");
  v6 = objc_msgSend(a3, "allowsKeyedCoding");
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v6 & 1) != 0)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSPhoneNumber"));
  else
    objc_msgSend(a3, "encodeObject:", v5);
}

- (NSPhoneNumberCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  NSString *v14;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v7;
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPhoneNumber"));
    return -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:](self, "initWithRange:phoneNumber:", v6, v8, v9);
  }
  v10 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v10 == 1)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v11;
    v9 = objc_msgSend(a3, "decodeObject");
    return -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:](self, "initWithRange:phoneNumber:", v6, v8, v9);
  }
  v13 = v10;
  v14 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v14, 1, v13);
  -[NSPhoneNumberCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 2048;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v11;
  NSString *v12;
  void *v13;
  NSRange v14;

  v6 = -[NSPhoneNumberCheckingResult range](self, "range");
  v8 = v7;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      v11 = v6;
      v12 = _NSFullMethodName((objc_class *)self, a2);
      v14.location = v11;
      v14.length = v8;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v12, a3, NSStringFromRange(v14)), 0);
      objc_exception_throw(v13);
    }
    v9 = v6 + a3;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:phoneNumber:", v9, v7, -[NSPhoneNumberCheckingResult phoneNumber](self, "phoneNumber"));
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  NSUInteger location;
  _NSRange *p_range;
  NSString *v7;
  void *v8;

  location = self->_range.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && location < -a3)
    {
      p_range = &self->_range;
      v7 = _NSFullMethodName((objc_class *)self, a2);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v7, a3, NSStringFromRange(*p_range)), 0);
      objc_exception_throw(v8);
    }
    self->_range.location = location + a3;
  }
  return 1;
}

- (id)phoneNumber
{
  return self->_phoneNumber;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

@end
