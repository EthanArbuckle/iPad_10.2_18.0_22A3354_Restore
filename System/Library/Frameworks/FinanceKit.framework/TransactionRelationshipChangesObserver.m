@implementation TransactionRelationshipChangesObserver

- (void)contextDidChangeNotificationWithNotification:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_2334EF4E4(v3);

  swift_release();
}

- (void)contextWillSaveNotificationWithNotification:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_2334F2A94();

  swift_release();
}

@end
