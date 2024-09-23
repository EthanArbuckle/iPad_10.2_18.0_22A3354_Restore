@implementation NSSQLCompoundWhereIntermediate

- (id)disambiguatingEntity
{
  if (self->_disambiguatingEntity)
    return self->_disambiguatingEntity;
  else
    return -[NSSQLIntermediate disambiguatingEntity](self->super.super._scope, "disambiguatingEntity");
}

- (BOOL)isOrScoped
{
  return -[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType") == 2
      || -[NSSQLIntermediate isOrScoped](self->super.super._scope, "isOrScoped");
}

- (id)disambiguationKeypath
{
  if (self->_disambiguationKeypath)
    return self->_disambiguationKeypath;
  else
    return -[NSSQLIntermediate disambiguationKeypath](self->super.super._scope, "disambiguationKeypath");
}

- (id)generateSQLStringInContext:(id)a3
{
  id v5;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = -[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType");
  if ((unint64_t)(v7 - 1) < 2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (-[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType") == 1)
      v9 = CFSTR(" AND ");
    else
      v9 = CFSTR(" OR ");
    objc_msgSend(v8, "appendString:", CFSTR("("));
    v10 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0), "generateSQLStringInContext:", a3);
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v8, "appendString:", v10);

      v12 = -[NSMutableArray count](self->_subclauses, "count");
      if (v12 < 2)
      {
LABEL_13:
        objc_msgSend(v8, "appendString:", CFSTR(")"));
LABEL_20:

        return v8;
      }
      v13 = v12;
      v14 = 1;
      while (1)
      {
        objc_msgSend(v8, "appendString:", v9);
        v15 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", v14), "generateSQLStringInContext:", a3);
        if (!v15)
          break;
        v16 = (void *)v15;
        objc_msgSend(v8, "appendString:", v15);

        if (v13 == ++v14)
          goto LABEL_13;
      }
    }

    v8 = 0;
    goto LABEL_20;
  }
  if (v7)
  {
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown compound predicate type %@"), self->super._predicate), 0), CFSTR("NSUnderlyingException"));
    goto LABEL_22;
  }
  objc_msgSend(v5, "appendString:", CFSTR(" NOT ("));
  v17 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0), "generateSQLStringInContext:", a3);
  if (!v17)
  {
LABEL_22:

    return 0;
  }
  v18 = (void *)v17;
  objc_msgSend(v5, "appendString:", v17);
  objc_msgSend(v5, "appendString:", CFSTR(")"));

  if (v5)
    return v5;
  if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate compound where clause for predicate (%@) (unknown problem)"), self->super._predicate);
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._predicate, CFSTR("predicate"))), CFSTR("NSUnderlyingException"));
  }
  return 0;
}

- (NSSQLCompoundWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5
{
  NSSQLCompoundWhereIntermediate *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSSQLSimpleWhereIntermediate *v13;
  NSSQLSimpleWhereIntermediate *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSSQLCompoundWhereIntermediate;
  v6 = -[NSSQLWhereIntermediate initWithPredicate:inScope:](&v20, sel_initWithPredicate_inScope_, a3, a4);
  if (v6)
  {
    v6->_subclauses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)-[NSPredicate subpredicates](v6->super._predicate, "subpredicates");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", v12, v6);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_15;
            v13 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", v12, v6, a5);
          }
          v14 = v13;
          if (!v13)
          {
LABEL_15:
            if (!objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
              objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Problem with subpredicate %@"), v12), 0), CFSTR("NSUnderlyingException"));

            return 0;
          }
          -[NSMutableArray addObject:](v6->_subclauses, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_subclauses = 0;
  self->_disambiguationKeypath = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLCompoundWhereIntermediate;
  -[NSSQLCompoundWhereIntermediate dealloc](&v3, sel_dealloc);
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

@end
