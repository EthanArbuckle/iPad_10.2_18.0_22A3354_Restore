@implementation MLCConvolutionDescriptor

- (MLCConvolutionDescriptor)init
{
  uint64_t v3;

  LODWORD(v3) = 0;
  return -[MLCConvolutionDescriptor initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:](self, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, v3, 0, 0);
}

+ (MLCConvolutionDescriptor)descriptorWithType:(MLCConvolutionType)convolutionType kernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;

  v15 = paddingSizes;
  v16 = dilationRates;
  v17 = strides;
  v18 = kernelSizes;
  v44 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v22;
  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v40, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "unsignedIntegerValue");
  v27 = v26;
  if (v15)
  {
    -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
    v37 = v19;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    v30 = objc_msgSend(v28, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
    v36 = v15;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v30;
    v21 = v29;
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", convolutionType, v42, v41, inputFeatureChannelCount, outputFeatureChannelCount, groupCount, v39, v23, v24, v27, v34, v35, objc_msgSend(v31, "unsignedIntegerValue"));

    v15 = v36;
    v19 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", convolutionType, v42, v41, inputFeatureChannelCount, outputFeatureChannelCount, groupCount, v39, v23, v24, v26, v34, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount
{
  uint64_t v7;

  LODWORD(v7) = 0;
  return (MLCConvolutionDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, kernelWidth, kernelHeight, inputFeatureChannelCount, outputFeatureChannelCount, 1, 1, 1, 1, 1, v7, 0, 0);
}

+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  MLCPaddingPolicy v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;

  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  v17 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v21;
  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  v23 = v22;
  if (v14)
  {
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
    v24 = paddingPolicy;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v17;
    v26 = v20;
    v27 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v36 = v19;
    v28 = v14;
    v29 = v18;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v27;
    v20 = v26;
    LODWORD(v33) = v24;
    v31 = (void *)objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v23, 1, 1, v33, v34, objc_msgSend(v30, "unsignedIntegerValue"));

    v18 = v29;
    v14 = v28;
    v19 = v36;

  }
  else
  {
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)objc_msgSend(v17, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v22, 1, 1, v33, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v31;
}

+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  NSUInteger v35;
  NSArray *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;

  v17 = paddingSizes;
  v18 = dilationRates;
  v19 = strides;
  v20 = kernelSizes;
  v43 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v22, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v44, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v23;
  v24 = objc_msgSend(v23, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v39, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "unsignedIntegerValue");
  v28 = v27;
  if (v17)
  {
    -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
    v37 = v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = inputFeatureChannelCount;
    v30 = objc_msgSend(v29, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
    v36 = v17;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v41, v40, v35, outputFeatureChannelCount, groupCount, v38, v24, v25, v28, v34, v30, objc_msgSend(v31, "unsignedIntegerValue"));

    v17 = v36;
    v21 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v41, v40, inputFeatureChannelCount, outputFeatureChannelCount, groupCount, v38, v24, v25, v27, v34, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount
{
  uint64_t v7;

  LODWORD(v7) = 0;
  return (MLCConvolutionDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, kernelWidth, kernelHeight, inputFeatureChannelCount, outputFeatureChannelCount, 1, 1, 1, 1, 1, v7, 0, 0);
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  MLCPaddingPolicy v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;

  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  v17 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v21;
  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  v23 = v22;
  if (v14)
  {
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
    v24 = paddingPolicy;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v17;
    v26 = v20;
    v27 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v36 = v19;
    v28 = v14;
    v29 = v18;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v27;
    v20 = v26;
    LODWORD(v33) = v24;
    v31 = (void *)objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v23, 1, 1, v33, v34, objc_msgSend(v30, "unsignedIntegerValue"));

    v18 = v29;
    v14 = v28;
    v19 = v36;

  }
  else
  {
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)objc_msgSend(v17, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v22, 1, 1, v33, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v31;
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  NSUInteger v35;
  NSArray *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;

  v17 = paddingSizes;
  v18 = dilationRates;
  v19 = strides;
  v20 = kernelSizes;
  v43 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v22, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v44, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v23;
  v24 = objc_msgSend(v23, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v39, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "unsignedIntegerValue");
  v28 = v27;
  if (v17)
  {
    -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
    v37 = v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = inputFeatureChannelCount;
    v30 = objc_msgSend(v29, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
    v36 = v17;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v41, v40, v35, outputFeatureChannelCount, groupCount, v38, v24, v25, v28, v34, v30, objc_msgSend(v31, "unsignedIntegerValue"));

    v17 = v36;
    v21 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v41, v40, inputFeatureChannelCount, outputFeatureChannelCount, groupCount, v38, v24, v25, v27, v34, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier
{
  uint64_t v7;

  LODWORD(v7) = 0;
  return (MLCConvolutionDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, kernelWidth, kernelHeight, inputFeatureChannelCount, channelMultiplier * inputFeatureChannelCount, 1, 1, 1, 1, 1, v7, 0, 0);
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  id v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSUInteger v27;
  MLCPaddingPolicy v28;
  uint64_t v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  v17 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v19, "unsignedIntegerValue");
  v20 = channelMultiplier * inputFeatureChannelCount;
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  v24 = v23;
  if (v14)
  {
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
    v41 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v21;
    v26 = v19;
    v27 = inputFeatureChannelCount;
    v28 = paddingPolicy;
    v29 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v39 = v22;
    v30 = v20;
    v31 = v17;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntegerValue");
    LODWORD(v38) = v28;
    v34 = v27;
    v19 = v26;
    v35 = v30;
    v22 = v39;
    v21 = v40;
    v36 = (void *)objc_msgSend(v31, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, v44, v43, v34, v35, 1, v42, v24, 1, 1, v38, v29, v33);

    v18 = v41;
  }
  else
  {
    LODWORD(v38) = paddingPolicy;
    v36 = (void *)objc_msgSend(v17, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, v44, v43, inputFeatureChannelCount, v20, 1, v42, v23, 1, 1, v38, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v36;
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSUInteger v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSUInteger v46;

  v15 = paddingSizes;
  v16 = dilationRates;
  v17 = strides;
  v18 = kernelSizes;
  v44 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v20, "unsignedIntegerValue");
  v46 = inputFeatureChannelCount;
  v41 = channelMultiplier * inputFeatureChannelCount;
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v22;
  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "unsignedIntegerValue");
  v28 = v27;
  if (v15)
  {
    -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
    v38 = v19;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
    v37 = v24;
    v31 = v21;
    v32 = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = paddingPolicy;
    v34 = (void *)objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, v42, v40, v46, v41, 1, v39, v23, v25, v28, v36, v30, objc_msgSend(v33, "unsignedIntegerValue"));

    v20 = v32;
    v21 = v31;
    v24 = v37;

    v19 = v38;
  }
  else
  {
    LODWORD(v36) = paddingPolicy;
    v34 = (void *)objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, v42, v40, v46, v41, 1, v39, v23, v25, v27, v36, 0, 0);
  }

  return (MLCConvolutionDescriptor *)v34;
}

- (MLCConvolutionDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7 groupCount:(unint64_t)a8 strideInX:(unint64_t)a9 strideInY:(unint64_t)a10 dilationRateInX:(unint64_t)a11 dilationRateInY:(unint64_t)a12 paddingPolicy:(int)a13 paddingSizeInX:(unint64_t)a14 paddingSizeInY:(unint64_t)a15
{
  MLCConvolutionDescriptor *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MLCConvolutionDescriptor;
  result = -[MLCConvolutionDescriptor init](&v22, sel_init);
  if (result)
  {
    result->_kernelWidth = a4;
    result->_kernelHeight = a5;
    result->_inputFeatureChannelCount = a6;
    result->_outputFeatureChannelCount = a7;
    result->_strideInX = a9;
    result->_strideInY = a10;
    result->_dilationRateInX = a11;
    result->_dilationRateInY = a12;
    result->_convolutionType = a3;
    result->_paddingPolicy = a13;
    result->_groupCount = a8;
    result->_paddingSizeInX = a14;
    result->_paddingSizeInY = a15;
  }
  return result;
}

- (BOOL)usesDepthwiseConvolution
{
  return -[MLCConvolutionDescriptor convolutionType](self, "convolutionType") == MLCConvolutionTypeDepthwise;
}

- (BOOL)isConvolutionTranspose
{
  return -[MLCConvolutionDescriptor convolutionType](self, "convolutionType") == MLCConvolutionTypeTransposed;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: { kernelWidth=%lu : kernelHeight=%lu : inputFeatureChannelCount=%lu : outputFeatureChannelCount=%lu : groupCount = %lu : usesDepthWiseConvolution = %lu : strideInX=%lu : strideInY=%lu : dilationRateInX=%lu :  dilationRateInY=%lu : paddingPolicy=%d : paddingSizeInX=%lu : paddingSizeInY = %lu}"), v4, -[MLCConvolutionDescriptor kernelWidth](self, "kernelWidth"), -[MLCConvolutionDescriptor kernelHeight](self, "kernelHeight"), -[MLCConvolutionDescriptor inputFeatureChannelCount](self, "inputFeatureChannelCount"), -[MLCConvolutionDescriptor outputFeatureChannelCount](self, "outputFeatureChannelCount"), -[MLCConvolutionDescriptor groupCount](self, "groupCount"), -[MLCConvolutionDescriptor usesDepthwiseConvolution](self, "usesDepthwiseConvolution"), -[MLCConvolutionDescriptor strideInX](self, "strideInX"), -[MLCConvolutionDescriptor strideInY](self, "strideInY"), -[MLCConvolutionDescriptor dilationRateInX](self, "dilationRateInX"), -[MLCConvolutionDescriptor dilationRateInY](self, "dilationRateInY"), -[MLCConvolutionDescriptor paddingPolicy](self, "paddingPolicy"), -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "kernelWidth");
    if (v6 != -[MLCConvolutionDescriptor kernelWidth](self, "kernelWidth"))
      goto LABEL_15;
    v7 = objc_msgSend(v5, "kernelHeight");
    if (v7 != -[MLCConvolutionDescriptor kernelHeight](self, "kernelHeight"))
      goto LABEL_15;
    v8 = objc_msgSend(v5, "inputFeatureChannelCount");
    if (v8 != -[MLCConvolutionDescriptor inputFeatureChannelCount](self, "inputFeatureChannelCount"))
      goto LABEL_15;
    v9 = objc_msgSend(v5, "outputFeatureChannelCount");
    if (v9 != -[MLCConvolutionDescriptor outputFeatureChannelCount](self, "outputFeatureChannelCount"))
      goto LABEL_15;
    v10 = objc_msgSend(v5, "strideInX");
    if (v10 != -[MLCConvolutionDescriptor strideInX](self, "strideInX"))
      goto LABEL_15;
    v11 = objc_msgSend(v5, "strideInY");
    if (v11 != -[MLCConvolutionDescriptor strideInY](self, "strideInY"))
      goto LABEL_15;
    v12 = objc_msgSend(v5, "dilationRateInX");
    if (v12 == -[MLCConvolutionDescriptor dilationRateInX](self, "dilationRateInX")
      && (v13 = objc_msgSend(v5, "dilationRateInY"),
          v13 == -[MLCConvolutionDescriptor dilationRateInY](self, "dilationRateInY"))
      && (v14 = objc_msgSend(v5, "groupCount"), v14 == -[MLCConvolutionDescriptor groupCount](self, "groupCount"))
      && (v15 = objc_msgSend(v5, "paddingPolicy"),
          v15 == -[MLCConvolutionDescriptor paddingPolicy](self, "paddingPolicy"))
      && (v16 = objc_msgSend(v5, "paddingSizeInX"),
          v16 == -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX"))
      && (v17 = objc_msgSend(v5, "paddingSizeInY"),
          v17 == -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY"))
      && (v18 = objc_msgSend(v5, "isConvolutionTranspose"),
          v18 == -[MLCConvolutionDescriptor isConvolutionTranspose](self, "isConvolutionTranspose")))
    {
      v21 = objc_msgSend(v5, "usesDepthwiseConvolution");
      v19 = v21 ^ -[MLCConvolutionDescriptor usesDepthwiseConvolution](self, "usesDepthwiseConvolution") ^ 1;
    }
    else
    {
LABEL_15:
      LOBYTE(v19) = 0;
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  unint64_t v12;

  v12 = 0;
  v11 = -[MLCConvolutionDescriptor kernelWidth](self, "kernelWidth");
  -[MLCConvolutionDescriptor kernelHeight](self, "kernelHeight");
  -[MLCConvolutionDescriptor inputFeatureChannelCount](self, "inputFeatureChannelCount");
  -[MLCConvolutionDescriptor outputFeatureChannelCount](self, "outputFeatureChannelCount");
  -[MLCConvolutionDescriptor strideInX](self, "strideInX");
  -[MLCConvolutionDescriptor strideInY](self, "strideInY");
  -[MLCConvolutionDescriptor dilationRateInX](self, "dilationRateInX");
  -[MLCConvolutionDescriptor dilationRateInY](self, "dilationRateInY");
  -[MLCConvolutionDescriptor groupCount](self, "groupCount");
  -[MLCConvolutionDescriptor paddingPolicy](self, "paddingPolicy");
  -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX");
  -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY");
  -[MLCConvolutionDescriptor isConvolutionTranspose](self, "isConvolutionTranspose");
  -[MLCConvolutionDescriptor usesDepthwiseConvolution](self, "usesDepthwiseConvolution");
  hashCombine_8(&v12, v3, v4, v5, v6, v7, v8, v9, v11);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  MLCConvolutionType v15;
  void *v16;

  v16 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v15 = -[MLCConvolutionDescriptor convolutionType](self, "convolutionType");
  v14 = -[MLCConvolutionDescriptor kernelWidth](self, "kernelWidth");
  v13 = -[MLCConvolutionDescriptor kernelHeight](self, "kernelHeight");
  v4 = -[MLCConvolutionDescriptor inputFeatureChannelCount](self, "inputFeatureChannelCount");
  v5 = -[MLCConvolutionDescriptor outputFeatureChannelCount](self, "outputFeatureChannelCount");
  v6 = -[MLCConvolutionDescriptor groupCount](self, "groupCount");
  v7 = -[MLCConvolutionDescriptor strideInX](self, "strideInX");
  v8 = -[MLCConvolutionDescriptor strideInY](self, "strideInY");
  v9 = -[MLCConvolutionDescriptor dilationRateInX](self, "dilationRateInX");
  v10 = -[MLCConvolutionDescriptor dilationRateInY](self, "dilationRateInY");
  LODWORD(v12) = -[MLCConvolutionDescriptor paddingPolicy](self, "paddingPolicy");
  return (id)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v12, -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY"));
}

- (MLCConvolutionType)convolutionType
{
  return self->_convolutionType;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (NSUInteger)inputFeatureChannelCount
{
  return self->_inputFeatureChannelCount;
}

- (NSUInteger)outputFeatureChannelCount
{
  return self->_outputFeatureChannelCount;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (NSUInteger)groupCount
{
  return self->_groupCount;
}

- (MLCPaddingPolicy)paddingPolicy
{
  return self->_paddingPolicy;
}

- (void)setPaddingPolicy:(int)a3
{
  self->_paddingPolicy = a3;
}

- (NSUInteger)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (void)setPaddingSizeInX:(unint64_t)a3
{
  self->_paddingSizeInX = a3;
}

- (NSUInteger)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (void)setPaddingSizeInY:(unint64_t)a3
{
  self->_paddingSizeInY = a3;
}

@end
