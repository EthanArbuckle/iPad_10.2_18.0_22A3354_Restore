@implementation DMClientAPIController

- (DMClientAPIController)init
{
  DMClientAPIController *v2;
  DMClientAPIController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMClientAPIController;
  v2 = -[DMClientAPIController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DMClientAPIController setConnectionMigrationMaximumAttempts:](v2, "setConnectionMigrationMaximumAttempts:", 3);
    -[DMClientAPIController setConnectionMigrationTimeIntervalToLastRetryDate:](v3, "setConnectionMigrationTimeIntervalToLastRetryDate:", 1.0);
  }
  return v3;
}

- (BOOL)_migrateWithConnection:(id)a3 checkNecessity:(BOOL)a4 lastRelevantPlugin:(id)a5 testMigrationInfrastructureOnly:(BOOL)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  BOOL v21;
  __CFString *v22;

  v7 = a6;
  v9 = a4;
  v11 = a3;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMClientAPIController connectionMigrationTimeIntervalToLastRetryDate](self, "connectionMigrationTimeIntervalToLastRetryDate");
  objc_msgSend(v13, "dateByAddingTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[DMClientAPIController connectionMigrationMaximumAttempts](self, "connectionMigrationMaximumAttempts");
  if (v15)
  {
    for (i = v15 - 1; ; --i)
    {
      v17 = objc_msgSend(v11, "migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:", v9, v12, v7);
      if (v17 != 4)
      {
        if (v17 == 3)
        {
          v20 = CFSTR("Data migrator successful so far. Un-blocking because plugin %@ did finish");
        }
        else
        {
          if (v17 != 2)
          {
            v21 = v17 == 1;
            _DMLogFunc(v6, 5, CFSTR("Data migrator completed with success: %s!"));
            goto LABEL_18;
          }
          v20 = CFSTR("Data migrator was not necessary");
        }
        _DMLogFunc(v6, 5, v20);
        goto LABEL_13;
      }
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "compare:", v14);

        if (v19 == 1)
          break;
      }
      if (!i)
      {
        v22 = CFSTR("Data migrator XPC interruption. Will not retry, because we are out of retries.");
        goto LABEL_17;
      }
      _DMLogFunc(v6, 5, CFSTR("Data migrator XPC interruption. Will retry."));
    }
    v22 = CFSTR("Data migrator XPC interruption. Will not retry, because too much time elapsed in the earlier attempt(s).");
LABEL_17:
    _DMLogFunc(v6, 5, v22);
    v21 = 0;
  }
  else
  {
LABEL_13:
    v21 = 1;
  }
LABEL_18:

  return v21;
}

- (void)progressHostIsReady
{
  uint64_t v2;
  xpc_object_t v3;
  void *v4;
  id v5;
  id v6;

  v6 = +[DMConnection connection](DMConnection, "connection");
  if (v6)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "msgID", 14);
    objc_msgSend(v6, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendMessageSync:", v3);

  }
  else
  {
    _DMLogFunc(v2, 3, CFSTR("Can't connect to datamigrator!"));
  }

}

- (unint64_t)connectionMigrationMaximumAttempts
{
  return self->_connectionMigrationMaximumAttempts;
}

- (void)setConnectionMigrationMaximumAttempts:(unint64_t)a3
{
  self->_connectionMigrationMaximumAttempts = a3;
}

- (double)connectionMigrationTimeIntervalToLastRetryDate
{
  return self->_connectionMigrationTimeIntervalToLastRetryDate;
}

- (void)setConnectionMigrationTimeIntervalToLastRetryDate:(double)a3
{
  self->_connectionMigrationTimeIntervalToLastRetryDate = a3;
}

@end
