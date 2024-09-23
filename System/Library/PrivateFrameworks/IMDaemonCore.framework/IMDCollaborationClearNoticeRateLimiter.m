@implementation IMDCollaborationClearNoticeRateLimiter

- (IMDCollaborationClearNoticeRateLimiter)init
{
  return (IMDCollaborationClearNoticeRateLimiter *)IMDCollaborationClearNoticeRateLimiter.init()();
}

- (BOOL)shouldSendWithNotice:(id)a3
{
  id v4;
  IMDCollaborationClearNoticeRateLimiter *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1D1608F98(v4);

  return self & 1;
}

- (void)didSendWithNotice:(id)a3
{
  id v4;
  IMDCollaborationClearNoticeRateLimiter *v5;

  v4 = a3;
  v5 = self;
  sub_1D1609A6C(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
