@implementation MLCTensor

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_4);
}

void __23__MLCTensor_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  gNextTensorID = 0;
  gLock = 0;
  +[_MLCGaussianRandomGenerator zeroMeanGaussianRandomGenerator](_MLCGaussianRandomGenerator, "zeroMeanGaussianRandomGenerator");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gGaussian;
  gGaussian = v0;

}

- (id)copyAndReplaceData:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  MLCTensor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MLCTensor *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    -[MLCTensor descriptor](self, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");

    if (v7 != v9)
    {
      +[MLCLog framework](MLCLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "length");
        -[MLCTensor descriptor](self, "descriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v19;
        v24 = 2048;
        v25 = v20;
        v26 = 2048;
        v27 = objc_msgSend(v21, "tensorAllocationSizeInBytes");
        _os_log_error_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%@: Data size mismatch! data.length=%lu : tensorAllocationSizeInBytes=%lu", (uint8_t *)&v22, 0x20u);

      }
    }
  }
  v11 = self;
  -[MLCTensor descriptor](v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor parentLayers](v11, "parentLayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor childLayers](v11, "childLayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor device](v11, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor deviceMemory](v11, "deviceMemory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MLCTensor initWithTensorDescriptor:tensorData:parentLayers:childLayers:device:deviceMemory:](v11, "initWithTensorDescriptor:tensorData:parentLayers:childLayers:device:deviceMemory:", v12, v6, v13, v14, v15, v16);

  return v17;
}

