@implementation AAVersionUpdater

- (AAVersionUpdater)initWithStartingVersion:(unint64_t)a3
{
  AAVersionUpdater *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAVersionUpdater;
  result = -[AAVersionUpdater init](&v5, sel_init);
  if (result)
    result->_currentVersion = a3;
  return result;
}

- (void)performMigrations
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unint64_t v9;
  id v10;

  objc_msgSend((id)objc_opt_class(), "orderedVersions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "orderedVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "unsignedIntValue");

      if (self->_currentVersion < v7)
      {
        -[AAVersionUpdater _performVersionUpdate:](self, "_performVersionUpdate:", v7);
        self->_currentVersion = v7;
      }
      ++v5;
      objc_msgSend((id)objc_opt_class(), "orderedVersions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v9 > v5);
  }

}

- (void)_performVersionUpdate:(unint64_t)a3
{
  NSObject *v6;
  unint64_t currentVersion;
  NSString *v8;
  SEL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentVersion = self->_currentVersion;
    *(_DWORD *)buf = 136315650;
    v17 = "-[AAVersionUpdater _performVersionUpdate:]";
    v18 = 2048;
    v19 = currentVersion;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "%s Performing data migration from version %lu to : %lu", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("performVersionUpdate%ldToVersion%ld"), self->_currentVersion, a3);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);

  -[AAVersionUpdater methodSignatureForSelector:](self, "methodSignatureForSelector:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "methodReturnLength") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAVersionUpdater.m"), 47, CFSTR("%@ method signature has invalid return length"), v10);

  }
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelector:", v9);
  objc_msgSend(v11, "invokeWithTarget:", self);
  v15 = 0;
  objc_msgSend(v11, "getReturnValue:", &v15);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_currentVersion;
    *(_DWORD *)buf = 136315906;
    v17 = "-[AAVersionUpdater _performVersionUpdate:]";
    v18 = 2048;
    v19 = v13;
    v20 = 2048;
    v21 = a3;
    v22 = 2048;
    v23 = v15;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "%s Performed update of version %lu to %lu with success %lu", buf, 0x2Au);
  }

}

- (BOOL)needsUpdate
{
  unint64_t currentVersion;
  void *v3;

  currentVersion = self->_currentVersion;
  -[AAVersionUpdater _latestVersion](self, "_latestVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(currentVersion) = currentVersion < objc_msgSend(v3, "unsignedIntValue");

  return currentVersion;
}

- (id)_latestVersion
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "orderedVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(unint64_t)a3
{
  self->_currentVersion = a3;
}

@end
