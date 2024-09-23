@implementation NSKeyPathSpecifierExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  return self->_value;
}

- (id)constantValue
{
  return self->_value;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSKeyPathSpecifierExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_value, CFSTR("NSKeyPath"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyPathSpecifierExpression;
  -[NSKeyPathSpecifierExpression dealloc](&v3, sel_dealloc);
}

- (id)keyPath
{
  return self->_value;
}

- (NSKeyPathSpecifierExpression)initWithObject:(id)a3
{
  NSKeyPathSpecifierExpression *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSKeyPathSpecifierExpression;
  v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 10);
  v4->_value = (NSString *)a3;
  return v4;
}

- (unint64_t)expressionType
{
  return 10;
}

- (NSKeyPathSpecifierExpression)initWithCoder:(id)a3
{
  NSKeyPathSpecifierExpression *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSKeyPathSpecifierExpression;
  v5 = -[NSExpression initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
    v5->_value = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSKeyPath"));
  return v5;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t i;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0)
    objc_msgSend(a3, "visitPredicateExpression:", self);
  if ((v4 & 0x10) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x186DA8F78]();
    v8 = (void *)objc_msgSend(-[NSKeyPathSpecifierExpression keyPath](self, "keyPath"), "componentsSeparatedByString:", CFSTR("."));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = &stru_1E0F56070;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(a3, "visitPredicateExpression:keyPathScope:key:", self, v12, v14);
          if (-[__CFString length](v12, "length"))
            v12 = (__CFString *)-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("."));
          v12 = (__CFString *)-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v10);
    }
    objc_autoreleasePoolPop(v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)predicateFormat
{
  NSArray *v3;
  NSMutableString *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString componentsSeparatedByString:](self->_value, "componentsSeparatedByString:", CFSTR("."));
  v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", -[NSString length](self->_value, "length"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((v7 & 1) != 0)
          -[NSMutableString appendString:](v4, "appendString:", CFSTR("."));
        if (+[_NSPredicateUtilities _isReservedWordInParser:](_NSPredicateUtilities, "_isReservedWordInParser:", v10))
        {
          -[NSMutableString appendString:](v4, "appendString:", CFSTR("#"));
        }
        -[NSMutableString appendString:](v4, "appendString:", v10);
        ++v9;
        v7 = 1;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", self->_value);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqual:", -[NSKeyPathSpecifierExpression keyPath](self, "keyPath"));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSKeyPathSpecifierExpression keyPath](self, "keyPath"), "hash");
}

@end
