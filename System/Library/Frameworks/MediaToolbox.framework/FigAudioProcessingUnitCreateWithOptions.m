@implementation FigAudioProcessingUnitCreateWithOptions

uint64_t __FigAudioProcessingUnitCreateWithOptions_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v5 = result;
    v6 = *(_QWORD *)(result + 40);
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      result = v7(v6, a2, a3);
    else
      result = 4294954514;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
