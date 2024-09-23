@implementation C3DIsRunningInXcode

Class __C3DIsRunningInXcode_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SKESceneDocument"));
  C3DIsRunningInXcode_runningXcode = result != 0;
  return result;
}

@end
