@implementation MXExtensionDispatchCenter

void __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __57___MXExtensionDispatchCenter_addExtensionsUpdateHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)MEMORY[0x18D778DB8](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __59___MXExtensionDispatchCenter_removeExtensionUpdateHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)MEMORY[0x18D778DB8](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "removeObject:", v2);

}

@end
