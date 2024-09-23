@implementation MapsSuggestionsRealFindMyConnector

- (NSString)uniqueName
{
  return (NSString *)sub_1A428E0CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector_uniqueName);
}

- (void)setUniqueName:(id)a3
{
  sub_1A428E1A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector_uniqueName);
}

- (_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector)init
{
  return (_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector *)MapsSuggestionsRealFindMyConnector.init()();
}

- (void)listOfFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE714C50;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE714C58;
  v12[5] = v11;
  v13 = self;
  sub_1A428F574((uint64_t)v7, (uint64_t)&unk_1EE714C60, (uint64_t)v12);
  swift_release();
}

- (void)locationFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE714C30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE714C38;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A428F574((uint64_t)v9, (uint64_t)&unk_1EE714C40, (uint64_t)v14);
  swift_release();
}

- (void)latestLocationFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE714C10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE714C18;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A428F574((uint64_t)v9, (uint64_t)&unk_1EE714C20, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
