@implementation NSStringPredicateOperator

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSStringPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_flags, CFSTR("NSFlags"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_newOperatorWithType:modifier:options:", -[NSPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), self->_flags);
}

- (NSStringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  NSStringPredicateOperator *v6;
  NSStringPredicateOperator *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSStringPredicateOperator;
  v6 = -[NSPredicateOperator initWithOperatorType:modifier:](&v9, sel_initWithOperatorType_modifier_, a3, a4);
  v7 = v6;
  if (v6)
    -[NSStringPredicateOperator _setOptions:](v6, "_setOptions:", a5);
  return v7;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_flags = a3 & 0x1F;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unint64_t)options
{
  return self->_flags;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSStringPredicateOperator)initWithCoder:(id)a3
{
  NSStringPredicateOperator *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSStringPredicateOperator;
  v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
    v5->_flags = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFlags"));
  return v5;
}

- (id)_modifierString
{
  NSMutableString *v3;
  NSMutableString *v4;
  unint64_t flags;

  if (!self->_flags)
    return &stru_1E0F56070;
  v3 = +[NSString stringWithString:](NSMutableString, "stringWithString:", CFSTR("["));
  v4 = v3;
  flags = self->_flags;
  if ((flags & 1) != 0)
  {
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("c"));
    flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_4:
      if ((flags & 8) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_4;
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("d"));
  flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
LABEL_14:
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("n"));
    if ((self->_flags & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("l"));
  flags = self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_14;
LABEL_6:
  if ((flags & 0x10) != 0)
LABEL_7:
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("w"));
LABEL_8:
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("]"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != objc_msgSend(a3, "modifier"))
    return 0;
  v7 = -[NSStringPredicateOperator flags](self, "flags");
  return v7 == objc_msgSend(a3, "flags");
}

@end
