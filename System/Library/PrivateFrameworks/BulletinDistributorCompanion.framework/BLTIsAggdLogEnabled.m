@implementation BLTIsAggdLogEnabled

uint64_t __BLTIsAggdLogEnabled_block_invoke()
{
  uint64_t result;

  if ((BLTIsDebugBuild() & 1) != 0)
    result = 1;
  else
    result = BLTDeviceOSIsInternalInstall();
  BLTIsAggdLogEnabled___BLTAggdLogEnabled = result;
  return result;
}

@end
