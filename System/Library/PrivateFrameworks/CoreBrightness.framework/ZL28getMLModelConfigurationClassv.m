@implementation ZL28getMLModelConfigurationClassv

unint64_t *___ZL28getMLModelConfigurationClassv_block_invoke(uint64_t a1)
{
  CoreMLLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_getClass("MLModelConfiguration");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    abort_report_np();
  return std::atomic_store_explicit[abi:ne180100]<void *>(&getMLModelConfigurationClass(void)::softClass, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0);
}

@end
