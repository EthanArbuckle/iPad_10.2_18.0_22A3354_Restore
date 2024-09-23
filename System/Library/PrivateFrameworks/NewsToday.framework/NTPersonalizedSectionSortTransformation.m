@implementation NTPersonalizedSectionSortTransformation

- (NTPersonalizedSectionSortTransformation)init
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
    v8 = "-[NTPersonalizedSectionSortTransformation init]";
    v9 = 2080;
    v10 = "NTPersonalizedSectionTransformations.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTPersonalizedSectionSortTransformation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTPersonalizedSectionSortTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 sortTransformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTPersonalizedSectionSortTransformation *v11;
  uint64_t v12;
  NSOrderedSet *mandatoryArticleIDs;
  uint64_t v14;
  NSOrderedSet *personalizedArticleIDs;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:].cold.4();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:].cold.3();
LABEL_6:
  if (objc_msgSend(v8, "intersectsOrderedSet:", v9)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:].cold.2();
    if (v10)
      goto LABEL_11;
  }
  else if (v10)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:].cold.1();
LABEL_11:
  v17.receiver = self;
  v17.super_class = (Class)NTPersonalizedSectionSortTransformation;
  v11 = -[NTPersonalizedSectionSortTransformation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    mandatoryArticleIDs = v11->_mandatoryArticleIDs;
    v11->_mandatoryArticleIDs = (NSOrderedSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    personalizedArticleIDs = v11->_personalizedArticleIDs;
    v11->_personalizedArticleIDs = (NSOrderedSet *)v14;

    objc_storeStrong((id *)&v11->_sortTransformation, a5);
  }

  return v11;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionSortTransformation transformFeedItems:].cold.1();
  -[NTPersonalizedSectionSortTransformation mandatoryArticleIDs](self, "mandatoryArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizedSectionSortTransformation personalizedArticleIDs](self, "personalizedArticleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke;
  v21[3] = &unk_24DB5F978;
  v10 = v5;
  v22 = v10;
  v23 = v7;
  v24 = v6;
  v25 = v8;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v21);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_18;
  v19[3] = &unk_24DB5F9A0;
  v20 = v10;
  v14 = v10;
  objc_msgSend(v13, "sortUsingComparator:", v19);
  -[NTPersonalizedSectionSortTransformation sortTransformation](self, "sortTransformation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transformFeedItems:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "fc_arrayByAddingObjectsFromArray:toArray:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "articleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
  {
    v5 = *(void **)(a1 + 40);
LABEL_5:
    objc_msgSend(v5, "addObject:", v3);
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v4))
  {
    v5 = *(void **)(a1 + 56);
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_cold_1();
LABEL_8:

}

uint64_t __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "articleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "articleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "compare:", v13);

  return v14;
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

- (FCFeedTransforming)sortTransformation
{
  return self->_sortTransformation;
}

- (void)setSortTransformation:(id)a3
{
  objc_storeStrong((id *)&self->_sortTransformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortTransformation, 0);
  objc_storeStrong((id *)&self->_personalizedArticleIDs, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDs, 0);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sortTransformation", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.2()
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

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.3()
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

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.4()
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

void __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_cold_1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Case unsupported"));
  v1 = 136315906;
  v2 = "-[NTPersonalizedSectionSortTransformation transformFeedItems:]_block_invoke";
  v3 = 2080;
  v4 = "NTPersonalizedSectionTransformations.m";
  v5 = 1024;
  v6 = 84;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
