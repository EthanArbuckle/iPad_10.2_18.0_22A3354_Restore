@implementation MLCLossDescriptor

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;

  v4 = *(_QWORD *)&reductionType;
  v5 = *(_QWORD *)&lossType;
  v6 = objc_alloc((Class)a1);
  LODWORD(v7) = 1.0;
  return (MLCLossDescriptor *)(id)objc_msgSend(v6, "initWithLossDescriptorWithType:reductionType:weight:", v5, v4, v7);
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;

  v6 = *(_QWORD *)&reductionType;
  v7 = *(_QWORD *)&lossType;
  v8 = objc_alloc((Class)a1);
  *(float *)&v9 = weight;
  return (MLCLossDescriptor *)(id)objc_msgSend(v8, "initWithLossDescriptorWithType:reductionType:weight:", v7, v6, v9);
}

- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5
{
  return -[MLCLossDescriptor initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](self, "initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", *(_QWORD *)&a3, *(_QWORD *)&a4, 1);
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v10 = *(_QWORD *)&reductionType;
  v11 = *(_QWORD *)&lossType;
  v12 = objc_alloc((Class)a1);
  LODWORD(v13) = 869711765;
  LODWORD(v14) = 1.0;
  *(float *)&v15 = weight;
  *(float *)&v16 = labelSmoothing;
  return (MLCLossDescriptor *)(id)objc_msgSend(v12, "initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", v11, v10, classCount, v15, v16, v13, v14);
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount epsilon:(float)epsilon delta:(float)delta
{
  uint64_t v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v14 = *(_QWORD *)&reductionType;
  v15 = *(_QWORD *)&lossType;
  v16 = objc_alloc((Class)a1);
  *(float *)&v17 = weight;
  *(float *)&v18 = labelSmoothing;
  *(float *)&v19 = epsilon;
  *(float *)&v20 = delta;
  return (MLCLossDescriptor *)(id)objc_msgSend(v16, "initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", v15, v14, classCount, v17, v18, v19, v20);
}

- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5 labelSmoothing:(float)a6 classCount:(unint64_t)a7 epsilon:(float)a8 delta:(float)a9
{
  NSObject *v18;
  MLCLossDescriptor *result;
  objc_super v20;

  if (a4 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCLossDescriptor initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:].cold.1(a2, a4, v18);

  }
  v20.receiver = self;
  v20.super_class = (Class)MLCLossDescriptor;
  result = -[MLCLossDescriptor init](&v20, sel_init);
  if (result)
  {
    result->_lossType = a3;
    result->_reductionType = a4;
    result->_weight = a5;
    result->_labelSmoothing = a6;
    result->_classCount = a7;
    result->_epsilon = a8;
    result->_delta = a9;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  double v9;
  float v10;
  double v11;
  NSUInteger v12;
  float v13;
  double v14;
  float v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLossDescriptor lossType](self, "lossType");
  v7 = -[MLCLossDescriptor reductionType](self, "reductionType");
  -[MLCLossDescriptor weight](self, "weight");
  v9 = v8;
  -[MLCLossDescriptor labelSmoothing](self, "labelSmoothing");
  v11 = v10;
  v12 = -[MLCLossDescriptor classCount](self, "classCount");
  -[MLCLossDescriptor epsilon](self, "epsilon");
  v14 = v13;
  -[MLCLossDescriptor delta](self, "delta");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { lossType=%d : reductionType=%d : weight=%f : labelSmoothing=%f : numberOfClasses=%lu : epsilon=%f : delta=%f }"), v5, v6, v7, *(_QWORD *)&v9, *(_QWORD *)&v11, v12, *(_QWORD *)&v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "lossType");
    if (v6 != -[MLCLossDescriptor lossType](self, "lossType"))
      goto LABEL_10;
    v7 = objc_msgSend(v5, "reductionType");
    if (v7 != -[MLCLossDescriptor reductionType](self, "reductionType"))
      goto LABEL_10;
    objc_msgSend(v5, "weight");
    v9 = v8;
    -[MLCLossDescriptor weight](self, "weight");
    if (v9 != v10)
      goto LABEL_10;
    objc_msgSend(v5, "labelSmoothing");
    v12 = v11;
    -[MLCLossDescriptor labelSmoothing](self, "labelSmoothing");
    if (v12 == v13
      && (v14 = objc_msgSend(v5, "classCount"), v14 == -[MLCLossDescriptor classCount](self, "classCount"))
      && (objc_msgSend(v5, "epsilon"), v16 = v15, -[MLCLossDescriptor epsilon](self, "epsilon"), v16 == v17))
    {
      objc_msgSend(v5, "delta");
      v19 = v18;
      -[MLCLossDescriptor delta](self, "delta");
      v21 = v19 == v20;
    }
    else
    {
LABEL_10:
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  unint64_t v20;

  v20 = 0;
  v19 = -[MLCLossDescriptor lossType](self, "lossType");
  -[MLCLossDescriptor reductionType](self, "reductionType");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCLossDescriptor weight](self, "weight");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCLossDescriptor labelSmoothing](self, "labelSmoothing");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  -[MLCLossDescriptor classCount](self, "classCount");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCLossDescriptor epsilon](self, "epsilon");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hash");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCLossDescriptor delta](self, "delta");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  hashCombine_3(&v20, v11, v12, v13, v14, v15, v16, v17, v19);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  NSUInteger v11;
  int v12;
  int v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCLossDescriptor lossType](self, "lossType");
  v6 = -[MLCLossDescriptor reductionType](self, "reductionType");
  -[MLCLossDescriptor weight](self, "weight");
  v8 = v7;
  -[MLCLossDescriptor labelSmoothing](self, "labelSmoothing");
  v10 = v9;
  v11 = -[MLCLossDescriptor classCount](self, "classCount");
  -[MLCLossDescriptor epsilon](self, "epsilon");
  v13 = v12;
  -[MLCLossDescriptor delta](self, "delta");
  LODWORD(v15) = v14;
  LODWORD(v16) = v8;
  LODWORD(v17) = v10;
  LODWORD(v18) = v13;
  return (id)objc_msgSend(v4, "initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", v5, v6, v11, v16, v17, v18, v15);
}

- (MLCLossType)lossType
{
  return self->_lossType;
}

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

- (float)weight
{
  return self->_weight;
}

- (float)labelSmoothing
{
  return self->_labelSmoothing;
}

- (NSUInteger)classCount
{
  return self->_classCount;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (float)delta
{
  return self->_delta;
}

- (void)initWithLossDescriptorWithType:(NSObject *)a3 reductionType:weight:labelSmoothing:classCount:epsilon:delta:.cold.1(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: reduction type is not supported, using MLCReductionTypeNone instead = %d", (uint8_t *)&v6, 0x12u);

}

@end
