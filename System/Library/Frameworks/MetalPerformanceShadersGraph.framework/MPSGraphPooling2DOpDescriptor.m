@implementation MPSGraphPooling2DOpDescriptor

- (MPSGraphPooling2DOpDescriptor)init
{
  MPSGraphPooling2DOpDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPSGraphPooling2DOpDescriptor;
  result = -[MPSGraphPooling2DOpDescriptor init](&v3, sel_init);
  result->_returnIndicesMode = 0;
  result->_returnIndicesDataType = 536870944;
  return result;
}

+ (MPSGraphPooling2DOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  MPSGraphPooling2DOpDescriptor *v20;

  v20 = objc_alloc_init(MPSGraphPooling2DOpDescriptor);
  -[MPSGraphPooling2DOpDescriptor setKernelWidth:](v20, "setKernelWidth:", kernelWidth);
  -[MPSGraphPooling2DOpDescriptor setKernelHeight:](v20, "setKernelHeight:", kernelHeight);
  -[MPSGraphPooling2DOpDescriptor setStrideInX:](v20, "setStrideInX:", strideInX);
  -[MPSGraphPooling2DOpDescriptor setStrideInY:](v20, "setStrideInY:", strideInY);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInX:](v20, "setDilationRateInX:", dilationRateInX);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInY:](v20, "setDilationRateInY:", dilationRateInY);
  -[MPSGraphPooling2DOpDescriptor setPaddingLeft:](v20, "setPaddingLeft:", paddingLeft);
  -[MPSGraphPooling2DOpDescriptor setPaddingRight:](v20, "setPaddingRight:", paddingRight);
  -[MPSGraphPooling2DOpDescriptor setPaddingTop:](v20, "setPaddingTop:", paddingTop);
  -[MPSGraphPooling2DOpDescriptor setPaddingBottom:](v20, "setPaddingBottom:", paddingBottom);
  -[MPSGraphPooling2DOpDescriptor setPaddingStyle:](v20, "setPaddingStyle:", paddingStyle);
  -[MPSGraphPooling2DOpDescriptor setDataLayout:](v20, "setDataLayout:", dataLayout);
  v20->_ceilMode = 0;
  v20->_includeZeroPadToAverage = 0;
  v20->_returnIndicesMode = 0;
  v20->_returnIndicesDataType = 536870944;
  return v20;
}

+ (MPSGraphPooling2DOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  MPSGraphPooling2DOpDescriptor *v14;

  v14 = objc_alloc_init(MPSGraphPooling2DOpDescriptor);
  -[MPSGraphPooling2DOpDescriptor setKernelWidth:](v14, "setKernelWidth:", kernelWidth);
  -[MPSGraphPooling2DOpDescriptor setKernelHeight:](v14, "setKernelHeight:", kernelHeight);
  -[MPSGraphPooling2DOpDescriptor setStrideInX:](v14, "setStrideInX:", strideInX);
  -[MPSGraphPooling2DOpDescriptor setStrideInY:](v14, "setStrideInY:", strideInY);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInX:](v14, "setDilationRateInX:", 1);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInY:](v14, "setDilationRateInY:", 1);
  -[MPSGraphPooling2DOpDescriptor setPaddingLeft:](v14, "setPaddingLeft:", 0);
  -[MPSGraphPooling2DOpDescriptor setPaddingRight:](v14, "setPaddingRight:", 0);
  -[MPSGraphPooling2DOpDescriptor setPaddingTop:](v14, "setPaddingTop:", 0);
  -[MPSGraphPooling2DOpDescriptor setPaddingBottom:](v14, "setPaddingBottom:", 0);
  -[MPSGraphPooling2DOpDescriptor setPaddingStyle:](v14, "setPaddingStyle:", paddingStyle);
  -[MPSGraphPooling2DOpDescriptor setDataLayout:](v14, "setDataLayout:", dataLayout);
  v14->_ceilMode = 0;
  v14->_includeZeroPadToAverage = 0;
  v14->_returnIndicesMode = 0;
  v14->_returnIndicesDataType = 536870944;
  return v14;
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  -[MPSGraphPooling2DOpDescriptor setPaddingLeft:](self, "setPaddingLeft:", paddingLeft);
  -[MPSGraphPooling2DOpDescriptor setPaddingRight:](self, "setPaddingRight:", paddingRight);
  -[MPSGraphPooling2DOpDescriptor setPaddingTop:](self, "setPaddingTop:", paddingTop);
  -[MPSGraphPooling2DOpDescriptor setPaddingBottom:](self, "setPaddingBottom:", paddingBottom);
  -[MPSGraphPooling2DOpDescriptor setPaddingStyle:](self, "setPaddingStyle:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphPooling2DOpDescriptor *v4;

  v4 = [MPSGraphPooling2DOpDescriptor alloc];
  -[MPSGraphPooling2DOpDescriptor setKernelWidth:](v4, "setKernelWidth:", self->_kernelWidth);
  -[MPSGraphPooling2DOpDescriptor setKernelHeight:](v4, "setKernelHeight:", self->_kernelHeight);
  -[MPSGraphPooling2DOpDescriptor setStrideInX:](v4, "setStrideInX:", self->_strideInX);
  -[MPSGraphPooling2DOpDescriptor setStrideInY:](v4, "setStrideInY:", self->_strideInY);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInX:](v4, "setDilationRateInX:", self->_dilationRateInX);
  -[MPSGraphPooling2DOpDescriptor setDilationRateInY:](v4, "setDilationRateInY:", self->_dilationRateInY);
  -[MPSGraphPooling2DOpDescriptor setPaddingLeft:](v4, "setPaddingLeft:", self->_paddingLeft);
  -[MPSGraphPooling2DOpDescriptor setPaddingRight:](v4, "setPaddingRight:", self->_paddingRight);
  -[MPSGraphPooling2DOpDescriptor setPaddingTop:](v4, "setPaddingTop:", self->_paddingTop);
  -[MPSGraphPooling2DOpDescriptor setPaddingBottom:](v4, "setPaddingBottom:", self->_paddingBottom);
  -[MPSGraphPooling2DOpDescriptor setPaddingStyle:](v4, "setPaddingStyle:", self->_paddingStyle);
  -[MPSGraphPooling2DOpDescriptor setDataLayout:](v4, "setDataLayout:", self->_dataLayout);
  v4->_ceilMode = self->_ceilMode;
  v4->_includeZeroPadToAverage = self->_includeZeroPadToAverage;
  v4->_returnIndicesMode = self->_returnIndicesMode;
  v4->_returnIndicesDataType = self->_returnIndicesDataType;
  return v4;
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

@end
