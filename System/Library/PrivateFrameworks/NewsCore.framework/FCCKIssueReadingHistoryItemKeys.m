@implementation FCCKIssueReadingHistoryItemKeys

id __FCCKIssueReadingHistoryItemKeys_block_invoke()
{
  if (qword_1ED0F7FF0 != -1)
    dispatch_once(&qword_1ED0F7FF0, &__block_literal_global_1209);
  return (id)qword_1ED0F7FE8;
}

void __FCCKIssueReadingHistoryItemKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("issueID"), CFSTR("lastVisited"), CFSTR("lastBadged"), CFSTR("lastEngaged"), CFSTR("lastSeen"), CFSTR("lastRemovedFromMyMagazines"), CFSTR("lastVisitedArticleID"), CFSTR("lastVisitedPageID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7FE8;
  qword_1ED0F7FE8 = v0;

}

@end
