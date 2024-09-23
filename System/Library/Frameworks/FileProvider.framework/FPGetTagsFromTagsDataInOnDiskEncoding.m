@implementation FPGetTagsFromTagsDataInOnDiskEncoding

FPTag *__FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke(uint64_t a1, void *a2)
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
  v3 = getMDPropertyCopyUserTagNameSymbolLoc_ptr_0;
  v13 = getMDPropertyCopyUserTagNameSymbolLoc_ptr_0;
  if (!getMDPropertyCopyUserTagNameSymbolLoc_ptr_0)
  {
    v4 = (void *)MetadataUtilitiesLibrary_1();
    v3 = dlsym(v4, "MDPropertyCopyUserTagName");
    v11[3] = (uint64_t)v3;
    getMDPropertyCopyUserTagNameSymbolLoc_ptr_0 = v3;
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
    __FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke_cold_1();
  v5 = (void *)((uint64_t (*)(id, unsigned __int8 *))v3)(v2, &v9);
  if (v5)
  {
    v6 = [FPTag alloc];
    v7 = -[FPTag initWithLabel:color:](v6, "initWithLabel:color:", v5, v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _MDPropertyCopyUserTagName(CFStringRef, uint8_t *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPTools.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
