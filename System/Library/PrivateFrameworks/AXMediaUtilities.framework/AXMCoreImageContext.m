@implementation AXMCoreImageContext

void __AXMCoreImageContext_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)_AXMContext;
  if (!_AXMContext)
  {
    objc_msgSend(*(id *)(a1 + 32), "measure:execute:", CFSTR("Create CIContext"), &__block_literal_global_136_0);
    v2 = (void *)_AXMContext;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __AXMCoreImageContext_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD90], "context");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AXMContext;
  _AXMContext = v0;

}

@end
