@implementation NSSQLBoundedByIntermediate

- (NSSQLBoundedByIntermediate)initWithWorkingEntity:(id)a3 target:(id)a4 bounds:(id)a5 scope:(id)a6
{
  NSSQLBoundedByIntermediate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLBoundedByIntermediate;
  v9 = -[NSSQLIntermediate initWithScope:](&v11, sel_initWithScope_, a6);
  if (v9)
  {
    v9->_entity = (NSSQLEntity *)a3;
    v9->_target = (NSAttributeDescription *)a4;
    v9->_bounds = (NSExpression *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_entity = 0;
  self->_target = 0;

  self->_bounds = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBoundedByIntermediate;
  -[NSSQLBoundedByIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  NSExpressionType v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  NSSQLEntity *entity;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSSQLEntity *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSSQLAliasGenerator *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSSQLBindVariable *v45;
  NSSQLBindVariable *v46;
  NSSQLBindVariable *v47;
  NSSQLBindVariable *v48;
  NSSQLBindVariable *v49;
  NSSQLBindVariable *v50;
  NSSQLBindVariable *v51;
  NSSQLBindVariable *v52;

  v5 = -[NSExpression expressionType](self->_bounds, "expressionType");
  if (v5 == NSConstantValueExpressionType)
  {
    v16 = -[NSExpression constantValue](self->_bounds, "constantValue");
    if (objc_msgSend(v16, "count") == 2)
    {
      v14 = (void *)objc_msgSend(v16, "firstObject");
      v17 = objc_msgSend(v16, "lastObject");
      goto LABEL_19;
    }
LABEL_26:
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, RHS of boundBy: must contain 2 values");
    goto LABEL_29;
  }
  if (v5 != NSAggregateExpressionType)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, RHS of boundBy: must be an aggregate or constant");
    goto LABEL_29;
  }
  v6 = -[NSExpression constantValue](self->_bounds, "constantValue");
  if (objc_msgSend(v6, "count") != 2)
    goto LABEL_26;
  v7 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
  v8 = objc_msgSend(v7, "expressionType");
  v9 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
  v10 = objc_msgSend(v9, "expressionType");
  if (v8)
    v11 = v8 == 3;
  else
    v11 = 1;
  if (!v11)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, topLeft parameter of boundBy: RHS must be a constant or keypath");
LABEL_29:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v12 = v10;
  if (v10)
    v13 = v10 == 3;
  else
    v13 = 1;
  if (!v13)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, bottomRight parameter of boundBy: RHS must be a constant or keypath");
    goto LABEL_29;
  }
  if (v8)
  {
    v14 = 0;
    if (v10)
    {
LABEL_16:
      v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = (void *)objc_msgSend(v7, "constantValue");
    if (v12)
      goto LABEL_16;
  }
  v17 = objc_msgSend(v9, "constantValue");
LABEL_19:
  v15 = (void *)v17;
LABEL_20:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, constant topLeft parameter of boundBy: RHS must respond to coordinate");
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, constant lowerRight parameter of boundBy: RHS must respond to coordinate");
    goto LABEL_29;
  }
  v18 = -[NSDictionary objectForKey:](-[NSPropertyDescription userInfo](self->_target, "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
  if ((objc_msgSend(v18, "isNSArray") & 1) == 0)
  {
    if (objc_msgSend(v18, "isNSString"))
      v18 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "description"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E1EE23F0), "componentsSeparatedByString:", CFSTR(","));
    else
      v18 = 0;
  }
  entity = self->_entity;
  v24 = objc_msgSend(v18, "firstObject");
  if (entity)
    v25 = (void *)-[NSMutableDictionary objectForKey:](entity->_properties, "objectForKey:", v24);
  else
    v25 = 0;
  v26 = objc_msgSend(v25, "columnName");
  v27 = self->_entity;
  v28 = objc_msgSend(v18, "lastObject");
  if (v27)
    v29 = (void *)-[NSMutableDictionary objectForKey:](v27->_properties, "objectForKey:", v28);
  else
    v29 = 0;
  v30 = objc_msgSend(v29, "columnName");
  v31 = -[NSSQLAliasGenerator initWithNestingLevel:]([NSSQLAliasGenerator alloc], "initWithNestingLevel:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("nestingLevel")), "integerValue") + 1);
  v32 = -[NSSQLAliasGenerator generateTableAlias](v31, "generateTableAlias");

  v33 = (void *)+[NSSQLLocationAttributeRTreeExtension newRTReeTableNameForAttribute:onEntity:]((uint64_t)NSSQLLocationAttributeRTreeExtension, self->_target, (uint64_t)-[NSSQLEntity entityDescription](self->_entity, "entityDescription"));
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT %@.Z_PK FROM %@ %@ WHERE ? <= %@.%@_MAX AND %@.%@_MIN <= ? AND ? <= %@.%@_MAX AND %@.%@_MIN <= ?"), v32, v33, v32, v32, v26, v32, v26, v32, v30, v32, v30);

  if (-[NSSQLIntermediate isWhereScoped](self, "isWhereScoped"))
    v35 = CFSTR("bindVars");
  else
    v35 = CFSTR("selectBindVars");
  v36 = (void *)objc_msgSend(a3, "objectForKey:", v35);
  objc_msgSend(v14, "coordinate");
  v38 = v37;
  objc_msgSend(v15, "coordinate");
  v40 = v39;
  objc_msgSend(v15, "coordinate");
  v42 = v41;
  objc_msgSend(v14, "coordinate");
  v44 = v43;
  v45 = [NSSQLBindVariable alloc];
  v46 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v45, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42), 7, 0);
  objc_msgSend(v36, "addObject:", v46);

  v47 = [NSSQLBindVariable alloc];
  v48 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v47, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44), 7, 0);
  objc_msgSend(v36, "addObject:", v48);

  v49 = [NSSQLBindVariable alloc];
  v50 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v49, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38), 7, 0);
  objc_msgSend(v36, "addObject:", v50);

  v51 = [NSSQLBindVariable alloc];
  v52 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v51, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40), 7, 0);
  objc_msgSend(v36, "addObject:", v52);

  return v34;
}

@end
