@implementation APReceiverSystemInfoGetDisplaySizeForUserVersion

uint64_t __APReceiverSystemInfoGetDisplaySizeForUserVersion_block_invoke(uint64_t result)
{
  int v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_DWORD *)(result + 48);
  if (v1 < 1)
  {
    v2 = 1280.0;
    v3 = 720.0;
  }
  else if (v1 == 1)
  {
    v2 = 1920.0;
    v3 = 1080.0;
  }
  else
  {
    v4 = *(_QWORD *)(result + 40);
    v2 = *(double *)(v4 + 592);
    v3 = *(double *)(v4 + 600);
    if (v2 == *MEMORY[0x24BDBF148] && v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v3 = 1080.0;
      v2 = 1920.0;
    }
  }
  v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(double *)(v5 + 32) = v2;
  *(double *)(v5 + 40) = v3;
  return result;
}

@end
