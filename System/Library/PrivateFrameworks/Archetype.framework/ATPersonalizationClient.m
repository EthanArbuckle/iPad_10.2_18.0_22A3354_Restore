@implementation ATPersonalizationClient

- (_TtC9Archetype23ATPersonalizationClient)init
{
  return (_TtC9Archetype23ATPersonalizationClient *)ATPersonalizationClient.init()();
}

- (void)freeNowWithExcludeAllDayEvents:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC9Archetype23ATPersonalizationClient *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256432CE8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = v9;
  *(_QWORD *)(v10 + 32) = self;
  v11 = sub_236A48EE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256432D58;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256432D60;
  v13[5] = v12;
  v14 = self;
  sub_236A48154((uint64_t)v8, (uint64_t)&unk_256432D68, (uint64_t)v13);
  swift_release();
}

- (void)topPlayedMediaWithK:(int64_t)a3 start:(int64_t)a4 end:(int64_t)a5 mediaType:(NSString *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  _TtC9Archetype23ATPersonalizationClient *v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256432CE8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  v17 = sub_236A48EE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256432D38;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256432D40;
  v19[5] = v18;
  v20 = a6;
  v21 = self;
  sub_236A48154((uint64_t)v14, (uint64_t)&unk_256432D48, (uint64_t)v19);
  swift_release();
}

- (void)currentLocationWithEffectiveBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _TtC9Archetype23ATPersonalizationClient *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256432CE8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_236A48EE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256432CF8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256432D08;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_236A48154((uint64_t)v8, (uint64_t)&unk_256432D18, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
