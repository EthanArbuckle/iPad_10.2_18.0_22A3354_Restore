@implementation ZL20getMLMultiArrayClassv

unint64_t *___ZL20getMLMultiArrayClassv_block_invoke(uint64_t a1)
{
  CoreMLLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_getClass("MLMultiArray");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    abort_report_np();
  return std::atomic_store_explicit[abi:ne180100]<void *>(&getMLMultiArrayClass(void)::softClass, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0);
}

@end
