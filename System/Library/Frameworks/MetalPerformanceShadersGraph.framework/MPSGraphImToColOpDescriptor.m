@implementation MPSGraphImToColOpDescriptor

+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  MPSGraphImToColOpDescriptor *v19;

  v19 = objc_alloc_init(MPSGraphImToColOpDescriptor);
  -[MPSGraphImToColOpDescriptor setKernelWidth:](v19, "setKernelWidth:", kernelWidth);
  -[MPSGraphImToColOpDescriptor setKernelHeight:](v19, "setKernelHeight:", kernelHeight);
  -[MPSGraphImToColOpDescriptor setStrideInX:](v19, "setStrideInX:", strideInX);
  -[MPSGraphImToColOpDescriptor setStrideInY:](v19, "setStrideInY:", strideInY);
  -[MPSGraphImToColOpDescriptor setDilationRateInX:](v19, "setDilationRateInX:", dilationRateInX);
  -[MPSGraphImToColOpDescriptor setDilationRateInY:](v19, "setDilationRateInY:", dilationRateInY);
  -[MPSGraphImToColOpDescriptor setPaddingLeft:](v19, "setPaddingLeft:", paddingLeft);
  -[MPSGraphImToColOpDescriptor setPaddingRight:](v19, "setPaddingRight:", paddingRight);
  -[MPSGraphImToColOpDescriptor setPaddingTop:](v19, "setPaddingTop:", paddingTop);
  -[MPSGraphImToColOpDescriptor setPaddingBottom:](v19, "setPaddingBottom:", paddingBottom);
  -[MPSGraphImToColOpDescriptor setDataLayout:](v19, "setDataLayout:", dataLayout);
  return v19;
}

+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  return (MPSGraphImToColOpDescriptor *)objc_msgSend(a1, "descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingLeft:paddingRight:paddingTop:paddingBottom:dataLayout:", kernelWidth, kernelHeight, strideInX, strideInY, dilationRateInX, dilationRateInY, 0, 0, 0, 0, dataLayout);
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  -[MPSGraphImToColOpDescriptor setPaddingLeft:](self, "setPaddingLeft:", paddingLeft);
  -[MPSGraphImToColOpDescriptor setPaddingRight:](self, "setPaddingRight:", paddingRight);
  -[MPSGraphImToColOpDescriptor setPaddingTop:](self, "setPaddingTop:", paddingTop);
  -[MPSGraphImToColOpDescriptor setPaddingBottom:](self, "setPaddingBottom:", paddingBottom);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphImToColOpDescriptor *v4;

  v4 = [MPSGraphImToColOpDescriptor alloc];
  -[MPSGraphImToColOpDescriptor setKernelWidth:](v4, "setKernelWidth:", self->_kernelWidth);
  -[MPSGraphImToColOpDescriptor setKernelHeight:](v4, "setKernelHeight:", self->_kernelHeight);
  -[MPSGraphImToColOpDescriptor setStrideInX:](v4, "setStrideInX:", self->_strideInX);
  -[MPSGraphImToColOpDescriptor setStrideInY:](v4, "setStrideInY:", self->_strideInY);
  -[MPSGraphImToColOpDescriptor setDilationRateInX:](v4, "setDilationRateInX:", self->_dilationRateInX);
  -[MPSGraphImToColOpDescriptor setDilationRateInY:](v4, "setDilationRateInY:", self->_dilationRateInY);
  -[MPSGraphImToColOpDescriptor setPaddingLeft:](v4, "setPaddingLeft:", self->_paddingLeft);
  -[MPSGraphImToColOpDescriptor setPaddingRight:](v4, "setPaddingRight:", self->_paddingRight);
  -[MPSGraphImToColOpDescriptor setPaddingTop:](v4, "setPaddingTop:", self->_paddingTop);
  -[MPSGraphImToColOpDescriptor setPaddingBottom:](v4, "setPaddingBottom:", self->_paddingBottom);
  -[MPSGraphImToColOpDescriptor setDataLayout:](v4, "setDataLayout:", self->_dataLayout);
  return v4;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(NSUInteger)kernelWidth
{
  self->_kernelWidth = kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(NSUInteger)kernelHeight
{
  self->_kernelHeight = kernelHeight;
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

- (MPSGraphTensorNamedDataLayout)dataLayout
{
  return self->_dataLayout;
}

- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  self->_dataLayout = dataLayout;
}

@end
