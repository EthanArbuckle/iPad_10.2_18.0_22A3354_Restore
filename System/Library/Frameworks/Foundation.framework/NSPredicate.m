@implementation NSPredicate

- (BOOL)_allowsEvaluation
{
  return (*(_BYTE *)&self->_predicateFlags & 1) == 0;
}

- (BOOL)evaluateWithObject:(id)object
{
  return -[NSPredicate evaluateWithObject:substitutionVariables:](self, "evaluateWithObject:substitutionVariables:", object, 0);
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat
{
  va_list va;

  va_start(va, predicateFormat);
  return (NSPredicate *)objc_msgSend(a1, "predicateWithFormat:arguments:", predicateFormat, va, va);
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList
{
  void *v5;
  NSPredicate *v6;
  NSPredicate *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = argList;
  v5 = (void *)MEMORY[0x186DA8F78](a1, a2);
  objc_msgSend((id)_qfqp_GlobalLock, "lock");
  v6 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, 0, v9);
  objc_msgSend((id)_qfqp_GlobalLock, "unlock");
  objc_autoreleasePoolPop(v5);
  v7 = v6;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_exception_throw(v6);
  }
  return v6;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_predicateFlags &= ~1u;
}

- (NSPredicate)initWithCoder:(id)a3
{
  NSPredicate *v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = -[NSPredicate init](self, "init");
  if (v5 && objc_msgSend(a3, "requiresSecureCoding"))
    *(_DWORD *)&v5->_predicateFlags |= 1u;
  return v5;
}

+ (NSPredicate)predicateWithBlock:(void *)block
{
  return (NSPredicate *)-[NSBlockPredicate initWithBlock:]([NSBlockPredicate alloc], "initWithBlock:", block);
}

+ (void)initialize
{
  if (!_qfqp_GlobalLock)
  {
    _qfqp_GlobalLock = objc_alloc_init(NSRecursiveLock);
    _qfqp2_InitializedGlobalData();
  }
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
}

+ (NSPredicate)predicateWithValue:(BOOL)value
{
  __objc2_class **v3;

  v3 = &off_1E0F11138;
  if (!value)
    v3 = off_1E0F10A58;
  return (NSPredicate *)objc_alloc_init(*v3);
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat argumentArray:(NSArray *)arguments
{
  void *v6;
  NSPredicate *v7;
  NSPredicate *v8;

  v6 = (void *)MEMORY[0x186DA8F78](a1, a2);
  objc_msgSend((id)_qfqp_GlobalLock, "lock");
  v7 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, arguments, 0);
  objc_msgSend((id)_qfqp_GlobalLock, "unlock");
  objc_autoreleasePoolPop(v6);
  v8 = v7;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_exception_throw(v7);
  }
  return v7;
}

- (NSPredicate)predicateWithSubstitutionVariables:(NSDictionary *)variables
{
  uint64_t v3;
  uint64_t v4;

  if (!variables)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0, v3, v4));
  return self;
}

- (id)generateMetadataDescription
{
  NSString *v2;

  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown kind of NSPredicate given to NSMetadataQuery (%@)"), self);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v2, 0));
}

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  return +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:](_NSPredicateOperatorUtilities, "newStringFrom:usingUnicodeTransforms:", a3, a4);
}

+ (__CFLocale)retainedLocale
{
  return +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSPredicate"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSPredicate"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSPredicate"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSString)predicateFormat
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPredicate"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end
