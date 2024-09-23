@implementation StubFCIssueReadingHistoryType

- (BOOL)hasIssueWithIDBeenVisited:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenBadged:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenEngaged:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenSeen:(id)a3
{
  return 0;
}

- (id)bookmarkForLastVisitToIssueWithID:(id)a3
{
  return 0;
}

- (id)lastVisitedDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastEngagedDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastSeenDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3
{
  return 0;
}

- (NSString)mostRecentlyVisitedIssueID
{
  return (NSString *)0;
}

- (NSArray)allEngagedIssueIDs
{
  return (NSArray *)(id)sub_1D6E26D68();
}

- (void)prepareForUseWithCompletion:(id)a3
{
  _QWORD *v3;
  void (*v4)(_QWORD *);

  v3 = _Block_copy(a3);
  v4 = (void (*)(_QWORD *))v3[2];
  swift_retain();
  v4(v3);
  _Block_release(v3);
  swift_release();
}

@end
