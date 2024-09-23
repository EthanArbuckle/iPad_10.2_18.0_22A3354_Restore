@implementation NTFeedTransformationItemFeedTransformation

- (NTFeedTransformationItemFeedTransformation)init
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
    v8 = "-[NTFeedTransformationItemFeedTransformation init]";
    v9 = 2080;
    v10 = "NTFeedTransformationUtilities.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTFeedTransformationItemFeedTransformation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTFeedTransformationItemFeedTransformation)initWithFeedItemTransformation:(id)a3
{
  id v5;
  NTFeedTransformationItemFeedTransformation *v6;
  NTFeedTransformationItemFeedTransformation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)NTFeedTransformationItemFeedTransformation;
  v6 = -[NTFeedTransformationItemFeedTransformation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_feedItemTransformation, a3);

  return v7;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationItemFeedTransformation transformFeedItems:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_9)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationItemFeedTransformation transformFeedItems:].cold.1();
  }
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke_15;
  v16 = &unk_24DB5F658;
  v17 = v5;
  v18 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v13);
  -[NTFeedTransformationItemFeedTransformation feedItemTransformation](self, "feedItemTransformation", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformFeedItems:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_objectsForKeys:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feedTransformationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "feedTransformationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (FCFeedTransforming)feedItemTransformation
{
  return self->_feedItemTransformation;
}

- (void)setFeedItemTransformation:(id)a3
{
  objc_storeStrong((id *)&self->_feedItemTransformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItemTransformation, 0);
}

- (void)initWithFeedItemTransformation:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItemTransformation", v6, 2u);

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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![items fc_containsObjectPassingTest:^BOOL(id<NTFeedTransformationItem> item) { return item.feedTransformationItem == nil; }]",
    v6,
    2u);

  OUTLINED_FUNCTION_2();
}

- (void)transformFeedItems:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
