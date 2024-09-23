@implementation CCDatabaseCommandBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

- (void)setCommandCriterion:(id)a3
{
  CCSQLCommandCriterion *v4;
  CCSQLCommandCriterion *criterion;

  v4 = (CCSQLCommandCriterion *)objc_msgSend(a3, "copy");
  criterion = self->_criterion;
  self->_criterion = v4;

}

- (CCDatabaseCommandBuilder)initWithTableName:(id)a3
{
  id v4;
  CCDatabaseCommandBuilder *v5;
  uint64_t v6;
  NSString *tableName;
  NSString *v8;
  CCDatabaseCommandBuilder *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CCDatabaseCommandBuilder;
  v5 = -[CCDatabaseCommandBuilder init](&v12, sel_init);
  if (!v5
    || (v6 = objc_msgSend(v4, "copy"),
        tableName = v5->_tableName,
        v5->_tableName = (NSString *)v6,
        tableName,
        (v8 = v5->_tableName) != 0)
    && -[NSString length](v8, "length"))
  {
    v9 = v5;
  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCDatabaseCommandBuilder initWithTableName:].cold.1(v10);

    v9 = 0;
  }

  return v9;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (CCSQLCommandCriterion)criterion
{
  return self->_criterion;
}

- (CCDatabaseCommandBuilder)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)initWithTableName:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Cannot construct database command builder with nil tableName", v1, 2u);
}

@end
