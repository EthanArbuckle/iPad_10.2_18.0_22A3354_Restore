@implementation FCFeedTransformationSort

+ (id)transformationWithSortMethod:(int64_t)a3
{
  void *v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      v3 = (void *)objc_opt_new();
      break;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this sort method needs a personalizer, please use the +transformationWithSortMethod:personalizer: variant"));
        v6 = 136315906;
        v7 = "+[FCFeedTransformationSort transformationWithSortMethod:]";
        v8 = 2080;
        v9 = "FCFeedTransformationSort.m";
        v10 = 1024;
        v11 = 43;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      goto LABEL_5;
    default:
LABEL_5:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)transformationWithSortMethod:(int64_t)a3 configurationSet:(int64_t)a4 personalizer:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a5;
  if (a3 == 3)
  {
    if (NSClassFromString(CFSTR("XCTest")))
    {
      v8 = objc_opt_new();
    }
    else
    {
      +[FCFeedTransformationPersonalizedSort transformationWithPersonalizer:configurationSet:](FCFeedTransformationPersonalizedSort, "transformationWithPersonalizer:configurationSet:", v7, a4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[FCFeedTransformationSort transformationWithSortMethod:](FCFeedTransformationSort, "transformationWithSortMethod:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)transformationWithSortMethod:(int64_t)a3 personalizer:(id)a4
{
  return (id)objc_msgSend(a1, "transformationWithSortMethod:configurationSet:personalizer:", a3, 0, a4);
}

- (id)transformFeedItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCFeedTransformationSort transformFeedItems:]";
    v11 = 2080;
    v12 = "FCFeedTransformationSort.m";
    v13 = 1024;
    v14 = 84;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedTransformationSort transformFeedItems:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

@end
