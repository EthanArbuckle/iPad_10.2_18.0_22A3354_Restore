@implementation FIUIUserHasExistingExerciseAndStandGoals

void __FIUIUserHasExistingExerciseAndStandGoals_block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD3DC0], "standGoal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FIUIUserHasExistingSampleOfTypesPassingFilter(v3, v5, &__block_literal_global_358, *(void **)(a1 + 40));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

@end
