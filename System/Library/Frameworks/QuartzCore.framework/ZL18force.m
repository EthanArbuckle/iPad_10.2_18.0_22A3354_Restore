@implementation ZL18force

char *___ZL18force_local_serverv_block_invoke()
{
  char *result;

  result = getenv("CA_FORCE_LOCAL_SERVER");
  force_local_server(void)::_force_local_server = result != 0;
  return result;
}

@end
