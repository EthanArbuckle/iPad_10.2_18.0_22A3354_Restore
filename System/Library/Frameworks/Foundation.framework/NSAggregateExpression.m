@implementation NSAggregateExpression

- (NSAggregateExpression)initWithCollection:(id)a3
{
  NSAggregateExpression *v5;
  void *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't create an aggregate expression with an instance of %@"), objc_opt_class()), 0);
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSAggregateExpression;
  v5 = -[NSExpression initWithExpressionType:](&v8, sel_initWithExpressionType_, 14);
  v5->_collection = a3;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 14;
}

- (void)allowEvaluation
{
  id collection;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  collection = self->_collection;
  v4 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(collection);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "allowEvaluation");
      }
      v5 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSAggregateExpression;
  -[NSExpression allowEvaluation](&v8, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSAggregateExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_collection, CFSTR("NSCollection"));
}

- (NSAggregateExpression)initWithCoder:(id)a3
{
  NSAggregateExpression *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (const __CFString *)*MEMORY[0x1E0C99778];
    v13 = CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers");
    goto LABEL_15;
  }
  v14.receiver = self;
  v14.super_class = (Class)NSAggregateExpression;
  v5 = -[NSExpression initWithCoder:](&v14, sel_initWithCoder_, a3);
  if (!v5)
    return v5;
  v6 = (void *)objc_msgSend(a3, "allowedClasses");
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
  }
  else
  {
    v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding");
  }
  v9 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSCollection"));
  v5->_collection = v9;
  if (v9
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSArray() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && (_NSIsNSDictionary() & 1) == 0)
  {

    if (v7)
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = CFSTR("NSInvalidUnarchiveOperationException");
    v13 = CFSTR("Malformed compound predicate (bad subpredicates collection)");
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
  }
  if (v7)

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4;
  Class *v5;
  void *v6;
  id collection;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(self->_collection, "isNSArray", a3);
  v5 = (Class *)0x1E0C99DE8;
  if (!v4)
    v5 = (Class *)0x1E0C99E20;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithCapacity:", objc_msgSend(self->_collection, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  collection = self->_collection;
  v8 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(collection);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copy");
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v9);
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCollection:", v6);

  return v13;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAggregateExpression;
  -[NSAggregateExpression dealloc](&v3, sel_dealloc);
}

- (id)predicateFormat
{
  id collection;

  collection = self->_collection;
  if ((_NSIsNSArray() & 1) != 0
    || (_NSIsNSSet() & 1) != 0
    || (_NSIsNSOrderedSet() & 1) != 0
    || _NSIsNSDictionary())
  {
    return +[_NSPredicateUtilities _parserableCollectionDescription:]((uint64_t)_NSPredicateUtilities, collection);
  }
  else
  {
    return (id)objc_msgSend(collection, "description");
  }
}

- (id)constantValue
{
  return self->_collection;
}

- (id)collection
{
  return self->_collection;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->_collection, "isEqual:", *((_QWORD *)a3 + 3));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_collection, "hash");
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  void *v7;
  id collection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  collection = self->_collection;
  v9 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(collection);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "expressionValueWithObject:context:", a3, a4);
        if (!v13)
          v13 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v10);
  }
  return v7;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  id collection;
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
    collection = self->_collection;
    v8 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(collection);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "acceptVisitor:flags:", a3, a4);
        }
        v9 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v9);
    }
    if ((a4 & 4) == 0)
      objc_msgSend(a3, "visitPredicateExpression:", self);
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  void *v5;
  id collection;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  collection = self->_collection;
  v7 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(collection);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_expressionWithSubstitutionVariables:", a3));
      }
      v8 = objc_msgSend(collection, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCollection:", v5);
}

@end
