@implementation CMSessionMgrPerformVolumeOperation

uint64_t __CMSessionMgrPerformVolumeOperation_block_invoke(uint64_t a1)
{
  unsigned int v2;
  float v3;
  const __CFString *v4;
  const void *v5;
  const void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 96);
  v3 = *(float *)(a1 + 100);
  v4 = *(const __CFString **)(a1 + 40);
  v5 = *(const void **)(a1 + 48);
  v6 = *(const void **)(a1 + 56);
  v7 = *(const __CFString **)(a1 + 64);
  v8 = getpid();
  result = MXSMPerformVolumeOperation(v2, v4, v5, v6, v7, 0, v8, *(float **)(a1 + 72), v3, 0.0, 0.0, *(_BYTE **)(a1 + 80), *(CFTypeRef **)(a1 + 88), 0, 0, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
