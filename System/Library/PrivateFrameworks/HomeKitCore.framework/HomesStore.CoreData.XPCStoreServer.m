@implementation HomesStore.CoreData.XPCStoreServer

- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4
{
  id v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a4;
  swift_retain();
  v7 = a3;
  LOBYTE(v4) = sub_2287F8278(a3, v4);

  swift_release();
  return v4 & 1;
}

@end
