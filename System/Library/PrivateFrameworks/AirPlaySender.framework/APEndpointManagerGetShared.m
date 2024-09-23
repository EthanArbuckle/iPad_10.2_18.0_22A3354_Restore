@implementation APEndpointManagerGetShared

uint64_t __APEndpointManagerGetShared_block_invoke()
{
  uint64_t result;

  result = manager_create(&APEndpointManagerGetShared_sAPEndpointManager);
  gCreationErr = result;
  return result;
}

@end
