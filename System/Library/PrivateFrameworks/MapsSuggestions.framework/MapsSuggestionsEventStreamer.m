@implementation MapsSuggestionsEventStreamer

- (NSString)uniqueName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_uniqueName;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setUniqueName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1A43AB62C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_uniqueName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)lookAheadPeriod
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_lookAheadPeriod);
}

- (double)pingInterval
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_pingInterval);
}

- (NSString)notificationName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__queue));
}

- (_TtC15MapsSuggestions10TimerClass)_scanTimer
{
  return (_TtC15MapsSuggestions10TimerClass *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer));
}

- (void)set_scanTimer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer) = (Class)a3;
  v3 = a3;

}

- (NSArray)_notifyTimers
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for TimerClass();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A43AB68C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)set_notifyTimers:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for TimerClass();
  v4 = sub_1A43AB698();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__notifyTimers);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (double)_delay
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__delay);
}

- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_1A43AB62C();
  v10 = v9;
  v11 = sub_1A43AB62C();
  return (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer *)MapsSuggestionsEventStreamer.init(lookAheadPeriod:pingInterval:notificationName:identifyingName:)(v8, v10, v11, v12, a3, a4);
}

- (void)broadcastEventFrom:(id)a3 to:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  _TtC15MapsSuggestions28MapsSuggestionsEventStreamer *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;

  v5 = sub_1A43AB44C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v14 - v10;
  sub_1A43AB428();
  sub_1A43AB428();
  v12 = self;
  MapsSuggestionsEventStreamer.broadcastEvent(from:to:)((uint64_t)v11, (uint64_t)v9);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (void)rescan
{
  _TtC15MapsSuggestions28MapsSuggestionsEventStreamer *v2;

  v2 = self;
  MapsSuggestionsEventStreamer.rescan()();

}

- (void)invalidateAllTimers
{
  _TtC15MapsSuggestions28MapsSuggestionsEventStreamer *v2;

  v2 = self;
  MapsSuggestionsEventStreamer.invalidateAllTimers()();

}

- (void)dealloc
{
  _TtC15MapsSuggestions28MapsSuggestionsEventStreamer *v2;
  objc_super v3;

  v2 = self;
  MapsSuggestionsEventStreamer.invalidateAllTimers()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsEventStreamer();
  -[MapsSuggestionsEventStreamer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer));
  swift_bridgeObjectRelease();
}

- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)init
{
  _TtC15MapsSuggestions28MapsSuggestionsEventStreamer *result;

  result = (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
