@implementation MPSGraphGRUDescriptor

+ (MPSGraphGRUDescriptor)descriptor
{
  MPSGraphGRUDescriptor *v2;

  v2 = objc_alloc_init(MPSGraphGRUDescriptor);
  v2->_reverse = 0;
  v2->_training = 0;
  v2->_bidirectional = 0;
  v2->_hasMask = 0;
  v2->_hasInitState = 0;
  v2->_hasBias2 = 0;
  v2->_resetGateActivation = 3;
  v2->_updateGateActivation = 3;
  v2->_outputGateActivation = 2;
  v2->_resetGateFirst = 0;
  v2->_resetAfter = 0;
  v2->_flipZ = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = [MPSGraphGRUDescriptor alloc];
  *((_BYTE *)result + 11) = self->_reverse;
  *((_BYTE *)result + 12) = self->_training;
  *((_BYTE *)result + 13) = self->_bidirectional;
  *((_BYTE *)result + 8) = self->_hasMask;
  *((_BYTE *)result + 9) = self->_hasInitState;
  *((_BYTE *)result + 10) = self->_hasBias2;
  *((_QWORD *)result + 3) = self->_resetGateActivation;
  *((_QWORD *)result + 4) = self->_updateGateActivation;
  *((_QWORD *)result + 5) = self->_outputGateActivation;
  *((_BYTE *)result + 15) = self->_resetGateFirst;
  *((_BYTE *)result + 14) = self->_resetAfter;
  *((_BYTE *)result + 16) = self->_flipZ;
  return result;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)reverse
{
  self->_reverse = reverse;
}

- (BOOL)training
{
  return self->_training;
}

- (void)setTraining:(BOOL)training
{
  self->_training = training;
}

- (BOOL)bidirectional
{
  return self->_bidirectional;
}

- (void)setBidirectional:(BOOL)bidirectional
{
  self->_bidirectional = bidirectional;
}

- (MPSGraphRNNActivation)resetGateActivation
{
  return self->_resetGateActivation;
}

- (void)setResetGateActivation:(MPSGraphRNNActivation)resetGateActivation
{
  self->_resetGateActivation = resetGateActivation;
}

- (MPSGraphRNNActivation)updateGateActivation
{
  return self->_updateGateActivation;
}

- (void)setUpdateGateActivation:(MPSGraphRNNActivation)updateGateActivation
{
  self->_updateGateActivation = updateGateActivation;
}

- (MPSGraphRNNActivation)outputGateActivation
{
  return self->_outputGateActivation;
}

- (void)setOutputGateActivation:(MPSGraphRNNActivation)outputGateActivation
{
  self->_outputGateActivation = outputGateActivation;
}

- (BOOL)resetAfter
{
  return self->_resetAfter;
}

- (void)setResetAfter:(BOOL)resetAfter
{
  self->_resetAfter = resetAfter;
}

- (BOOL)resetGateFirst
{
  return self->_resetGateFirst;
}

- (void)setResetGateFirst:(BOOL)resetGateFirst
{
  self->_resetGateFirst = resetGateFirst;
}

- (BOOL)flipZ
{
  return self->_flipZ;
}

- (void)setFlipZ:(BOOL)flipZ
{
  self->_flipZ = flipZ;
}

@end
