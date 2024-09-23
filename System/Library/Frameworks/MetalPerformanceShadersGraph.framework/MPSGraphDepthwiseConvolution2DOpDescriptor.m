@implementation MPSGraphDepthwiseConvolution2DOpDescriptor

+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  MPSGraphDepthwiseConvolution2DOpDescriptor *v19;

  v19 = objc_alloc_init(MPSGraphDepthwiseConvolution2DOpDescriptor);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInX:](v19, "setStrideInX:", strideInX);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInY:](v19, "setStrideInY:", strideInY);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInX:](v19, "setDilationRateInX:", dilationRateInX);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInY:](v19, "setDilationRateInY:", dilationRateInY);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingLeft:](v19, "setPaddingLeft:", paddingLeft);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingRight:](v19, "setPaddingRight:", paddingRight);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingTop:](v19, "setPaddingTop:", paddingTop);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingBottom:](v19, "setPaddingBottom:", paddingBottom);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingStyle:](v19, "setPaddingStyle:", paddingStyle);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDataLayout:](v19, "setDataLayout:", dataLayout);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setWeightsLayout:](v19, "setWeightsLayout:", weightsLayout);
  return v19;
}

+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  MPSGraphDepthwiseConvolution2DOpDescriptor *v6;

  v6 = objc_alloc_init(MPSGraphDepthwiseConvolution2DOpDescriptor);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInX:](v6, "setStrideInX:", 1);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInY:](v6, "setStrideInY:", 1);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInX:](v6, "setDilationRateInX:", 1);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInY:](v6, "setDilationRateInY:", 1);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingLeft:](v6, "setPaddingLeft:", 0);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingRight:](v6, "setPaddingRight:", 0);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingTop:](v6, "setPaddingTop:", 0);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingBottom:](v6, "setPaddingBottom:", 0);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingStyle:](v6, "setPaddingStyle:", 0);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDataLayout:](v6, "setDataLayout:", dataLayout);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setWeightsLayout:](v6, "setWeightsLayout:", weightsLayout);
  return v6;
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingLeft:](self, "setPaddingLeft:", paddingLeft);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingRight:](self, "setPaddingRight:", paddingRight);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingTop:](self, "setPaddingTop:", paddingTop);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingBottom:](self, "setPaddingBottom:", paddingBottom);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingStyle:](self, "setPaddingStyle:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphDepthwiseConvolution2DOpDescriptor *v4;

  v4 = [MPSGraphDepthwiseConvolution2DOpDescriptor alloc];
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInX:](v4, "setStrideInX:", self->_strideInX);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setStrideInY:](v4, "setStrideInY:", self->_strideInY);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInX:](v4, "setDilationRateInX:", self->_dilationRateInX);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDilationRateInY:](v4, "setDilationRateInY:", self->_dilationRateInY);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingLeft:](v4, "setPaddingLeft:", self->_paddingLeft);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingRight:](v4, "setPaddingRight:", self->_paddingRight);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingTop:](v4, "setPaddingTop:", self->_paddingTop);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingBottom:](v4, "setPaddingBottom:", self->_paddingBottom);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setPaddingStyle:](v4, "setPaddingStyle:", self->_paddingStyle);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setDataLayout:](v4, "setDataLayout:", self->_dataLayout);
  -[MPSGraphDepthwiseConvolution2DOpDescriptor setWeightsLayout:](v4, "setWeightsLayout:", self->_weightsLayout);
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

@end
