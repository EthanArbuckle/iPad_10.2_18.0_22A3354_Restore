@implementation SFCard

void __49__SFCard_CRCard___interactionsByIntentDataHashes__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_interactionsByIntentDataHashes_interactionsByIntentDataHashes;
  _interactionsByIntentDataHashes_interactionsByIntentDataHashes = (uint64_t)v0;

}

uint64_t __41__SFCard_CRCard__loadCardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
