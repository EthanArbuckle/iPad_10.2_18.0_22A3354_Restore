@implementation MPSGraphConvolution3DOpDescriptor

+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  MPSGraphConvolution3DOpDescriptor *v24;

  if (dataLayout - 7 >= 2 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (weightsLayout - 9 >= 2 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v24 = objc_alloc_init(MPSGraphConvolution3DOpDescriptor);
  -[MPSGraphConvolution3DOpDescriptor setStrideInX:](v24, "setStrideInX:", strideInX);
  -[MPSGraphConvolution3DOpDescriptor setStrideInY:](v24, "setStrideInY:", strideInY);
  -[MPSGraphConvolution3DOpDescriptor setStrideInZ:](v24, "setStrideInZ:", strideInZ);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInX:](v24, "setDilationRateInX:", dilationRateInX);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInY:](v24, "setDilationRateInY:", dilationRateInY);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInZ:](v24, "setDilationRateInZ:", dilationRateInZ);
  -[MPSGraphConvolution3DOpDescriptor setGroups:](v24, "setGroups:", groups);
  -[MPSGraphConvolution3DOpDescriptor setPaddingLeft:](v24, "setPaddingLeft:", paddingLeft);
  -[MPSGraphConvolution3DOpDescriptor setPaddingRight:](v24, "setPaddingRight:", paddingRight);
  -[MPSGraphConvolution3DOpDescriptor setPaddingTop:](v24, "setPaddingTop:", paddingTop);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBottom:](v24, "setPaddingBottom:", paddingBottom);
  -[MPSGraphConvolution3DOpDescriptor setPaddingFront:](v24, "setPaddingFront:", paddingFront);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBack:](v24, "setPaddingBack:", paddingBack);
  -[MPSGraphConvolution3DOpDescriptor setPaddingStyle:](v24, "setPaddingStyle:", paddingStyle);
  -[MPSGraphConvolution3DOpDescriptor setDataLayout:](v24, "setDataLayout:", dataLayout);
  -[MPSGraphConvolution3DOpDescriptor setWeightsLayout:](v24, "setWeightsLayout:", weightsLayout);
  return v24;
}

+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  return (MPSGraphConvolution3DOpDescriptor *)objc_msgSend(a1, "descriptorWithStrideInX:strideInY:strideInZ:dilationRateInX:dilationRateInY:dilationRateInZ:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingFront:paddingBack:paddingStyle:dataLayout:weightsLayout:", strideInX, strideInY, strideInZ, dilationRateInX, dilationRateInY, dilationRateInZ, groups, 0, 0, 0, 0, 0, 0, paddingStyle, dataLayout,
                                                weightsLayout);
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack
{
  -[MPSGraphConvolution3DOpDescriptor setPaddingLeft:](self, "setPaddingLeft:", paddingLeft);
  -[MPSGraphConvolution3DOpDescriptor setPaddingRight:](self, "setPaddingRight:", paddingRight);
  -[MPSGraphConvolution3DOpDescriptor setPaddingTop:](self, "setPaddingTop:", paddingTop);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBottom:](self, "setPaddingBottom:", paddingBottom);
  -[MPSGraphConvolution3DOpDescriptor setPaddingFront:](self, "setPaddingFront:", paddingFront);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBack:](self, "setPaddingBack:", paddingBack);
  -[MPSGraphConvolution3DOpDescriptor setPaddingStyle:](self, "setPaddingStyle:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphConvolution3DOpDescriptor *v4;

  v4 = [MPSGraphConvolution3DOpDescriptor alloc];
  -[MPSGraphConvolution3DOpDescriptor setStrideInX:](v4, "setStrideInX:", self->_strideInX);
  -[MPSGraphConvolution3DOpDescriptor setStrideInY:](v4, "setStrideInY:", self->_strideInY);
  -[MPSGraphConvolution3DOpDescriptor setStrideInZ:](v4, "setStrideInZ:", self->_strideInZ);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInX:](v4, "setDilationRateInX:", self->_dilationRateInX);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInY:](v4, "setDilationRateInY:", self->_dilationRateInY);
  -[MPSGraphConvolution3DOpDescriptor setDilationRateInZ:](v4, "setDilationRateInZ:", self->_dilationRateInZ);
  -[MPSGraphConvolution3DOpDescriptor setGroups:](v4, "setGroups:", self->_groups);
  -[MPSGraphConvolution3DOpDescriptor setPaddingLeft:](v4, "setPaddingLeft:", self->_paddingLeft);
  -[MPSGraphConvolution3DOpDescriptor setPaddingRight:](v4, "setPaddingRight:", self->_paddingRight);
  -[MPSGraphConvolution3DOpDescriptor setPaddingTop:](v4, "setPaddingTop:", self->_paddingTop);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBottom:](v4, "setPaddingBottom:", self->_paddingBottom);
  -[MPSGraphConvolution3DOpDescriptor setPaddingFront:](v4, "setPaddingFront:", self->_paddingFront);
  -[MPSGraphConvolution3DOpDescriptor setPaddingBack:](v4, "setPaddingBack:", self->_paddingBack);
  -[MPSGraphConvolution3DOpDescriptor setPaddingStyle:](v4, "setPaddingStyle:", self->_paddingStyle);
  -[MPSGraphConvolution3DOpDescriptor setDataLayout:](v4, "setDataLayout:", self->_dataLayout);
  -[MPSGraphConvolution3DOpDescriptor setWeightsLayout:](v4, "setWeightsLayout:", self->_weightsLayout);
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

- (NSUInteger)strideInZ
{
  return self->_strideInZ;
}

- (void)setStrideInZ:(NSUInteger)strideInZ
{
  self->_strideInZ = strideInZ;
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

- (NSUInteger)dilationRateInZ
{
  return self->_dilationRateInZ;
}

- (void)setDilationRateInZ:(NSUInteger)dilationRateInZ
{
  self->_dilationRateInZ = dilationRateInZ;
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

- (NSUInteger)paddingFront
{
  return self->_paddingFront;
}

- (void)setPaddingFront:(NSUInteger)paddingFront
{
  self->_paddingFront = paddingFront;
}

- (NSUInteger)paddingBack
{
  return self->_paddingBack;
}

- (void)setPaddingBack:(NSUInteger)paddingBack
{
  self->_paddingBack = paddingBack;
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
