@implementation MPSGraphPooling4DOpDescriptor

+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  MPSGraphPooling4DOpDescriptor *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;

  v11 = kernelSizes;
  v12 = strides;
  v13 = dilationRates;
  v14 = paddingValues;
  v15 = objc_alloc_init(MPSGraphPooling4DOpDescriptor);
  -[NSArray count](v11, "count");
  if (-[NSArray count](v11, "count") != 4 && MTLReportFailureTypeEnabled())
  {
    v25 = -[NSArray count](v11, "count");
    MTLReportFailure();
  }
  -[NSArray count](v12, "count", v25);
  if (-[NSArray count](v12, "count") != 4 && MTLReportFailureTypeEnabled())
  {
    v26 = -[NSArray count](v12, "count");
    MTLReportFailure();
  }
  -[NSArray count](v13, "count", v26);
  if (-[NSArray count](v13, "count") != 4 && MTLReportFailureTypeEnabled())
  {
    v27 = -[NSArray count](v13, "count");
    MTLReportFailure();
  }
  -[NSArray count](v14, "count", v27);
  if (-[NSArray count](v14, "count") != 8 && MTLReportFailureTypeEnabled())
  {
    v28 = -[NSArray count](v14, "count");
    MTLReportFailure();
  }
  if (paddingStyle > MPSGraphPaddingStyleONNX_SAME_LOWER || paddingStyle == MPSGraphPaddingStyleExplicitOffset)
  {
    if (MTLReportFailureTypeEnabled())
    {
      v28 = "MPSGraphPaddingStyleExplicit, MPSGraphPaddingStyleONNX_SAME_LOWER, MPSGraphPaddingStyleTF_SAME or MPSGraphPa"
            "ddingStyleTF_VALID for MPSGraphPooling Ops.";
      MTLReportFailure();
    }
  }
  v16 = -[NSArray copy](v11, "copy", v28);
  v17 = v15->_kernelSizes;
  v15->_kernelSizes = (NSArray *)v16;

  v18 = -[NSArray copy](v12, "copy");
  v19 = v15->_strides;
  v15->_strides = (NSArray *)v18;

  v20 = -[NSArray copy](v13, "copy");
  v21 = v15->_dilationRates;
  v15->_dilationRates = (NSArray *)v20;

  v22 = -[NSArray copy](v14, "copy");
  v23 = v15->_paddingValues;
  v15->_paddingValues = (NSArray *)v22;

  v15->_paddingStyle = paddingStyle;
  v15->_ceilMode = 0;
  v15->_includeZeroPadToAverage = 0;
  v15->_returnIndicesMode = 0;
  v15->_returnIndicesDataType = 536870944;

  return v15;
}

+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  +[MPSGraphPooling4DOpDescriptor descriptorWithKernelSizes:strides:dilationRates:paddingValues:paddingStyle:](MPSGraphPooling4DOpDescriptor, "descriptorWithKernelSizes:strides:dilationRates:paddingValues:paddingStyle:", kernelSizes, &unk_1E0E9B680, &unk_1E0E9B698, &unk_1E0E9B6B0, paddingStyle);
  return (MPSGraphPooling4DOpDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphPooling4DOpDescriptor *v4;
  uint64_t v5;
  NSArray *kernelSizes;
  uint64_t v7;
  NSArray *dilationRates;
  uint64_t v9;
  NSArray *paddingValues;
  uint64_t v11;
  NSArray *strides;

  v4 = [MPSGraphPooling4DOpDescriptor alloc];
  v5 = -[NSArray copy](self->_kernelSizes, "copy");
  kernelSizes = v4->_kernelSizes;
  v4->_kernelSizes = (NSArray *)v5;

  v7 = -[NSArray copy](self->_dilationRates, "copy");
  dilationRates = v4->_dilationRates;
  v4->_dilationRates = (NSArray *)v7;

  v4->_paddingStyle = self->_paddingStyle;
  v9 = -[NSArray copy](self->_paddingValues, "copy");
  paddingValues = v4->_paddingValues;
  v4->_paddingValues = (NSArray *)v9;

  v11 = -[NSArray copy](self->_strides, "copy");
  strides = v4->_strides;
  v4->_strides = (NSArray *)v11;

  v4->_ceilMode = self->_ceilMode;
  v4->_includeZeroPadToAverage = self->_includeZeroPadToAverage;
  v4->_returnIndicesMode = self->_returnIndicesMode;
  v4->_returnIndicesDataType = self->_returnIndicesDataType;
  return v4;
}

- (NSArray)kernelSizes
{
  return self->_kernelSizes;
}

- (void)setKernelSizes:(NSArray *)kernelSizes
{
  objc_setProperty_nonatomic_copy(self, a2, kernelSizes, 16);
}

- (NSArray)strides
{
  return self->_strides;
}

- (void)setStrides:(NSArray *)strides
{
  objc_setProperty_nonatomic_copy(self, a2, strides, 24);
}

- (NSArray)dilationRates
{
  return self->_dilationRates;
}

- (void)setDilationRates:(NSArray *)dilationRates
{
  objc_setProperty_nonatomic_copy(self, a2, dilationRates, 32);
}

- (NSArray)paddingValues
{
  return self->_paddingValues;
}

- (void)setPaddingValues:(NSArray *)paddingValues
{
  objc_setProperty_nonatomic_copy(self, a2, paddingValues, 40);
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (BOOL)ceilMode
{
  return self->_ceilMode;
}

- (void)setCeilMode:(BOOL)ceilMode
{
  self->_ceilMode = ceilMode;
}

- (BOOL)includeZeroPadToAverage
{
  return self->_includeZeroPadToAverage;
}

- (void)setIncludeZeroPadToAverage:(BOOL)includeZeroPadToAverage
{
  self->_includeZeroPadToAverage = includeZeroPadToAverage;
}

- (MPSGraphPoolingReturnIndicesMode)returnIndicesMode
{
  return self->_returnIndicesMode;
}

- (void)setReturnIndicesMode:(MPSGraphPoolingReturnIndicesMode)returnIndicesMode
{
  self->_returnIndicesMode = returnIndicesMode;
}

- (MPSDataType)returnIndicesDataType
{
  return self->_returnIndicesDataType;
}

- (void)setReturnIndicesDataType:(MPSDataType)returnIndicesDataType
{
  self->_returnIndicesDataType = returnIndicesDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingValues, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_kernelSizes, 0);
}

@end
