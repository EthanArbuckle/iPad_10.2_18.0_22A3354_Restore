@implementation NSKeyPathExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  const char *v7;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[NSFunctionExpression _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  v7 = -[NSFunctionExpression selector](self, "selector");
  if (v7 != sel_valueForKeyPath_ && v7 != sel_valueForKey_)
  {
    objc_opt_self();
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    {
      objc_opt_self();
      v9 = _NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1817D9000, v9, OS_LOG_TYPE_FAULT, "NSPredicate: NSKeyPathExpression: malformed selector", buf, 2u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)NSKeyPathExpression;
  return -[NSFunctionExpression expressionValueWithObject:context:](&v11, sel_expressionValueWithObject_context_, a3, a4);
}

- (NSKeyPathExpression)initWithKeyPath:(id)a3
{
  NSSelfExpression *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  NSKeyPathExpression *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(NSSelfExpression);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a3, 0);
  v7 = sel_valueForKeyPath_;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "keyPath"), "rangeOfString:", CFSTR("."));
    if (!v8)
      v7 = sel_valueForKey_;
  }
  v11.receiver = self;
  v11.super_class = (Class)NSKeyPathExpression;
  v9 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:](&v11, sel_initWithExpressionType_operand_selector_argumentArray_, 3, v5, v7, v6);

  return v9;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)NSKeyPathExpression;
  -[NSFunctionExpression dealloc](&v2, sel_dealloc);
}

- (NSKeyPathExpression)initWithOperand:(id)a3 andKeyPath:(id)a4
{
  void *v6;
  NSKeyPathExpression *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a4, 0);
  v9.receiver = self;
  v9.super_class = (Class)NSKeyPathExpression;
  v7 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:](&v9, sel_initWithExpressionType_operand_selector_argumentArray_, 4, a3, sel_valueForKeyPath_, v6);

  return v7;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSKeyPathExpression;
  -[NSFunctionExpression acceptVisitor:flags:](&v4, sel_acceptVisitor_flags_, a3, a4);
}

- (unint64_t)expressionType
{
  if (self->super.super._expressionType == 4)
    return 4;
  else
    return 3;
}

- (id)predicateFormat
{
  id v3;

  v3 = -[NSKeyPathExpression pathExpression](self, "pathExpression");
  -[NSFunctionExpression operand](self, "operand");
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v3, "predicateFormat");
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "predicateFormat"), objc_msgSend(v3, "predicateFormat"));
}

- (id)pathExpression
{
  return (id)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
}

- (id)keyPath
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[NSFunctionExpression operand](self, "operand");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend((id)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0), "keyPath");
  v4.receiver = self;
  v4.super_class = (Class)NSKeyPathExpression;
  return -[NSExpression keyPath](&v4, sel_keyPath);
}

@end
