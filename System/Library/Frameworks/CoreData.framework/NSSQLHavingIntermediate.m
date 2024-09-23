@implementation NSSQLHavingIntermediate

- (NSSQLHavingIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5
{
  NSSQLHavingIntermediate *v7;
  NSSQLHavingIntermediate *v8;
  NSSQLCompoundWhereIntermediate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLHavingIntermediate;
  v7 = -[NSSQLIntermediate initWithScope:](&v11, sel_initWithScope_, a4);
  v8 = v7;
  if (a3 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", a3, v8, a5);
        v8->_whereClause = &v9->super;
        if (v9)
          return v8;
      }
      else
      {
        objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown predicate type for having predicate: %@"), a3), 0), CFSTR("NSUnderlyingException"));
      }

      return 0;
    }
    v8->_whereClause = (NSSQLWhereIntermediate *)-[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", a3, v8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_whereClause = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLHavingIntermediate;
  -[NSSQLHavingIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isHavingScoped
{
  return 1;
}

- (id)generateSQLStringInContext:(id)a3
{
  if (!-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
    return -[NSSQLIntermediate generateSQLStringInContext:](self->_whereClause, "generateSQLStringInContext:", a3);
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported clause (having not allowed in updates)")), 0), CFSTR("NSUnderlyingException"));
  return 0;
}

@end
