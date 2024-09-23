@implementation NSPredicateOperator

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (BOOL)performOperationUsingObject:(id)a3 andObject:(id)a4
{
  id v7;
  id v8;
  unint64_t modifier;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v7 == a3)
    v8 = 0;
  else
    v8 = a3;
  if (v7 == a4)
    a4 = 0;
  modifier = self->_modifier;
  if (!modifier)
  {
    LOBYTE(v10) = -[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:](self, "performPrimitiveOperationUsingObject:andObject:", v8, a4);
    return v10;
  }
  if (v8)
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99778];
      v20 = CFSTR("The left hand side for an ALL or ANY operator must be either an NSArray or an NSSet.");
LABEL_42:
      objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
    }
    if (_NSIsNSSet())
      a3 = (id)objc_msgSend(v8, "allObjects");
    if (_NSIsNSOrderedSet())
      a3 = (id)objc_msgSend(a3, "array");
    modifier = self->_modifier;
  }
  else
  {
    a3 = 0;
  }
  if (modifier == 2)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (!v10)
      return v10;
    v15 = v10;
    v16 = *(_QWORD *)v24;
LABEL_31:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v16)
        objc_enumerationMutation(a3);
      if (-[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:](self, "performPrimitiveOperationUsingObject:andObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17), a4))
      {
        break;
      }
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        LOBYTE(v10) = 0;
        if (v15)
          goto LABEL_31;
        return v10;
      }
    }
LABEL_38:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (modifier != 1)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Bad comparison predicate modifier");
    goto LABEL_42;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (!v11)
    goto LABEL_38;
  v12 = v11;
  v13 = *(_QWORD *)v29;
LABEL_22:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v13)
      objc_enumerationMutation(a3);
    LODWORD(v10) = -[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:](self, "performPrimitiveOperationUsingObject:andObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14), a4);
    if (!(_DWORD)v10)
      return v10;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      LOBYTE(v10) = 1;
      if (v12)
        goto LABEL_22;
      return v10;
    }
  }
}

+ (SEL)_getSelectorForType:(unint64_t)a3
{
  char **v3;

  v3 = &selRef_compare_;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 < 4)
      return *v3;
    goto LABEL_13;
  }
  if ((uint64_t)a3 > 98)
  {
    if (a3 == 99)
    {
LABEL_11:
      v3 = &selRef_containsObject_;
      return *v3;
    }
    if (a3 == 100)
      return *v3;
LABEL_13:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown predicate type %ld"), a3), 0));
  }
  if (a3 - 4 >= 2)
  {
    if (a3 == 10)
      goto LABEL_11;
    goto LABEL_13;
  }
  v3 = &selRef_isEqual_;
  return *v3;
}

- (SEL)selector
{
  return +[NSPredicateOperator _getSelectorForType:](NSPredicateOperator, "_getSelectorForType:", self->_operatorType);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_operatorType, CFSTR("NSOperatorType"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_modifier, CFSTR("NSModifier"));
}

- (id)symbol
{
  return +[NSPredicateOperator _getSymbolForType:](NSPredicateOperator, "_getSymbolForType:", self->_operatorType);
}

+ (id)_getSymbolForType:(unint64_t)a3
{
  id result;

  result = CFSTR("<");
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      return CFSTR("<=");
    case 2uLL:
      return CFSTR(">");
    case 3uLL:
      return CFSTR(">=");
    case 4uLL:
      return CFSTR("==");
    case 5uLL:
      return CFSTR("!=");
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      return CFSTR("IN");
    default:
      if (a3 == 99)
        return CFSTR("CONTAINS");
      if (a3 != 100)
LABEL_12:
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown predicate type %ld"), a3), 0));
      return CFSTR("BETWEEN");
  }
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4
{
  NSPredicateOperator *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSPredicateOperator;
  result = -[NSPredicateOperator init](&v7, sel_init);
  if (result)
  {
    result->_operatorType = a3;
    result->_modifier = a4;
  }
  return result;
}

