@implementation NTPersonalizedSectionLimitTransformation

- (NTPersonalizedSectionLimitTransformation)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTPersonalizedSectionLimitTransformation init]";
    v9 = 2080;
    v10 = "NTPersonalizedSectionTransformations.m";
    v11 = 1024;
    v12 = 116;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTPersonalizedSectionLimitTransformation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTPersonalizedSectionLimitTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  NTPersonalizedSectionLimitTransformation *v10;
  uint64_t v11;
  NSOrderedSet *mandatoryArticleIDs;
  uint64_t v13;
  NSOrderedSet *personalizedArticleIDs;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:].cold.3();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:].cold.2();
LABEL_6:
  if (objc_msgSend(v8, "intersectsOrderedSet:", v9)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)NTPersonalizedSectionLimitTransformation;
  v10 = -[NTPersonalizedSectionLimitTransformation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    mandatoryArticleIDs = v10->_mandatoryArticleIDs;
    v10->_mandatoryArticleIDs = (NSOrderedSet *)v11;

    v13 = objc_msgSend(v9, "copy");
    personalizedArticleIDs = v10->_personalizedArticleIDs;
    v10->_personalizedArticleIDs = (NSOrderedSet *)v13;

    v10->_limit = a5;
  }

  return v10;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionLimitTransformation transformFeedItems:].cold.1();
  -[NTPersonalizedSectionLimitTransformation mandatoryArticleIDs](self, "mandatoryArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __63__NTPersonalizedSectionLimitTransformation_transformFeedItems___block_invoke;
  v19 = &unk_24DB5F9C8;
  v6 = v5;
  v20 = v6;
  v21 = &v22;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, &v16);
  v7 = -[NTPersonalizedSectionLimitTransformation limit](self, "limit", v16, v17, v18, v19);
  v8 = v23[3];
  v9 = v8 + 1;
  v10 = v7 - (v8 + 1);
  if (v7 <= v8 + 1)
  {
    objc_msgSend(v4, "fc_subarrayUpToCountInclusive:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "fc_subarrayUpToCountInclusive:", v8 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_safeSubarrayWithCountFromBack:", objc_msgSend(v4, "count") - v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fc_subarrayWithMaxCount:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE30], "fc_arrayByAddingObjectsFromArray:toArray:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __63__NTPersonalizedSectionLimitTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "articleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSOrderedSet)mandatoryArticleIDs
{
  return self->_mandatoryArticleIDs;
}

- (void)setMandatoryArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSOrderedSet)personalizedArticleIDs
{
  return self->_personalizedArticleIDs;
}

- (void)setPersonalizedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedArticleIDs, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDs, 0);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![mandatoryArticleIDs intersectsOrderedSet:personalizedArticleIDs]", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizedArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"mandatoryArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)transformFeedItems:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
