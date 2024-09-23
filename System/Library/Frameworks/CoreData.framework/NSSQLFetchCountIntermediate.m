@implementation NSSQLFetchCountIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  id v5;
  NSSQLColumn *v7;
  id v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSSQLColumn *v15;
  _BYTE *v16;
  id v17;
  id v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if ((unint64_t)(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("storeRequest")), "fetchLimit")
                        - 10001) > 0xFFFFFFFFFFFFD8EFLL)
  {
    v15 = objc_alloc_init(NSSQLColumn);
    -[NSSQLColumn _setColumnName:]((uint64_t)v15, CFSTR("Z_PK"));
    if (v15)
      *(_WORD *)&v15->super._flags |= 1u;
    v21.receiver = self;
    v21.super_class = (Class)NSSQLFetchCountIntermediate;
    v16 = -[NSSQLFetchIntermediate selectIntermediate](&v21, sel_selectIntermediate);
    if (v16)
      v16[48] = 1;
    v20.receiver = self;
    v20.super_class = (Class)NSSQLFetchCountIntermediate;
    v17 = -[NSSQLFetchIntermediate selectIntermediate](&v20, sel_selectIntermediate);
    -[NSSQLSelectIntermediate setFetchColumns:]((uint64_t)v17, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15));

    v19.receiver = self;
    v19.super_class = (Class)NSSQLFetchCountIntermediate;
    v18 = -[NSSQLFetchIntermediate generateSQLStringInContext:](&v19, sel_generateSQLStringInContext_, a3);
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT COUNT(*) FROM ("));
      objc_msgSend(v5, "appendString:", v18);
      objc_msgSend(v5, "appendString:", CFSTR(")"));

      return v5;
    }

    return 0;
  }
  -[NSSQLStatementIntermediate setLimitIntermediate:]((uint64_t)self, 0);
  v7 = objc_alloc_init(NSSQLColumn);
  -[NSSQLColumn _setColumnName:]((uint64_t)v7, CFSTR("Z_PK"));
  if (v7)
    *(_WORD *)&v7->super._flags |= 1u;
  v8 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  -[NSSQLSelectIntermediate setFetchColumns:]((uint64_t)v8, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7));

  v9 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  if (v9)
    v9[48] = 1;
  v10 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  if (v10)
    v10[64] = 1;
  v22.receiver = self;
  v22.super_class = (Class)NSSQLFetchCountIntermediate;
  v5 = -[NSSQLFetchIntermediate generateSQLStringInContext:](&v22, sel_generateSQLStringInContext_, a3);
  v11 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  if ((unint64_t)objc_msgSend(v11, "count") >= 6
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", CFSTR("SELECT"))
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "isEqualToString:", CFSTR("COUNT(")))
  {
    v12 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "isEqualToString:", CFSTR("DISTINCT"))? 3: 2;
    if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12), "isEqualToString:", CFSTR("t0.Z_PK)")))
    {
      if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12 + 1), "isEqualToString:", CFSTR("FROM")))
      {
        v13 = objc_msgSend(v11, "objectAtIndex:", v12 + 2);
        if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12 + 3), "isEqualToString:", CFSTR("t0")))
        {
          v14 = v12 | 4;
          if (v14 >= objc_msgSend(v11, "count"))
          {
LABEL_23:

            return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v13);
          }
          else
          {
            while ((objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v14), "isEqualToString:", &stru_1E1EE23F0) & 1) != 0)
            {
              if (++v14 >= objc_msgSend(v11, "count"))
                goto LABEL_23;
            }
          }
        }
      }
    }
  }
  return v5;
}

@end
