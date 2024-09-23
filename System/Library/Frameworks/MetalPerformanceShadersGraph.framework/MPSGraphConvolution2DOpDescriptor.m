@implementation MPSGraphConvolution2DOpDescriptor

+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  MPSGraphConvolution2DOpDescriptor *v20;

  if (dataLayout >= MPSGraphTensorNamedDataLayoutOIHW && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if ((weightsLayout & 0xFFFFFFFFFFFFFFFELL) != 2 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v20 = objc_alloc_init(MPSGraphConvolution2DOpDescriptor);
  -[MPSGraphConvolution2DOpDescriptor setStrideInX:](v20, "setStrideInX:", strideInX);
  -[MPSGraphConvolution2DOpDescriptor setStrideInY:](v20, "setStrideInY:", strideInY);
  -[MPSGraphConvolution2DOpDescriptor setDilationRateInX:](v20, "setDilationRateInX:", dilationRateInX);
  -[MPSGraphConvolution2DOpDescriptor setDilationRateInY:](v20, "setDilationRateInY:", dilationRateInY);
  -[MPSGraphConvolution2DOpDescriptor setGroups:](v20, "setGroups:", groups);
  -[MPSGraphConvolution2DOpDescriptor setPaddingLeft:](v20, "setPaddingLeft:", paddingLeft);
  -[MPSGraphConvolution2DOpDescriptor setPaddingRight:](v20, "setPaddingRight:", paddingRight);
  -[MPSGraphConvolution2DOpDescriptor setPaddingTop:](v20, "setPaddingTop:", paddingTop);
  -[MPSGraphConvolution2DOpDescriptor setPaddingBottom:](v20, "setPaddingBottom:", paddingBottom);
  -[MPSGraphConvolution2DOpDescriptor setPaddingStyle:](v20, "setPaddingStyle:", paddingStyle);
  -[MPSGraphConvolution2DOpDescriptor setDataLayout:](v20, "setDataLayout:", dataLayout);
  -[MPSGraphConvolution2DOpDescriptor setWeightsLayout:](v20, "setWeightsLayout:", weightsLayout);
  return v20;
}

+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  return (MPSGraphConvolution2DOpDescriptor *)objc_msgSend(a1, "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", strideInX, strideInY, dilationRateInX, dilationRateInY, groups, 0, 0, 0, 0, paddingStyle, dataLayout, weightsLayout);
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  -[MPSGraphConvolution2DOpDescriptor setPaddingLeft:](self, "setPaddingLeft:", paddingLeft);
  -[MPSGraphConvolution2DOpDescriptor setPaddingRight:](self, "setPaddingRight:", paddingRight);
  -[MPSGraphConvolution2DOpDescriptor setPaddingTop:](self, "setPaddingTop:", paddingTop);
  -[MPSGraphConvolution2DOpDescriptor setPaddingBottom:](self, "setPaddingBottom:", paddingBottom);
  -[MPSGraphConvolution2DOpDescriptor setPaddingStyle:](self, "setPaddingStyle:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphConvolution2DOpDescriptor *v4;

  v4 = [MPSGraphConvolution2DOpDescriptor alloc];
  -[MPSGraphConvolution2DOpDescriptor setStrideInX:](v4, "setStrideInX:", self->_strideInX);
  -[MPSGraphConvolution2DOpDescriptor setStrideInY:](v4, "setStrideInY:", self->_strideInY);
  -[MPSGraphConvolution2DOpDescriptor setDilationRateInX:](v4, "setDilationRateInX:", self->_dilationRateInX);
  -[MPSGraphConvolution2DOpDescriptor setDilationRateInY:](v4, "setDilationRateInY:", self->_dilationRateInY);
  -[MPSGraphConvolution2DOpDescriptor setGroups:](v4, "setGroups:", self->_groups);
  -[MPSGraphConvolution2DOpDescriptor setPaddingLeft:](v4, "setPaddingLeft:", self->_paddingLeft);
  -[MPSGraphConvolution2DOpDescriptor setPaddingRight:](v4, "setPaddingRight:", self->_paddingRight);
  -[MPSGraphConvolution2DOpDescriptor setPaddingTop:](v4, "setPaddingTop:", self->_paddingTop);
  -[MPSGraphConvolution2DOpDescriptor setPaddingBottom:](v4, "setPaddingBottom:", self->_paddingBottom);
  -[MPSGraphConvolution2DOpDescriptor setPaddingStyle:](v4, "setPaddingStyle:", self->_paddingStyle);
  -[MPSGraphConvolution2DOpDescriptor setDataLayout:](v4, "setDataLayout:", self->_dataLayout);
  -[MPSGraphConvolution2DOpDescriptor setWeightsLayout:](v4, "setWeightsLayout:", self->_weightsLayout);
  return v4;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (void)setStrideInX:(NSUInteger)strideInX
{
  self->_strideInX = strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (void)setStrideInY:(NSUInteger)strideInY
{
  self->_strideInY = strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (void)setDilationRateInX:(NSUInteger)dilationRateInX
{
  self->_dilationRateInX = dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (void)setDilationRateInY:(NSUInteger)dilationRateInY
{
  self->_dilationRateInY = dilationRateInY;
}

- (NSUInteger)paddingLeft
{
  return self->_paddingLeft;
}

- (void)setPaddingLeft:(NSUInteger)paddingLeft
{
  self->_paddingLeft = paddingLeft;
}

- (NSUInteger)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(NSUInteger)paddingRight
{
  self->_paddingRight = paddingRight;
}

- (NSUInteger)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(NSUInteger)paddingTop
{
  self->_paddingTop = paddingTop;
}

- (NSUInteger)paddingBottom
{
  return self->_paddingBottom;
}

- (void)setPaddingBottom:(NSUInteger)paddingBottom
{
  self->_paddingBottom = paddingBottom;
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (MPSGraphTensorNamedDataLayout)dataLayout
{
  return self->_dataLayout;
}

- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  self->_dataLayout = dataLayout;
}

- (MPSGraphTensorNamedDataLayout)weightsLayout
{
  return self->_weightsLayout;
}

- (void)setWeightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  self->_weightsLayout = weightsLayout;
}

- (NSUInteger)groups
{
  return self->_groups;
}

- (void)setGroups:(NSUInteger)groups
{
  self->_groups = groups;
}

@end
