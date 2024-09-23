@implementation VNANEProcessingDevice

- (id)computeDevice
{
  return +[VNComputeDeviceUtilities mostPerformantNeuralEngineComputeDevice](VNComputeDeviceUtilities, "mostPerformantNeuralEngineComputeDevice");
}

- (BOOL)targetsANE
{
  return 1;
}

- (int)espressoStorageType
{
  return 65552;
}

@end
