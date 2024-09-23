@implementation ZN19EXRWritePluginInput6readCBEPvmm10axr

void *___ZN19EXRWritePluginInput6readCBEPvmm10axr_size_t_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)a3, *(_QWORD *)(a3 + 8) * *(_QWORD *)(a3 + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += *(_QWORD *)(a3 + 24);
  return result;
}

@end
