@implementation FCAccountActionQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDictionary, 0);
}

- (BOOL)popActionTypesUpToCount:(unint64_t)a3 setLocalDataHintIfNeeded:(BOOL)a4
{
  void *v6;
  char v7;
  _QWORD v9[5];
  BOOL v10;

  -[FCAccountActionQueue persistentDictionary](self, "persistentDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__FCAccountActionQueue_popActionTypesUpToCount_setLocalDataHintIfNeeded___block_invoke;
  v9[3] = &__block_descriptor_41_e29_v16__0__NSMutableDictionary_8l;
  v9[4] = a3;
  v10 = a4;
  v7 = objc_msgSend(v6, "writeWithAccessor:", v9);

  return v7;
}

- (FCPersistentDictionary)persistentDictionary
{
  return self->_persistentDictionary;
}

- (id)peekAtActionTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[FCAccountActionQueue persistentDictionary](self, "persistentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "read");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_actionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __73__FCAccountActionQueue_popActionTypesUpToCount_setLocalDataHintIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_popActionTypesUpToCount:", v3);
  objc_msgSend(v4, "fc_setLocalDataHintIfNeeded:", *(unsigned __int8 *)(a1 + 40));

}

- (FCAccountActionQueue)initWithFileURL:(id)a3
{
  id v4;
  FCAccountActionQueue *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  FCPersistentDictionary *v10;
  FCPersistentDictionary *persistentDictionary;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCAccountActionQueue;
  v5 = -[FCAccountActionQueue init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCPersistentDictionary initWithFileURL:allowedClasses:]([FCPersistentDictionary alloc], "initWithFileURL:allowedClasses:", v4, v9);
    persistentDictionary = v5->_persistentDictionary;
    v5->_persistentDictionary = v10;

  }
  return v5;
}

- (FCAccountActionQueue)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAccountActionQueue init]";
    v9 = 2080;
    v10 = "FCAccountActionQueue.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCAccountActionQueue init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)readLocalDataHint
{
  void *v2;
  void *v3;
  char v4;

  -[FCAccountActionQueue persistentDictionary](self, "persistentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "read");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fc_localDataHint");

  return v4;
}

- (BOOL)enqueueActionWithType:(int64_t)a3
{
  void *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  -[FCAccountActionQueue persistentDictionary](self, "persistentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__FCAccountActionQueue_enqueueActionWithType___block_invoke;
  v7[3] = &unk_1E463E020;
  v7[4] = &v8;
  v7[5] = a3;
  v5 = objc_msgSend(v4, "writeWithAccessor:", v7);

  if (!*((_BYTE *)v9 + 24))
    v5 = 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__FCAccountActionQueue_enqueueActionWithType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "fc_enqueueActionType:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setPersistentDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_persistentDictionary, a3);
}

@end
