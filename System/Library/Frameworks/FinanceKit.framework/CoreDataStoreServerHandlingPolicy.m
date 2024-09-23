@implementation CoreDataStoreServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v4;
  _TtC10FinanceKit33CoreDataStoreServerHandlingPolicy *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_233293228(v4);

  return v6 & 1;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  void *v3;

  if (sub_233293400())
  {
    v3 = (void *)sub_23361E5B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_TtC10FinanceKit33CoreDataStoreServerHandlingPolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataStoreServerHandlingPolicy();
  return -[CoreDataStoreServerHandlingPolicy init](&v3, sel_init);
}

@end
