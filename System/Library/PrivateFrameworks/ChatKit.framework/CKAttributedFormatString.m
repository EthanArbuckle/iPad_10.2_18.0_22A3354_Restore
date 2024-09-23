@implementation CKAttributedFormatString

uint64_t __CKAttributedFormatString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t __CKAttributedFormatString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a6, a7, a3);
}

@end
