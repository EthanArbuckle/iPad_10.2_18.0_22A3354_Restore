@implementation NSSelfExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (_NSPredicateUtilities == a3)
    return 0;
  else
    return a3;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSSelfExpressionSingleton;
}

- (id)predicateFormat
{
  return CFSTR("SELF");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSSelfExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSSelfExpression)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  return (NSSelfExpression *)_NSSelfExpressionSingleton;
}

+ (void)initialize
{
  if (!_NSSelfExpressionSingleton)
  {
    _NSSelfExpressionSingleton = (uint64_t)NSAllocateObject((Class)a1, 0, 0);
    objc_msgSend((id)_NSSelfExpressionSingleton, "_initPrivate");
  }
}

- (id)_initPrivate
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSSelfExpression;
  return -[NSExpression initWithExpressionType:](&v3, sel_initWithExpressionType_, 1);
}

- (unint64_t)hash
{
  return 8421;
}

+ (id)defaultInstance
{
  return (id)_NSSelfExpressionSingleton;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)_allowsEvaluation
{
  return 1;
}

@end
