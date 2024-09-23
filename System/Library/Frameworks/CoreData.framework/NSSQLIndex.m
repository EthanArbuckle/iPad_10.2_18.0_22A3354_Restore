@implementation NSSQLIndex

- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4
{
  NSSQLIndex *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLIndex;
  v6 = -[NSSQLIndex init](&v8, sel_init);
  if (v6)
  {
    v6->_indexDescription = (NSFetchIndexDescription *)a3;
    v6->_sqlEntity = (NSSQLEntity *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_createStrings = 0;
  self->_dropStrings = 0;

  self->_updateStrings = 0;
  self->_indexDescription = 0;
  self->_sqlEntity = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLIndex;
  -[NSSQLIndex dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  NSSQLEntity *sqlEntity;
  BOOL result;
  NSFetchIndexDescription *indexDescription;
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  sqlEntity = self->_sqlEntity;
  if (sqlEntity != (NSSQLEntity *)objc_msgSend(a3, "sqlEntity"))
    return 0;
  indexDescription = self->_indexDescription;
  v8 = objc_msgSend(a3, "indexDescription");
  if (indexDescription == (NSFetchIndexDescription *)v8)
    return 1;
  v9 = v8;
  result = 0;
  if (indexDescription)
  {
    if (v9)
      return -[NSFetchIndexDescription isEqual:](indexDescription, "isEqual:");
  }
  return result;
}

- (id)generateStatementsForStore:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)dropStatementsForStore:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)isUnique
{
  return -[NSFetchIndexDescription _isUnique]((uint64_t)self->_indexDescription);
}

- (NSFetchIndexDescription)indexDescription
{
  return self->_indexDescription;
}

- (NSSQLEntity)sqlEntity
{
  return self->_sqlEntity;
}

@end
