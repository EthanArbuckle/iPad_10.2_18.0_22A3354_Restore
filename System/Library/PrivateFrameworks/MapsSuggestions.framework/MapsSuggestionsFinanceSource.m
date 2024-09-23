@implementation MapsSuggestionsFinanceSource

+ (unint64_t)disposition
{
  return 2;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id result;
  id v6;
  id v7;
  id v8;
  id v9;

  swift_unknownObjectRetain();
  result = objc_msgSend(a3, sel_oneSourceDelegate);
  if (result)
  {
    v6 = result;
    result = objc_msgSend(a3, sel_oneFinanceKit);
    if (result)
    {
      v7 = result;
      v8 = objc_allocWithZone((Class)type metadata accessor for MapsSuggestionsFinanceSource());
      v9 = sub_1A429CABC((uint64_t)v6, v7);
      swift_unknownObjectRelease();
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)start
{
  _TtC15MapsSuggestions28MapsSuggestionsFinanceSource *v2;

  v2 = self;
  MapsSuggestionsFinanceSource.start()();

}

- (void)stop
{
  _TtC15MapsSuggestions28MapsSuggestionsFinanceSource *v2;

  v2 = self;
  MapsSuggestionsFinanceSource.stop()();

}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC15MapsSuggestions28MapsSuggestionsFinanceSource *v8;
  double v9;
  double v10;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A429DC3C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  MapsSuggestionsFinanceSource.updateSuggestionEntries(handler:)((uint64_t)v7, v6);
  v10 = v9;
  sub_1A42856E0((uint64_t)v7);

  return v10;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 23;
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id)initFromResourceDepot:(id)a3
{
  id result;

  swift_unknownObjectRetain();
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)init
{
  _TtC15MapsSuggestions28MapsSuggestionsFinanceSource *result;

  result = (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)initWithDelegate:(id)a3 name:(id)a4
{
  _TtC15MapsSuggestions28MapsSuggestionsFinanceSource *result;

  swift_unknownObjectRetain();
  result = (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A429BAA8((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__financeKit));
  sub_1A42856E0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__updateCompleteHandler));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource_queue));
}

@end
