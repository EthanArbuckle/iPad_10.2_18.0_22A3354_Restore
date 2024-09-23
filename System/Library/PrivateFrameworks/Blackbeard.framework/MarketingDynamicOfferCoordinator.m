@implementation MarketingDynamicOfferCoordinator

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10Blackbeard32MarketingDynamicOfferCoordinator *v15;
  uint64_t v16;
  id v17;

  v9 = sub_237319D24();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x23B80FF3C]((char *)self + OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub))
  {
    swift_getObjectType();
    v17 = a5;
    v13 = a3;
    v14 = a4;
    v15 = self;
    sub_237319D18();
    sub_236E7D458((unint64_t *)&unk_25679F200, (uint64_t (*)(uint64_t))MEMORY[0x24BE8E6B8], MEMORY[0x24BE8E6A8]);
    sub_23731B710();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_236EA3B50(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_236EA3B38);
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  sub_236EA3B50(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_236EA3BD4);
}

- (_TtC10Blackbeard32MarketingDynamicOfferCoordinator)init
{
  objc_super v4;

  *(_QWORD *)&self->eventHub[OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingDynamicOfferCoordinator();
  return -[MarketingDynamicOfferCoordinator init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_236EA954C((uint64_t)self + OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub);
  swift_unknownObjectWeakDestroy();
}

@end
