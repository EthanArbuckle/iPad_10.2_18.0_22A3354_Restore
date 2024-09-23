@implementation MLCControlTreeNode

+ (MLCControlTreeNode)controlTreeNodeWithPredicate:(id)a3 needToNegate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTensor:needToNegate:", v6, v4);

  return (MLCControlTreeNode *)v7;
}

- (MLCControlTreeNode)initWithTensor:(id)a3 needToNegate:(BOOL)a4
{
  id v8;
  MLCControlTreeNode *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  MLCControlTreeNode *v26;
  objc_super v28;

  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MLCControlTreeNode;
  v9 = -[MLCControlTreeNode init](&v28, sel_init);
  objc_msgSend(v8, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    v14 = 1;
    do
    {
      objc_msgSend(v8, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 *= objc_msgSend(v17, "unsignedIntegerValue");

      ++v13;
      objc_msgSend(v8, "descriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shape");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v13 < v20);
    if (v14 != 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCControlTreeNode initWithTensor:needToNegate:].cold.3(a2);
      goto LABEL_13;
    }
  }
  objc_msgSend(v8, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "dataType");

  if (v22 != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCControlTreeNode initWithTensor:needToNegate:].cold.2(a2);
    goto LABEL_13;
  }
  objc_msgSend(v8, "parentLayers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCControlTreeNode initWithTensor:needToNegate:].cold.1(a2);
LABEL_13:

    v26 = 0;
    goto LABEL_14;
  }
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    v9->_needToNegate = a4;
  }
  v26 = v9;
LABEL_14:

  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCControlTreeNode predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { predicate=%@ : needToNegate=%d }"), v5, v7, -[MLCControlTreeNode needToNegate](self, "needToNegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCControlTreeNode predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTensor:needToNegate:", v5, -[MLCControlTreeNode needToNegate](self, "needToNegate"));

  return v6;
}

- (MLCTensor)predicate
{
  return self->_predicate;
}

- (BOOL)needToNegate
{
  return self->_needToNegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: A predicate must be graph-invariant", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: A predicate tensor with BOOLean data type is expected", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: A predicate tensor with a single element is expected ", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
