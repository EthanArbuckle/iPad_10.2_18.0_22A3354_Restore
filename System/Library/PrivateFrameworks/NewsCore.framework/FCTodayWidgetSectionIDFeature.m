@implementation FCTodayWidgetSectionIDFeature

- (_QWORD)initWithPersonalizationIdentifier:(_QWORD *)a1
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(CFSTR("f8"), "length");
    if (v5 <= objc_msgSend(CFSTR("+"), "length") + v6)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("+"), "length") + objc_msgSend(CFSTR("f8"), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[FCTodayWidgetSectionIDFeature initWithSectionID:](a1, v7);

      v8 = a1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FCTodayWidgetSectionIDFeature)init
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
  -[FCTodayWidgetSectionIDFeature initWithSectionID:](self, &stru_1E464BC40);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTodayWidgetSectionIDFeature init]";
    v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    v11 = 1024;
    v12 = 888;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTodayWidgetSectionIDFeature init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (_QWORD)initWithSectionID:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCTodayWidgetSectionIDFeature;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("f8"), CFSTR("+"), v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
