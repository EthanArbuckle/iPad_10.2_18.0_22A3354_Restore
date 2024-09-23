@implementation NSExpression

- (BOOL)_allowsEvaluation
{
  return (*(_BYTE *)&self->_expressionFlags & 1) == 0;
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat
{
  va_list va;

  va_start(va, expressionFormat);
  return (NSExpression *)objc_msgSend(a1, "expressionWithFormat:arguments:", expressionFormat, va, va);
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat arguments:(va_list)argList
{
  return (NSExpression *)-[NSPredicate leftExpression](+[NSPredicate predicateWithFormat:arguments:](NSPredicate, "predicateWithFormat:arguments:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ == 1"), expressionFormat), argList), "leftExpression");
}

- (NSExpression)initWithExpressionType:(NSExpressionType)type
{
  NSExpression *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSExpression;
  result = -[NSExpression init](&v5, sel_init);
  if (result)
    result->_expressionType = type;
  return result;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_expressionFlags &= ~1u;
}

- (NSExpression)initWithCoder:(NSCoder *)coder
{
  NSExpression *v5;

  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = -[NSExpression initWithExpressionType:](self, "initWithExpressionType:", -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSExpressionType")));
  if (v5 && -[NSCoder requiresSecureCoding](coder, "requiresSecureCoding"))
    *(_DWORD *)&v5->_expressionFlags |= 1u;
  return v5;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
    objc_msgSend(a3, "visitPredicateExpression:", self);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSExpression expressionType](self, "expressionType"), CFSTR("NSExpressionType"));
}

- (BOOL)_shouldUseParensWithDescription
{
  return 0;
}

+ (NSExpression)expressionForKeyPath:(NSString *)keyPath
{
  void *v3;
  NSKeyPathExpression *v4;

  v3 = (void *)objc_msgSend(a1, "_newKeyPathExpressionForString:", keyPath);
  v4 = -[NSKeyPathExpression initWithKeyPath:]([NSKeyPathExpression alloc], "initWithKeyPath:", v3);

  return &v4->super.super;
}

+ (id)_newKeyPathExpressionForString:(id)a3
{
  return -[NSKeyPathSpecifierExpression initWithObject:]([NSKeyPathSpecifierExpression alloc], "initWithObject:", a3);
}

+ (NSExpression)expressionForFunction:(NSString *)name arguments:(NSArray *)parameters
{
  SEL v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = NSSelectorFromString(name);
  objc_opt_self();
  if (objc_msgSend(*(id *)_CFPredicatePolicyData(), "objectForKey:", name))
  {
    LODWORD(v7) = 0;
  }
  else
  {
    objc_opt_self();
    v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = name;
      _os_log_fault_impl(&dword_1817D9000, v8, OS_LOG_TYPE_FAULT, "NSPredicate: Use of '%{public}@' as an NSExpression function is forbidden.", buf, 0xCu);
    }
    objc_opt_self();
    v7 = ((unint64_t)_CFPredicatePolicyData_getFlags() >> 3) & 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (_DWORD)v7)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not a supported method."), name), 0));
  return (NSExpression *)-[NSFunctionExpression initWithSelector:argumentArray:]([NSFunctionExpression alloc], "initWithSelector:argumentArray:", v6, parameters);
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0, v3, v4));
  return self;
}

+ (NSExpression)expressionForConstantValue:(id)obj
{
  return (NSExpression *)-[NSConstantValueExpression initWithObject:]([NSConstantValueExpression alloc], "initWithObject:", obj);
}

+ (NSExpression)expressionForSubquery:(NSExpression *)expression usingIteratorVariable:(NSString *)variable predicate:(NSPredicate *)predicate
{
  return (NSExpression *)-[NSSubqueryExpression initWithExpression:usingIteratorVariable:predicate:]([NSSubqueryExpression alloc], "initWithExpression:usingIteratorVariable:predicate:", expression, variable, predicate);
}

+ (NSExpression)expressionForVariable:(NSString *)string
{
  return (NSExpression *)-[NSVariableExpression initWithObject:]([NSVariableExpression alloc], "initWithObject:", string);
}

+ (NSExpression)expressionForEvaluatedObject
{
  return (NSExpression *)objc_alloc_init(NSSelfExpression);
}

+ (NSExpression)expressionForFunction:(NSExpression *)target selectorName:(NSString *)name arguments:(NSArray *)parameters
{
  return (NSExpression *)-[NSFunctionExpression initWithTarget:selectorName:arguments:]([NSFunctionExpression alloc], "initWithTarget:selectorName:arguments:", target, name, parameters);
}

+ (NSExpression)expressionForBlock:(void *)block arguments:(NSArray *)arguments
{
  return (NSExpression *)-[NSBlockExpression initWithType:block:arguments:]([NSBlockExpression alloc], "initWithType:block:arguments:", 19, block, arguments);
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat argumentArray:(NSArray *)arguments
{
  return (NSExpression *)-[NSPredicate leftExpression](+[NSPredicate predicateWithFormat:argumentArray:](NSPredicate, "predicateWithFormat:argumentArray:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ == 1"), expressionFormat), arguments), "leftExpression");
}

+ (id)expressionForSymbolicString:(id)a3
{
  return -[NSSymbolicExpression initWithString:]([NSSymbolicExpression alloc], "initWithString:", a3);
}

+ (NSExpression)expressionForAggregate:(NSArray *)subexpressions
{
  return (NSExpression *)-[NSAggregateExpression initWithCollection:]([NSAggregateExpression alloc], "initWithCollection:", subexpressions);
}

+ (id)expressionForVariableNameAssignment:(id)a3 expression:(id)a4
{
  return -[NSVariableAssignmentExpression initWithAssignmentVariable:expression:]([NSVariableAssignmentExpression alloc], "initWithAssignmentVariable:expression:", a3, a4);
}

+ (id)expressionForTernaryWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5
{
  return -[NSTernaryExpression initWithPredicate:trueExpression:falseExpression:]([NSTernaryExpression alloc], "initWithPredicate:trueExpression:falseExpression:", a3, a4, a5);
}

+ (NSExpression)expressionForUnionSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *)-[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", 5, left, right);
}

+ (NSExpression)expressionForIntersectSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *)-[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", 6, left, right);
}

+ (NSExpression)expressionForMinusSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *)-[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", 7, left, right);
}

+ (NSExpression)expressionForAnyKey
{
  return (NSExpression *)objc_alloc_init(NSAnyKeyExpression);
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

- (id)expressionValueWithObject:(id)object context:(NSMutableDictionary *)context
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)predicateFormat
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpressionType)expressionType
{
  return self->_expressionType;
}

- (NSString)keyPath
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)constantValue
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)variable
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)function
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)operand
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (SEL)selector
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)leftExpression
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)rightExpression
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSPredicate)predicate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)collection
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)subexpression
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)trueExpression
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)falseExpression
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)expressionBlock
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExpression"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end
