@implementation CSSearchableItemAdapter

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  FPTag *v6;
  FPTag *v7;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v2 = a2;
  v9 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = getMDPropertyCopyUserTagNameSymbolLoc_ptr;
  v13 = getMDPropertyCopyUserTagNameSymbolLoc_ptr;
  if (!getMDPropertyCopyUserTagNameSymbolLoc_ptr)
  {
    v4 = (void *)MetadataUtilitiesLibrary_0();
    v3 = dlsym(v4, "MDPropertyCopyUserTagName");
    v11[3] = (uint64_t)v3;
    getMDPropertyCopyUserTagNameSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
    __32___CSSearchableItemAdapter_tags__block_invoke_cold_1();
  v5 = (void *)((uint64_t (*)(id, unsigned __int8 *))v3)(v2, &v9);
  v6 = [FPTag alloc];
  v7 = -[FPTag initWithLabel:color:](v6, "initWithLabel:color:", v5, v9);

  return v7;
}

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  FPTag *v6;
  void *v7;
  FPTag *v8;

  v5 = a2;
  v6 = [FPTag alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPTag initWithLabel:color:](v6, "initWithLabel:color:", v5, objc_msgSend(v7, "intValue"));

  return v8;
}

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  FPTag *v3;

  v2 = a2;
  v3 = -[FPTag initWithLabel:color:]([FPTag alloc], "initWithLabel:color:", v2, 0);

  return v3;
}

void __32___CSSearchableItemAdapter_tags__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _MDPropertyCopyUserTagName(CFStringRef, uint8_t *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 75, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

@end
