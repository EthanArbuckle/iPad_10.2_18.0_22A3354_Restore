@implementation _NSPersistentHistoryTransactionPredicateParser

- (_NSPersistentHistoryTransactionPredicateParser)initWithPredicate:(id)a3
{
  _NSPersistentHistoryTransactionPredicateParser *v4;

  v4 = -[_NSPersistentHistoryTransactionPredicateParser init](self, "init");
  if (v4)
  {
    v4->_predicate = (NSPredicate *)objc_msgSend(a3, "copy");
    v4->_storeTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_WORD *)&v4->_hasDate = 0;
    v4->_localError = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_predicate = 0;
  self->_storeTokens = 0;

  self->_localError = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryTransactionPredicateParser;
  -[_NSPersistentHistoryTransactionPredicateParser dealloc](&v3, sel_dealloc);
}

- (BOOL)parse:(id *)a3
{
  NSPredicate *predicate;
  NSError *localError;
  BOOL result;

  predicate = self->_predicate;
  if (!predicate)
    return 1;
  -[NSPredicate acceptVisitor:flags:](predicate, "acceptVisitor:flags:", self, 1);
  localError = self->_localError;
  result = localError == 0;
  if (a3)
  {
    if (localError)
    {
      result = 0;
      *a3 = localError;
    }
  }
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  void *v5;
  const __CFString **v6;
  uint64_t *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (self->_localError)
    return;
  if (objc_msgSend(a3, "expressionType"))
  {
    if (objc_msgSend(a3, "expressionType") != 10
      || !objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", CFSTR("TIMESTAMP")))
    {
      return;
    }
    if (self->_hasDate)
    {
      v12 = *MEMORY[0x1E0CB2D50];
      v13 = CFSTR("Only one date predicate is allowed for history deletion.");
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v13;
      v7 = &v12;
LABEL_17:
      v10 = objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      self->_localError = (NSError *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v10);
      return;
    }
    goto LABEL_18;
  }
  objc_msgSend(a3, "constantValue");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)objc_msgSend(a3, "constantValue");
  if ((isKindOfClass & 1) != 0)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_storeTokens, "addEntriesFromDictionary:", objc_msgSend(v9, "storeTokens"));
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "constantValue"), "isEqualToString:", CFSTR("TIMESTAMP")))
  {
    self->_hasTimestamp = 1;
    return;
  }
  objc_msgSend(a3, "constantValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_hasTimestamp)
  {
    if (self->_hasDate)
    {
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("Only one date predicate is allowed for history deletion.");
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = (const __CFString **)v15;
      v7 = &v14;
      goto LABEL_17;
    }
LABEL_18:
    self->_hasDate = 1;
  }
}

- (id)storeTokens
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_storeTokens);
}

@end
