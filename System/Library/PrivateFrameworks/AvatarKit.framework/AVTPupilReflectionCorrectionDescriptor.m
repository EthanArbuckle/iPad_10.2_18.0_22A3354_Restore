@implementation AVTPupilReflectionCorrectionDescriptor

- (uint64_t)setLeftEyeTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

- (uint64_t)setRightEyeTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 40) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeMaterial, 0);
  objc_storeStrong((id *)&self->_leftEyeMaterial, 0);
  objc_storeStrong((id *)&self->_readMorpherNode, 0);
}

@end
