@implementation HKCBCentralManagerLoader

void __61___HKCBCentralManagerLoader_getCentralManagerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") == 5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v5 = (id)objc_msgSend(v2, "copy");
    v4 = _Block_copy(v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
