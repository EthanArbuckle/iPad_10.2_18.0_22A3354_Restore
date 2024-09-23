@implementation NSAnyKeyExpression

+ (void)initialize
{
  if (!_NSAnyKeyExpressionSingleton)
  {
    _NSAnyKeyExpressionSingleton = (uint64_t)NSAllocateObject((Class)a1, 0, 0);
    objc_msgSend((id)_NSAnyKeyExpressionSingleton, "_initPrivate");
  }
}

- (id)_initPrivate
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSAnyKeyExpression;
  return -[NSExpression initWithExpressionType:](&v3, sel_initWithExpressionType_, 15);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSAnyKeyExpressionSingleton;
}

+ (id)defaultInstance
{
  return (id)_NSAnyKeyExpressionSingleton;
}

- (unint64_t)expressionType
{
  return 15;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_allowsEvaluation
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSAnyKeyExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSAnyKeyExpression)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  return (NSAnyKeyExpression *)_NSAnyKeyExpressionSingleton;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 8674;
}

- (id)predicateFormat
{
  return CFSTR("ANYKEY");
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot evaluate an ANYKEY predicate in memory.  This predicate is for Spotlight use only."), 0));
}

@end
