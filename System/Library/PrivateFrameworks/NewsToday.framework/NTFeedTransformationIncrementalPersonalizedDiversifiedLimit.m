@implementation NTFeedTransformationIncrementalPersonalizedDiversifiedLimit

- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)init
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
    v8 = "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit init]";
    v9 = 2080;
    v10 = "NTFeedTransformationIncrementalPersonalizedDiversifiedLimit.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)initWithFunctionProvider:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8;
  id v9;
  NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *v10;
  uint64_t v11;
  NSArray *priorFeedItems;
  uint64_t v13;
  uint64_t v14;
  FCFeedTransforming *privateLimitTransformation;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:].cold.1();
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)NTFeedTransformationIncrementalPersonalizedDiversifiedLimit;
  v10 = -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    priorFeedItems = v10->_priorFeedItems;
    v10->_priorFeedItems = (NSArray *)v11;

    v13 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x24BE6CBA8], "transformationWithFunctionProvider:limit:", v8, v13 + a4);
    v14 = objc_claimAutoreleasedReturnValue();
    privateLimitTransformation = v10->_privateLimitTransformation;
    v10->_privateLimitTransformation = (FCFeedTransforming *)v14;

  }
  return v10;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:].cold.2();
  -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit priorFeedItems](self, "priorFeedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "fc_arrayByAddingObjectsFromArray:toArray:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit privateLimitTransformation](self, "privateLimitTransformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformFeedItems:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "fc_containsObjectsAtFront:", v5) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:].cold.1();
  }
  objc_msgSend(v8, "fc_arrayByRemovingObjectsInArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)priorFeedItems
{
  return self->_priorFeedItems;
}

- (void)setPriorFeedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCFeedTransforming)privateLimitTransformation
{
  return self->_privateLimitTransformation;
}

- (void)setPrivateLimitTransformation:(id)a3
{
  objc_storeStrong((id *)&self->_privateLimitTransformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateLimitTransformation, 0);
  objc_storeStrong((id *)&self->_priorFeedItems, 0);
}

- (void)initWithFunctionProvider:limit:priorFeedItems:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "priorFeedItems");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFunctionProvider:limit:priorFeedItems:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "functionProvider");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)transformFeedItems:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("private transformation must return the prior items at the start of the array"));
  v2 = 136315906;
  v3 = "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:]";
  v4 = 2080;
  v5 = "NTFeedTransformationIncrementalPersonalizedDiversifiedLimit.m";
  v6 = 1024;
  v7 = 57;
  v8 = 2114;
  v9 = v0;
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

}

- (void)transformFeedItems:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItems");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

@end
