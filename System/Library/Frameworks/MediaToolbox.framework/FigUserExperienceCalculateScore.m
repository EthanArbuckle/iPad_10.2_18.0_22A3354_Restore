@implementation FigUserExperienceCalculateScore

void __FigUserExperienceCalculateScore_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x19403137C]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "scoreStreaming:", 0);
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_autoreleasePoolPop(v2);
}

@end
