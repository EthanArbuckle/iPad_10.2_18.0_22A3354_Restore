@implementation CMPhotoIsTileEncoderAvailable

uint64_t __CMPhotoIsTileEncoderAvailable_block_invoke_2()
{
  int *v0;
  uint64_t result;
  int v2;

  v0 = (int *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    result = kdebug_trace();
    v2 = *v0;
    sTileEncodersAvailable_1 = 1;
    if (v2 == 1)
      return kdebug_trace();
  }
  else
  {
    sTileEncodersAvailable_1 = 1;
  }
  return result;
}

@end
