@implementation NUStyleEngineMemoryResource

BOOL __90___NUStyleEngineMemoryResource_usingSharedMemoryResourceForDevice_withDescriptor_perform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  unint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
  {
    objc_msgSend(v3, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "memSize");
    v5 = v7 >= objc_msgSend(*(id *)(a1 + 40), "memSize");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
