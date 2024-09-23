@implementation EFSQLDisqualifiedColumnExpression

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_128 != -1)
    dispatch_once(&cachedSelf_onceToken_128, &__block_literal_global_129);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_126);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_127, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_126);
  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EFSQLDisqualifiedColumnExpression;
  return 33 * -[EFSQLColumnExpression hash](&v3, sel_hash) + 1;
}

void __60__EFSQLDisqualifiedColumnExpression_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_126 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_127;
  cachedSelf_sUniqueObjectIDs_127 = v0;

}

- (BOOL)isEqual:(id)a3
{
  EFSQLDisqualifiedColumnExpression *v4;
  EFSQLDisqualifiedColumnExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (EFSQLDisqualifiedColumnExpression *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[EFSQLDisqualifiedColumnExpression isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[EFSQLColumnExpression name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[EFSQLColumnExpression tableName](self, "tableName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFSQLColumnExpression tableName](v5, "tableName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = EFObjectsAreEqual(v8, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("+"));
  v5.receiver = self;
  v5.super_class = (Class)EFSQLDisqualifiedColumnExpression;
  -[EFSQLColumnExpression ef_renderSQLExpressionInto:](&v5, sel_ef_renderSQLExpressionInto_, v4);

}

- (EFSQLColumnExpression)columnExpression
{
  return self->_columnExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnExpression, 0);
}

@end
