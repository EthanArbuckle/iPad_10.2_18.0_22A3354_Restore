@implementation MFMailboxFrecencyController.Implementation

- (id)sortedArrayOfMailboxes:(id)a3
{
  id v3;
  uint64_t v5;
  void *v7;

  v3 = a3;
  swift_retain();
  sub_1A521BC28();
  v5 = sub_1A594B958();
  sub_1A5334324(v5);
  swift_bridgeObjectRelease();

  swift_release();
  v7 = (void *)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)sortedArrayOfMailboxesForAccount:(id)a3
{
  id v3;
  id v6;

  v3 = a3;
  swift_retain();
  sub_1A5336024(a3);
  swift_release();

  sub_1A521BC28();
  v6 = (id)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)recordEventWithMailboxIDs:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  swift_retain();
  sub_1A5135668();
  v4 = sub_1A594B958();
  sub_1A5336210(v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end
