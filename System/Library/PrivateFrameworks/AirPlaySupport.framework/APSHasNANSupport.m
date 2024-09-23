@implementation APSHasNANSupport

uint64_t __APSHasNANSupport_block_invoke()
{
  uint64_t result;

  result = GestaltGetBoolean();
  APSHasNANSupport_sHasNANSupport = result;
  return result;
}

@end
