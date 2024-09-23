@implementation MapsSuggestionsEventKitStreamer

- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4
{
  return (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *)sub_1A42880D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MapsSuggestionsEventKitStreamer.init(resourceDepot:notificationName:));
}

- (void)_setupEventKit
{
  _TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *v2;

  v2 = self;
  sub_1A4288134();

}

- (void)_tearDownEventKit
{
  _TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *v2;

  v2 = self;
  sub_1A4288340(&OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKit, "Tore down EventKit.");

}

- (void)scanForStreamableEvents
{
  _TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *v2;

  v2 = self;
  MapsSuggestionsEventKitStreamer.scanForStreamableEvents()();

}

- (void)dealloc
{
  _TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *v2;

  v2 = self;
  MapsSuggestionsEventKitStreamer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKit));
  sub_1A4289E38((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__keyListenerBlock, (uint64_t *)&unk_1ED22EA38);
  swift_unknownObjectRelease();
  sub_1A4289E38((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKitObserver, (uint64_t *)&unk_1ED22EA38);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKitChangedCanKicker));
}

- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
  sub_1A4289798();
}

@end
