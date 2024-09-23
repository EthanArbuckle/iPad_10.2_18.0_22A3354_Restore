@implementation C3DIsRunningInSCNTool

Class __C3DIsRunningInSCNTool_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SKEDocumentSanitizer"));
  C3DIsRunningInSCNTool_runningSCNTool = result != 0;
  return result;
}

@end
