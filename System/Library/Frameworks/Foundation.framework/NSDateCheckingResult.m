@implementation NSDateCheckingResult

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11 leadingText:(id)a12 trailingText:(id)a13
{
  NSUInteger length;
  NSUInteger location;
  NSDateCheckingResult *v20;
  NSDateCheckingResult *v21;
  objc_super v23;
  uint64_t v24;

  length = a3.length;
  location = a3.location;
  v24 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)NSDateCheckingResult;
  v20 = -[NSDateCheckingResult init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_range.location = location;
    v20->_range.length = length;
    v20->_date = (NSDate *)objc_msgSend(a4, "copy");
    v21->_timeZone = (NSTimeZone *)objc_msgSend(a5, "copy");
    v21->_duration = a6;
    v21->_referenceDate = (NSDate *)objc_msgSend(a7, "copy");
    v21->_underlyingResult = a8;
    v21->_timeIsSignificant = a9;
    v21->_timeIsApproximate = a10;
    v21->_timeIsPast = a11;
    v21->_leadingText = (NSString *)objc_msgSend(a12, "copy");
    v21->_trailingText = (NSString *)objc_msgSend(a13, "copy");
  }
  return v21;
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11
{
  uint64_t v12;

  BYTE2(v12) = 0;
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, a5, a7, a8, a6, v12, 0, 0);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10
{
  uint64_t v11;

  BYTE2(v11) = 0;
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, a5, a7, a8, a6, v11, 0, 0);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8
{
  uint64_t v9;

  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, a5, a7, a8, a6, v9, 0, 0);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7
{
  uint64_t v8;

  BYTE2(v8) = 0;
  LOWORD(v8) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, a5, a7, 0, a6, v8, 0, 0);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6
{
  uint64_t v7;

  BYTE2(v7) = 0;
  LOWORD(v7) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, a5, 0, 0, a6, v7, 0, 0);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4
{
  uint64_t v5;

  BYTE2(v5) = 0;
  LOWORD(v5) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:](self, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:", a3.location, a3.length, a4, 0, 0, 0, 0.0, v5, 0, 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSDateCheckingResult;
  -[NSDateCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  double v4;
  uint64_t v6;
  objc_super v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[NSDateCheckingResult date](self, "date");
  -[NSDateCheckingResult duration](self, "duration");
  if (v4 <= 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSDateCheckingResult;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@}"), -[NSTextCheckingResult description](&v7, sel_description), v3, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSDateCheckingResult;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@-%@}"), -[NSTextCheckingResult description](&v8, sel_description), v3, objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v3, v4));
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSDate *v6;
  NSTimeZone *v7;
  double v8;
  double v9;
  char v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSDateCheckingResult date](self, "date");
  v6 = -[NSDateCheckingResult referenceDate](self, "referenceDate");
  v7 = -[NSDateCheckingResult timeZone](self, "timeZone");
  -[NSDateCheckingResult duration](self, "duration");
  v9 = v8;
  v10 = objc_msgSend(a3, "allowsKeyedCoding", *(_QWORD *)&v8);
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSDate"));
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSTimeZone"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSDuration"), v9);
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSReferenceDate"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
    objc_msgSend(a3, "encodeObject:", v7);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", v11);
    objc_msgSend(a3, "encodeObject:", v6);
  }
}

- (NSDateCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = 0;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v7;
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDate"));
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSTimeZone"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSDuration"));
    v12 = v11;
    *(double *)v19 = v11;
    v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReferenceDate"));
    return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:](self, "initWithRange:date:timeZone:duration:referenceDate:", v6, v8, v9, v10, v13, v12);
  }
  v14 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
  if (v14 == 1)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v15;
    v9 = objc_msgSend(a3, "decodeObject");
    v10 = objc_msgSend(a3, "decodeObject");
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", v19, 8);
    v13 = objc_msgSend(a3, "decodeObject");
    v12 = *(double *)v19;
    return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:](self, "initWithRange:date:timeZone:duration:referenceDate:", v6, v8, v9, v10, v13, v12);
  }
  v17 = v14;
  v18 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v18, 1, v17);
  -[NSDateCheckingResult dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 8;
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
  id v10;
  id v11;
  NSTimeZone *v12;
  double v13;
  NSUInteger v15;
  NSString *v16;
  void *v17;
  NSRange v18;

  v6 = -[NSDateCheckingResult range](self, "range");
  v8 = v7;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      v15 = v6;
      v16 = _NSFullMethodName((objc_class *)self, a2);
      v18.location = v15;
      v18.length = v8;
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v16, a3, NSStringFromRange(v18)), 0);
      objc_exception_throw(v17);
    }
    v9 = v6 + a3;
  }
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = -[NSDateCheckingResult date](self, "date");
  v12 = -[NSDateCheckingResult timeZone](self, "timeZone");
  -[NSDateCheckingResult duration](self, "duration");
  return (id)objc_msgSend(v10, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:", v9, v8, v11, v12, -[NSDateCheckingResult referenceDate](self, "referenceDate"), -[NSDateCheckingResult underlyingResult](self, "underlyingResult"), v13);
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

- (id)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (id)leadingText
{
  return self->_leadingText;
}

- (id)trailingText
{
  return self->_trailingText;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

- (BOOL)timeIsSignificant
{
  return self->_timeIsSignificant;
}

- (BOOL)timeIsApproximate
{
  return self->_timeIsApproximate;
}

- (BOOL)timeIsPast
{
  return self->_timeIsPast;
}

@end
