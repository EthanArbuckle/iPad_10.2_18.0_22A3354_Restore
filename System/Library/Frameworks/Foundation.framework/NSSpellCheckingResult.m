@implementation NSSpellCheckingResult

- (NSSpellCheckingResult)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSSpellCheckingResult *result;
  objc_super v6;
  uint64_t v7;

  length = a3.length;
  location = a3.location;
  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSSpellCheckingResult;
  result = -[NSSpellCheckingResult init](&v6, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
  }
  return result;
}

- (NSSpellCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  NSString *v11;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0
    || (v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult")), v6 == 1))
  {
    v7 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    return -[NSSpellCheckingResult initWithRange:](self, "initWithRange:", v7, v8);
  }
  else
  {
    v10 = v6;
    v11 = _NSFullMethodName((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v11, 1, v10);
    -[NSSpellCheckingResult dealloc](self, "dealloc");
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 2;
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

  v6 = -[NSSpellCheckingResult range](self, "range");
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v9, v7);
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

@end
