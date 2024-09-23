@implementation NSTextCheckingResult

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (id)description
{
  id v3;
  objc_super v5;
  uint64_t v6;
  NSRange v7;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSTextCheckingResult;
  v3 = -[NSTextCheckingResult description](&v5, sel_description);
  v7.location = -[NSTextCheckingResult range](self, "range");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, NSStringFromRange(v7));
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTextCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeRangeWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSTextCheckingResult range](self, "range");
  v6 = v5;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeInteger:forKey:", v4, CFSTR("NSRangeLocation"));
    objc_msgSend(a3, "encodeInteger:forKey:", v6, CFSTR("NSRangeLength"));
  }
  else
  {
    v7 = v6;
    v8[0] = v4;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "QQ", v8, &v7);
  }
}

- (_NSRange)decodeRangeWithCoder:(id)a3
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _QWORD v8[2];
  _NSRange result;

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v4 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSRangeLocation"));
    v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSRangeLength"));
  }
  else
  {
    v7 = 0;
    v8[0] = 0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "QQ", v8, &v7);
    v5 = v7;
    v4 = v8[0];
  }
  v6 = v4;
  result.length = v5;
  result.location = v6;
  return result;
}

- (NSTextCheckingType)resultType
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTextCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)range
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTextCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTextCheckingResult)resultByAdjustingRangesWithOffset:(NSInteger)offset
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTextCheckingResult"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  return 0;
}

- (NSUInteger)numberOfRanges
{
  return 1;
}

- (NSRange)rangeAtIndex:(NSUInteger)idx
{
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  NSRange result;

  v6 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges");
  if (v6 <= idx)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range index (%lu) >= number of ranges (%lu)"), _NSFullMethodName((objc_class *)self, a2), idx, v6), 0);
    objc_exception_throw(v9);
  }
  v7 = -[NSTextCheckingResult range](self, "range");
  result.length = v8;
  result.location = v7;
  return result;
}

- (NSRange)rangeWithName:(NSString *)name
{
  NSUInteger v3;
  NSUInteger v4;
  NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSOrthography)orthography
{
  return 0;
}

- (NSArray)grammarDetails
{
  return 0;
}

- (NSDate)date
{
  return 0;
}

- (NSTimeZone)timeZone
{
  return 0;
}

- (NSTimeInterval)duration
{
  return 0.0;
}

- (id)referenceDate
{
  return 0;
}

- (id)leadingText
{
  return 0;
}

- (id)trailingText
{
  return 0;
}

- (NSDictionary)components
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

- (NSString)replacementString
{
  return 0;
}

- (NSArray)alternativeStrings
{
  return 0;
}

- (NSRegularExpression)regularExpression
{
  return 0;
}

- (NSString)phoneNumber
{
  return 0;
}

- (void)underlyingResult
{
  return 0;
}

- (BOOL)timeIsSignificant
{
  return 0;
}

- (BOOL)timeIsApproximate
{
  return 0;
}

- (BOOL)timeIsPast
{
  return 0;
}

+ (NSTextCheckingResult)orthographyCheckingResultWithRange:(NSRange)range orthography:(NSOrthography *)orthography
{
  return (NSTextCheckingResult *)-[NSOrthographyCheckingResult initWithRange:orthography:]([NSOrthographyCheckingResult alloc], "initWithRange:orthography:", range.location, range.length, orthography);
}

+ (NSTextCheckingResult)spellCheckingResultWithRange:(NSRange)range
{
  return (NSTextCheckingResult *)-[NSSpellCheckingResult initWithRange:]([NSSpellCheckingResult alloc], "initWithRange:", range.location, range.length);
}

+ (NSTextCheckingResult)grammarCheckingResultWithRange:(NSRange)range details:(NSArray *)details
{
  return (NSTextCheckingResult *)-[NSGrammarCheckingResult initWithRange:details:]([NSGrammarCheckingResult alloc], "initWithRange:details:", range.location, range.length, details);
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date
{
  return (NSTextCheckingResult *)-[NSDateCheckingResult initWithRange:date:]([NSDateCheckingResult alloc], "initWithRange:date:", range.location, range.length, date);
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date timeZone:(NSTimeZone *)timeZone duration:(NSTimeInterval)duration
{
  return (NSTextCheckingResult *)-[NSDateCheckingResult initWithRange:date:timeZone:duration:]([NSDateCheckingResult alloc], "initWithRange:date:timeZone:duration:", range.location, range.length, date, timeZone, duration);
}

+ (NSTextCheckingResult)addressCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  return (NSTextCheckingResult *)-[NSAddressCheckingResult initWithRange:components:]([NSAddressCheckingResult alloc], "initWithRange:components:", range.location, range.length, components);
}

+ (NSTextCheckingResult)linkCheckingResultWithRange:(NSRange)range URL:(NSURL *)url
{
  return (NSTextCheckingResult *)-[NSLinkCheckingResult initWithRange:URL:]([NSLinkCheckingResult alloc], "initWithRange:URL:", range.location, range.length, url);
}

+ (NSTextCheckingResult)quoteCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *)-[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSQuoteCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);
}

+ (NSTextCheckingResult)dashCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *)-[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSDashCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);
}

+ (NSTextCheckingResult)replacementCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *)-[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSReplacementCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *)-[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSCorrectionCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString alternativeStrings:(NSArray *)alternativeStrings
{
  return (NSTextCheckingResult *)-[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:]([NSCorrectionCheckingResult alloc], "initWithRange:replacementString:alternativeStrings:", range.location, range.length, replacementString, alternativeStrings);
}

+ (NSTextCheckingResult)regularExpressionCheckingResultWithRanges:(NSRangePointer)ranges count:(NSUInteger)count regularExpression:(NSRegularExpression *)regularExpression
{
  __objc2_class **v5;
  Class *v6;

  v5 = off_1E0F10A38;
  if ((count & 0xFFFFFFFFFFFFFFFCLL) != 4)
    v5 = off_1E0F108B8;
  if (count - 1 >= 3)
    v6 = (Class *)v5;
  else
    v6 = (Class *)off_1E0F11060;
  return (NSTextCheckingResult *)(id)objc_msgSend(objc_alloc(*v6), "initWithRanges:count:regularExpression:", ranges, count, regularExpression);
}

+ (NSTextCheckingResult)phoneNumberCheckingResultWithRange:(NSRange)range phoneNumber:(NSString *)phoneNumber
{
  return (NSTextCheckingResult *)-[NSPhoneNumberCheckingResult initWithRange:phoneNumber:]([NSPhoneNumberCheckingResult alloc], "initWithRange:phoneNumber:", range.location, range.length, phoneNumber);
}

+ (NSTextCheckingResult)transitInformationCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  return (NSTextCheckingResult *)-[NSTransitInformationCheckingResult initWithRange:components:]([NSTransitInformationCheckingResult alloc], "initWithRange:components:", range.location, range.length, components);
}

@end
