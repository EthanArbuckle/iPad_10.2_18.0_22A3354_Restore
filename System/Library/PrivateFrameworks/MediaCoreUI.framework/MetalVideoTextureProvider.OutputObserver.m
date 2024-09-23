@implementation MetalVideoTextureProvider.OutputObserver

- (void)outputMediaDataWillChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver *v12;
  id v13;
  _TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254384360);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    v9 = v8;
    v10 = sub_2414B4FE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    sub_2414B4FC0();
    v11 = a3;
    v12 = self;
    v13 = v11;
    v14 = v12;
    v15 = sub_2414B4FB4();
    v16 = (_QWORD *)swift_allocObject();
    v17 = MEMORY[0x24BEE6930];
    v16[2] = v15;
    v16[3] = v17;
    v16[4] = v14;
    v16[5] = v9;
    sub_2413EE440((uint64_t)v7, (uint64_t)&unk_257124130, (uint64_t)v16);
    swift_release();

  }
}

- (void)dealloc
{
  _TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver *v2;

  v2 = self;
  sub_241362500();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (_TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver)init
{
  return (_TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver *)sub_2413626F4();
}

@end
