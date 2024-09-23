@implementation NSBlockExpression

- (NSBlockExpression)initWithType:(unint64_t)a3 block:(id)a4 arguments:(id)a5
{
  NSBlockExpression *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSBlockExpression;
  v7 = -[NSExpression initWithExpressionType:](&v9, sel_initWithExpressionType_, a3);
  if (v7)
  {
    v7->_block = (id)objc_msgSend(a4, "copy");
    v7->_arguments = (NSArray *)objc_msgSend(a5, "copy");
  }
  return v7;
}

- (unint64_t)expressionType
{
  return 19;
}

- (id)expressionBlock
{
  return self->_block;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_block = 0;
  self->_arguments = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBlockExpression;
  -[NSBlockExpression dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSBlockExpression initWithType:block:arguments:]([NSBlockExpression alloc], "initWithType:block:arguments:", -[NSBlockExpression expressionType](self, "expressionType"), self->_block, self->_arguments);
}

- (id)arguments
{
  return self->_arguments;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSBlockExpression cannot be encoded or decoded"), 0));
}

- (NSBlockExpression)initWithCoder:(id)a3
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSBlockExpression cannot be encoded or decoded"), 0));
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  void *v7;
  NSArray *arguments;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_arguments, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  arguments = self->_arguments;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(arguments);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "expressionValueWithObject:context:", a3, a4));
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  v12 = (void *)(*((uint64_t (**)(void))self->_block + 2))();

  return v12;
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BLOCK(%p, %@)"), self->_block, self->_arguments);
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  id v5;
  NSArray *arguments;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSBlockExpression *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  arguments = self->_arguments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(arguments);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_expressionWithSubstitutionVariables:", a3));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  v11 = -[NSBlockExpression initWithType:block:arguments:]([NSBlockExpression alloc], "initWithType:block:arguments:", -[NSBlockExpression expressionType](self, "expressionType"), self->_block, v5);

  return v11;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
      objc_msgSend(a3, "visitPredicateExpression:", self);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = -[NSBlockExpression arguments](self, "arguments");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "acceptVisitor:flags:", a3, a4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v9);
    }
    if ((a4 & 4) == 0)
      objc_msgSend(a3, "visitPredicateExpression:", self);
  }
}

@end
