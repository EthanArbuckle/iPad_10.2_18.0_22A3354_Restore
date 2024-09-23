@implementation HKEnumerateUUIDsInCollection

uint64_t ___HKEnumerateUUIDsInCollection_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "hk_UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v3 = 1;

  return v3;
}

@end
