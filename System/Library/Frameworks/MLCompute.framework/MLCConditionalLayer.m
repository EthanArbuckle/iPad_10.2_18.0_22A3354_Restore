@implementation MLCConditionalLayer

+ (id)layerWithTrueBranch:(id)a3 falseBranch:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTrueBranch:falseBranch:", v7, v6);

  return v8;
}

- (MLCConditionalLayer)initWithTrueBranch:(id)a3 falseBranch:(id)a4
{
  id v7;
  id v8;
  MLCConditionalLayer *v9;
  MLCConditionalLayer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLCConditionalLayer;
  v9 = -[MLCLayer initWithLabel:](&v12, sel_initWithLabel_, CFSTR("Conditonal"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trueBranch, a3);
    objc_storeStrong((id *)&v10->_falseBranch, a4);
  }

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCConditionalLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2, v6);

  return 0;
}

- (unint64_t)resultSizeForOutputIndex:(unint64_t)a3 dimension:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;

  -[MLCConditionalLayer trueBranch](self, "trueBranch", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graphLayerList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConditionalLayer trueBranch](self, "trueBranch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "graphLayerList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resultTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  -[MLCConditionalLayer falseBranch](self, "falseBranch");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "graphLayerList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConditionalLayer falseBranch](self, "falseBranch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "graphLayerList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v21, "count") - 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resultTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shape");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  if (v17 != v28)
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCConditionalLayer resultSizeForOutputIndex:dimension:].cold.1(a2, a4, v29);

    v17 = 0;
  }

  return v17;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (i >= v10)
      break;
    v11 = -[MLCConditionalLayer resultSizeForOutputIndex:dimension:](self, "resultSizeForOutputIndex:dimension:", 0, i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, i);

  }
  v13 = (void *)objc_msgSend(v5, "copy");
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v13, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConditionalLayer trueBranch](self, "trueBranch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConditionalLayer falseBranch](self, "falseBranch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { predicate=%@ : trueBranch=%p : falseBranch=%p : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MLCGraph)trueBranch
{
  return self->_trueBranch;
}

- (MLCGraph)falseBranch
{
  return self->_falseBranch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseBranch, 0);
  objc_storeStrong((id *)&self->_trueBranch, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Conditional must not be present in the graph during compilation.", (uint8_t *)&v4, 0xCu);

}

- (void)resultSizeForOutputIndex:(NSObject *)a3 dimension:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: Result tensors of true and false branches have different shape at dimension = %lu", (uint8_t *)&v6, 0x16u);

}

@end
