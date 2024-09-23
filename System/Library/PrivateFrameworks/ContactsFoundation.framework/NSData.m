@implementation NSData

id __53__NSData_ContactsFoundation___cn_writeToURL_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "writeToURL:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2))v3 = *(void **)(a1 + 40);
  else
    v3 = 0;
  return v3;
}

@end
