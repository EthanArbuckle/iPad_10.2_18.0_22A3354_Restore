@implementation NSSymbolicExpression

- (NSSymbolicExpression)initWithString:(id)a3
{
  NSSymbolicExpression *v4;
  NSSymbolicExpression *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSSymbolicExpression;
  v4 = -[NSExpression initWithExpressionType:](&v7, sel_initWithExpressionType_, 11);
  if (!a3 || (v5 = v4, (_NSIsNSString() & 1) == 0))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't create a symbolic expression with a nil token"), 0));
  v5->_token = (NSString *)a3;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolicExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_token, CFSTR("NSToken"));
}

- (NSSymbolicExpression)initWithCoder:(id)a3
{
  NSSymbolicExpression *result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSymbolicExpression;
  result = -[NSExpression initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (result)
    return -[NSSymbolicExpression initWithString:](result, "initWithString:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSToken")));
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", self->_token);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSymbolicExpression;
  -[NSSymbolicExpression dealloc](&v3, sel_dealloc);
}

- (id)predicateFormat
{
  return self->_token;
}

- (id)constantValue
{
  return self->_token;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && -[NSString isEqual:](self->_token, "isEqual:", *((_QWORD *)a3 + 3));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_token, "hash");
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  return self;
}

@end
