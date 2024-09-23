@implementation MPSGraphSingleGateRNNDescriptor

+ (MPSGraphSingleGateRNNDescriptor)descriptor
{
  MPSGraphSingleGateRNNDescriptor *v2;

  v2 = objc_alloc_init(MPSGraphSingleGateRNNDescriptor);
  v2->_reverse = 0;
  v2->_training = 0;
  v2->_activation = 1;
  v2->_bidirectional = 0;
  v2->_hasMask = 0;
  v2->_hasInitState = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = [MPSGraphSingleGateRNNDescriptor alloc];
  *((_BYTE *)result + 10) = self->_reverse;
  *((_BYTE *)result + 11) = self->_training;
  *((_QWORD *)result + 2) = self->_activation;
  *((_BYTE *)result + 12) = self->_bidirectional;
  *((_BYTE *)result + 8) = self->_hasMask;
  *((_BYTE *)result + 9) = self->_hasInitState;
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

- (MPSGraphRNNActivation)activation
{
  return self->_activation;
}

- (void)setActivation:(MPSGraphRNNActivation)activation
{
  self->_activation = activation;
}

- (BOOL)bidirectional
{
  return self->_bidirectional;
}

- (void)setBidirectional:(BOOL)bidirectional
{
  self->_bidirectional = bidirectional;
}

@end
