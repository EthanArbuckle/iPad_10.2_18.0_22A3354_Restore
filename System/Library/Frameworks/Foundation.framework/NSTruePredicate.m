@implementation NSTruePredicate

+ (id)defaultInstance
{
  return &__NSTheOneTruePredicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSTheOneTruePredicate;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  objc_msgSend(a3, "visitPredicate:", self, a4);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSTruePredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (unint64_t)hash
{
  return 1;
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

- (BOOL)_allowsEvaluation
{
  return 1;
}

- (NSTruePredicate)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  return (NSTruePredicate *)&__NSTheOneTruePredicate;
}

- (id)predicateFormat
{
  return CFSTR("TRUEPREDICATE");
}

@end
