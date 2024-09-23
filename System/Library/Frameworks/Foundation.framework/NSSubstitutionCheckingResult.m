@implementation NSSubstitutionCheckingResult

- (NSSubstitutionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSSubstitutionCheckingResult *v7;
  NSSubstitutionCheckingResult *v8;
  objc_super v10;
  uint64_t v11;

  length = a3.length;
  location = a3.location;
  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSSubstitutionCheckingResult;
  v7 = -[NSSubstitutionCheckingResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_range.location = location;
    v7->_range.length = length;
    v7->_replacementString = (NSString *)objc_msgSend(a4, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSubstitutionCheckingResult;
  -[NSSubstitutionCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSSubstitutionCheckingResult;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@}"), -[NSTextCheckingResult description](&v3, sel_description), -[NSSubstitutionCheckingResult replacementString](self, "replacementString"));
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  char v6;

  v5 = -[NSSubstitutionCheckingResult replacementString](self, "replacementString");
  v6 = objc_msgSend(a3, "allowsKeyedCoding");
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v6 & 1) != 0)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSReplacementString"));
  else
    objc_msgSend(a3, "encodeObject:", v5);
}

- (NSSubstitutionCheckingResult)initWithCoder:(id)a3
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
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReplacementString"));
    return -[NSSubstitutionCheckingResult initWithRange:replacementString:](self, "initWithRange:replacementString:", v6, v8, v9);
  }
  v10 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v10 == 1)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v11;
    v9 = objc_msgSend(a3, "decodeObject");
    return -[NSSubstitutionCheckingResult initWithRange:replacementString:](self, "initWithRange:replacementString:", v6, v8, v9);
  }
  v13 = v10;
  v14 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v14, 1, v13);
  -[NSSubstitutionCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

  v6 = -[NSSubstitutionCheckingResult range](self, "range");
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:replacementString:", v9, v7, -[NSSubstitutionCheckingResult replacementString](self, "replacementString"));
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

- (id)replacementString
{
  return self->_replacementString;
}

@end