- (MLCTensor)initWithTensorDescriptor:(id)a3 tensorData:(id)a4 parentLayers:(id)a5 childLayers:(id)a6 device:(id)a7 deviceMemory:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MLCTensor *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *label;
  void *v25;
  uint64_t v26;
  NSMutableArray *broadcastabledeviceMemory;
  MLCTensor *sharedMemoryTensor;
  MLCLayer *intermediateSumLayer;
  uint64_t v30;
  NSArray *optimizerData;
  uint64_t v32;
  NSArray *optimizerDeviceData;
  id deviceDataSources;
  id obj;
  id v37;
  id v38;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  obj = a5;
  v17 = a5;
  v37 = a6;
  v18 = a6;
  v38 = a7;
  v19 = a7;
  v20 = a8;
  v39.receiver = self;
  v39.super_class = (Class)MLCTensor;
  v21 = -[MLCTensor init](&v39, sel_init);
  if (v21)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gLock);
    v22 = gNextTensorID++;
    v21->_tensorID = v22;
    os_unfair_lock_unlock((os_unfair_lock_t)&gLock);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data%lu"), v21->_tensorID);
    v23 = objc_claimAutoreleasedReturnValue();
    label = v21->_label;
    v21->_label = (NSString *)v23;

    objc_storeStrong((id *)&v21->_descriptor, a3);
    objc_storeStrong((id *)&v21->_data, a4);
    objc_storeStrong((id *)&v21->_parentLayers, obj);
    objc_storeStrong((id *)&v21->_childLayers, v37);
    objc_storeStrong((id *)&v21->_device, v38);
    objc_storeStrong((id *)&v21->_deviceMemory, a8);
    v21->_deviceIndex = 0;
    v25 = (void *)MEMORY[0x1E0C9AA60];
    v26 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    broadcastabledeviceMemory = v21->_broadcastabledeviceMemory;
    v21->_broadcastabledeviceMemory = (NSMutableArray *)v26;

    v21->_readCount = 0;
    sharedMemoryTensor = v21->_sharedMemoryTensor;
    v21->_sharedMemoryTensor = 0;

    v21->_concatOffset = 0;
    v21->_concatDimension = 0;
    v21->_splitOffset = 0;
    v21->_splitDimension = 1;
    v21->_multiDeviceReductionType = 0;
    v21->_interleave = 1;
    v21->_rootSourceGradientTensorIndexStart = 0;
    v21->_rootSourceGradientTensorCount = 0;
    intermediateSumLayer = v21->_intermediateSumLayer;
    v21->_rootSourceGradientTensorIndex = 0;
    v21->_intermediateSumLayer = 0;

    v30 = objc_msgSend(v25, "mutableCopy");
    optimizerData = v21->_optimizerData;
    v21->_optimizerData = (NSArray *)v30;

    v32 = objc_msgSend(v25, "mutableCopy");
    optimizerDeviceData = v21->_optimizerDeviceData;
    v21->_optimizerDeviceData = (NSArray *)v32;

    deviceDataSources = v21->_deviceDataSources;
    v21->_deviceDataSources = 0;

    v21->_skipWritingToDevice = 0;
    v21->_computeFlags = 0;
  }

  return v21;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor
{
  MLCTensorDescriptor *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = tensorDescriptor;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  v10 = (void *)objc_msgSend(v5, "initWithTensorDescriptor:tensorData:parentLayers:childLayers:device:deviceMemory:", v4, 0, v7, v8, 0, v9);

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor data:(MLCTensorData *)data
{
  MLCTensorData *v6;
  MLCTensorDescriptor *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = data;
  v7 = tensorDescriptor;
  v8 = objc_alloc((Class)a1);
  -[MLCTensorData data](v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  v14 = (void *)objc_msgSend(v8, "initWithTensorDescriptor:tensorData:parentLayers:childLayers:device:deviceMemory:", v7, v9, v11, v12, 0, v13);

  return (MLCTensor *)v14;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor fillWithData:(NSNumber *)fillData
{
  MLCTensorDescriptor *v6;
  void *v7;
  void *v8;

  v6 = tensorDescriptor;
  v7 = (void *)objc_msgSend(a1, "newDataForTensorDescriptor:fillWithData:", v6, fillData);
  objc_msgSend(a1, "tensorWithDescriptor:data:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v4;
  MLCTensorDescriptor *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&randomInitializerType;
  v6 = tensorDescriptor;
  v7 = (void *)objc_msgSend(a1, "newRandomDataForWeightTensorDescriptor:randomInitializerType:", v6, v4);
  objc_msgSend(a1, "tensorWithDescriptor:data:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape
{
  void *v4;
  void *v5;

  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v5;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&randomInitializerType;
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:randomInitializerType:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v7;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType dataType:(MLCDataType)dataType
{
  uint64_t v5;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&randomInitializerType;
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, *(_QWORD *)&dataType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:randomInitializerType:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType
{
  void *v5;
  void *v6;

  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, *(_QWORD *)&dataType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v6;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape fillWithData:(NSNumber *)fillData dataType:(MLCDataType)dataType
{
  uint64_t v5;
  NSNumber *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&dataType;
  v8 = fillData;
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:fillWithData:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape data:(MLCTensorData *)data dataType:(MLCDataType)dataType
{
  uint64_t v5;
  MLCTensorData *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&dataType;
  v8 = data;
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", shape, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:data:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize
{
  void *v7;
  void *v8;

  +[MLCTensorDescriptor descriptorWithWidth:height:featureChannelCount:batchSize:](MLCTensorDescriptor, "descriptorWithWidth:height:featureChannelCount:batchSize:", width, height, featureChannelCount, batchSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize fillWithData:(float)fillData dataType:(MLCDataType)dataType
{
  void *v10;
  double v11;
  void *v12;
  void *v13;

  +[MLCTensorDescriptor descriptorWithWidth:height:featureChannelCount:batchSize:dataType:](MLCTensorDescriptor, "descriptorWithWidth:height:featureChannelCount:batchSize:dataType:", width, height, featureChannelCount, batchSize, *(_QWORD *)&dataType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = fillData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:fillWithData:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v13;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v7;
  void *v9;
  void *v10;

  v7 = *(_QWORD *)&randomInitializerType;
  +[MLCTensorDescriptor descriptorWithWidth:height:featureChannelCount:batchSize:](MLCTensorDescriptor, "descriptorWithWidth:height:featureChannelCount:batchSize:", width, height, featureChannelCount, batchSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:randomInitializerType:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  MLCTensorData *v12;
  void *v13;
  void *v14;

  v12 = data;
  +[MLCTensorDescriptor descriptorWithWidth:height:featureChannelCount:batchSize:](MLCTensorDescriptor, "descriptorWithWidth:height:featureChannelCount:batchSize:", width, height, featureChannelCount, batchSize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:data:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v14;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data dataType:(MLCDataType)dataType
{
  uint64_t v8;
  MLCTensorData *v14;
  void *v15;
  void *v16;

  v8 = *(_QWORD *)&dataType;
  v14 = data;
  +[MLCTensorDescriptor descriptorWithWidth:height:featureChannelCount:batchSize:dataType:](MLCTensorDescriptor, "descriptorWithWidth:height:featureChannelCount:batchSize:dataType:", width, height, featureChannelCount, batchSize, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tensorWithDescriptor:data:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v16;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", batchSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (batchSize)
  {
    v10 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sequenceLength);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v11, v10);

      ++v10;
    }
    while (batchSize != v10);
  }
  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(a1, "tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:", v12, 1, featureChannelCount, batchSize, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v13;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v6;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&randomInitializerType;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", batchSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (batchSize)
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sequenceLength);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v13, v12);

      ++v12;
    }
    while (batchSize != v12);
  }
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(a1, "tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:", v14, 1, featureChannelCount, batchSize, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v15;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  MLCTensorData *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = data;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", batchSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (batchSize)
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sequenceLength);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v13, v12);

      ++v12;
    }
    while (batchSize != v12);
  }
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(a1, "tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:data:", v14, 1, featureChannelCount, batchSize, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v15;
}

+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v7;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];

  v7 = *(_QWORD *)&randomInitializerType;
  v25[3] = *MEMORY[0x1E0C80C00];
  v13 = sequenceLengths;
  v14 = v13;
  if (sortedSequences)
  {
    -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", batchSize);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", featureChannelCount);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v20, v14, 1, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend((id)objc_opt_class(), "newRandomDataForWeightTensorDescriptor:randomInitializerType:", v21, v7);
    objc_msgSend(a1, "tensorWithDescriptor:data:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[MLCTensor tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:].cold.1(a2);
    v23 = 0;
  }

  return (MLCTensor *)v23;
}

+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  NSArray *v13;
  MLCTensorData *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v13 = sequenceLengths;
  v14 = data;
  if (sortedSequences)
  {
    -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", batchSize);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", featureChannelCount);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v20, v13, 1, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(a1, "tensorWithDescriptor:data:", v21, v14);
    else
      objc_msgSend(a1, "tensorWithDescriptor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[MLCTensor tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:].cold.1(a2);
    v22 = 0;
  }

  return (MLCTensor *)v22;
}

- (BOOL)dataContainsScalarWhere:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLCTensor data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCTensor descriptor](self, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "dimensionCount");
    v8 = (char *)&v13[-1] - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, 8 * v7);
    v17 = 0;
    v18 = (id *)&v17;
    v19 = 0x3042000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22[0] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__MLCTensor_dataContainsScalarWhere___block_invoke;
    v13[3] = &unk_1E9820DA0;
    v13[4] = self;
    v16 = v8;
    v14 = v4;
    v15 = &v17;
    v9 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D8263EA0](v13);
    objc_storeWeak(v18 + 5, v9);
    v10 = v9[2](v9, 0);

    _Block_object_dispose(&v17, 8);
    objc_destroyWeak(v22);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __37__MLCTensor_dataContainsScalarWhere___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t (**WeakRetained)(id, uint64_t);
  int v28;

  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dimensionCount") - 1;

  if (v5 == a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "bytes");

    if (a2)
    {
      v8 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "descriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stride");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8) * objc_msgSend(v11, "unsignedIntegerValue");

        ++v8;
      }
      while (a2 != v8);
    }
    v12 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "descriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      v17 = v12 < v16;
      if (v12 >= v16)
        break;
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stride");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = (*(uint64_t (**)(uint64_t, unint64_t))(v18 + 16))(v18, v7 + objc_msgSend(v21, "unsignedIntegerValue") * v12);

      ++v12;
    }
    while ((v18 & 1) == 0);
  }
  else
  {
    v22 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "descriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shape");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      v17 = v22 < v26;
      if (v22 >= v26)
        break;
      *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * a2) = v22;
      WeakRetained = (uint64_t (**)(id, uint64_t))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                  + 8)
                                                                                      + 40));
      v28 = WeakRetained[2](WeakRetained, a2 + 1);

      ++v22;
    }
    while (!v28);
  }
  return v17;
}

