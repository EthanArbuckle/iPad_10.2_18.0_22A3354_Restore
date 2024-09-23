@implementation MapsSuggestionsRealFinanceKitConnector

- (id)currentOrderPickupsWithPeriod:(double)a3
{
  void *v3;

  _s15MapsSuggestions0aB23RealFinanceKitConnectorC19currentOrderPickups6periodSayAA0abH6PickupCGSd_tF_0(a3);
  type metadata accessor for MapsSuggestionsOrderPickup();
  v3 = (void *)sub_1A43AB68C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC15MapsSuggestions38MapsSuggestionsRealFinanceKitConnector *v8;
  void *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = (void *)MapsSuggestionsRealFinanceKitConnector.startObservingOrderPickups(in:callback:)((uint64_t)sub_1A428B4E0, v7, a3);

  swift_release();
  return v9;
}

- (_TtC15MapsSuggestions38MapsSuggestionsRealFinanceKitConnector)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsRealFinanceKitConnector();
  return -[MapsSuggestionsRealFinanceKitConnector init](&v3, sel_init);
}

@end
