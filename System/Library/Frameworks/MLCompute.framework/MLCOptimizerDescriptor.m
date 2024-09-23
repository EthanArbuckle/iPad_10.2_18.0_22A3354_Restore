@implementation MLCOptimizerDescriptor

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v7;
  MLCOptimizerDescriptor *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = *(_QWORD *)&regularizationType;
  v10 = [MLCOptimizerDescriptor alloc];
  LODWORD(v11) = 1.0;
  LODWORD(v12) = -1.0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1.0;
  *(float *)&v15 = learningRate;
  *(float *)&v16 = gradientRescale;
  *(float *)&v17 = regularizationScale;
  return -[MLCOptimizerDescriptor initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:](v10, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:", 0, v7, 0, v15, v16, v11, v12, v17, v13, v14);
}

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v10;
  _BOOL8 v13;
  MLCOptimizerDescriptor *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v10 = *(_QWORD *)&regularizationType;
  v13 = appliesGradientClipping;
  v16 = [MLCOptimizerDescriptor alloc];
  LODWORD(v17) = 1.0;
  LODWORD(v18) = 1.0;
  *(float *)&v19 = learningRate;
  *(float *)&v20 = gradientRescale;
  *(float *)&v21 = gradientClipMax;
  *(float *)&v22 = gradientClipMin;
  *(float *)&v23 = regularizationScale;
  return -[MLCOptimizerDescriptor initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:](v16, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:", v13, v10, 0, v19, v20, v21, v22, v23, v17, v18);
}

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClippingType:(MLCGradientClippingType)gradientClippingType gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin maximumClippingNorm:(float)maximumClippingNorm customGlobalNorm:(float)customGlobalNorm regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v13;
  uint64_t v18;
  _BOOL8 v19;
  MLCOptimizerDescriptor *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v13 = *(_QWORD *)&regularizationType;
  v18 = *(_QWORD *)&gradientClippingType;
  v19 = appliesGradientClipping;
  v22 = [MLCOptimizerDescriptor alloc];
  *(float *)&v23 = learningRate;
  *(float *)&v24 = gradientRescale;
  *(float *)&v25 = gradientClipMax;
  *(float *)&v26 = gradientClipMin;
  *(float *)&v27 = regularizationScale;
  *(float *)&v28 = maximumClippingNorm;
  *(float *)&v29 = customGlobalNorm;
  return -[MLCOptimizerDescriptor initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:](v22, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:", v19, v13, v18, v23, v24, v25, v26, v27, v28, v29);
}

- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12
{
  MLCOptimizerDescriptor *result;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MLCOptimizerDescriptor;
  result = -[MLCOptimizerDescriptor init](&v23, sel_init);
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a9;
    result->_regularizationType = a8;
    result->_gradientClippingType = a10;
    result->_maximumClippingNorm = a11;
    result->_customGlobalNorm = a12;
  }
  return result;
}

- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9
{
  MLCOptimizerDescriptor *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MLCOptimizerDescriptor;
  result = -[MLCOptimizerDescriptor init](&v17, sel_init);
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationType = a8;
    result->_regularizationScale = a9;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  _BOOL4 v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  double v20;
  float v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCOptimizerDescriptor learningRate](self, "learningRate");
  v7 = v6;
  -[MLCOptimizerDescriptor gradientRescale](self, "gradientRescale");
  v9 = v8;
  v10 = -[MLCOptimizerDescriptor appliesGradientClipping](self, "appliesGradientClipping");
  -[MLCOptimizerDescriptor gradientClipMax](self, "gradientClipMax");
  v12 = v11;
  -[MLCOptimizerDescriptor gradientClipMin](self, "gradientClipMin");
  v14 = v13;
  -[MLCOptimizerDescriptor regularizationScale](self, "regularizationScale");
  v16 = v15;
  v17 = -[MLCOptimizerDescriptor regularizationType](self, "regularizationType");
  v18 = -[MLCOptimizerDescriptor gradientClippingType](self, "gradientClippingType");
  -[MLCOptimizerDescriptor maximumClippingNorm](self, "maximumClippingNorm");
  v20 = v19;
  -[MLCOptimizerDescriptor customGlobalNorm](self, "customGlobalNorm");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { learningRate=%f : gradientRescale=%f : applyGradientClipping=%d : gradientClipMax=%f : gradientClipMin=%f : regularizationScale=%f : regularizationType=%d : gradientClippingType=%d : maximumClippingNorm=%f : customGlobalNorm=%f}"), v5, *(_QWORD *)&v7, *(_QWORD *)&v9, v10, *(_QWORD *)&v12, *(_QWORD *)&v14, *(_QWORD *)&v16, v17, v18, *(_QWORD *)&v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  int v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  BOOL v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "learningRate");
    v7 = v6;
    -[MLCOptimizerDescriptor learningRate](self, "learningRate");
    if (v7 != v8)
      goto LABEL_13;
    objc_msgSend(v5, "gradientRescale");
    v10 = v9;
    -[MLCOptimizerDescriptor gradientRescale](self, "gradientRescale");
    if (v10 != v11)
      goto LABEL_13;
    v12 = objc_msgSend(v5, "appliesGradientClipping");
    if (v12 != -[MLCOptimizerDescriptor appliesGradientClipping](self, "appliesGradientClipping"))
      goto LABEL_13;
    objc_msgSend(v5, "gradientClipMax");
    v14 = v13;
    -[MLCOptimizerDescriptor gradientClipMax](self, "gradientClipMax");
    if (v14 != v15)
      goto LABEL_13;
    objc_msgSend(v5, "gradientClipMin");
    v17 = v16;
    -[MLCOptimizerDescriptor gradientClipMin](self, "gradientClipMin");
    if (v17 != v18)
      goto LABEL_13;
    objc_msgSend(v5, "regularizationScale");
    v20 = v19;
    -[MLCOptimizerDescriptor regularizationScale](self, "regularizationScale");
    if (v20 != v21)
      goto LABEL_13;
    v22 = objc_msgSend(v5, "regularizationType");
    if (v22 == -[MLCOptimizerDescriptor regularizationType](self, "regularizationType")
      && (v23 = objc_msgSend(v5, "gradientClippingType"),
          v23 == -[MLCOptimizerDescriptor gradientClippingType](self, "gradientClippingType"))
      && (objc_msgSend(v5, "maximumClippingNorm"),
          v25 = v24,
          -[MLCOptimizerDescriptor maximumClippingNorm](self, "maximumClippingNorm"),
          v25 == v26))
    {
      objc_msgSend(v5, "customGlobalNorm");
      v28 = v27;
      -[MLCOptimizerDescriptor customGlobalNorm](self, "customGlobalNorm");
      v30 = v28 == v29;
    }
    else
    {
LABEL_13:
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  unint64_t v26;

  v26 = 0;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor learningRate](self, "learningRate");
  objc_msgSend(v3, "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v25, "hash");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor gradientRescale](self, "gradientRescale");
  objc_msgSend(v4, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hash");
  -[MLCOptimizerDescriptor appliesGradientClipping](self, "appliesGradientClipping");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor gradientClipMax](self, "gradientClipMax");
  objc_msgSend(v5, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor gradientClipMin](self, "gradientClipMin");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor regularizationScale](self, "regularizationScale");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");
  -[MLCOptimizerDescriptor regularizationType](self, "regularizationType");
  -[MLCOptimizerDescriptor gradientClippingType](self, "gradientClippingType");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor maximumClippingNorm](self, "maximumClippingNorm");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hash");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCOptimizerDescriptor customGlobalNorm](self, "customGlobalNorm");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hash");
  hashCombine_4(&v26, v14, v15, v16, v17, v18, v19, v20, v23);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _BOOL8 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCOptimizerDescriptor learningRate](self, "learningRate");
  v6 = v5;
  -[MLCOptimizerDescriptor gradientRescale](self, "gradientRescale");
  v8 = v7;
  v9 = -[MLCOptimizerDescriptor appliesGradientClipping](self, "appliesGradientClipping");
  -[MLCOptimizerDescriptor gradientClipMax](self, "gradientClipMax");
  v11 = v10;
  -[MLCOptimizerDescriptor gradientClipMin](self, "gradientClipMin");
  v13 = v12;
  v14 = -[MLCOptimizerDescriptor regularizationType](self, "regularizationType");
  -[MLCOptimizerDescriptor regularizationScale](self, "regularizationScale");
  v16 = v15;
  v17 = -[MLCOptimizerDescriptor gradientClippingType](self, "gradientClippingType");
  -[MLCOptimizerDescriptor maximumClippingNorm](self, "maximumClippingNorm");
  v19 = v18;
  -[MLCOptimizerDescriptor customGlobalNorm](self, "customGlobalNorm");
  LODWORD(v21) = v20;
  LODWORD(v22) = v6;
  LODWORD(v23) = v8;
  LODWORD(v24) = v11;
  LODWORD(v25) = v13;
  LODWORD(v26) = v16;
  LODWORD(v27) = v19;
  return (id)objc_msgSend(v4, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:gradientClippingType:maximumClippingNorm:customGlobalNorm:", v9, v14, v17, v22, v23, v24, v25, v26, v27, v21);
}

- (float)learningRate
{
  return self->_learningRate;
}

- (float)gradientRescale
{
  return self->_gradientRescale;
}

- (BOOL)appliesGradientClipping
{
  return self->_appliesGradientClipping;
}

- (float)gradientClipMax
{
  return self->_gradientClipMax;
}

- (float)gradientClipMin
{
  return self->_gradientClipMin;
}

- (float)regularizationScale
{
  return self->_regularizationScale;
}

- (MLCRegularizationType)regularizationType
{
  return self->_regularizationType;
}

- (MLCGradientClippingType)gradientClippingType
{
  return self->_gradientClippingType;
}

- (float)maximumClippingNorm
{
  return self->_maximumClippingNorm;
}

- (float)customGlobalNorm
{
  return self->_customGlobalNorm;
}

@end
