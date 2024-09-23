@implementation MLCMultiheadAttentionDescriptor

+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension keyDimension:(NSUInteger)keyDimension valueDimension:(NSUInteger)valueDimension headCount:(NSUInteger)headCount dropout:(float)dropout hasBiases:(BOOL)hasBiases hasAttentionBiases:(BOOL)hasAttentionBiases addsZeroAttention:(BOOL)addsZeroAttention
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v17;
  double v18;
  uint64_t v20;

  v10 = hasAttentionBiases;
  v11 = hasBiases;
  v17 = objc_alloc((Class)a1);
  LOBYTE(v20) = addsZeroAttention;
  *(float *)&v18 = dropout;
  return (MLCMultiheadAttentionDescriptor *)(id)objc_msgSend(v17, "initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:", modelDimension, keyDimension, valueDimension, headCount, v11, v10, v18, v20);
}

+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension headCount:(NSUInteger)headCount
{
  id v6;
  double v7;
  uint64_t v9;

  v6 = objc_alloc((Class)a1);
  LOBYTE(v9) = 0;
  LODWORD(v7) = 0;
  return (MLCMultiheadAttentionDescriptor *)(id)objc_msgSend(v6, "initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:", modelDimension, modelDimension, modelDimension, headCount, 1, 0, v7, v9);
}

