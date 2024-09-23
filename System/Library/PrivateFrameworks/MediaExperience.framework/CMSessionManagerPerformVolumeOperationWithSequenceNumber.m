@implementation CMSessionManagerPerformVolumeOperationWithSequenceNumber

uint64_t __CMSessionManagerPerformVolumeOperationWithSequenceNumber_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MXSMPerformVolumeOperation(*(_DWORD *)(a1 + 104), *(const __CFString **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56), *(const __CFString **)(a1 + 64), 0, *(unsigned int *)(a1 + 112), *(float **)(a1 + 72), *(float *)(a1 + 108), 0.0, 0.0, *(_BYTE **)(a1 + 80), *(CFTypeRef **)(a1 + 88), *(uint64_t **)(a1 + 96), 0, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
