@implementation FCCKPuzzleTypeSettingsKeys

id __FCCKPuzzleTypeSettingsKeys_block_invoke()
{
  if (qword_1ED0F8090 != -1)
    dispatch_once(&qword_1ED0F8090, &__block_literal_global_1525);
  return (id)qword_1ED0F8088;
}

void __FCCKPuzzleTypeSettingsKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("puzzleTypeID"), CFSTR("settingsData"), CFSTR("lastSeenPuzzleIDs"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8088;
  qword_1ED0F8088 = v0;

}

@end
