@implementation NSEqualityPredicateOperator

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t options;
  unint64_t v9;
  CFStringCompareFlags v10;
  __CFLocale *v11;
  BOOL v12;
  CFRange v13;

  if (!((unint64_t)a3 | (unint64_t)a4))
    return !self->_negate;
  if (!a3 || !a4)
    return self->_negate;
  if (!self->_options || !_NSIsNSString() || !_NSIsNSString())
    return objc_msgSend(a3, -[NSPredicateOperator selector](self, "selector"), a4) ^ self->_negate;
  options = self->_options;
  if ((options & 4) != 0)
  {
    v10 = 2;
  }
  else
  {
    v9 = self->_options & 1 | (((self->_options >> 1) & 1) << 7);
    if (v9)
      v10 = v9 | 0x100;
    else
      v10 = 0;
  }
  if ((options & 8) != 0)
    v11 = +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
  else
    v11 = 0;
  v13.length = objc_msgSend(a3, "length");
  v13.location = 0;
  v12 = CFStringCompareWithOptionsAndLocale((CFStringRef)a3, (CFStringRef)a4, v13, v10, v11) != kCFCompareEqualTo;

  return v12 ^ !self->_negate;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSEqualityPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_negate, CFSTR("NSNegate"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_options, CFSTR("NSOptions"));
}

- (id)predicateFormat
{
  id v3;
  id v4;
  void *v5;
  unint64_t options;

  v3 = -[NSPredicateOperator symbol](self, "symbol");
  if (self->_options)
    v4 = (id)objc_msgSend(v3, "mutableCopy");
  else
    v4 = v3;
  v5 = v4;
  if (self->_options)
  {
    objc_msgSend(v4, "appendString:", CFSTR("["));
    options = self->_options;
    if ((options & 1) != 0)
    {
      objc_msgSend(v5, "appendString:", CFSTR("c"));
      options = self->_options;
      if ((options & 2) == 0)
      {
LABEL_7:
        if ((options & 8) == 0)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    else if ((options & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v5, "appendString:", CFSTR("d"));
    options = self->_options;
    if ((options & 8) == 0)
    {
LABEL_8:
      if ((options & 4) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(v5, "appendString:", CFSTR("l"));
    options = self->_options;
    if ((options & 4) == 0)
    {
LABEL_9:
      if ((options & 0x10) == 0)
      {
LABEL_11:
        objc_msgSend(v5, "appendString:", CFSTR("]"));
        return v5;
      }
LABEL_10:
      objc_msgSend(v5, "appendString:", CFSTR("w"));
      goto LABEL_11;
    }
LABEL_16:
    objc_msgSend(v5, "appendString:", CFSTR("n"));
    if ((self->_options & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  return v5;
}

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5 options:(unint64_t)a6
{
  NSEqualityPredicateOperator *result;

  result = -[NSEqualityPredicateOperator initWithOperatorType:modifier:negate:](self, "initWithOperatorType:modifier:negate:", a3, a4, a5);
  if (result)
    result->_options = a6;
  return result;
}

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5
{
  NSEqualityPredicateOperator *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSEqualityPredicateOperator;
  result = -[NSPredicateOperator initWithOperatorType:modifier:](&v7, sel_initWithOperatorType_modifier_, a3, a4);
  if (result)
    result->_negate = a5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v9;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != objc_msgSend(a3, "modifier"))
    return 0;
  v7 = -[NSEqualityPredicateOperator isNegation](self, "isNegation");
  if (v7 != objc_msgSend(a3, "isNegation"))
    return 0;
  v9 = -[NSEqualityPredicateOperator options](self, "options");
  return v9 == objc_msgSend(a3, "options");
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isNegation
{
  return self->_negate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOperatorType:modifier:negate:options:", -[NSPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), self->_negate, self->_options);
}

- (NSEqualityPredicateOperator)initWithCoder:(id)a3
{
  NSEqualityPredicateOperator *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSEqualityPredicateOperator;
  v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_negate = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSNegate"));
    v5->_options = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSOptions"));
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNegation:(BOOL)a3
{
  self->_negate = a3;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
