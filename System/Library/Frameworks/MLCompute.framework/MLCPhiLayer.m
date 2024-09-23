@implementation MLCPhiLayer

+ (id)layerWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithControlTreeNode:sources:resultTensor:", v10, v9, v8);

  return v11;
}

- (MLCPhiLayer)initWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MLCPhiLayer *v30;
  MLCPhiLayer *v31;
  void *v32;
  void *v33;
  MLCPhiLayer *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v38;
  const char *v39;
  MLCPhiLayer *v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  objc_super v45;
  objc_super v46;
  objc_super v47;
  objc_super v48;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") == 2)
  {
    v39 = a2;
    v40 = self;
    v41 = v9;
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v42 = objc_msgSend(v10, "count");
    if (v42)
    {
      v15 = 0;
      v43 = v10;
      v44 = v11;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "descriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shape");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v14 != v19)
        {
          +[MLCLog framework](MLCLog, "framework");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:].cold.1(v39);

          v34 = 0;
          self = v40;
          v9 = v41;
          goto LABEL_19;
        }
        if (v14)
          break;
LABEL_9:
        if (++v15 == v42)
          goto LABEL_10;
      }
      v20 = 0;
      while (1)
      {
        v21 = v14;
        objc_msgSend(v11, "descriptor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shape");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v15;
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "descriptor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shape");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 != v29)
          break;
        ++v20;
        v14 = v21;
        v10 = v43;
        v11 = v44;
        v15 = v25;
        if (v21 == v20)
          goto LABEL_9;
      }
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:].cold.1(v39);

      v34 = 0;
      self = v40;
      v9 = v41;
      v10 = v43;
      v11 = v44;
    }
    else
    {
LABEL_10:
      v48.receiver = v40;
      v48.super_class = (Class)MLCPhiLayer;
      v30 = -[MLCLayer initWithLabel:](&v48, sel_initWithLabel_, CFSTR("Phi"));
      v31 = v30;
      v9 = v41;
      if (v30)
      {
        v47.receiver = v30;
        v47.super_class = (Class)MLCPhiLayer;
        -[MLCLayer sourceTensors](&v47, sel_sourceTensors);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObjectsFromArray:", v10);

        v46.receiver = v31;
        v46.super_class = (Class)MLCPhiLayer;
        -[MLCLayer resultTensors](&v46, sel_resultTensors);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v11);

        v45.receiver = v31;
        v45.super_class = (Class)MLCPhiLayer;
        -[MLCLayer setConditionalTreeNode:](&v45, sel_setConditionalTreeNode_, v41);
      }
      self = v31;
      v34 = self;
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:].cold.3(a2);

    v34 = 0;
  }
LABEL_19:

  return v34;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLCPhiLayer;
  -[MLCLayer bindDevice:deviceOps:](&v6, sel_bindDevice_deviceOps_, a3, 0, a5);
  return 1;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCPhiLayer resultSizeFromSourceSize:dimension:].cold.1(a2);

  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: { sources = [%@, %@] : predicate = %@ : result = %@ }"), v4, v6, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)initWithControlTreeNode:(const char *)a1 sources:resultTensor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Result and source tensors have different shape.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithControlTreeNode:(const char *)a1 sources:resultTensor:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Two source tensors are expected in phi layer.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: resultSizeFromSourceSize:dimension must not be used for phi layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