- (BOOL)hasValidNumerics
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[MLCTensor descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFloatingPoint") & 1) == 0)
  {

    return 1;
  }
  -[MLCTensor data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[MLCTensor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataType");

  if (v6 == 3)
    v7 = &__block_literal_global_10;
  else
    v7 = &__block_literal_global_11;
  return !-[MLCTensor dataContainsScalarWhere:](self, "dataContainsScalarWhere:", v7);
}

BOOL __29__MLCTensor_hasValidNumerics__block_invoke(uint64_t a1, _WORD *a2)
{
  return (*a2 & 0x7FFFu) > 0x7BFF;
}

BOOL __29__MLCTensor_hasValidNumerics__block_invoke_2(uint64_t a1, _DWORD *a2)
{
  return (*a2 & 0x7FFFFFFFu) > 0x7F7FFFFF;
}

- (BOOL)copyDataFromDeviceMemoryToBytes:(void *)bytes length:(NSUInteger)length synchronizeWithDevice:(BOOL)synchronizeWithDevice
{
  _BOOL4 v5;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSUInteger v14;
  NSObject *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;

  v5 = synchronizeWithDevice;
  -[MLCTensor device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:].cold.1(a2);
    goto LABEL_11;
  }
  -[MLCTensor deviceMemory](self, "deviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:].cold.2(a2);
LABEL_11:

    return 0;
  }
  -[MLCTensor descriptor](self, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "tensorAllocationSizeInBytes");

  if (v14 > length)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:].cold.3();

    return 0;
  }
  if (v5)
  {
    -[MLCTensor device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "computeEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[MLCTensor device](self, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "computeEngine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "synchronizeTensorOnHost:", self);

      if (!v23)
        return 0;
    }
  }
  -[MLCTensor device](self, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "computeEngine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "readTensor:targetBuffer:", self, bytes);

  return 1;
}