- (MLCMultiheadAttentionDescriptor)initWithModelDimension:(unint64_t)a3 keyDimension:(unint64_t)a4 valueDimension:(unint64_t)a5 headCount:(unint64_t)a6 dropout:(float)a7 hasBias:(BOOL)a8 hasAttentionBias:(BOOL)a9 addsZeroAttention:(BOOL)a10
{
  MLCMultiheadAttentionDescriptor *v12;
  NSObject *v14;
  MLCMultiheadAttentionDescriptor *v17;
  char *v23;
  objc_super v24;

  v12 = self;
  if (a7 < 0.0 || a7 > 1.0)
  {
    +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a8, a9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionDescriptor initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:].cold.1(a2);
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  if (!a6 || a3 % a6)
  {
    +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionDescriptor initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:].cold.2(a2);
    goto LABEL_11;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLCMultiheadAttentionDescriptor;
  v23 = -[MLCMultiheadAttentionDescriptor init](&v24, sel_init);
  if (v23)
  {
    *((_QWORD *)v23 + 3) = a3;
    *((_QWORD *)v23 + 4) = a4;
    *((_QWORD *)v23 + 5) = a5;
    *((_QWORD *)v23 + 6) = a6;
    *((float *)v23 + 4) = a7;
    v23[8] = a8;
    v23[9] = a9;
    v23[10] = a10;
    *(_WORD *)(v23 + 11) = 0;
  }
  v12 = v23;
  v17 = v12;
LABEL_12:

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  float v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCMultiheadAttentionDescriptor modelDimension](self, "modelDimension");
  v7 = -[MLCMultiheadAttentionDescriptor keyDimension](self, "keyDimension");
  v8 = -[MLCMultiheadAttentionDescriptor valueDimension](self, "valueDimension");
  v9 = -[MLCMultiheadAttentionDescriptor headCount](self, "headCount");
  -[MLCMultiheadAttentionDescriptor dropout](self, "dropout");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { modelDimension=%lu : keyDimension=%lu : valueDimension=%lu : headCount=%lu : dropout=%f : hasBias=%d : hasAttentionBias=%d : addsZeroAttention=%d }"), v5, v6, v7, v8, v9, v10, -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases"), -[MLCMultiheadAttentionDescriptor hasAttentionBiases](self, "hasAttentionBiases"), -[MLCMultiheadAttentionDescriptor addsZeroAttention](self, "addsZeroAttention"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  int v12;
  int v13;
  int v14;
  int v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "modelDimension");
    if (v6 == -[MLCMultiheadAttentionDescriptor modelDimension](self, "modelDimension")
      && (v7 = objc_msgSend(v5, "keyDimension"),
          v7 == -[MLCMultiheadAttentionDescriptor keyDimension](self, "keyDimension"))
      && (v8 = objc_msgSend(v5, "headCount"), v8 == -[MLCMultiheadAttentionDescriptor headCount](self, "headCount"))
      && (objc_msgSend(v5, "dropout"), v10 = v9, -[MLCMultiheadAttentionDescriptor dropout](self, "dropout"), v10 == v11)
      && (v12 = objc_msgSend(v5, "hasBiases"), v12 == -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases"))
      && (v13 = objc_msgSend(v5, "hasAttentionBiases"),
          v13 == -[MLCMultiheadAttentionDescriptor hasAttentionBiases](self, "hasAttentionBiases")))
    {
      v16 = objc_msgSend(v5, "addsZeroAttention");
      v14 = v16 ^ -[MLCMultiheadAttentionDescriptor addsZeroAttention](self, "addsZeroAttention") ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v14 = 0;
  v3 = -[MLCMultiheadAttentionDescriptor modelDimension](self, "modelDimension");
  -[MLCMultiheadAttentionDescriptor keyDimension](self, "keyDimension");
  -[MLCMultiheadAttentionDescriptor valueDimension](self, "valueDimension");
  -[MLCMultiheadAttentionDescriptor headCount](self, "headCount");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCMultiheadAttentionDescriptor dropout](self, "dropout");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases");
  -[MLCMultiheadAttentionDescriptor hasAttentionBiases](self, "hasAttentionBiases");
  -[MLCMultiheadAttentionDescriptor addsZeroAttention](self, "addsZeroAttention");
  hashCombine_1(&v14, v6, v7, v8, v9, v10, v11, v12, v3);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  int v9;
  int v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v13;
  uint64_t v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCMultiheadAttentionDescriptor modelDimension](self, "modelDimension");
  v6 = -[MLCMultiheadAttentionDescriptor keyDimension](self, "keyDimension");
  v7 = -[MLCMultiheadAttentionDescriptor valueDimension](self, "valueDimension");
  v8 = -[MLCMultiheadAttentionDescriptor headCount](self, "headCount");
  -[MLCMultiheadAttentionDescriptor dropout](self, "dropout");
  v10 = v9;
  v11 = -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases");
  v12 = -[MLCMultiheadAttentionDescriptor hasAttentionBiases](self, "hasAttentionBiases");
  LOBYTE(v15) = -[MLCMultiheadAttentionDescriptor addsZeroAttention](self, "addsZeroAttention");
  LODWORD(v13) = v10;
  return (id)objc_msgSend(v4, "initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:", v5, v6, v7, v8, v11, v12, v13, v15);
}

- (NSUInteger)modelDimension
{
  return self->_modelDimension;
}

- (NSUInteger)keyDimension
{
  return self->_keyDimension;
}

- (NSUInteger)valueDimension
{
  return self->_valueDimension;
}

- (NSUInteger)headCount
{
  return self->_headCount;
}

- (float)dropout
{
  return self->_dropout;
}

- (BOOL)hasBiases
{
  return self->_hasBiases;
}

- (BOOL)hasAttentionBiases
{
  return self->_hasAttentionBiases;
}

- (BOOL)addsZeroAttention
{
  return self->_addsZeroAttention;
}

- (BOOL)hasKeyPaddingMask
{
  return self->_hasKeyPaddingMask;
}

- (void)setHasKeyPaddingMask:(BOOL)a3
{
  self->_hasKeyPaddingMask = a3;
}

- (BOOL)hasAttentionMask
{
  return self->_hasAttentionMask;
}

- (void)setHasAttentionMask:(BOOL)a3
{
  self->_hasAttentionMask = a3;
}

- (void)initWithModelDimension:(const char *)a1 keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@ droupout is a probability between zero and one", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithModelDimension:(const char *)a1 keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@ model dimension must be divisible by number of heads", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
