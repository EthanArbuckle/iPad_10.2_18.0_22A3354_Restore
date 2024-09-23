@implementation OfferUpsellScenarioProvider

- (_TtC12NewsArticles27OfferUpsellScenarioProvider)init
{
  uint64_t v3;
  _TtC12NewsArticles27OfferUpsellScenarioProvider *result;

  v3 = OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_observers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_didProcessInitialOffer) = 0;

  result = (_TtC12NewsArticles27OfferUpsellScenarioProvider *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (int64_t)offerUpsellScenario
{
  _TtC12NewsArticles27OfferUpsellScenarioProvider *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B9F154C0();

  return v3;
}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_observers), sel_removeObject_, a3);
}

@end
