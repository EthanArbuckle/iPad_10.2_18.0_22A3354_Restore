@implementation CMITiledInferenceProcessorNetworkImpl

- (NSArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_outputs, a3);
}

- (int64_t)networkIndex
{
  return self->_networkIndex;
}

- (void)setNetworkIndex:(int64_t)a3
{
  self->_networkIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
