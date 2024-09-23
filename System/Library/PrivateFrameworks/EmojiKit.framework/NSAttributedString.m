@implementation NSAttributedString

void __72__NSAttributedString_Helper___enumerateTokenListsInReverse_handler_emk___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __73__NSAttributedString_Helper___enumerateTokenListsInRange_usingBlock_emk___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *a5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
  }

}

@end
