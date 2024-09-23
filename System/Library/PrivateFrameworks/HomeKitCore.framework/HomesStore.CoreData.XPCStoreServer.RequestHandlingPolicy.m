@implementation HomesStore.CoreData.XPCStoreServer.RequestHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v3;
  id v5;
  _TtCCOC11HomeKitCore10HomesStore8CoreData14XPCStoreServer21RequestHandlingPolicy *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_228812E60(v3);

  return v3 & 1;
}

- (_TtCCOC11HomeKitCore10HomesStore8CoreData14XPCStoreServer21RequestHandlingPolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s21RequestHandlingPolicyCMa();
  return -[HomesStore.CoreData.XPCStoreServer.RequestHandlingPolicy init](&v3, sel_init);
}

@end
