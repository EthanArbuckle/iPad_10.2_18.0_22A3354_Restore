@implementation CNAutocompleteSharedLocalOnlyContactStore

void __CNAutocompleteSharedLocalOnlyContactStore_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v2, "setIncludeLocalContacts:", 1);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v2);
  v1 = (void *)CNAutocompleteSharedLocalOnlyContactStore_store;
  CNAutocompleteSharedLocalOnlyContactStore_store = v0;

}

@end
