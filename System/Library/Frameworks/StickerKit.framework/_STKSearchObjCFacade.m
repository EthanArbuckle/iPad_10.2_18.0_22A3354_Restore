@implementation _STKSearchObjCFacade

- (BOOL)enableEmojiSearch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableEmojiSearch;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableEmojiSearch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableEmojiSearch;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)enableStickerSearch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableStickerSearch;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableStickerSearch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableStickerSearch;
  swift_beginAccess();
  *v4 = a3;
}

- (_STKSearchObjCFacade)init
{
  _STKSearchObjCFacade *result;

  _STKSearchObjCFacade.init()();
  return result;
}

- (void)search:(STKStickerSearchQuery *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKStickerSearchQuery *v15;
  _STKSearchObjCFacade *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256172D90;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179330;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256176470, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____STKSearchObjCFacade_logger;
  v4 = sub_234716224();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____STKSearchObjCFacade_stickerSearchDataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____STKSearchObjCFacade_emojiSearchDataSource);
}

@end
