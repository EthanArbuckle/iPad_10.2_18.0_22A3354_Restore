@implementation AXNTKUserIsWheelchairUserWithVoiceOverOn

void __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v3 = 0;
  objc_msgSend(v0, "wheelchairUseWithError:", &v3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v3)
    AXNTKUserIsWheelchairUserWithVoiceOverOn___isWheelchair = objc_msgSend(v1, "wheelchairUse") == 2;

}

uint64_t __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
