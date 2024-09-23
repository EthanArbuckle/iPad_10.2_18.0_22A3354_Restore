@implementation MLCEmbeddingDescriptor

+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension paddingIndex:(NSNumber *)paddingIndex maximumNorm:(NSNumber *)maximumNorm pNorm:(NSNumber *)pNorm scalesGradientByFrequency:(BOOL)scalesGradientByFrequency
{
  _BOOL8 v8;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  void *v19;

  v8 = scalesGradientByFrequency;
  v14 = pNorm;
  v15 = maximumNorm;
  v16 = paddingIndex;
  v17 = embeddingDimension;
  v18 = embeddingCount;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:", v18, v17, v16, v15, v14, v8);

  return (MLCEmbeddingDescriptor *)v19;
}

+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension
{
  NSNumber *v6;
  NSNumber *v7;
  void *v8;

  v6 = embeddingDimension;
  v7 = embeddingCount;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:", v7, v6, 0, 0, 0, 0);

  return (MLCEmbeddingDescriptor *)v8;
}

- (MLCEmbeddingDescriptor)initWithEmbeddingCount:(id)a3 embeddingDimension:(id)a4 paddingIndex:(id)a5 maximumNorm:(id)a6 pNorm:(id)a7 scalesGradientByFrequency:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  NSObject *v20;
  float v21;
  float v22;
  MLCEmbeddingDescriptor *v23;
  MLCEmbeddingDescriptor *v24;
  void *v25;
  MLCEmbeddingDescriptor *v26;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v14, "integerValue") <= 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.1(a2);
    goto LABEL_26;
  }
  if (objc_msgSend(v15, "integerValue") <= 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.2(a2);
    goto LABEL_26;
  }
  if (v16)
  {
    if (objc_msgSend(v16, "integerValue") < 0
      || (v19 = objc_msgSend(v16, "unsignedIntegerValue"), v19 > objc_msgSend(v14, "unsignedIntegerValue") - 1))
    {
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.5(a2);
LABEL_26:

      v26 = 0;
      goto LABEL_27;
    }
  }
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    if (v21 <= 0.0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.4(a2);
      goto LABEL_26;
    }
  }
  if (v18)
  {
    objc_msgSend(v18, "floatValue");
    if (v22 <= 0.0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.3(a2);
      goto LABEL_26;
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)MLCEmbeddingDescriptor;
  v23 = -[MLCEmbeddingDescriptor init](&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_embeddingCount, a3);
    objc_storeStrong((id *)&v24->_embeddingDimension, a4);
    objc_storeStrong((id *)&v24->_paddingIndex, a5);
    objc_storeStrong((id *)&v24->_maximumNorm, a6);
    if (v18)
      v25 = v18;
    else
      v25 = &unk_1E9844CB0;
    objc_storeStrong((id *)&v24->_pNorm, v25);
    v24->_scalesGradientByFrequency = a8;
  }
  self = v24;
  v26 = self;
LABEL_27:

  return v26;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  void *v16;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingDescriptor embeddingCount](self, "embeddingCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  -[MLCEmbeddingDescriptor embeddingDimension](self, "embeddingDimension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  -[MLCEmbeddingDescriptor paddingIndex](self, "paddingIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  -[MLCEmbeddingDescriptor maximumNorm](self, "maximumNorm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;
  -[MLCEmbeddingDescriptor pNorm](self, "pNorm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: { embeddingCount=%lu : embeddingDimension=%lu : paddingIndex=%lu : maximumNorm=%f : pNorm=%f : scalesGradientByFrequency=%d }"), v4, v6, v8, v10, *(_QWORD *)&v13, v15, -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;
  id v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "embeddingCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCEmbeddingDescriptor embeddingCount](self, "embeddingCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      objc_msgSend(v5, "embeddingDimension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCEmbeddingDescriptor embeddingDimension](self, "embeddingDimension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {
        objc_msgSend(v5, "paddingIndex");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCEmbeddingDescriptor paddingIndex](self, "paddingIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {
          objc_msgSend(v5, "maximumNorm");
          v13 = objc_claimAutoreleasedReturnValue();
          -[MLCEmbeddingDescriptor maximumNorm](self, "maximumNorm");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)v13;
          if ((void *)v13 == v14)
          {
            v22 = v14;
            objc_msgSend(v5, "pNorm");
            v15 = objc_claimAutoreleasedReturnValue();
            -[MLCEmbeddingDescriptor pNorm](self, "pNorm");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)v15;
            if ((void *)v15 == v16)
            {
              v17 = v16;
              v20 = objc_msgSend(v5, "scalesGradientByFrequency");
              v18 = v20 ^ -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency");
              v16 = v17;
              v8 = v18 ^ 1;
            }
            else
            {
              v8 = 0;
            }

            v14 = v22;
          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  unint64_t v17;

  v17 = 0;
  -[MLCEmbeddingDescriptor embeddingCount](self, "embeddingCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "hash");
  -[MLCEmbeddingDescriptor embeddingDimension](self, "embeddingDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");
  -[MLCEmbeddingDescriptor paddingIndex](self, "paddingIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[MLCEmbeddingDescriptor maximumNorm](self, "maximumNorm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  -[MLCEmbeddingDescriptor pNorm](self, "pNorm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency");
  hashCombine_6(&v17, v8, v9, v10, v11, v12, v13, v14, v16);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCEmbeddingDescriptor embeddingCount](self, "embeddingCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingDescriptor embeddingDimension](self, "embeddingDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingDescriptor paddingIndex](self, "paddingIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingDescriptor maximumNorm](self, "maximumNorm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingDescriptor pNorm](self, "pNorm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:", v5, v6, v7, v8, v9, -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency"));

  return v10;
}

- (NSNumber)embeddingCount
{
  return self->_embeddingCount;
}

- (NSNumber)embeddingDimension
{
  return self->_embeddingDimension;
}

- (NSNumber)paddingIndex
{
  return self->_paddingIndex;
}

- (NSNumber)maximumNorm
{
  return self->_maximumNorm;
}

- (NSNumber)pNorm
{
  return self->_pNorm;
}

- (BOOL)scalesGradientByFrequency
{
  return self->_scalesGradientByFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pNorm, 0);
  objc_storeStrong((id *)&self->_maximumNorm, 0);
  objc_storeStrong((id *)&self->_paddingIndex, 0);
  objc_storeStrong((id *)&self->_embeddingDimension, 0);
  objc_storeStrong((id *)&self->_embeddingCount, 0);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The number of embeddings must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The embedding dimension must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The p in p-norm must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The maximum norm must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The padding index must be within the number of embeddings", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