- (BOOL)bindAndWriteData:(MLCTensorData *)data toDevice:(MLCDevice *)device
{
  MLCTensorData *v6;
  MLCDevice *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  MLCDeviceType v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  const void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = data;
  v7 = device;
  v8 = -[MLCTensorData length](v6, "length");
  -[MLCTensor descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tensorAllocationSizeInBytes");

  if (v8 >= v10)
  {
    v11 = -[MLCDevice type](v7, "type");
    v12 = -[MLCTensor isLayerParameter](self, "isLayerParameter");
    if (v11)
    {
      if (!v12)
      {
        -[MLCTensorData data](v6, "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTensor setData:](self, "setData:", v25);

        v26 = -[MLCTensor calculateBatchSizeToUse](self, "calculateBatchSizeToUse");
        -[MLCDevice computeEngine](v7, "computeEngine");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "needToAllocateDeviceMemoryForTensor:", self);

        if (v28)
          -[MLCTensor allocateDeviceMemory:](self, "allocateDeviceMemory:", v7);
        -[MLCTensor writeTensorDataToAllDevices:batchSize:](self, "writeTensorDataToAllDevices:batchSize:", v7, v26);
        goto LABEL_21;
      }
      -[MLCTensor data](self, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTensorData data](v6, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
        goto LABEL_19;
    }
    else
    {
      if (!v12)
      {
        -[MLCTensorData data](v6, "data");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTensor setData:](self, "setData:", v29);

        -[MLCTensor data](self, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTensor deviceMemory](self, "deviceMemory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:atIndexedSubscript:", v30, 0);

LABEL_20:
LABEL_21:
        -[MLCTensor setDevice:](self, "setDevice:", v7);
        goto LABEL_22;
      }
      -[MLCTensor data](self, "data");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_17;
      v17 = (void *)v16;
      -[MLCTensor data](self, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTensorData data](v6, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == v19)
      {
LABEL_17:
        -[MLCTensorData data](v6, "data");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        -[MLCTensor setData:](self, "setData:", v20);
        goto LABEL_18;
      }
    }
    -[MLCTensor data](self, "data");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (void *)objc_msgSend(v20, "bytes");
    -[MLCTensorData data](v6, "data");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const void *)objc_msgSend(v22, "bytes");
    -[MLCTensor data](self, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    memcpy(v21, v23, objc_msgSend(v24, "length"));

LABEL_18:
LABEL_19:
    -[MLCDevice computeEngine](v7, "computeEngine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "reloadParameterDataFromHostToDeviceMemoryForTensor:", self);
    goto LABEL_20;
  }
  +[MLCLog framework](MLCLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:].cold.3();

LABEL_22:
  return v8 >= v10;
}

- (BOOL)synchronizeData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  size_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;

  -[MLCTensor device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[MLCTensor deviceMemory](self, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 1;
  -[MLCTensor device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computeEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getHostPointerIfUnifiedDeviceMemory:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLCTensor setData:](self, "setData:", v8);
  }
  else
  {
    -[MLCTensor data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[MLCTensor descriptor](self, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "tensorAllocationSizeInBytes");

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL), v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTensor setData:](self, "setData:", v12);

      v8 = 0;
    }
  }
  -[MLCTensor device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "computeEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0
    && (-[MLCTensor device](self, "device"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "computeEngine"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "synchronizeTensorOnHost:", self),
        v17,
        v16,
        !v18))
  {
    v9 = 0;
  }
  else
  {
    -[MLCTensor device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "computeEngine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTensor data](self, "data");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "readTensor:targetBuffer:", self, objc_msgSend(v21, "bytes"));

    v9 = 1;
  }

  return v9;
}

- (BOOL)synchronizeOptimizerData
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[MLCTensor device](self, "device");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[MLCTensor optimizerDeviceData](self, "optimizerDeviceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MLCTensor deviceMemory](self, "deviceMemory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        if (!-[MLCTensor isLayerParameter](self, "isLayerParameter"))
        {
          -[MLCTensor device](self, "device");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "computeEngine");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "synchronizeOptimizerUpdatesForTensor:", self);

          -[MLCTensor device](self, "device");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "computeEngine");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "commitAndWaitForCompletion:", 0);

          -[MLCTensor device](self, "device");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "computeEngine");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "convertUpdatesToTensorDataForTensorParameters:", self);
LABEL_12:

          return 1;
        }
        -[MLCTensor childLayers](self, "childLayers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v11 = 0;
          while (1)
          {
            -[MLCTensor childLayers](self, "childLayers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v13, "isTrainable"))
              break;

            ++v11;
            -[MLCTensor childLayers](self, "childLayers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v11 >= v15)
              return 1;
          }
          -[MLCTensor device](self, "device");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "computeEngine");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "synchronizeUpdatesForLayer:", v13);

          -[MLCTensor device](self, "device");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "computeEngine");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "commitAndWaitForCompletion:", 0);

          -[MLCTensor device](self, "device");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "computeEngine");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "convertUpdatesToTensorDataForLayer:", v13);

          goto LABEL_12;
        }
      }
    }
  }
  return 1;
}

- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData
{
  NSArray *v6;

  v6 = deviceData;
  -[MLCTensor setOptimizerData:](self, "setOptimizerData:", data);
  if (v6)
    -[MLCTensor setOptimizerDeviceData:](self, "setOptimizerDeviceData:", v6);

  return 1;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor deviceMemory](self, "deviceMemory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { label=%@ : tensorDescriptor=%@ : tensorData=%@ : deviceMemory=%@ }"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)doesShapeMatchWithTensor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v28;

  v4 = a3;
  -[MLCTensor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v28 = v4;
  objc_msgSend(v4, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v7 == v10)
  {
    -[MLCTensor descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      do
      {
        -[MLCTensor descriptor](self, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shape");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntegerValue");
        objc_msgSend(v28, "descriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shape");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        v23 = v18 == v22;
        if (v18 != v22)
          break;
        ++v14;
        -[MLCTensor descriptor](self, "descriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shape");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

      }
      while (v14 < v26);
    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (unint64_t)calculateBatchSizeToUse
{
  return -[MLCTensor calculateBatchSizeToUse:](self, "calculateBatchSizeToUse:", 0);
}

- (unint64_t)calculateBatchSizeToUse:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;

  -[MLCTensor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
    return 1;
  -[MLCTensor descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 >= a3)
    v13 = a3;
  else
    v13 = v12;
  if (a3)
    return v13;
  else
    return v12;
}

- (void)allocateDeviceMemory:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "type"))
  {
    objc_msgSend(v6, "computeEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocateDeviceMemoryForTensor:", self);
  }
  else
  {
    -[MLCTensor deviceMemory](self, "deviceMemory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTensor data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)deallocateDeviceMemory:(id)a3
{
  id v4;

  objc_msgSend(a3, "computeEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deallocateDeviceMemoryForTensor:", self);

}

- (void)writeTensorDataToAllDevices:(id)a3
{
  id v4;

  objc_msgSend(a3, "computeEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcastTensor:", self);

}

- (void)writeTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4
{
  id v6;

  objc_msgSend(a3, "computeEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "broadcastTensor:batchSize:", self, a4);

}

- (void)dispatchWriteTensorDataToAllDevices:(id)a3
{
  id v4;

  objc_msgSend(a3, "computeEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchBroadcastTensor:", self);

}

- (void)dispatchWriteTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4
{
  id v6;

  objc_msgSend(a3, "computeEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchBroadcastTensor:batchSize:", self, a4);

}

+ (BOOL)canConvertValue:(float)_S0 toDataType:(int)a4
{
  BOOL result;
  float v5;

  result = 0;
  switch(a4)
  {
    case 1:
    case 4:
      result = 1;
      break;
    case 3:
      v5 = fabsf(_S0);
      __asm
      {
        FCVT            H0, S0
        FCVT            S0, H0
      }
      _S0 = fabsf(_S0);
      __asm { FCVT            H0, S0 }
      if (v5 == INFINITY)
      {
        __asm { FCVT            S0, H0 }
        result = _S0 == INFINITY;
      }
      else
      {
        __asm { FCVT            S0, H0 }
        result = _S0 > INFINITY || _S0 < INFINITY;
      }
      break;
    case 6:
      result = _S0 <= 1.0 && _S0 >= 0.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)newDataForTensorDescriptor:(id)a3 fillWithData:(id)a4
{
  id v6;
  id v7;
  size_t v8;
  int v9;
  float *v10;
  vDSP_Length v11;
  NSObject *v12;
  int v13;
  int v19;
  float v20;
  void *v21;
  uint64_t __A;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "tensorAllocationSizeInBytes");
  v9 = objc_msgSend(v7, "dataType");
  v10 = (float *)malloc_type_malloc(v8, 0xCA03E5B1uLL);
  v11 = objc_msgSend(v7, "elementCount");

  switch(v9)
  {
    case 0:
    case 10:
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:].cold.1(a2);

      break;
    case 1:
      objc_msgSend(v6, "floatValue");
      LODWORD(__A) = v13;
      vDSP_vfill((const float *)&__A, v10, 1, v11);
      break;
    case 3:
      objc_msgSend(v6, "floatValue");
      __asm { FCVT            H0, S0 }
      LOWORD(__A) = _S0;
      WORD1(__A) = _S0;
      goto LABEL_13;
    case 4:
      v19 = objc_msgSend(v6, "BOOLValue");
      goto LABEL_10;
    case 5:
      __A = objc_msgSend(v6, "longLongValue");
      goto LABEL_15;
    case 6:
      objc_msgSend(v6, "floatValue");
      v19 = (int)(float)(v20 * 255.0);
LABEL_10:
      memset(v10, v19, v8);
      break;
    case 7:
      LODWORD(__A) = objc_msgSend(v6, "intValue");
      goto LABEL_13;
    case 8:
      LODWORD(__A) = 16843009 * objc_msgSend(v6, "intValue");
LABEL_13:
      memset_pattern4(v10, &__A, v8);
      break;
    case 9:
      LODWORD(__A) = 16843009 * objc_msgSend(v6, "intValue");
LABEL_15:
      memset_pattern8(v10, &__A, v8);
      break;
    default:
      break;
  }
  +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v10, v8, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)newRandomDataForWeightTensorDescriptor:(id)a3 randomInitializerType:(int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float *v17;
  _BOOL4 v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v28;
  double v29;
  uint32_t v30;
  double v31;
  NSObject *v32;
  float v33;
  int v34;
  NSObject *v40;
  void *v41;
  NSObject *v43;
  int *v44;
  size_t v46;
  _BYTE v47[4];
  int v48;
  _BYTE v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "fanIn");
  v7 = objc_msgSend(v5, "fanOut");
  v8 = objc_msgSend(v5, "elementCount");
  if (v6 | v7)
    goto LABEL_8;
  if ((a4 & 0xFFFFFFFE) != 2)
  {
    v7 = 0;
    v6 = 0;
LABEL_8:
    v46 = objc_msgSend(v5, "tensorAllocationSizeInBytes");
    v17 = (float *)malloc_type_malloc(v46, 0x8AECF894uLL);
    v18 = +[MLCPlatformInfo isRNGSeeded](MLCPlatformInfo, "isRNGSeeded");
    if (v18)
      srand48(+[MLCPlatformInfo randomSeed](MLCPlatformInfo, "randomSeed"));
    v19 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
    arc4random_buf(v19, 4 * v8);
    if (v8)
    {
      v21 = 0;
      v22 = (float)(unint64_t)(v6 + v7);
      v23 = sqrtf(6.0 / v22);
      v24 = -v23;
      v25 = 1.0 / v22;
      v26 = v23 + v23;
      v44 = &v48;
      _S13 = 0.0;
      do
      {
        switch(a4)
        {
          case 1:
            v30 = arc4random();
            if (v18)
              v31 = drand48();
            else
              v31 = (double)v30 / 4294967300.0;
            _S13 = v31;
            break;
          case 3:
            objc_msgSend((id)gGaussian, "sample");
            *(float *)&v29 = v29;
            _S13 = v25 * *(float *)&v29;
            break;
          case 2:
            if (v18)
            {
              v28 = drand48();
            }
            else
            {
              LODWORD(v20) = *((_DWORD *)v19 + v21);
              v28 = (double)v20 / 4294967300.0;
            }
            v33 = v28;
            _S13 = v24 + (float)(v33 * v26);
            break;
          default:
            +[MLCLog framework](MLCLog, "framework");
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:].cold.2((uint64_t)v49, (uint64_t)a2);

            break;
        }
        v34 = objc_msgSend(v5, "dataType", v44);
        switch(v34)
        {
          case 1:
            v17[v21] = _S13;
            break;
          case 4:
            *((_BYTE *)v17 + v21) = _S13 >= 0.5;
            break;
          case 3:
            __asm { FCVT            H0, S13 }
            *((_WORD *)v17 + v21) = _H0;
            break;
          default:
            +[MLCLog framework](MLCLog, "framework");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:].cold.1((uint64_t)v47, (uint64_t)a2);

            break;
        }
        ++v21;
      }
      while (v8 != v21);
    }
    free(v19);
    +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v17, v46, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v5, "dimensionCount") == 4)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend(v5, "shape");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 *= objc_msgSend(v12, "unsignedIntegerValue");

      ++v9;
    }
    while (v9 != 4);
    objc_msgSend(v5, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v14, "unsignedIntegerValue") * v10;

    objc_msgSend(v5, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v16, "unsignedIntegerValue") * v10;

    goto LABEL_8;
  }
  +[MLCLog framework](MLCLog, "framework");
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:].cold.3();

  v41 = 0;
