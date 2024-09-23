@implementation NSSQLForeignKeyIntermediate

- (NSSQLForeignKeyIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignKeyIntermediate;
  return -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:](&v5, sel_initWithConstantValue_inScope_context_, a3, a4, 0);
}

- (id)generateSQLStringInContext:(id)a3
{
  id constantValue;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  NSSQLBindVariable *v12;
  NSSQLBindVariable *v13;
  const __CFString *v15;

  constantValue = self->super._constantValue;
  if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == constantValue)
    v6 = 0;
  else
    v6 = constantValue;
  if (!v6)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
LABEL_11:
    v8 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:](objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore")), "adapter"), v6);
    if (v8 == 1)
      v9 = 2;
    else
      v9 = v8;
    if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
      v10 = CFSTR("selectBindVars");
    else
      v10 = CFSTR("bindVars");
    v11 = (void *)objc_msgSend(a3, "objectForKey:", v10);
    v12 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v6, v9, 0);
    goto LABEL_18;
  }
  constantValue = (id)objc_msgSend(v6, "objectID");
  if (!constantValue)
    goto LABEL_11;
LABEL_7:
  if ((objc_msgSend(constantValue, "isTemporaryID") & 1) == 0)
  {
    v7 = objc_msgSend(constantValue, "persistentStore");
    if (v7 == objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore")))
    {
      if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
        v15 = CFSTR("selectBindVars");
      else
        v15 = CFSTR("bindVars");
      v11 = (void *)objc_msgSend(a3, "objectForKey:", v15);
      v12 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", objc_msgSend(constantValue, "_referenceData64"), 2);
LABEL_18:
      v13 = v12;
      objc_msgSend(v11, "addObject:", v12);

      return (id)objc_msgSend(CFSTR("?"), "mutableCopy");
    }
  }
  -[NSSQLConstantValueIntermediate _addBindVarForConstId:ofType:inContext:](self, (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0), 2, a3);
  return (id)objc_msgSend(CFSTR("?"), "mutableCopy");
}

@end
