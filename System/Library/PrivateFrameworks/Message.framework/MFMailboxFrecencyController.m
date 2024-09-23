@implementation MFMailboxFrecencyController

- (void).cxx_destruct
{
  swift_getObjectType();
  swift_release();
}

- (MFMailboxFrecencyController)initWithDatabase:(id)a3
{
  id v3;

  swift_getObjectType();
  v3 = a3;
  return (MFMailboxFrecencyController *)sub_1A5333D80(a3);
}

- (id)sortedArrayOfMailboxes:(id)a3
{
  id v4;
  MFMailboxFrecencyController *v5;
  uint64_t v7;
  void *v10;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  sub_1A521BC28();
  v7 = sub_1A594B958();
  sub_1A5334290(v7);
  swift_bridgeObjectRelease();

  v10 = (void *)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)sortedArrayOfMailboxesForAccount:(id)a3
{
  id v4;
  MFMailboxFrecencyController *v5;
  id v9;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  sub_1A533472C(a3);

  sub_1A521BC28();
  v9 = (id)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)recordEventWithMailboxIDs:(id)a3
{
  id v4;
  MFMailboxFrecencyController *v5;
  uint64_t v6;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  sub_1A5135668();
  v6 = sub_1A594B958();
  sub_1A5334968(v6);
  swift_bridgeObjectRelease();

}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  MFMailboxFrecencyController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A5334D58();

}

- (void)testResetFrecencyForAllMailboxes
{
  MFMailboxFrecencyController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A5335060();

}

- (void)test_tearDown
{
  MFMailboxFrecencyController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A53352B0();

}

- (MFMailboxFrecencyController)init
{
  swift_getObjectType();
  return (MFMailboxFrecencyController *)MFMailboxFrecencyController.init()();
}

@end
