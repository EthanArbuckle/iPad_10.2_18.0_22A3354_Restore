@implementation CLKComplicationTemplateAssertionBlock

void __CLKComplicationTemplateAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "markCalled");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
