@implementation NSSQLVariableExpressionIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  NSString *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  void *v12;

  v5 = -[NSExpression variable](self->super._expression, "variable");
  v6 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("substitutionVariables")), "valueForKey:", v5);
  if (!v6)
  {
    v10 = (id)objc_msgSend((id)objc_msgSend(-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"), "selectIntermediate"), "resolveVariableExpression:inContext:", self->super._expression, a3);
    if (v10)
      return v10;
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to resolve variable expression: %@"), self->super._expression), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v7 = (void *)v6;
  v8 = -[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped");
  v9 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("selectBindVars")), "count");
  v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v7, self->super._allowToMany, a3);
  if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("selectBindVars")), "count") - v9 >= 2)
  {
    if (!objc_msgSend(a3, "valueForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid variable substitution - multiple values not supported here %@"), self->super._expression), 0), CFSTR("NSUnderlyingException"));

    return 0;
  }
  if (v8)
    v11 = CFSTR("columnSubOrder");
  else
    v11 = CFSTR("subOrder");
  v12 = (void *)objc_msgSend(a3, "valueForKey:", v11);
  objc_msgSend(v12, "addObject:", v5);
  objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9));
  return v10;
}

@end
