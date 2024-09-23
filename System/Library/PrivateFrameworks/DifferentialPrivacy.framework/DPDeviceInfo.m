@implementation DPDeviceInfo

uint64_t __32___DPDeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalBuild_isInternalBuild = result;
  return result;
}

uint64_t __40___DPDeviceInfo_isDataCollectionEnabled__block_invoke()
{
  uint64_t result;

  result = DiagnosticLogSubmissionEnabled();
  isDataCollectionEnabled_dataCollectionEnabled = result;
  return result;
}

Class __35___DPDeviceInfo_isRunningUnitTests__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  isRunningUnitTests_runningTests = result != 0;
  return result;
}

@end
