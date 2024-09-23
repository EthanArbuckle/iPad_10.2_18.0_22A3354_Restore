@implementation FigXMLServiceStartServer

uint64_t __FigXMLServiceStartServer_block_invoke()
{
  uint64_t result;

  result = FigXPCServerStart();
  FigXMLServiceStartServer_err = result;
  return result;
}

@end
