@implementation SGRe2

- (BOOL)isTrivial
{
  SGRe2 *v2;
  int isTrivial;
  void *v4;
  char v5;
  BOOL v6;

  v2 = self;
  objc_sync_enter(v2);
  isTrivial = v2->_isTrivial;
  if (!v2->_isTrivial)
  {
    -[SGRe2 existsInUtf8:](v2, "existsInUtf8:", ");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = 2;
    v2->_isTrivial = v5;

    isTrivial = v2->_isTrivial;
  }
  v6 = isTrivial == 1;
  objc_sync_exit(v2);

  return v6;
}

- (id)matchesString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    -[SGRe2 matchesUtf8:](self, "matchesUtf8:", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)existsInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    -[SGRe2 existsInUtf8:](self, "existsInUtf8:", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  -[SGRe2 enumerateMatchesInUtf8:fromString:ngroups:block:](self, "enumerateMatchesInUtf8:fromString:ngroups:block:", objc_msgSend(v10, "UTF8String"), v10, a4, v9);

}

- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SGRe2_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
  v12[3] = &unk_1E7DB4DD0;
  v13 = v10;
  v11 = v10;
  -[SGRe2 _enumerateMatchesInUtf8:fromString:ngroups:block:](self, "_enumerateMatchesInUtf8:fromString:ngroups:block:", a3, a4, a5, v12);

}

- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 blockWithSubregexp:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  -[SGRe2 _enumerateMatchesInUtf8:fromString:ngroups:block:](self, "_enumerateMatchesInUtf8:fromString:ngroups:block:", objc_msgSend(v10, "UTF8String"), v10, a4, v9);

}

- (id)hashId
{
  return 0;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a6;
  __break(1u);
  return (int)v8;
}

uint64_t __57__SGRe2_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (id)re2WithRegexp:(id)a3
{
  id v3;
  SGRe2Basic *v4;

  v3 = a3;
  v4 = -[SGRe2Basic initWithRegexp:]([SGRe2Basic alloc], "initWithRegexp:", v3);

  return v4;
}

+ (id)re2WithRegexpLazy:(id)a3
{
  id v3;
  SGRe2Lazy *v4;

  v3 = a3;
  v4 = -[SGRe2Lazy initWithRegexp:]([SGRe2Lazy alloc], "initWithRegexp:", v3);

  return v4;
}

+ (id)re2WithRegexpData:(id)a3
{
  id v3;
  SGRe2Basic *v4;

  v3 = a3;
  v4 = -[SGRe2Basic initWithRegexpData:]([SGRe2Basic alloc], "initWithRegexpData:", v3);

  return v4;
}

+ (id)re2WithRegexpDataLazy:(id)a3
{
  id v3;
  SGRe2Lazy *v4;

  v3 = a3;
  v4 = -[SGRe2Lazy initWithRegexpData:]([SGRe2Lazy alloc], "initWithRegexpData:", v3);

  return v4;
}

+ (id)re2WithSubregexps:(id)a3 prefilter:(id)a4
{
  id v5;
  id v6;
  SGRe2Subregexps *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[SGRe2Subregexps initWithSubregexps:prefilter:]([SGRe2Subregexps alloc], "initWithSubregexps:prefilter:", v5, v6);

  return v7;
}

+ (id)re2WithSubregexps:(id)a3
{
  id v3;
  SGRe2Subregexps *v4;

  v3 = a3;
  v4 = -[SGRe2Subregexps initWithSubregexps:prefilter:]([SGRe2Subregexps alloc], "initWithSubregexps:prefilter:", v3, 0);

  return v4;
}

+ (void)setCacheLimitForTesting:(unint64_t)a3
{
  id v4;

  getLazyRe2Cache();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountLimit:", a3);

}

@end
