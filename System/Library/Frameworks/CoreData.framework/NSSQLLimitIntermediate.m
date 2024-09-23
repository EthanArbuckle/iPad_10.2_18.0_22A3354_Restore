@implementation NSSQLLimitIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  unint64_t limit;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("substitutionVariables"));
  if (v6
    && (v13 = v6, (v14 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"))) != 0))
  {
    v15 = v14;
    if (objc_msgSend(v14, "expressionType"))
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = CFSTR("Unable to generate SQL - non-constant expression for limit substitution.");
LABEL_18:
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, v13), CFSTR("NSUnderlyingException"));
      return 0;
    }
    v20 = objc_msgSend(v15, "constantValue");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = CFSTR("Unable to generate SQL - non-NSNumber value for limit substitution.");
      goto LABEL_18;
    }
    v21 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("bindVars")), "count");
    v22 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v20, (uint64_t)a3);
    if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("bindVars")), "count") - v21 >= 2)
    {
      if (!objc_msgSend(a3, "valueForKey:", CFSTR("NSUnderlyingException")))
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid variable substitution - multiple values not supported for limit %@"), v20), 0), CFSTR("NSUnderlyingException"));

      return 0;
    }
    v23 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("subOrder"));
    objc_msgSend(v23, "addObject:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"));
    objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21));
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" LIMIT %@"), v22);

    return v24;
  }
  else
  {
    limit = self->_limit;
    if (limit)
    {
      if ((limit & 0x8000000000000000) != 0)
        _NSCoreDataLog(2, (uint64_t)CFSTR("CoreData: warning: Fetch Limit is too large, please set it to a value less than or equal to NSIntegerMax"), v7, v8, v9, v10, v11, v12, v25);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" LIMIT %lu"), self->_limit);
    }
    else
    {
      return (id)objc_msgSend(CFSTR(" LIMIT -1"), "mutableCopy");
    }
  }
}

- (NSSQLLimitIntermediate)initWithLimit:(unint64_t)a3 inScope:(id)a4
{
  NSSQLLimitIntermediate *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLLimitIntermediate;
  result = -[NSSQLIntermediate initWithScope:](&v6, sel_initWithScope_, a4);
  if (result)
    result->_limit = a3;
  return result;
}

@end
