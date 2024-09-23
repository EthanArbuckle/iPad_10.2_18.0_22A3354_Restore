@implementation AAUISilverWorkoutAchievement

uint64_t __AAUISilverWorkoutAchievement_block_invoke(uint64_t a1, void *a2)
{
  return AAUIIsGoldAchievement(a2) ^ 1;
}

@end
