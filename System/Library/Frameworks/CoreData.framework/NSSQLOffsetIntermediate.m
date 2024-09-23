@implementation NSSQLOffsetIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("Unsupported join (offsets not allowed in updates)");
LABEL_12:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", v8), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v9 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
  if (!v9 || !v9[6])
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("Invalid SQL (must specify a limit with an offset)");
    goto LABEL_12;
  }
  v10 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("substitutionVariables"));
  if (!v10)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" OFFSET %lu"), self->_offset);
  v11 = v10;
  v12 = (void *)objc_msgSend(v10, "valueForKey:", CFSTR("FETCH_REQUEST_OFFSET_SUBSTITUTION"));
  if (!v12)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" OFFSET %lu"), self->_offset);
  v13 = v12;
  if (objc_msgSend(v12, "expressionType"))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Unable to generate SQL - non-constant expression for offset substitution.");
LABEL_20:
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, v11), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v18 = objc_msgSend(v13, "constantValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Unable to generate SQL - non-NSNumber value for offset substitution.");
    goto LABEL_20;
  }
  v19 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("bindVars")), "count");
  v20 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v18, (uint64_t)a3);
  if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("bindVars")), "count") - v19 >= 2)
  {
    if (!objc_msgSend(a3, "valueForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid variable substitution - multiple values not supported for limit %@"), v18), 0), CFSTR("NSUnderlyingException"));

    return 0;
  }
  v21 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("subOrder"));
  objc_msgSend(v21, "addObject:", CFSTR("FETCH_REQUEST_OFFSET_SUBSTITUTION"));
  objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19));
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" OFFSET %@"), v20);

  return v22;
}

- (NSSQLOffsetIntermediate)initWithOffset:(unint64_t)a3 inScope:(id)a4
{
  NSSQLOffsetIntermediate *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLOffsetIntermediate;
  result = -[NSSQLIntermediate initWithScope:](&v6, sel_initWithScope_, a4);
  if (result)
    result->_offset = a3;
  return result;
}

@end
