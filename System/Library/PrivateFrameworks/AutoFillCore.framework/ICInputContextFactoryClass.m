@implementation ICInputContextFactoryClass

void __get_ICInputContextFactoryClass_block_invoke(uint64_t a1)
{
  InputContextLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_ICInputContextFactory");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_ICInputContextFactoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_ICInputContextFactoryClass_block_invoke_cold_1();
    InputContextLibrary();
  }
}

uint64_t __get_ICInputContextFactoryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSafariCreditCardStoreClass_block_invoke_cold_1(v0);
}

@end
