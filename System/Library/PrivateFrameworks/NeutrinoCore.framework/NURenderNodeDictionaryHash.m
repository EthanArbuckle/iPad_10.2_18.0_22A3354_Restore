@implementation NURenderNodeDictionaryHash

void __NURenderNodeDictionaryHash_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= 0x18482028EBA975 * objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= 0x20E47795B02877 * (_QWORD)a3;

}

@end
