@implementation FCCKAudioPlaylistItemKeys

id __FCCKAudioPlaylistItemKeys_block_invoke()
{
  if (qword_1ED0F8040 != -1)
    dispatch_once(&qword_1ED0F8040, &__block_literal_global_1317);
  return (id)qword_1ED0F8038;
}

void __FCCKAudioPlaylistItemKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("articleID"), CFSTR("dateAdded"), CFSTR("order"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8038;
  qword_1ED0F8038 = v0;

}

@end