LABEL_38:

  return v41;
}

- (BOOL)isTensorDataTypeInListOfDataTypes:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      -[MLCTensor descriptor](self, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "dataType");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      v10 = v7 == v9;
      if (v7 == v9)
        break;
      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)tensorBatchSize
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[MLCTensor descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = 1;
  }
  else
  {
    -[MLCTensor descriptor](self, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(float)scale bias:(NSInteger)bias
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSInteger v16;
  float v17;

  v5 = *(_QWORD *)&type;
  v17 = scale;
  v16 = bias;
  v7 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", &unk_1E9844BE8, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorData dataWithBytes:length:](MLCTensorData, "dataWithBytes:length:", &v17, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", &unk_1E9844C00, 0, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorData dataWithBytes:length:](MLCTensorData, "dataWithBytes:length:", &v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCTensor tensorByQuantizingToType:scale:bias:axis:](self, "tensorByQuantizingToType:scale:bias:axis:", v5, v10, v13, -1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return (MLCTensor *)v14;
}

- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis
{
  uint64_t v6;
  NSObject *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&type;
  if ((type - 10) > 0xFFFFFFFC)
  {
    -[MLCTensor synchronizeData](self, "synchronizeData");
    -[MLCTensor descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", v12, 0, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", malloc_type_malloc(objc_msgSend(v13, "tensorAllocationSizeInBytes"), 0x9FB04933uLL), objc_msgSend(v13, "tensorAllocationSizeInBytes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCTensor tensorByQuantizingToType:scale:bias:axis:].cold.1(a2);

    v9 = 0;
  }
  return (MLCTensor *)v9;
}

- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias
{
  int v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MLCTensor *v17;
  int v18;

  v6 = *(_QWORD *)&type;
  v18 = v5;
  v17 = scale;
  v8 = (void *)MEMORY[0x1D8263D2C](self, a2, *(_QWORD *)&type, scale, bias);
  +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", &unk_1E9844C18, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorData dataWithBytes:length:](MLCTensorData, "dataWithBytes:length:", &v18, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", &unk_1E9844C30, 0, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorData dataWithBytes:length:](MLCTensorData, "dataWithBytes:length:", &v17, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCTensor tensorByDequantizingToType:scale:bias:axis:](self, "tensorByDequantizingToType:scale:bias:axis:", v6, v11, v14, -1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return (MLCTensor *)v15;
}

- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  int v18;
  NSObject *v19;

  if (type != MLCDataTypeFloat32)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCTensor tensorByDequantizingToType:scale:bias:axis:].cold.2(a2);

    goto LABEL_10;
  }
  -[MLCTensor descriptor](self, "descriptor", *(_QWORD *)&type, scale, bias, axis);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "dataType") != 8)
  {
    -[MLCTensor descriptor](self, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "dataType") == 9)
    {

      goto LABEL_5;
    }
    -[MLCTensor descriptor](self, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "dataType");

    if (v18 == 7)
      goto LABEL_6;
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCTensor tensorByDequantizingToType:scale:bias:axis:].cold.1();

