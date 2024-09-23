@implementation SetProperty

uint64_t __sharedUI_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_UpdateAudioMetaData(**(_QWORD **)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __sharedUI_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_UpdateAudioProgress(**(_QWORD **)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __sharedUI_SetProperty_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_SetProperty(**(_QWORD **)(a1 + 40), *(CFStringRef *)(a1 + 48), 0, *(const void **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
