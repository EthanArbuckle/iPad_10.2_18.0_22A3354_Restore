@implementation MPSGraphFFTDescriptor

+ (MPSGraphFFTDescriptor)descriptor
{
  MPSGraphFFTDescriptor *v2;

  v2 = objc_alloc_init(MPSGraphFFTDescriptor);
  v2->_inverse = 0;
  v2->_scalingMode = 0;
  v2->_roundToOddHermitean = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = [MPSGraphFFTDescriptor alloc];
  *((_BYTE *)result + 8) = self->_inverse;
  *((_QWORD *)result + 2) = self->_scalingMode;
  *((_BYTE *)result + 9) = self->_roundToOddHermitean;
  return result;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)inverse
{
  self->_inverse = inverse;
}

- (MPSGraphFFTScalingMode)scalingMode
{
  return self->_scalingMode;
}

- (void)setScalingMode:(MPSGraphFFTScalingMode)scalingMode
{
  self->_scalingMode = scalingMode;
}

- (BOOL)roundToOddHermitean
{
  return self->_roundToOddHermitean;
}

- (void)setRoundToOddHermitean:(BOOL)roundToOddHermitean
{
  self->_roundToOddHermitean = roundToOddHermitean;
}

@end