LABEL_10:
    v14 = 0;
    return (MLCTensor *)v14;
  }
LABEL_5:

LABEL_6:
  -[MLCTensor synchronizeData](self, "synchronizeData");
  -[MLCTensor descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:stride:dataType:](MLCTensorDescriptor, "descriptorWithShape:stride:dataType:", v11, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", malloc_type_malloc(objc_msgSend(v12, "tensorAllocationSizeInBytes"), 0xAED3EAD3uLL), objc_msgSend(v12, "tensorAllocationSizeInBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v14;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCTensor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor parentLayers](self, "parentLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor childLayers](self, "childLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor deviceMemory](self, "deviceMemory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithTensorDescriptor:tensorData:parentLayers:childLayers:device:deviceMemory:", v5, v6, v7, v8, v9, v10);

  -[MLCTensor device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDevice:", v12);

  objc_msgSend(v11, "setReadCount:", -[MLCTensor readCount](self, "readCount"));
  -[MLCTensor sharedMemoryTensor](self, "sharedMemoryTensor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSharedMemoryTensor:", v13);

  objc_msgSend(v11, "setConcatOffset:", -[MLCTensor concatOffset](self, "concatOffset"));
  objc_msgSend(v11, "setConcatDimension:", -[MLCTensor concatDimension](self, "concatDimension"));
  objc_msgSend(v11, "setSplitOffset:", -[MLCTensor splitOffset](self, "splitOffset"));
  objc_msgSend(v11, "setSplitDimension:", -[MLCTensor splitDimension](self, "splitDimension"));
  objc_msgSend(v11, "setMultiDeviceReductionType:", -[MLCTensor multiDeviceReductionType](self, "multiDeviceReductionType"));
  objc_msgSend(v11, "setInterleave:", -[MLCTensor interleave](self, "interleave"));
  objc_msgSend(v11, "setRootSourceGradientTensorIndex:", -[MLCTensor rootSourceGradientTensorIndex](self, "rootSourceGradientTensorIndex"));
  objc_msgSend(v11, "setRootSourceGradientTensorIndexStart:", -[MLCTensor rootSourceGradientTensorIndexStart](self, "rootSourceGradientTensorIndexStart"));
  objc_msgSend(v11, "setRootSourceGradientTensorCount:", -[MLCTensor rootSourceGradientTensorCount](self, "rootSourceGradientTensorCount"));
  -[MLCTensor intermediateSumLayer](self, "intermediateSumLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIntermediateSumLayer:", v14);

  -[MLCTensor optimizerData](self, "optimizerData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptimizerData:", v15);

  -[MLCTensor optimizerDeviceData](self, "optimizerDeviceData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptimizerDeviceData:", v16);

  -[MLCTensor deviceDataSources](self, "deviceDataSources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeviceDataSources:", v17);

  objc_msgSend(v11, "setSkipWritingToDevice:", -[MLCTensor skipWritingToDevice](self, "skipWritingToDevice"));
  objc_msgSend(v11, "setComputeFlags:", -[MLCTensor computeFlags](self, "computeFlags"));
  return v11;
}

- (NSUInteger)tensorID
{
  return self->_tensorID;
}

- (void)setTensorID:(unint64_t)a3
{
  self->_tensorID = a3;
}

- (MLCTensorDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 48);
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)optimizerData
{
  return self->_optimizerData;
}

- (void)setOptimizerData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)optimizerDeviceData
{
  return self->_optimizerDeviceData;
}

- (void)setOptimizerDeviceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableArray)parentLayers
{
  return self->_parentLayers;
}

- (void)setParentLayers:(id)a3
{
  objc_storeStrong((id *)&self->_parentLayers, a3);
}

- (NSMutableArray)childLayers
{
  return self->_childLayers;
}

- (void)setChildLayers:(id)a3
{
  objc_storeStrong((id *)&self->_childLayers, a3);
}

- (NSMutableArray)deviceMemory
{
  return self->_deviceMemory;
}

- (void)setDeviceMemory:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMemory, a3);
}

- (unint64_t)deviceIndex
{
  return self->_deviceIndex;
}

- (void)setDeviceIndex:(unint64_t)a3
{
  self->_deviceIndex = a3;
}

- (NSMutableArray)broadcastabledeviceMemory
{
  return self->_broadcastabledeviceMemory;
}

- (void)setBroadcastabledeviceMemory:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastabledeviceMemory, a3);
}

- (MLCTensor)sharedMemoryTensor
{
  return self->_sharedMemoryTensor;
}

- (void)setSharedMemoryTensor:(id)a3
{
  objc_storeStrong((id *)&self->_sharedMemoryTensor, a3);
}

- (int)multiDeviceReductionType
{
  return self->_multiDeviceReductionType;
}

- (void)setMultiDeviceReductionType:(int)a3
{
  self->_multiDeviceReductionType = a3;
}

- (unint64_t)concatOffset
{
  return self->_concatOffset;
}

