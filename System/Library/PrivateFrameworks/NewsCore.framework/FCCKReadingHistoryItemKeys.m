@implementation FCCKReadingHistoryItemKeys

id __FCCKReadingHistoryItemKeys_block_invoke()
{
  if (qword_1ED0F7FE0 != -1)
    dispatch_once(&qword_1ED0F7FE0, &__block_literal_global_1180);
  return (id)_MergedGlobals_159;
}

void __FCCKReadingHistoryItemKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("articleID"), CFSTR("sourceChannelTagID"), CFSTR("deviceID"), CFSTR("lastVisited"), CFSTR("articleRead"), CFSTR("articleSeen"), CFSTR("completedListening"), CFSTR("completedReading"), CFSTR("articleConsumed"), CFSTR("liked"), CFSTR("disliked"), CFSTR("offensive"), CFSTR("listenedCount"), CFSTR("listeningProgress"), CFSTR("listeningProgressLastSaved"), CFSTR("lastListened"), CFSTR("readingPosition"),
    CFSTR("readingPositionLastSaved"),
    CFSTR("readCount"),
    CFSTR("removedFromAudio"),
    CFSTR("pruningDisabled"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_159;
  _MergedGlobals_159 = v0;

}

@end
