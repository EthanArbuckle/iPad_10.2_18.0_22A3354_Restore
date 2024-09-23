@implementation _MLCGPUConvolutionTransposePadding

+ (id)convolutionTransposeZeroPaddingWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:", a3, a4, a5, a6, a7, a8);
}

- (_MLCGPUConvolutionTransposePadding)initWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8
{
  _MLCGPUConvolutionTransposePadding *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_MLCGPUConvolutionTransposePadding;
  result = -[_MLCGPUConvolutionTransposePadding init](&v15, sel_init);
  if (result)
  {
    result->_topAmount = a3;
    result->_bottomAmount = a4;
    result->_leftAmount = a5;
    result->_rightAmount = a6;
    result->_outputPaddingX = a7;
    result->_outputPaddingY = a8;
  }
  return result;
}

- (unint64_t)paddingMethod
{
  return 0x4000;
}

- (id)destinationImageDescriptorForSourceImages:(id)a3 sourceStates:(id)a4 forKernel:(id)a5 suggestedDescriptor:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t topAmount;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v28[3];

  v9 = a5;
  v10 = a6;
  v11 = a3;
  v12 = objc_msgSend(v9, "kernelWidth");
  v13 = objc_msgSend(v9, "kernelHeight");
  v14 = objc_msgSend(v9, "dilationRateX") * (v12 - 1);
  v15 = v14 + 1;
  v16 = objc_msgSend(v9, "dilationRateY") * (v13 - 1);
  v17 = v16 + 1;
  memset(v28, 0, sizeof(v28));
  objc_msgSend(v9, "setOffset:", v28);
  v18 = v14 + 2;
  if (v14 + 1 >= 0)
    v18 = v14 + 1;
  if (v17 >= 0)
    v19 = v16 + 1;
  else
    v19 = v16 + 2;
  topAmount = self->_topAmount;
  objc_msgSend(v9, "setKernelOffsetX:", (v14 & 1) - (v18 >> 1) + self->_leftAmount);
  objc_msgSend(v9, "setKernelOffsetY:", (v16 & 1) - (v19 >> 1) + topAmount);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "width") - 1;
  v23 = v15
      + v22 * objc_msgSend(v9, "strideInPixelsX")
      - (self->_leftAmount
       + self->_rightAmount)
      + self->_outputPaddingX;

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "height") - 1;
  v26 = v17
      + v25 * objc_msgSend(v9, "strideInPixelsY")
      - (self->_topAmount
       + self->_bottomAmount)
      + self->_outputPaddingY;

  objc_msgSend(v10, "setWidth:", v23);
  objc_msgSend(v10, "setHeight:", v26);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding topAmount](self, "topAmount"), CFSTR("topAmount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding bottomAmount](self, "bottomAmount"), CFSTR("bottomAmount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding leftAmount](self, "leftAmount"), CFSTR("leftAmount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding rightAmount](self, "rightAmount"), CFSTR("rightAmount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding outputPaddingX](self, "outputPaddingX"), CFSTR("outputPaddingX"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding outputPaddingY](self, "outputPaddingY"), CFSTR("outputPaddingY"));

}

- (_MLCGPUConvolutionTransposePadding)initWithCoder:(id)a3
{
  id v4;
  float v5;
  unint64_t v6;
  float v7;
  unint64_t v8;
  float v9;
  unint64_t v10;
  float v11;
  unint64_t v12;
  float v13;
  unint64_t v14;
  float v15;
  float v16;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("topAmount"));
  v6 = (unint64_t)v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomAmount"));
  v8 = (unint64_t)v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftAmount"));
  v10 = (unint64_t)v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightAmount"));
  v12 = (unint64_t)v11;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("outputPaddingX"));
  v14 = (unint64_t)v13;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("outputPaddingY"));
  v16 = v15;

  return -[_MLCGPUConvolutionTransposePadding initWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:](self, "initWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:", v6, v8, v10, v12, v14, (unint64_t)v16);
}

- (unint64_t)topAmount
{
  return self->_topAmount;
}

- (unint64_t)bottomAmount
{
  return self->_bottomAmount;
}

- (unint64_t)leftAmount
{
  return self->_leftAmount;
}

- (unint64_t)rightAmount
{
  return self->_rightAmount;
}

- (unint64_t)outputPaddingX
{
  return self->_outputPaddingX;
}

- (unint64_t)outputPaddingY
{
  return self->_outputPaddingY;
}

@end
