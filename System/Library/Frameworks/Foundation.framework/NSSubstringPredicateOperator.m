@implementation NSSubstringPredicateOperator

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSSubstringPredicateOperator;
  -[NSStringPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_position, CFSTR("NSPosition"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSubstringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5 position:(unint64_t)a6
{
  NSSubstringPredicateOperator *result;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSSubstringPredicateOperator;
  result = -[NSStringPredicateOperator initWithOperatorType:modifier:variant:](&v8, sel_initWithOperatorType_modifier_variant_, a3, a4, a5);
  if (result)
    result->_position = a6;
  return result;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result;
  unint64_t v8;
  uint64_t v9;
  __CFLocale *v10;
  uint64_t v11;
  unint64_t position;
  uint64_t v13;
  uint64_t v14;

  result = 0;
  if (a3 && a4)
  {
    if (!_NSIsNSString() || (_NSIsNSString() & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't do a substring operation with something that isn't a string (lhs = %@ rhs = %@)"), a3, a4), 0));
    v8 = -[NSStringPredicateOperator flags](self, "flags");
    if ((v8 & 4) != 0)
    {
      v10 = 0;
      v11 = 2;
    }
    else
    {
      v9 = v8 & 1 | (((v8 >> 1) & 1) << 7);
      if ((v8 & 8) != 0)
        v10 = +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
      else
        v10 = 0;
      v11 = v9 | 0x100;
      if (!v9)
        v11 = 0;
    }
    position = self->_position;
    if (!position)
      v11 |= 8uLL;
    if (position == 1)
      v13 = v11 | 0xC;
    else
      v13 = v11;
    v14 = objc_msgSend(a3, "rangeOfString:options:range:locale:", a4, v13, 0, objc_msgSend(a3, "length"), v10);

    return v14 != 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (SEL)selector
{
  return sel_rangeOfString_options_;
}

- (NSSubstringPredicateOperator)initWithCoder:(id)a3
{
  NSSubstringPredicateOperator *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSSubstringPredicateOperator;
  v5 = -[NSStringPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
    v5->_position = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSPosition"));
  return v5;
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != objc_msgSend(a3, "modifier"))
    return 0;
  v7 = -[NSStringPredicateOperator flags](self, "flags");
  if (v7 != objc_msgSend(a3, "flags"))
    return 0;
  v8 = -[NSSubstringPredicateOperator position](self, "position");
  return v8 == objc_msgSend(a3, "position");
}

- (id)symbol
{
  unint64_t position;
  const __CFString *v3;
  __CFString *v4;

  position = self->_position;
  v3 = CFSTR("BEGINSWITH");
  if (position == 2)
    v3 = CFSTR("CONTAINS");
  if (position == 1)
    v4 = CFSTR("ENDSWITH");
  else
    v4 = (__CFString *)v3;
  return (id)-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

@end
