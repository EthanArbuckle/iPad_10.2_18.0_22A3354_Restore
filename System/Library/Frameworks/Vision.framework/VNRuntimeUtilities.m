@implementation VNRuntimeUtilities

+ (int)runTimeVersion
{
  if (runTimeVersion_onceToken != -1)
    dispatch_once(&runTimeVersion_onceToken, &__block_literal_global_2);
  return runTimeVersion_version;
}

uint64_t __37__VNRuntimeUtilities_linkTimeVersion__block_invoke()
{
  uint64_t result;

  result = NSVersionOfLinkTimeLibrary("Vision");
  linkTimeVersion_version = result;
  return result;
}

uint64_t __36__VNRuntimeUtilities_runTimeVersion__block_invoke()
{
  uint64_t result;

  result = NSVersionOfRunTimeLibrary("Vision");
  runTimeVersion_version = result;
  return result;
}

+ (int)linkTimeVersion
{
  if (linkTimeVersion_onceToken != -1)
    dispatch_once(&linkTimeVersion_onceToken, &__block_literal_global_3736);
  return linkTimeVersion_version;
}

@end
