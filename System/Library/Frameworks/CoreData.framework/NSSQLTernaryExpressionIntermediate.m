@implementation NSSQLTernaryExpressionIntermediate

- (void)dealloc
{
  objc_super v3;

  self->_disambiguationKeypath = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLTernaryExpressionIntermediate;
  -[NSSQLTernaryExpressionIntermediate dealloc](&v3, sel_dealloc);
}

- (id)disambiguatingEntity
{
  if (self->_disambiguatingEntity)
    return self->_disambiguatingEntity;
  else
    return -[NSSQLIntermediate disambiguatingEntity](self->super.super._scope, "disambiguatingEntity");
}

- (id)disambiguationKeypath
{
  if (self->_disambiguationKeypath)
    return self->_disambiguationKeypath;
  else
    return -[NSSQLIntermediate disambiguationKeypath](self->super.super._scope, "disambiguationKeypath");
}

- (BOOL)disambiguationKeypathHasToMany
{
  if (self->_disambiguationKeypath)
    return self->_disambiguationKeypathHasToMany;
  else
    return -[NSSQLIntermediate disambiguationKeypathHasToMany](self->super.super._scope, "disambiguationKeypathHasToMany");
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
  self->_disambiguatingEntity = (NSSQLEntity *)a3;
  self->_disambiguationKeypath = (NSArray *)a4;
  self->_disambiguationKeypathHasToMany = a5;
}

- (id)generateSQLStringInContext:(id)a3
{
  void *v5;
  NSPredicate *v6;
  NSSQLSimpleWhereIntermediate *v7;
  const __CFString *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (-[NSSQLIntermediate isIndexExpressionScoped](self, "isIndexExpressionScoped"))
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Ternary expression not supported as index component"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._expression, CFSTR("Bad value"))), CFSTR("NSUnderlyingException"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(CASE ("));
  v6 = -[NSExpression predicate](self->super._expression, "predicate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", v6, self);
    if (!v7)
    {
      if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
        v8 = CFSTR("Can't generate intermediate for ternary expression predicate.");
LABEL_15:
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0), CFSTR("NSUnderlyingException"));
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = CFSTR("Can't generate intermediate for ternary expression predicate (unknown type)");
      goto LABEL_15;
    }
    v7 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", v6, self, a3);
    if (!v7)
    {
LABEL_16:
      if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
LABEL_19:

        return 0;
      }
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = CFSTR("Can't generate SQL for ternary expression predicate.");
LABEL_18:
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0), CFSTR("NSUnderlyingException"));
      goto LABEL_19;
    }
  }
  v9 = -[NSSQLSimpleWhereIntermediate generateSQLStringInContext:](v7, "generateSQLStringInContext:", a3);

  if (!v9)
    goto LABEL_16;
  objc_msgSend(v5, "appendString:", v9);

  objc_msgSend(v5, "appendString:", CFSTR(") when 1 then ("));
  v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, -[NSExpression trueExpression](self->super._expression, "trueExpression"), self->super._allowToMany, a3);
  if (!v10)
  {
    if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      goto LABEL_19;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Can't generate SQL for ternary expression trueExpression.");
    goto LABEL_18;
  }
  v11 = v10;
  objc_msgSend(v5, "appendString:", v10);

  objc_msgSend(v5, "appendString:", CFSTR(") else ("));
  v12 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, -[NSExpression falseExpression](self->super._expression, "falseExpression"), self->super._allowToMany, a3);
  if (!v12)
  {
    if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      goto LABEL_19;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Can't generate SQL for ternary expression falseExpression.");
    goto LABEL_18;
  }
  v13 = v12;
  objc_msgSend(v5, "appendString:", v12);

  objc_msgSend(v5, "appendString:", CFSTR(") end)"));
  return v5;
}

@end
