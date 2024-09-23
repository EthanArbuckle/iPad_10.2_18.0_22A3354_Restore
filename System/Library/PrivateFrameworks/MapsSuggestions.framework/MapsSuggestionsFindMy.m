@implementation MapsSuggestionsFindMy

- (id)initFromResourceDepot:(id)a3
{
  _TtC15MapsSuggestions21MapsSuggestionsFindMy *v5;
  id result;
  _TtC15MapsSuggestions21MapsSuggestionsFindMy *v7;
  objc_super v8;

  swift_unknownObjectRetain();
  v5 = self;
  result = objc_msgSend(a3, sel_oneFindMyConnector);
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC15MapsSuggestions21MapsSuggestionsFindMy__connector) = (Class)result;

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for MapsSuggestionsFindMy();
    v7 = -[MapsSuggestionsFindMy init](&v8, sel_init);
    swift_unknownObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)verifyFriendshipWith:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSArray *v14;
  _TtC15MapsSuggestions21MapsSuggestionsFindMy *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7146A8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE7146B0;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1A428F574((uint64_t)v8, (uint64_t)&unk_1EE7146B8, (uint64_t)v13);
  swift_release();
}

- (void)locationOf:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  MapsSuggestionsEntry *v14;
  _TtC15MapsSuggestions21MapsSuggestionsFindMy *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE714688;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE714690;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1A428F574((uint64_t)v8, (uint64_t)&unk_1EE714698, (uint64_t)v13);
  swift_release();
}

- (_TtC15MapsSuggestions21MapsSuggestionsFindMy)init
{
  _TtC15MapsSuggestions21MapsSuggestionsFindMy *result;

  result = (_TtC15MapsSuggestions21MapsSuggestionsFindMy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
