@implementation NSSQLUpdateIntermediate

- (void)setUpdateColumnsIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 64) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 64) = a2;
    }
  }
}

- (NSSQLUpdateIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLUpdateIntermediate;
  return -[NSSQLStatementIntermediate initWithEntity:alias:inScope:](&v6, sel_initWithEntity_alias_inScope_, a3, a4, a5);
}

- (id)generateSQLStringInContext:(id)a3
{
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  NSSQLWhereIntermediate *whereClause;
  id v10;
  NSSQLOrderIntermediate *orderIntermediate;
  id v12;
  NSSQLLimitIntermediate *limitClause;
  id v14;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (-[NSSQLStatementIntermediate governingAlias](self, "governingAlias"))
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" AS %@"), -[NSSQLStatementIntermediate governingAlias](self, "governingAlias"));
  else
    v5 = &stru_1E1EE23F0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@%@ SET "), objc_msgSend(-[NSSQLStatementIntermediate governingEntity](self, "governingEntity"), "tableName"), v5);
  v7 = -[NSSQLUpdateColumnsIntermediate generateSQLStringInContext:](self->_updateColumns, "generateSQLStringInContext:", a3);
  if (!v7)
  {
LABEL_19:

    return 0;
  }
  v8 = v7;
  objc_msgSend(v6, "appendString:", v7);
  whereClause = self->super._whereClause;
  if (whereClause)
  {
    v10 = -[NSSQLIntermediate generateSQLStringInContext:](whereClause, "generateSQLStringInContext:", a3);
    if (!v10)
      goto LABEL_18;
  }
  else
  {
    v10 = 0;
  }
  orderIntermediate = self->super._orderIntermediate;
  if (orderIntermediate)
  {
    v12 = -[NSSQLOrderIntermediate generateSQLStringInContext:](orderIntermediate, "generateSQLStringInContext:", a3);
    if (!v12)
      goto LABEL_17;
  }
  else
  {
    v12 = 0;
  }
  limitClause = self->super._limitClause;
  if (limitClause)
  {
    v14 = -[NSSQLLimitIntermediate generateSQLStringInContext:](limitClause, "generateSQLStringInContext:", a3);
    if (!v14)
    {

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    v14 = 0;
  }
  if (v10)
  {
    objc_msgSend(v6, "appendString:", CFSTR("WHERE "));
    objc_msgSend(v6, "appendString:", v10);
    objc_msgSend(v6, "appendString:", CFSTR(" "));
  }
  if (v12)
    objc_msgSend(v6, "appendString:", v12);
  if (v14)
    objc_msgSend(v6, "appendString:", v14);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_updateColumns = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLUpdateIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isUpdateScoped
{
  return 1;
}

@end
