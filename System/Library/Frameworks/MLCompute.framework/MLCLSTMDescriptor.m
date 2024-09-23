@implementation MLCLSTMDescriptor

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount
{
  double v5;

  LODWORD(v5) = 0;
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:isBidirectional:dropout:", inputSize, hiddenSize, layerCount, 1, 0, v5);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases isBidirectional:(BOOL)isBidirectional dropout:(float)dropout
{
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:dropout:", inputSize, hiddenSize, layerCount, usesBiases, 1, isBidirectional);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional dropout:(float)dropout
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:", inputSize, hiddenSize, layerCount, usesBiases, batchFirst, isBidirectional, v10);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout
{
  uint64_t v11;

  LOBYTE(v11) = returnsSequences;
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", inputSize, hiddenSize, layerCount, usesBiases, batchFirst, isBidirectional, v11, 0);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout resultMode:(MLCLSTMResultMode)resultMode
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v18;
  double v19;
  uint64_t v21;

  v12 = isBidirectional;
  v13 = batchFirst;
  v14 = usesBiases;
  v18 = objc_alloc((Class)a1);
  LOBYTE(v21) = returnsSequences;
  *(float *)&v19 = dropout;
  return (MLCLSTMDescriptor *)(id)objc_msgSend(v18, "initWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", inputSize, hiddenSize, layerCount, v14, v13, v12, v19, v21, resultMode);
}

- (MLCLSTMDescriptor)initWithInputSize:(unint64_t)a3 hiddenSize:(unint64_t)a4 layerCount:(unint64_t)a5 usesBiases:(BOOL)a6 batchFirst:(BOOL)a7 isBidirectional:(BOOL)a8 returnsSequences:(BOOL)a9 dropout:(float)a10 resultMode:(unint64_t)a11
{
  MLCLSTMDescriptor *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MLCLSTMDescriptor;
  result = -[MLCLSTMDescriptor init](&v19, sel_init);
  if (result)
  {
    result->_inputSize = a3;
    result->_hiddenSize = a4;
    result->_usesBiases = a6;
    result->_batchFirst = a7;
    result->_isBidirectional = a8;
    result->_returnsSequences = a9;
    result->_dropout = a10;
    result->_layerCount = a5;
    result->_resultMode = a11;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  float v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLSTMDescriptor inputSize](self, "inputSize");
  v7 = -[MLCLSTMDescriptor hiddenSize](self, "hiddenSize");
  v8 = -[MLCLSTMDescriptor layerCount](self, "layerCount");
  v9 = -[MLCLSTMDescriptor usesBiases](self, "usesBiases");
  v10 = -[MLCLSTMDescriptor batchFirst](self, "batchFirst");
  v11 = -[MLCLSTMDescriptor isBidirectional](self, "isBidirectional");
  -[MLCLSTMDescriptor dropout](self, "dropout");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { inputSize=%lu : hiddenSize=%lu : numberOfLayers=%lu : bias=%d : batchFirst=%d : biDirectional=%d : dropout=%f }"), v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "inputSize");
    if (v6 != -[MLCLSTMDescriptor inputSize](self, "inputSize"))
      goto LABEL_12;
    v7 = objc_msgSend(v5, "hiddenSize");
    if (v7 != -[MLCLSTMDescriptor hiddenSize](self, "hiddenSize"))
      goto LABEL_12;
    v8 = objc_msgSend(v5, "layerCount");
    if (v8 != -[MLCLSTMDescriptor layerCount](self, "layerCount"))
      goto LABEL_12;
    v9 = objc_msgSend(v5, "usesBiases");
    if (v9 == -[MLCLSTMDescriptor usesBiases](self, "usesBiases")
      && (v10 = objc_msgSend(v5, "batchFirst"), v10 == -[MLCLSTMDescriptor batchFirst](self, "batchFirst"))
      && (v11 = objc_msgSend(v5, "isBidirectional"), v11 == -[MLCLSTMDescriptor isBidirectional](self, "isBidirectional"))&& (v12 = objc_msgSend(v5, "returnsSequences"), v12 == -[MLCLSTMDescriptor returnsSequences](self, "returnsSequences"))&& (objc_msgSend(v5, "dropout"), v14 = v13, -[MLCLSTMDescriptor dropout](self, "dropout"), v14 == v15))
    {
      v16 = objc_msgSend(v5, "resultMode");
      v17 = v16 == -[MLCLSTMDescriptor resultMode](self, "resultMode");
    }
    else
    {
LABEL_12:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
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
  v3 = -[MLCLSTMDescriptor inputSize](self, "inputSize");
  -[MLCLSTMDescriptor hiddenSize](self, "hiddenSize");
  -[MLCLSTMDescriptor layerCount](self, "layerCount");
  -[MLCLSTMDescriptor usesBiases](self, "usesBiases");
  -[MLCLSTMDescriptor batchFirst](self, "batchFirst");
  -[MLCLSTMDescriptor isBidirectional](self, "isBidirectional");
  -[MLCLSTMDescriptor returnsSequences](self, "returnsSequences");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCLSTMDescriptor dropout](self, "dropout");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[MLCLSTMDescriptor resultMode](self, "resultMode");
  hashCombine_2(&v14, v6, v7, v8, v9, v10, v11, v12, v3);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  int v13;
  MLCLSTMResultMode v14;
  double v15;
  uint64_t v17;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCLSTMDescriptor inputSize](self, "inputSize");
  v6 = -[MLCLSTMDescriptor hiddenSize](self, "hiddenSize");
  v7 = -[MLCLSTMDescriptor layerCount](self, "layerCount");
  v8 = -[MLCLSTMDescriptor usesBiases](self, "usesBiases");
  v9 = -[MLCLSTMDescriptor batchFirst](self, "batchFirst");
  v10 = -[MLCLSTMDescriptor isBidirectional](self, "isBidirectional");
  v11 = -[MLCLSTMDescriptor returnsSequences](self, "returnsSequences");
  -[MLCLSTMDescriptor dropout](self, "dropout");
  v13 = v12;
  v14 = -[MLCLSTMDescriptor resultMode](self, "resultMode");
  LOBYTE(v17) = v11;
  LODWORD(v15) = v13;
  return (id)objc_msgSend(v4, "initWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", v5, v6, v7, v8, v9, v10, v15, v17, v14);
}

- (NSUInteger)inputSize
{
  return self->_inputSize;
}

- (NSUInteger)hiddenSize
{
  return self->_hiddenSize;
}

- (NSUInteger)layerCount
{
  return self->_layerCount;
}

- (BOOL)usesBiases
{
  return self->_usesBiases;
}

- (BOOL)batchFirst
{
  return self->_batchFirst;
}

- (BOOL)isBidirectional
{
  return self->_isBidirectional;
}

- (BOOL)returnsSequences
{
  return self->_returnsSequences;
}

- (float)dropout
{
  return self->_dropout;
}

- (MLCLSTMResultMode)resultMode
{
  return self->_resultMode;
}

@end
