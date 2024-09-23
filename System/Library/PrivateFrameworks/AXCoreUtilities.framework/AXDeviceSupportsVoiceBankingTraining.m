@implementation AXDeviceSupportsVoiceBankingTraining

uint64_t __AXDeviceSupportsVoiceBankingTraining_block_invoke()
{
  uint64_t result;

  result = _get_cpu_capabilities();
  AXDeviceSupportsVoiceBankingTraining__AXDeviceSupportsVoiceBankingTraining = (result & 0x70000000) != 0;
  return result;
}

@end
