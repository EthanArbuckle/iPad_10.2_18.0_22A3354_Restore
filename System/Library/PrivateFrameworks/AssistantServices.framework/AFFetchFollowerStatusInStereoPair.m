@implementation AFFetchFollowerStatusInStereoPair

void __AFFetchFollowerStatusInStereoPair_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

@end
