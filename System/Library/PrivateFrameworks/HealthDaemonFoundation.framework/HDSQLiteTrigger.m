@implementation HDSQLiteTrigger

- (HDSQLiteTrigger)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSQLiteTrigger)initWithEntity:(Class)a3 name:(id)a4 triggerEvent:(int64_t)a5 predicateString:(id)a6 triggerString:(id)a7
{
  id v12;
  id v13;
  id v14;
  HDSQLiteTrigger *v15;
  HDSQLiteTrigger *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *predicateString;
  uint64_t v21;
  NSString *triggerString;
  objc_super v24;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HDSQLiteTrigger;
  v15 = -[HDSQLiteTrigger init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entityClass, a3);
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_event = a5;
    v19 = objc_msgSend(v13, "copy");
    predicateString = v16->_predicateString;
    v16->_predicateString = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    triggerString = v16->_triggerString;
    v16->_triggerString = (NSString *)v21;

  }
  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HDSQLiteTrigger creationSQL](self, "creationSQL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)creationSQL
{
  NSString *predicateString;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  predicateString = self->_predicateString;
  if (predicateString)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WHEN %@ "), predicateString);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CB19CC0;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLiteTrigger disambiguatedName](self, "disambiguatedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_event)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull NSStringFromTriggerEvent(HDSQLiteTriggerEvent)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteTrigger.m"), 73, CFSTR("Unreachable code has been executed"));

    v9 = &stru_24CB19CC0;
  }
  else
  {
    v9 = CFSTR("DELETE");
  }
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER %@ ON %@ FOR EACH ROW %@BEGIN %@; END"),
    v6,
    v9,
    v10,
    v4,
    self->_triggerString);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)disambiguatedName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *name;
  void *v8;
  uint64_t v10;

  -[objc_class databaseName](self->_entityClass, "databaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  name = self->_name;
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@_%@"), v3, v5, name);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v5, name, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)event
{
  return self->_event;
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (NSString)triggerString
{
  return self->_triggerString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerString, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end
