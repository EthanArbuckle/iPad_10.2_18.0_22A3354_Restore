@implementation CADeviceDisplaySupportsEDRFactor

uint64_t __CADeviceDisplaySupportsEDRFactor_block_invoke()
{
  char *v0;
  uint64_t result;
  char v2;

  v0 = getenv("CA_USE_IOMFB_EDRFACTOR");
  if (v0)
  {
    result = atoi(v0);
    if (!(_DWORD)result)
    {
      v2 = 0;
      goto LABEL_11;
    }
  }
  result = MGGetSInt64Answer();
  v2 = 0;
  if (result > 32788)
  {
    if (result == 32789 || result == 33537)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!result)
    return result;
  if (result != 28672)
LABEL_9:
    v2 = 1;
LABEL_11:
  CADeviceDisplaySupportsEDRFactor::supports_edr = v2;
  return result;
}

@end
