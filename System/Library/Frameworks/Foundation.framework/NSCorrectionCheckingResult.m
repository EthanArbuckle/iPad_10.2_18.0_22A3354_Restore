@implementation NSCorrectionCheckingResult

- (NSCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 alternativeStrings:(id)a5
{
  NSCorrectionCheckingResult *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSCorrectionCheckingResult;
  v6 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v8, sel_initWithRange_replacementString_, a3.location, a3.length, a4);
  if (v6)
    v6->_alternativeStrings = (NSArray *)objc_msgSend(a5, "copy");
  return v6;
}

- (id)alternativeStrings
{
  return self->_alternativeStrings;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSCorrectionCheckingResult;
  -[NSSubstitutionCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSCorrectionCheckingResult;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@}"), -[NSSubstitutionCheckingResult description](&v3, sel_description), -[NSCorrectionCheckingResult alternativeStrings](self, "alternativeStrings"));
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;
  char v7;

  v5 = -[NSSubstitutionCheckingResult replacementString](self, "replacementString");
  v6 = -[NSCorrectionCheckingResult alternativeStrings](self, "alternativeStrings");
  v7 = objc_msgSend(a3, "allowsKeyedCoding");
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSReplacementString"));
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSAlternativeStrings"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
  }
}

- (NSCorrectionCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  NSString *v17;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v7;
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReplacementString"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), CFSTR("NSAlternativeStrings"));
    return -[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:](self, "initWithRange:replacementString:alternativeStrings:", v6, v8, v9, v12);
  }
  v13 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v13 == 1)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v14;
    v9 = objc_msgSend(a3, "decodeObject");
    v12 = 0;
    return -[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:](self, "initWithRange:replacementString:alternativeStrings:", v6, v8, v9, v12);
  }
  v16 = v13;
  v17 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v17, 1, v16);
  -[NSCorrectionCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:replacementString:alternativeStrings:", v9, v7, -[NSSubstitutionCheckingResult replacementString](self, "replacementString"), -[NSCorrectionCheckingResult alternativeStrings](self, "alternativeStrings"));
}

- (unint64_t)resultType
{
  return 512;
}

@end
