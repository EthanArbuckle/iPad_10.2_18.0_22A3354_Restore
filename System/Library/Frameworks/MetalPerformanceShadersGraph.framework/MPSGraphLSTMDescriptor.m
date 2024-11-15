@implementation MPSGraphLSTMDescriptor

+ (MPSGraphLSTMDescriptor)descriptor
{
  MPSGraphLSTMDescriptor *v2;

  v2 = objc_alloc_init(MPSGraphLSTMDescriptor);
  v2->_reverse = 0;
  v2->_training = 0;
  v2->_bidirectional = 0;
  v2->_hasMask = 0;
  v2->_hasInitState = 0;
  v2->_hasInitCell = 0;
  v2->_hasPeephole = 0;
  v2->_hasCellGradient = 0;
  v2->_produceCell = 0;
  v2->_forgetGateLast = 0;
  v2->_inputGateActivation = 3;
  v2->_forgetGateActivation = 3;
  v2->_cellGateActivation = 2;
  v2->_outputGateActivation = 3;
  v2->_activation = 2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = [MPSGraphLSTMDescriptor alloc];
  *((_BYTE *)result + 13) = self->_reverse;
  *((_BYTE *)result + 14) = self->_training;
  *((_BYTE *)result + 15) = self->_bidirectional;
  *((_BYTE *)result + 8) = self->_hasMask;
  *((_BYTE *)result + 9) = self->_hasInitState;
  *((_BYTE *)result + 10) = self->_hasInitCell;
  *((_BYTE *)result + 11) = self->_hasPeephole;
  *((_BYTE *)result + 12) = self->_hasCellGradient;
  *((_BYTE *)result + 16) = self->_produceCell;
  *((_BYTE *)result + 17) = self->_forgetGateLast;
  *((_QWORD *)result + 4) = self->_inputGateActivation;
  *((_QWORD *)result + 5) = self->_forgetGateActivation;
  *((_QWORD *)result + 6) = self->_cellGateActivation;
  *((_QWORD *)result + 7) = self->_outputGateActivation;
  *((_QWORD *)result + 3) = self->_activation;
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

- (BOOL)produceCell
{
  return self->_produceCell;
}

- (void)setProduceCell:(BOOL)produceCell
{
  self->_produceCell = produceCell;
}

- (BOOL)forgetGateLast
{
  return self->_forgetGateLast;
}

- (void)setForgetGateLast:(BOOL)forgetGateLast
{
  self->_forgetGateLast = forgetGateLast;
}

- (MPSGraphRNNActivation)inputGateActivation
{
  return self->_inputGateActivation;
}

- (void)setInputGateActivation:(MPSGraphRNNActivation)inputGateActivation
{
  self->_inputGateActivation = inputGateActivation;
}

- (MPSGraphRNNActivation)forgetGateActivation
{
  return self->_forgetGateActivation;
}

- (void)setForgetGateActivation:(MPSGraphRNNActivation)forgetGateActivation
{
  self->_forgetGateActivation = forgetGateActivation;
}

- (MPSGraphRNNActivation)cellGateActivation
{
  return self->_cellGateActivation;
}

- (void)setCellGateActivation:(MPSGraphRNNActivation)cellGateActivation
{
  self->_cellGateActivation = cellGateActivation;
}

- (MPSGraphRNNActivation)outputGateActivation
{
  return self->_outputGateActivation;
}

- (void)setOutputGateActivation:(MPSGraphRNNActivation)outputGateActivation
{
  self->_outputGateActivation = outputGateActivation;
}

@end