+ (id)_newOperatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  NSComparisonPredicateOperator *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSInPredicateOperator *v11;
  uint64_t v12;
  NSEqualityPredicateOperator *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSLikePredicateOperator *v18;
  uint64_t v19;
  NSSubstringPredicateOperator *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  if ((uint64_t)a3 <= 98)
  {
    switch(a3)
    {
      case 0uLL:
        v7 = [NSComparisonPredicateOperator alloc];
        v8 = 0;
        v9 = a4;
        v10 = 0;
        return -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:options:](v7, "initWithOperatorType:modifier:variant:options:", v8, v9, v10, a5);
      case 1uLL:
        v7 = [NSComparisonPredicateOperator alloc];
        v8 = 1;
        v9 = a4;
        v10 = 1;
        return -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:options:](v7, "initWithOperatorType:modifier:variant:options:", v8, v9, v10, a5);
      case 2uLL:
        v7 = [NSComparisonPredicateOperator alloc];
        v8 = 2;
        v9 = a4;
        v10 = 2;
        return -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:options:](v7, "initWithOperatorType:modifier:variant:options:", v8, v9, v10, a5);
      case 3uLL:
        v7 = [NSComparisonPredicateOperator alloc];
        v8 = 3;
        v9 = a4;
        v10 = 3;
        return -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:options:](v7, "initWithOperatorType:modifier:variant:options:", v8, v9, v10, a5);
      case 4uLL:
        v14 = [NSEqualityPredicateOperator alloc];
        v15 = 4;
        v16 = a4;
        v17 = 0;
        return -[NSEqualityPredicateOperator initWithOperatorType:modifier:negate:options:](v14, "initWithOperatorType:modifier:negate:options:", v15, v16, v17, a5);
      case 5uLL:
        v14 = [NSEqualityPredicateOperator alloc];
        v15 = 5;
        v16 = a4;
        v17 = 1;
        return -[NSEqualityPredicateOperator initWithOperatorType:modifier:negate:options:](v14, "initWithOperatorType:modifier:negate:options:", v15, v16, v17, a5);
      case 6uLL:
        v18 = [NSMatchingPredicateOperator alloc];
        v19 = 6;
        return -[NSMatchingPredicateOperator initWithOperatorType:modifier:variant:](v18, "initWithOperatorType:modifier:variant:", v19, a4, a5);
      case 7uLL:
        v18 = [NSLikePredicateOperator alloc];
        v19 = 7;
        return -[NSMatchingPredicateOperator initWithOperatorType:modifier:variant:](v18, "initWithOperatorType:modifier:variant:", v19, a4, a5);
      case 8uLL:
        v20 = [NSSubstringPredicateOperator alloc];
        v21 = 8;
        v22 = a4;
        v23 = a5;
        v24 = 0;
        return -[NSSubstringPredicateOperator initWithOperatorType:modifier:variant:position:](v20, "initWithOperatorType:modifier:variant:position:", v21, v22, v23, v24);
      case 9uLL:
        v20 = [NSSubstringPredicateOperator alloc];
        v21 = 9;
        v22 = a4;
        v23 = a5;
        v24 = 1;
        return -[NSSubstringPredicateOperator initWithOperatorType:modifier:variant:position:](v20, "initWithOperatorType:modifier:variant:position:", v21, v22, v23, v24);
      case 0xAuLL:
        v11 = [NSInPredicateOperator alloc];
        v12 = 10;
        return -[NSInPredicateOperator initWithOperatorType:modifier:options:](v11, "initWithOperatorType:modifier:options:", v12, a4, a5);
      default:
        goto LABEL_28;
    }
  }
  if ((uint64_t)a3 <= 999)
  {
    if (a3 == 99)
    {
      v11 = [NSInPredicateOperator alloc];
      v12 = 99;
      return -[NSInPredicateOperator initWithOperatorType:modifier:options:](v11, "initWithOperatorType:modifier:options:", v12, a4, a5);
    }
    if (a3 == 100)
    {
      v11 = [NSBetweenPredicateOperator alloc];
      v12 = 100;
      return -[NSInPredicateOperator initWithOperatorType:modifier:options:](v11, "initWithOperatorType:modifier:options:", v12, a4, a5);
    }
LABEL_28:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown predicate type %ld"), a3), 0));
  }
  if (a3 != 1000)
  {
    if (a3 == 2000)
      return -[NSPredicateOperator initWithOperatorType:modifier:]([NSBoundedByPredicateOperator alloc], "initWithOperatorType:modifier:", 2000, a4);
    goto LABEL_28;
  }
  v18 = [NSTokenMatchingPredicateOperator alloc];
  v19 = 1000;
  return -[NSMatchingPredicateOperator initWithOperatorType:modifier:variant:](v18, "initWithOperatorType:modifier:variant:", v19, a4, a5);
}

- (void)_setModifier:(unint64_t)a3
{
  self->_modifier = a3;
}

- (NSPredicateOperator)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  return -[NSPredicateOperator initWithOperatorType:modifier:](self, "initWithOperatorType:modifier:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSOperatorType")), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSModifier")));
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 2) != 0)
    objc_msgSend(a3, "visitPredicateOperator:", self);
}

- (unint64_t)modifier
{
  return self->_modifier;
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3
{
  return -[NSPredicateOperator initWithOperatorType:modifier:](self, "initWithOperatorType:modifier:", a3, 0);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[NSString hash](NSStringFromSelector(-[NSPredicateOperator selector](self, "selector")), "hash") ^ v3;
}

+ (NSPredicateOperator)operatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  return (NSPredicateOperator *)(id)objc_msgSend(a1, "_newOperatorWithType:modifier:options:", a3, a4, a5);
}

+ (NSPredicateOperator)operatorWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  return (NSPredicateOperator *)-[NSCustomPredicateOperator initWithCustomSelector:modifier:]([NSCustomPredicateOperator alloc], "initWithCustomSelector:modifier:", a3, a4);
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

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  return v6 == objc_msgSend(a3, "modifier");
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSPredicateOperator"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)_setOptions:(unint64_t)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSPredicateOperator"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (unint64_t)options
{
  return 0;
}

@end
