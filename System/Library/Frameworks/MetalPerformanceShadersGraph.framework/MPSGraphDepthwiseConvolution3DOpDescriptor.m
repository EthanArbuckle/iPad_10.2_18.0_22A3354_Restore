@implementation MPSGraphDepthwiseConvolution3DOpDescriptor

+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithStrides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  MPSGraphDepthwiseConvolution3DOpDescriptor *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v9 = strides;
  v10 = dilationRates;
  v11 = paddingValues;
  v12 = objc_alloc_init(MPSGraphDepthwiseConvolution3DOpDescriptor);
  -[NSArray count](v9, "count");
  if (-[NSArray count](v9, "count") != 3 && MTLReportFailureTypeEnabled())
  {
    v17 = -[NSArray count](v9, "count");
    MTLReportFailure();
  }
  -[NSArray count](v10, "count", v17);
  if (-[NSArray count](v10, "count") != 3 && MTLReportFailureTypeEnabled())
  {
    v18 = -[NSArray count](v10, "count");
    MTLReportFailure();
  }
  -[NSArray count](v11, "count", v18);
  if (-[NSArray count](v11, "count") != 6 && MTLReportFailureTypeEnabled())
  {
    v19 = -[NSArray count](v11, "count");
    MTLReportFailure();
  }
  if (paddingStyle > MPSGraphPaddingStyleONNX_SAME_LOWER || paddingStyle == MPSGraphPaddingStyleExplicitOffset)
  {
    if (MTLReportFailureTypeEnabled())
    {
      v19 = "MPSGraphPaddingStyleExplicit, MPSGraphPaddingStyleONNX_SAME_LOWER, MPSGraphPaddingStyleTF_SAME or MPSGraphPa"
            "ddingStyleTF_VALID for MPSGraphDepthwiseConvolution.";
      MTLReportFailure();
    }
  }
  v13 = (void *)-[NSArray copy](v9, "copy", v19);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor setStrides:](v12, "setStrides:", v13);

  v14 = (void *)-[NSArray copy](v10, "copy");
  -[MPSGraphDepthwiseConvolution3DOpDescriptor setDilationRates:](v12, "setDilationRates:", v14);

  v15 = (void *)-[NSArray copy](v11, "copy");
  -[MPSGraphDepthwiseConvolution3DOpDescriptor setPaddingValues:](v12, "setPaddingValues:", v15);

  -[MPSGraphDepthwiseConvolution3DOpDescriptor setPaddingStyle:](v12, "setPaddingStyle:", paddingStyle);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor setChannelDimensionIndex:](v12, "setChannelDimensionIndex:", -4);

  return v12;
}

+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  return +[MPSGraphDepthwiseConvolution3DOpDescriptor descriptorWithStrides:dilationRates:paddingValues:paddingStyle:](MPSGraphDepthwiseConvolution3DOpDescriptor, "descriptorWithStrides:dilationRates:paddingValues:paddingStyle:", &unk_1E0E9B110, &unk_1E0E9B128, &unk_1E0E9B140, paddingStyle);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphDepthwiseConvolution3DOpDescriptor *v4;
  uint64_t v5;
  NSArray *dilationRates;
  uint64_t v7;
  NSArray *paddingValues;
  uint64_t v9;
  NSArray *strides;

  v4 = [MPSGraphDepthwiseConvolution3DOpDescriptor alloc];
  v5 = -[NSArray copy](self->_dilationRates, "copy");
  dilationRates = v4->_dilationRates;
  v4->_dilationRates = (NSArray *)v5;

  v4->_paddingStyle = self->_paddingStyle;
  v7 = -[NSArray copy](self->_paddingValues, "copy");
  paddingValues = v4->_paddingValues;
  v4->_paddingValues = (NSArray *)v7;

  v9 = -[NSArray copy](self->_strides, "copy");
  strides = v4->_strides;
  v4->_strides = (NSArray *)v9;

  v4->_channelDimensionIndex = self->_channelDimensionIndex;
  return v4;
}

- (NSArray)strides
{
  return self->_strides;
}

- (void)setStrides:(NSArray *)strides
{
  objc_setProperty_nonatomic_copy(self, a2, strides, 8);
}

- (NSArray)dilationRates
{
  return self->_dilationRates;
}

- (void)setDilationRates:(NSArray *)dilationRates
{
  objc_setProperty_nonatomic_copy(self, a2, dilationRates, 16);
}

- (NSArray)paddingValues
{
  return self->_paddingValues;
}

- (void)setPaddingValues:(NSArray *)paddingValues
{
  objc_setProperty_nonatomic_copy(self, a2, paddingValues, 24);
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (NSInteger)channelDimensionIndex
{
  return self->_channelDimensionIndex;
}

- (void)setChannelDimensionIndex:(NSInteger)channelDimensionIndex
{
  self->_channelDimensionIndex = channelDimensionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingValues, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);
  objc_storeStrong((id *)&self->_strides, 0);
}

@end
