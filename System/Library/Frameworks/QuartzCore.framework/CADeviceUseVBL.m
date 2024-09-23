@implementation CADeviceUseVBL

uint64_t __CADeviceUseVBL_block_invoke()
{
  char *v0;
  uint64_t result;
  BOOL v2;

  v0 = getenv("CA_FORCE_TIMER");
  if (v0 && (result = atoi(v0), (_DWORD)result))
  {
    v2 = 1;
  }
  else
  {
    result = MGGetSInt64Answer();
    v2 = result == 28672 || result == 32784;
  }
  CADeviceUseVBL::use_vbl = v2;
  return result;
}

@end
