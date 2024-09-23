@implementation FCFileCoordinatedTodayPersonalizationUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, 0);
}

void __61__FCFileCoordinatedTodayPersonalizationUpdate_consumeUpdates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TodayPersonalizationUpdateKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("TodayPersonalizationUpdateKey"));
}

- (FCFileCoordinatedTodayPersonalizationUpdate)initWithFileURL:(id)a3
{
  id v4;
  FCFileCoordinatedTodayPersonalizationUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  FCFileCoordinatedDictionary *v9;
  FCFileCoordinatedDictionary *fileCoordinatedDictionary;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFileCoordinatedTodayPersonalizationUpdate initWithFileURL:]";
    v16 = 2080;
    v17 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    v18 = 1024;
    v19 = 51;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v13.receiver = self;
  v13.super_class = (Class)FCFileCoordinatedTodayPersonalizationUpdate;
  v5 = -[FCFileCoordinatedTodayPersonalizationUpdate init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]([FCFileCoordinatedDictionary alloc], "initWithFileURL:allowedClasses:", v4, v8);
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v9;

  }
  return v5;
}

- (id)consumeUpdates
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  -[FCFileCoordinatedTodayPersonalizationUpdate fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__FCFileCoordinatedTodayPersonalizationUpdate_consumeUpdates__block_invoke;
  v5[3] = &unk_1E4644B00;
  v5[4] = &v6;
  objc_msgSend(v2, "writeSyncWithAccessor:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (FCFileCoordinatedTodayPersonalizationUpdate)init
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedTodayPersonalizationUpdate init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedTodayPersonalizationUpdate init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)readWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedTodayPersonalizationUpdate readWithAccessor:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    v14 = 1024;
    v15 = 74;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayPersonalizationUpdate fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__FCFileCoordinatedTodayPersonalizationUpdate_readWithAccessor___block_invoke;
  v8[3] = &unk_1E463CA08;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWithAccessor:", v8);

}

void __64__FCFileCoordinatedTodayPersonalizationUpdate_readWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TodayPersonalizationUpdateKey")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TodayPersonalizationUpdateKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)submitUpdate:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "update");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFileCoordinatedTodayPersonalizationUpdate submitUpdate:withCompletion:]";
    v16 = 2080;
    v17 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    v18 = 1024;
    v19 = 91;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v15 = CFSTR("Storing a personalization event from News Today Widget.");
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  -[FCFileCoordinatedTodayPersonalizationUpdate fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__FCFileCoordinatedTodayPersonalizationUpdate_submitUpdate_withCompletion___block_invoke;
  v12[3] = &unk_1E463AA78;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "writeWithAccessor:completion:", v12, v7);

}

void __75__FCFileCoordinatedTodayPersonalizationUpdate_submitUpdate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TodayPersonalizationUpdateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("TodayPersonalizationUpdateKey"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TodayPersonalizationUpdateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)clearUpdates
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = CFSTR("Clearing events from News Today Widget");
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
  }
  -[FCFileCoordinatedTodayPersonalizationUpdate fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeWithAccessor:completion:", &__block_literal_global_88, 0);

}

uint64_t __59__FCFileCoordinatedTodayPersonalizationUpdate_clearUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, CFSTR("TodayPersonalizationUpdateKey"));
}

- (void)setFileCoordinatedDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, a3);
}

@end