- (void)setConcatOffset:(unint64_t)a3
{
  self->_concatOffset = a3;
}

- (unint64_t)concatDimension
{
  return self->_concatDimension;
}

- (void)setConcatDimension:(unint64_t)a3
{
  self->_concatDimension = a3;
}

- (unint64_t)splitOffset
{
  return self->_splitOffset;
}

- (void)setSplitOffset:(unint64_t)a3
{
  self->_splitOffset = a3;
}

- (unint64_t)splitDimension
{
  return self->_splitDimension;
}

- (void)setSplitDimension:(unint64_t)a3
{
  self->_splitDimension = a3;
}

- (unint64_t)rootSourceGradientTensorIndexStart
{
  return self->_rootSourceGradientTensorIndexStart;
}

- (void)setRootSourceGradientTensorIndexStart:(unint64_t)a3
{
  self->_rootSourceGradientTensorIndexStart = a3;
}

- (unint64_t)rootSourceGradientTensorCount
{
  return self->_rootSourceGradientTensorCount;
}

- (void)setRootSourceGradientTensorCount:(unint64_t)a3
{
  self->_rootSourceGradientTensorCount = a3;
}

- (unint64_t)rootSourceGradientTensorIndex
{
  return self->_rootSourceGradientTensorIndex;
}

- (void)setRootSourceGradientTensorIndex:(unint64_t)a3
{
  self->_rootSourceGradientTensorIndex = a3;
}

- (MLCLayer)intermediateSumLayer
{
  return self->_intermediateSumLayer;
}

- (void)setIntermediateSumLayer:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateSumLayer, a3);
}

- (unint64_t)interleave
{
  return self->_interleave;
}

- (void)setInterleave:(unint64_t)a3
{
  self->_interleave = a3;
}

- (BOOL)isLayerParameter
{
  return self->_isLayerParameter;
}

- (void)setIsLayerParameter:(BOOL)a3
{
  self->_isLayerParameter = a3;
}

- (id)deviceDataSources
{
  return self->_deviceDataSources;
}

- (void)setDeviceDataSources:(id)a3
{
  objc_storeStrong(&self->_deviceDataSources, a3);
}

- (BOOL)skipWritingToDevice
{
  return self->_skipWritingToDevice;
}

- (void)setSkipWritingToDevice:(BOOL)a3
{
  self->_skipWritingToDevice = a3;
}

- (int)computeFlags
{
  return self->_computeFlags;
}

- (void)setComputeFlags:(int)a3
{
  self->_computeFlags = a3;
}

- (unint64_t)readCount
{
  return self->_readCount;
}

- (void)setReadCount:(unint64_t)a3
{
  self->_readCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceDataSources, 0);
  objc_storeStrong((id *)&self->_intermediateSumLayer, 0);
  objc_storeStrong((id *)&self->_sharedMemoryTensor, 0);
  objc_storeStrong((id *)&self->_broadcastabledeviceMemory, 0);
  objc_storeStrong((id *)&self->_deviceMemory, 0);
  objc_storeStrong((id *)&self->_childLayers, 0);
  objc_storeStrong((id *)&self->_parentLayers, 0);
  objc_storeStrong((id *)&self->_optimizerDeviceData, 0);
  objc_storeStrong((id *)&self->_optimizerData, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)tensorWithSequenceLengths:(const char *)a1 sortedSequences:featureChannelCount:batchSize:randomInitializerType:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unsorted sequences are not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)copyDataFromDeviceMemoryToBytes:(const char *)a1 length:synchronizeWithDevice:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: No device assoicated with tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)copyDataFromDeviceMemoryToBytes:(const char *)a1 length:synchronizeWithDevice:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: No device memory allocated for tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:.cold.3()
{
  void *v0;
  SEL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tensorAllocationSizeInBytes");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v4, v5, "%@: length must be >= tensor.descriptor.tensorAllocationSizeInBytes (%lu)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_1();
}

+ (void)newRandomDataForWeightTensorDescriptor:(uint64_t)a1 randomInitializerType:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (const char *)OUTLINED_FUNCTION_10_2(a1, a2);
  NSStringFromSelector(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1D4999000, v6, v7, "%@: Unsupported data type.");

  OUTLINED_FUNCTION_11_1();
}

+ (void)newRandomDataForWeightTensorDescriptor:(uint64_t)a1 randomInitializerType:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (const char *)OUTLINED_FUNCTION_10_2(a1, a2);
  NSStringFromSelector(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1D4999000, v6, v7, "%@: Unsupported random number generator");

  OUTLINED_FUNCTION_11_1();
}

+ (void)newRandomDataForWeightTensorDescriptor:randomInitializerType:.cold.3()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: unexpected number of dimensions(%lu).", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)tensorByQuantizingToType:(const char *)a1 scale:bias:axis:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: invalid data type (%d) specified for quantization.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)tensorByDequantizingToType:scale:bias:axis:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataType");
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v4, v5, "%@: source data type (%d) specified for de-quantization must be a quantized data type.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4_1();
}

- (void)tensorByDequantizingToType:(const char *)a1 scale:bias:axis:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: invalid data type (%d) specified for de-quantization, must be MLCDataTypeFloat32", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

@end
