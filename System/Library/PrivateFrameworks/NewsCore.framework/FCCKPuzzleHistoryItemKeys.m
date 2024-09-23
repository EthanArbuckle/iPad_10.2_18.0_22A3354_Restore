@implementation FCCKPuzzleHistoryItemKeys

id __FCCKPuzzleHistoryItemKeys_block_invoke()
{
  if (qword_1ED0F8080 != -1)
    dispatch_once(&qword_1ED0F8080, &__block_literal_global_1515);
  return (id)qword_1ED0F8078;
}

void __FCCKPuzzleHistoryItemKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("puzzleID"), CFSTR("puzzleTypeID"), CFSTR("progressData"), CFSTR("progressLevel"), CFSTR("score"), CFSTR("rankID"), CFSTR("usedReveal"), CFSTR("playDuration"), CFSTR("lastPlayedDate"), CFSTR("completedDate"), CFSTR("firstCompletedDate"), CFSTR("firstPlayDuration"), CFSTR("bestScore"), CFSTR("difficulty"), CFSTR("publishDate"), CFSTR("behaviorFlags"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8078;
  qword_1ED0F8078 = v0;

}

@end
