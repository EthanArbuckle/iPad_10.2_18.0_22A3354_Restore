@implementation NSComparisonPredicateOperator

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result;
  unint64_t options;
  unint64_t v10;
  CFStringCompareFlags v11;
  char *v12;
  unint64_t variant;
  BOOL v14;
  __CFLocale *v15;
  CFRange v16;

  if (!((unint64_t)a3 | (unint64_t)a4))
    return ((self->_variant - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  result = 0;
  if (a3 && a4)
  {
    if (self->_options && _NSIsNSString() && _NSIsNSString())
    {
      options = self->_options;
      if ((options & 4) != 0)
      {
        v11 = 2;
      }
      else
      {
        v10 = self->_options & 1 | (((self->_options >> 1) & 1) << 7);
        if (v10)
          v11 = v10 | 0x100;
        else
          v11 = 0;
      }
      if ((options & 8) != 0)
        v15 = +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
      else
        v15 = 0;
      v16.length = objc_msgSend(a3, "length");
      v16.location = 0;
      v12 = (char *)CFStringCompareWithOptionsAndLocale((CFStringRef)a3, (CFStringRef)a4, v16, v11, v15);

    }
    else
    {
      v12 = (char *)objc_msgSend(a3, -[NSPredicateOperator selector](self, "selector"), a4);
    }
    variant = self->_variant;
    switch(variant)
    {
      case 2uLL:
        return v12 == (char *)1;
      case 1uLL:
        v14 = (unint64_t)(v12 + 1) >= 2;
        break;
      case 0uLL:
        return v12 + 1 == 0;
      default:
        v14 = (unint64_t)v12 >= 2;
        break;
    }
    return !v14;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSComparisonPredicateOperator)initWithCoder:(id)a3
{
  NSComparisonPredicateOperator *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSComparisonPredicateOperator;
  v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_variant = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSVariant"));
    v5->_options = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSOptions"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSComparisonPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_variant, CFSTR("NSVariant"));
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
        goto LABEL_14;
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
      {
LABEL_10:
        objc_msgSend(v5, "appendString:", CFSTR("]"));
        return v5;
      }
LABEL_9:
      objc_msgSend(v5, "appendString:", CFSTR("n"));
      goto LABEL_10;
    }
LABEL_14:
    objc_msgSend(v5, "appendString:", CFSTR("l"));
    if ((self->_options & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOperatorType:modifier:variant:options:", -[NSPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), self->_variant, self->_options);
}

- (unint64_t)options
{
  return self->_options;
}

- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5 options:(unint64_t)a6
{
  NSComparisonPredicateOperator *result;

  result = -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:](self, "initWithOperatorType:modifier:variant:", a3, a4, a5);
  if (result)
    result->_options = a6;
  return result;
}

- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  NSComparisonPredicateOperator *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSComparisonPredicateOperator;
  result = -[NSPredicateOperator initWithOperatorType:modifier:](&v7, sel_initWithOperatorType_modifier_, a3, a4);
  if (result)
    result->_variant = a5;
  return result;
}

- (unint64_t)variant
{
  return self->_variant;
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
  v7 = -[NSComparisonPredicateOperator variant](self, "variant");
  if (v7 != objc_msgSend(a3, "variant"))
    return 0;
  v8 = -[NSComparisonPredicateOperator options](self, "options");
  return v8 == objc_msgSend(a3, "options");
}

@end
