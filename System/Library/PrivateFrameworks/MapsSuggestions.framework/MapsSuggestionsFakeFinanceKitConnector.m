@implementation MapsSuggestionsFakeFinanceKitConnector

- (id)currentOrderPickupsWithPeriod:(double)a3
{
  void *v3;

  swift_beginAccess();
  type metadata accessor for MapsSuggestionsOrderPickup();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A43AB68C();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSArray)orderPickups
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for MapsSuggestionsOrderPickup();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A43AB68C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setOrderPickups:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for MapsSuggestionsOrderPickup();
  v4 = sub_1A43AB698();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector_orderPickups);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)_callbackHandle
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A429C078;
  aBlock[3] = &block_descriptor_2;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)set_callbackHandle:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A429C67C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A42856E0(v7);
}

- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector *v7;
  void *v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = self;
  v8 = (void *)sub_1A429C548((uint64_t)sub_1A428B4E0, v6);
  swift_unknownObjectRetain();

  swift_release();
  return v8;
}

- (void)updatedOrders
{
  void (**v3)(uint64_t);
  void (*v4)(uint64_t);
  _TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector *v5;
  uint64_t v6;

  v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    v5 = self;
    sub_1A42855E0((uint64_t)v4);
    v6 = swift_bridgeObjectRetain();
    v4(v6);
    sub_1A42856E0((uint64_t)v4);

    swift_bridgeObjectRelease();
  }
}

- (_TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector_orderPickups) = (Class)MEMORY[0x1E0DEE9D8];
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  v4 = (objc_class *)type metadata accessor for MapsSuggestionsFakeFinanceKitConnector();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[MapsSuggestionsFakeFinanceKitConnector init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A42856E0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle));
}

@end
