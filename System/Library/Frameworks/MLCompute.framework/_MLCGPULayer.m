@implementation _MLCGPULayer

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 1;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensors:(id)a6
{
  return 1;
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOps, 0);
}

@end
