@implementation NSEnumerator(FCAdditions)

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v8;
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
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSEnumerator(FCAdditions) fc_firstObjectPassingTest:]";
    v11 = 2080;
    v12 = "NSEnumerator+FCAdditions.m";
    v13 = 1024;
    v14 = 15;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = 0;
  do
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v5 && !v4[2](v4, v5));

  return v5;
}

@end
