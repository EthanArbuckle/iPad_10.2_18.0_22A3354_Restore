@implementation AVTEyeSkinningDescriptor

- (uint64_t)leftEyeLookOutTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)setLeftEyeLookOutTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 48) = a2;
  return result;
}

- (uint64_t)leftEyeLookUpTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)setLeftEyeLookUpTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (uint64_t)rightEyeLookDownTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)setRightEyeLookDownTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (uint64_t)rightEyeLookInTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)setRightEyeLookInTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

- (uint64_t)rightEyeLookOutTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)setRightEyeLookOutTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 80) = a2;
  return result;
}

- (uint64_t)rightEyeLookUpTargetIndex
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)setRightEyeLookUpTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 88) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeJoint, 0);
  objc_storeStrong((id *)&self->_leftEyeJoint, 0);
  objc_storeStrong((id *)&self->_readMorpherNode, 0);
}

@end
