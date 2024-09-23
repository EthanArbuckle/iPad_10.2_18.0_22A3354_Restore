@implementation VNCPUProcessingDevice

- (id)computeDevice
{
  return +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice](VNComputeDeviceUtilities, "mostPerformantCPUComputeDevice");
}

- (BOOL)targetsCPU
{
  return 1;
}

- (id)metalDevice
{
  return 0;
}

- (int)espressoEngine
{
  return 0;
}

- (int)espressoStorageType
{
  return 65568;
}

@end
