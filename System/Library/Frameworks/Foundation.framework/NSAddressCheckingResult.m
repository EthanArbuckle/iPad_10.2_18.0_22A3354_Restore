@implementation NSAddressCheckingResult

- (NSAddressCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4 underlyingResult:(void *)a5
{
  NSUInteger length;
  NSUInteger location;
  NSAddressCheckingResult *v9;
  NSAddressCheckingResult *v10;
  objc_super v12;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSAddressCheckingResult;
  v9 = -[NSAddressCheckingResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_range.location = location;
    v9->_range.length = length;
    v9->_components = (NSDictionary *)objc_msgSend(a4, "copy");
    v10->_underlyingResult = a5;
  }
  return v10;
}

- (NSAddressCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4
{
  return -[NSAddressCheckingResult initWithRange:components:underlyingResult:](self, "initWithRange:components:underlyingResult:", a3.location, a3.length, a4, 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAddressCheckingResult;
  -[NSAddressCheckingResult dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  char v6;

  v5 = -[NSAddressCheckingResult components](self, "components");
  v6 = objc_msgSend(a3, "allowsKeyedCoding");
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v6 & 1) != 0)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSAddressComponents"));
  else
    objc_msgSend(a3, "encodeObject:", v5);
}

- (NSAddressCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSString *v16;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), CFSTR("NSAddressComponents"));
    return -[NSAddressCheckingResult initWithRange:components:](self, "initWithRange:components:", v6, v8, v11);
  }
  v12 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v12 == 1)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v13;
    v11 = objc_msgSend(a3, "decodeObject");
    return -[NSAddressCheckingResult initWithRange:components:](self, "initWithRange:components:", v6, v8, v11);
  }
  v15 = v12;
  v16 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v16, 1, v15);
  -[NSAddressCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 16;
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

  v6 = -[NSAddressCheckingResult range](self, "range");
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:components:underlyingResult:", v9, v7, -[NSAddressCheckingResult components](self, "components"), -[NSAddressCheckingResult underlyingResult](self, "underlyingResult"));
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

- (id)components
{
  return self->_components;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

@end
