@implementation BKDescribeSenderSet

void ___BKDescribeSenderSet_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___BKDescribeSenderSet_block_invoke_2;
  v3[3] = &unk_1E81F6FA8;
  v4 = v1;
  objc_msgSend(v4, "appendCollection:withName:itemBlock:", v2, 0, v3);

}

id ___BKDescribeSenderSet_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", a2, 0, 0);
}

@end
