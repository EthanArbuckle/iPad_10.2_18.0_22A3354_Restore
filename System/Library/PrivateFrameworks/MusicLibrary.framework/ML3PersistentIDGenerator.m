@implementation ML3PersistentIDGenerator

- (ML3PersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4
{
  id v7;
  id v8;
  ML3PersistentIDGenerator *v9;
  ML3PersistentIDGenerator *v10;
  uint64_t v11;
  NSString *validateStartingPersistentIdSQL;
  uint64_t v13;
  NSString *nextUsedPersistentIdSQL;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ML3PersistentIDGenerator;
  v9 = -[ML3PersistentIDGenerator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_tableName, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM %@ WHERE ROWID = ?"), v8);
    v11 = objc_claimAutoreleasedReturnValue();
    validateStartingPersistentIdSQL = v10->_validateStartingPersistentIdSQL;
    v10->_validateStartingPersistentIdSQL = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM %@ WHERE ROWID > ? LIMIT 1"), v8);
    v13 = objc_claimAutoreleasedReturnValue();
    nextUsedPersistentIdSQL = v10->_nextUsedPersistentIdSQL;
    v10->_nextUsedPersistentIdSQL = (NSString *)v13;

  }
  return v10;
}

- (int64_t)nextPersistentID
{
  int64_t result;

  result = self->_currentPersistentID;
  if (!result || result == self->_nextUsedPersistentID)
  {
    -[ML3PersistentIDGenerator _calculateNewRun](self, "_calculateNewRun");
    result = self->_currentPersistentID;
  }
  self->_currentPersistentID = result + 1;
  return result;
}

- (void)_calculateNewRun
{
  uint64_t v3;
  ML3DatabaseConnection *connection;
  NSString *validateStartingPersistentIdSQL;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t currentPersistentID;
  int64_t v11;
  ML3DatabaseConnection *v12;
  NSString *nextUsedPersistentIdSQL;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  NSObject *v19;
  NSString *tableName;
  int64_t v21;
  int64_t nextUsedPersistentID;
  int v23;
  NSString *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  do
  {
    v3 = arc4random();
    self->_currentPersistentID = (arc4random() >> 1) | (unint64_t)(v3 << 31);
    connection = self->_connection;
    validateStartingPersistentIdSQL = self->_validateStartingPersistentIdSQL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnection executeQuery:withParameters:](connection, "executeQuery:withParameters:", validateStartingPersistentIdSQL, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "int64ValueForFirstRowAndColumn");
    currentPersistentID = self->_currentPersistentID;
    if (v9 == currentPersistentID)
      currentPersistentID = 0;
    self->_currentPersistentID = currentPersistentID;

    v11 = self->_currentPersistentID;
  }
  while (!v11 || v11 == 0x7FFFFFFFFFFFFFFFLL);
  v12 = self->_connection;
  nextUsedPersistentIdSQL = self->_nextUsedPersistentIdSQL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection executeQuery:withParameters:](v12, "executeQuery:withParameters:", nextUsedPersistentIdSQL, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "int64ValueForFirstRowAndColumn");
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (v17)
    v18 = v17;
  self->_nextUsedPersistentID = v18;
  v19 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    tableName = self->_tableName;
    v21 = self->_currentPersistentID;
    nextUsedPersistentID = self->_nextUsedPersistentID;
    v23 = 138543874;
    v24 = tableName;
    v25 = 2048;
    v26 = v21;
    v27 = 2048;
    v28 = nextUsedPersistentID;
    _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Calculated new run starting for table '%{public}@' at %lli until %lli", (uint8_t *)&v23, 0x20u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUsedPersistentIdSQL, 0);
  objc_storeStrong((id *)&self->_validateStartingPersistentIdSQL, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
