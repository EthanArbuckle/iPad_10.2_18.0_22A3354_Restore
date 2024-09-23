@implementation MapsSuggestionsFinanceKit

- (id)initFromResourceDepot:(id)a3
{
  id result;
  id v6;
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *v7;

  swift_unknownObjectRetain();
  result = objc_msgSend(a3, sel_oneFinanceKitConnector);
  if (result)
  {
    v6 = result;
    result = objc_msgSend(a3, sel_oneNetworkRequester);
    if (result)
    {
      v7 = -[MapsSuggestionsFinanceKit initWithConnector:requester:](self, sel_initWithConnector_requester_, v6, result);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return v7;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)initWithConnector:(id)a3 requester:(id)a4
{
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit *)sub_1A42A05F4((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

- (NSString)uniqueName
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setUniqueName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1A43AB62C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions25MapsSuggestionsFinanceKit_uniqueName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)canProduceEntriesOfTypeWithType:(int64_t)a3
{
  return a3 == 23;
}

- (void)updateOrdersWithOrders:(id)a3
{
  uint64_t v4;
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *v5;

  type metadata accessor for MapsSuggestionsOrderPickup();
  v4 = sub_1A43AB698();
  v5 = self;
  sub_1A429E1A8(v4);

  swift_bridgeObjectRelease();
}

- (void)startObservingForOrdersWithPeriod:(double)a3
{
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *v4;

  v4 = self;
  MapsSuggestionsFinanceKit.startObservingForOrders(period:)(a3);

}

- (void)stopObservingForOrders
{
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *v2;

  v2 = self;
  MapsSuggestionsFinanceKit.stopObservingForOrders()();

}

- (char)deleteOrDeclineEntryWithEntry:(id)a3 handler:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
  return 0;
}

- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)init
{
  _TtC15MapsSuggestions25MapsSuggestionsFinanceKit *result;

  result = (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1A429BAA8((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions25MapsSuggestionsFinanceKit__delegate);
  swift_unknownObjectRelease();

}

@end
