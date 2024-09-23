@implementation MarketingWebUserInterfaceCoordinator

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_236EAAE70);
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_236EAB024);
}

- (_TtC10Blackbeard36MarketingWebUserInterfaceCoordinator)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingWebUserInterfaceCoordinator();
  return -[MarketingWebUserInterfaceCoordinator init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
