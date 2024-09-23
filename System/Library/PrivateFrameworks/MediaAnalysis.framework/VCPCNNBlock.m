@implementation VCPCNNBlock

- (int)constructBlock:(id)a3 context:(id)a4
{
  return -4;
}

- (int)forward
{
  return -4;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  return 0;
}

- (BOOL)supportGPU
{
  return 0;
}

- (BOOL)useGPU
{
  return 0;
}

- (NSMutableArray)inputSize
{
  return (NSMutableArray *)objc_loadWeakRetained((id *)&self->_inputSize);
}

- (void)setInputSize:(id)a3
{
  objc_storeWeak((id *)&self->_inputSize, a3);
}

- (NSMutableArray)outputSize
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutputSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (VCPCNNData)input
{
  return (VCPCNNData *)objc_loadWeakRetained((id *)&self->_input);
}

- (void)setInput:(id)a3
{
  objc_storeWeak((id *)&self->_input, a3);
}

- (VCPCNNData)output
{
  return (VCPCNNData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (VCPCNNMetalContext)context
{
  return (VCPCNNMetalContext *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)generateOutput
{
  return self->_generateOutput;
}

- (void)setGenerateOutput:(BOOL)a3
{
  self->_generateOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_destroyWeak((id *)&self->_input);
  objc_storeStrong((id *)&self->_outputSize, 0);
  objc_destroyWeak((id *)&self->_inputSize);
}

@end
