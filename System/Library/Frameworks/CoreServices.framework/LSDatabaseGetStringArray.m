@implementation LSDatabaseGetStringArray

void ___LSDatabaseGetStringArray_block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)_CSStringCopyCFString();
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);

}

@end
