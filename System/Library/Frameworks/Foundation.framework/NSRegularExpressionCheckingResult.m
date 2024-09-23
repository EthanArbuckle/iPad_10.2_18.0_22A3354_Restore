@implementation NSRegularExpressionCheckingResult

- (NSRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSRegularExpressionCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSRegularExpressionCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSRegularExpression)regularExpression
{
  return 0;
}

- (NSArray)rangeArray
{
  return 0;
}

- (_NSRange)rangeWithName:(id)a3
{
  NSRegularExpression *v5;
  NSRegularExpression *v6;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v5 = -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression");
  if (v5
    && (v6 = v5,
        v7 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges"),
        v8 = -[NSRegularExpression _captureGroupNumberWithName:](v6, "_captureGroupNumberWithName:", a3),
        v8 < v7))
  {
    v9 = -[NSTextCheckingResult rangeAtIndex:](self, "rangeAtIndex:", v8);
  }
  else
  {
    v10 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSRegularExpressionCheckingResult;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@}"), -[NSTextCheckingResult description](&v3, sel_description), -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));
}

- (void)encodeWithCoder:(id)a3
{
  NSRegularExpression *v5;
  NSArray *v6;

  v5 = -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression");
  v6 = -[NSRegularExpressionCheckingResult rangeArray](self, "rangeArray");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSRegularExpression"));
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSRangeArray"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
    objc_msgSend(a3, "encodeObject:", v6);
  }
}

- (NSRegularExpressionCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  NSString *v13;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSRegularExpression"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("NSRangeArray"));
    return -[NSRegularExpressionCheckingResult initWithRangeArray:regularExpression:](self, "initWithRangeArray:regularExpression:", v9, v6);
  }
  v10 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v10 == 1)
  {
    v6 = objc_msgSend(a3, "decodeObject");
    v9 = objc_msgSend(a3, "decodeObject");
    return -[NSRegularExpressionCheckingResult initWithRangeArray:regularExpression:](self, "initWithRangeArray:regularExpression:", v9, v6);
  }
  v12 = v10;
  v13 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v13, 1, v12);
  -[NSRegularExpressionCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 1024;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  NSArray *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t i;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v15;
  objc_class *v16;
  NSUInteger v17;
  NSString *v18;
  void *v19;
  NSRange v20;

  v6 = -[NSRegularExpressionCheckingResult rangeArray](self, "rangeArray");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      v11 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "rangeValue");
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3 < 0 && v11 < -a3)
        {
          v15 = v11;
          v16 = (objc_class *)self;
          v17 = v12;
          v18 = _NSFullMethodName(v16, a2);
          v20.location = v15;
          v20.length = v17;
          v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v18, a3, NSStringFromRange(v20)), 0);
          objc_exception_throw(v19);
        }
        v13 = v11 + a3;
      }
      objc_msgSend(v7, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, v12));
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRangeArray:regularExpression:", v7, -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));
}

@end
