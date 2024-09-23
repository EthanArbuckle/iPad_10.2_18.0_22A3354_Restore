@implementation MapsSuggestionsWalletStreamer

- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4
{
  return (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *)sub_1A42880D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MapsSuggestionsWalletStreamer.init(resourceDepot:notificationName:));
}

- (void)_setupWallet
{
  _TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *v2;

  v2 = self;
  sub_1A4286AC4();

}

- (void)_tearDownWallet
{
  _TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *v2;

  v2 = self;
  sub_1A4288340(&OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__wallet, "Tore down Wallet.");

}

- (void)scanForStreamableEvents
{
  _TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *v2;

  v2 = self;
  MapsSuggestionsWalletStreamer.scanForStreamableEvents()();

}

- (void)dealloc
{
  _TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *v2;

  v2 = self;
  MapsSuggestionsWalletStreamer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__wallet));
  sub_1A4289E38((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__keyListenerBlock, (uint64_t *)&unk_1ED22EA38);
  swift_unknownObjectRelease();
  sub_1A4289E38((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__passKitObserver, (uint64_t *)&unk_1ED22EA38);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__passKitChangedCanKicker));
}

- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
  sub_1A4289798();
}

@end
