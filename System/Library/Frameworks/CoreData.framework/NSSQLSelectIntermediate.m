@implementation NSSQLSelectIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  NSUInteger v4;
  NSUInteger v6;
  void *v7;
  void *v8;
  uint64_t i;
  _WORD *v10;
  NSSQLEntity *entity;
  int *v12;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v4 = -[NSArray count](self->_fetchColumns, "count");
  if (self->_isCount && v4 > 1)
    return 0;
  v6 = v4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
  v8 = v7;
  if (!self->_isCount)
  {
    if (!self->_useDistinct)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v7, "appendString:", CFSTR("COUNT( "));
  if ((objc_msgSend((id)objc_msgSend(-[NSArray lastObject](self->_fetchColumns, "lastObject"), "columnName"), "isEqual:", CFSTR("*")) & 1) == 0)LABEL_8:objc_msgSend(v8, "appendString:", CFSTR("DISTINCT "));
LABEL_9:
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v10 = -[NSArray objectAtIndex:](self->_fetchColumns, "objectAtIndex:", i);
      if (i)
        objc_msgSend(v8, "appendString:", CFSTR(", "));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || v10 && (v10[16] & 1) != 0)
      {
        objc_msgSend(v8, "appendString:", self->_columnAlias);
        objc_msgSend(v8, "appendString:", CFSTR("."));
      }
      objc_msgSend(v8, "appendString:", objc_msgSend(v10, "columnName"));
    }
  }
  if (self->_isCount)
    objc_msgSend(v8, "appendString:", CFSTR(")"));
  objc_msgSend(v8, "appendString:", CFSTR(" FROM "));
  entity = self->_entity;
  if (entity)
  {
    objc_msgSend(v8, "appendString:", -[NSSQLEntity tableName](entity, "tableName"));
    objc_msgSend(v8, "appendString:", CFSTR(" "));
    v12 = &OBJC_IVAR___NSSQLSelectIntermediate__entityAlias;
  }
  else
  {
    v12 = &OBJC_IVAR___NSSQLSelectIntermediate__correlationTarget;
  }
  objc_msgSend(v8, "appendString:", *(Class *)((char *)&self->super.super.isa + *v12));
  objc_msgSend(v8, "appendString:", CFSTR(" "));
  return v8;
}

- (BOOL)isTargetColumnsScoped
{
  return 1;
}

- (NSSQLSelectIntermediate)initWithEntity:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6
{
  NSSQLSelectIntermediate *v9;
  NSSQLSelectIntermediate *v10;

  v9 = -[NSSQLIntermediate initWithScope:](self, "initWithScope:", a6);
  v10 = v9;
  if (v9)
  {
    v9->_entity = (NSSQLEntity *)a3;
    v9->_entityAlias = (NSString *)objc_msgSend(a4, "copy");
    v10->_columnAlias = (NSString *)objc_msgSend(a4, "copy");
    v10->_fetchColumns = (NSArray *)a5;
    v10->_useDistinct = 0;
    v10->_isCount = 0;
  }
  return v10;
}

- (void)setFetchColumns:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 40) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 40) = a2;
    }
  }
}

- (void)setColumnAlias:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 56) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 56) = a2;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLSelectIntermediate;
  -[NSSQLSelectIntermediate dealloc](&v3, sel_dealloc);
}

- (id)initForCorrelationTarget:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6
{
  NSSQLSelectIntermediate *v9;

  v9 = -[NSSQLIntermediate initWithScope:](self, "initWithScope:", a6);
  if (v9)
  {
    v9->_correlationTarget = (NSString *)objc_msgSend(a3, "copy");
    v9->_columnAlias = (NSString *)objc_msgSend(a4, "copy");
    v9->_fetchColumns = (NSArray *)a5;
    v9->_useDistinct = 0;
    v9->_isCount = 0;
  }
  return v9;
}

- (id)resolveVariableExpression:(id)a3 inContext:(id)a4
{
  return 0;
}

- (BOOL)onlyFetchesAggregates
{
  return 0;
}

@end
