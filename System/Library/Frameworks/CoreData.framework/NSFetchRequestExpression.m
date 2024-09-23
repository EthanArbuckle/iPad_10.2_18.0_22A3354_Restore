@implementation NSFetchRequestExpression

- (id)initForFetch:(id)a3 context:(id)a4 countOnly:(BOOL)a5
{
  _BOOL4 v5;
  NSFetchRequestExpression *v8;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)NSFetchRequestExpression;
  v8 = -[NSFetchRequestExpression initWithExpressionType:](&v10, sel_initWithExpressionType_, 50);
  if (v8)
  {
    v8->_fetchRequest = (NSExpression *)a3;
    v8->_managedObjectContext = (NSExpression *)a4;
    v8->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v8->_flags & 0xFFFFFFFE | v5);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequestExpression;
  -[NSFetchRequestExpression dealloc](&v3, sel_dealloc);
}

+ (NSExpression)expressionForFetch:(NSExpression *)fetch context:(NSExpression *)context countOnly:(BOOL)countFlag
{
  return (NSExpression *)-[NSFetchRequestExpression initForFetch:context:countOnly:]([NSFetchRequestExpression alloc], "initForFetch:context:countOnly:", fetch, context, countFlag);
}

- (NSExpression)requestExpression
{
  return self->_fetchRequest;
}

- (NSExpression)contextExpression
{
  return self->_managedObjectContext;
}

- (BOOL)isCountOnlyRequest
{
  return *(_DWORD *)&self->_flags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  objc_super v3;

  -[NSExpression allowEvaluation](self->_managedObjectContext, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_fetchRequest, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequestExpression;
  -[NSFetchRequestExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSFetchRequestExpression;
  -[NSFetchRequestExpression encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_fetchRequest, CFSTR("NSFRExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_managedObjectContext, CFSTR("NSMOCExpression"));
  objc_msgSend(a3, "encodeBool:forKey:", *(_DWORD *)&self->_flags & 1, CFSTR("NSCountOnlyFlag"));
}

- (NSFetchRequestExpression)initWithCoder:(id)a3
{
  NSFetchRequestExpression *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSFetchRequestExpression;
  v4 = -[NSFetchRequestExpression initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFRExpression"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_managedObjectContext = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("NSMOCExpression"));
    v4->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSCountOnlyFlag")));
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSFetchRequestExpression initForFetch:context:countOnly:]([NSFetchRequestExpression alloc], "initForFetch:context:countOnly:", self->_fetchRequest, self->_managedObjectContext, *(_DWORD *)&self->_flags & 1);
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  NSFetchRequestExpression *v6;
  id v7;
  id v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = self;
  if ((-[NSFetchRequestExpression _allowsEvaluation](self, "_allowsEvaluation") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  v7 = -[NSExpression expressionValueWithObject:context:](v6->_fetchRequest, "expressionValueWithObject:context:", a3, a4);
  v8 = -[NSExpression expressionValueWithObject:context:](v6->_managedObjectContext, "expressionValueWithObject:context:", a3, a4);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&v6->_flags & 1) != 0)
    {
      v12 = objc_msgSend(v8, "countForFetchRequest:error:", v7, &v15);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = 0;
      else
        v13 = v12;
      v6 = (NSFetchRequestExpression *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
    }
    else
    {
      v11 = objc_msgSend(v8, "executeFetchRequest:error:", v7, &v15);
      if (v11)
        v6 = (NSFetchRequestExpression *)v11;
      else
        v6 = (NSFetchRequestExpression *)NSArray_EmptyArray;
    }
    v10 = 0;
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSFetchRequestExpression could not evaluate its request or context."));
    return 0;
  }
  return v6;
}

- (id)description
{
  const __CFString *v2;

  if (self)
  {
    if ((*((_DWORD *)self + 18) & 1) != 0)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FETCH(%@, %@, %@)"), *((_QWORD *)self + 7), *((_QWORD *)self + 8), v2);
  }
  return self;
}

- (unint64_t)expressionType
{
  return 50;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSFetchRequestExpression isCountOnlyRequest](self, "isCountOnlyRequest"),
        v5 == objc_msgSend(a3, "isCountOnlyRequest"))
    && -[NSExpression isEqual:](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "isEqual:", objc_msgSend(a3, "requestExpression")))
  {
    return -[NSExpression isEqual:](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "isEqual:", objc_msgSend(a3, "contextExpression"));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSExpression hash](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "hash");
  return -[NSExpression hash](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "hash") ^ v3;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      objc_msgSend(a3, "visitPredicateExpression:", self);
      -[NSExpression acceptVisitor:flags:](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "acceptVisitor:flags:", a3, a4);
    }
    else
    {
      -[NSExpression acceptVisitor:flags:](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(a3, "visitPredicateExpression:", self);
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  return -[NSFetchRequestExpression initForFetch:context:countOnly:]([NSFetchRequestExpression alloc], "initForFetch:context:countOnly:", -[NSExpression _expressionWithSubstitutionVariables:](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "_expressionWithSubstitutionVariables:", a3), -[NSExpression _expressionWithSubstitutionVariables:](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "_expressionWithSubstitutionVariables:", a3), *(_DWORD *)&self->_flags & 1);
}

@end
