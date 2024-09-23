@implementation NSSQLGroupByIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v19;
  NSArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
  {
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported clause (group by not allowed in updates)")), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  else
  {
    v5 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
    v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_properties;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        v11 = 0;
        v12 = -v9;
        v19 = v8 + v9;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          if (objc_msgSend(v13, "_propertyType") == 5)
          {
            -[NSSQLFetchIntermediate addGroupByKeypath:]((uint64_t)v5, objc_msgSend((id)objc_msgSend(v13, "expression"), "predicateFormat"));
            v14 = (void *)objc_msgSend(v13, "expression");
          }
          else
          {
            v15 = objc_msgSend(v13, "name");
            -[NSSQLFetchIntermediate addGroupByKeypath:]((uint64_t)v5, v15);
            v14 = (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v15);
          }
          v16 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v14, 0, a3);
          if (!v16)
          {
            if (!objc_msgSend(a3, "valueForKey:", CFSTR("NSUnderlyingException")))
              objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate SQL for group by property: %@"), v13), 0), CFSTR("NSUnderlyingException"));

            return 0;
          }
          v17 = v16;
          if (v12 != v11)
            objc_msgSend(v6, "appendString:", CFSTR(", "));
          objc_msgSend(v6, "appendString:", v17);

          ++v11;
        }
        while (v8 != v11);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v9 = v19;
        if (v8)
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

  self->_properties = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLGroupByIntermediate;
  -[NSSQLGroupByIntermediate dealloc](&v3, sel_dealloc);
}

- (NSSQLGroupByIntermediate)initWithProperties:(id)a3 inScope:(id)a4
{
  NSSQLGroupByIntermediate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLGroupByIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5)
    v5->_properties = (NSArray *)objc_msgSend(a3, "copy");
  return v5;
}

@end
