@implementation HDSQLiteEntityForeignKey

- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5 isDeferred:(BOOL)a6
{
  id v10;
  HDSQLiteEntityForeignKey *v11;
  HDSQLiteEntityForeignKey *v12;
  uint64_t v13;
  NSString *property;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteEntityForeignKey;
  v11 = -[HDSQLiteEntityForeignKey init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityClass, a3);
    v13 = objc_msgSend(v10, "copy");
    property = v12->_property;
    v12->_property = (NSString *)v13;

    v12->_deletionAction = a5;
    v12->_isDeferred = a6;
  }

  return v12;
}

- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5
{
  return -[HDSQLiteEntityForeignKey initWithEntityClass:property:deletionAction:isDeferred:](self, "initWithEntityClass:property:deletionAction:isDeferred:", a3, a4, a5, 0);
}

- (id)creationSQL
{
  void *v3;
  void *v4;
  NSString *property;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  property = self->_property;
  HDSQLForForeignKeyDeletionAction(self->_deletionAction);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_isDeferred)
    v8 = CFSTR(" DEFERRABLE INITIALLY DEFERRED");
  else
    v8 = &stru_24CB19CC0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("REFERENCES %@ (%@) ON DELETE %@%@"), v4, property, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)property
{
  return self->_property;
}

- (int64_t)deletionAction
{
  return self->_deletionAction;
}

- (BOOL)isDeferred
{
  return self->_isDeferred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end
