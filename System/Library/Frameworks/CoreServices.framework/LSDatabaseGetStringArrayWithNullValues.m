@implementation LSDatabaseGetStringArrayWithNullValues

void ___LSDatabaseGetStringArrayWithNullValues_block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  v3 = (id)_CSStringCopyCFString();
  objc_msgSend(*(id *)(a1 + 32), "addPointer:");
  if (!v3)
  {
    v2 = *(_BYTE **)(a1 + 48);
    if (v2)
      *v2 = 1;
  }

}

@end
