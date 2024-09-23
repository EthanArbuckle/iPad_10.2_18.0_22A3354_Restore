@implementation MapsSuggestionsContactActivity

- (NSString)uniqueName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_uniqueName;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_uniqueName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtP15MapsSuggestions38MapsSuggestionsContactActivityDelegate_)contactActivityDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_contactActivityDelegate;
  swift_beginAccess();
  return (_TtP15MapsSuggestions38MapsSuggestionsContactActivityDelegate_ *)(id)MEMORY[0x1A859D360](v2);
}

- (void)setContactActivityDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)initFromResourceDepot:(id)a3
{
  swift_unknownObjectRetain();
  return MapsSuggestionsContactActivity.init(fromResourceDepot:)(a3);
}

- (void)contactActivityEntriesWith:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t);
  _TtC15MapsSuggestions30MapsSuggestionsContactActivity *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A429BAA0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  MapsSuggestionsContactActivity.contactActivityEntries(with:)((uint64_t)v7, v6);
  sub_1A42856E0((uint64_t)v7);

}

- (_TtC15MapsSuggestions30MapsSuggestionsContactActivity)init
{
  _TtC15MapsSuggestions30MapsSuggestionsContactActivity *result;

  result = (_TtC15MapsSuggestions30MapsSuggestionsContactActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__biome));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__contacts));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__findMy));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__queue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A429BAA8((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_contactActivityDelegate);
}

@end
