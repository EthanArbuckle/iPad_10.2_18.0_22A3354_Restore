@implementation MotionCacheAssetLoader

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  id v20;
  _TtC11MediaCoreUI22MotionCacheAssetLoader *v21;
  id v22;
  _TtC11MediaCoreUI22MotionCacheAssetLoader *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  id v28;
  char *v29;

  v28 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254384360);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2414B2A88();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v28 - v15;
  sub_2414B2A64();
  v17 = sub_2414B4FE4();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v29 = v9;
  v18(v9, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
  v19 = qword_257120B60;
  v20 = a4;
  v21 = self;
  v22 = v20;
  v23 = v21;
  v28 = v28;
  if (v19 != -1)
    swift_once();
  v24 = qword_257137250;
  v25 = sub_2412C8030(&qword_25712B120, (uint64_t (*)(uint64_t))type metadata accessor for MotionCacheActor, (uint64_t)&unk_2414CD288);
  v26 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v27 = (char *)swift_allocObject();
  *((_QWORD *)v27 + 2) = v24;
  *((_QWORD *)v27 + 3) = v25;
  *((_QWORD *)v27 + 4) = v22;
  *((_QWORD *)v27 + 5) = v23;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v27[v26], v13, v10);
  swift_retain();
  sub_2413EE440((uint64_t)v29, (uint64_t)&unk_25712B568, (uint64_t)v27);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC11MediaCoreUI22MotionCacheAssetLoader *v15;
  id v16;
  _TtC11MediaCoreUI22MotionCacheAssetLoader *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254384360);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2414B4FE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = qword_257120B60;
  v14 = a4;
  v15 = self;
  v16 = a5;
  v17 = v15;
  v18 = v14;
  v19 = v16;
  v20 = a3;
  if (v13 != -1)
    swift_once();
  v21 = qword_257137250;
  v22 = sub_2412C8030(&qword_25712B120, (uint64_t (*)(uint64_t))type metadata accessor for MotionCacheActor, (uint64_t)&unk_2414CD288);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v21;
  v23[3] = v22;
  v23[4] = v17;
  v23[5] = v18;
  v23[6] = v19;
  swift_retain();
  sub_2413EE440((uint64_t)v11, (uint64_t)&unk_25712B520, (uint64_t)v23);

  swift_release();
}

- (_TtC11MediaCoreUI22MotionCacheAssetLoader)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC11MediaCoreUI22MotionCacheAssetLoader *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_downloadContainers;
  v5 = self;
  v6 = MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_24131262C(MEMORY[0x24BEE4AF8]);
  v7 = OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_assetDownloadTasksMapping;
  *(Class *)((char *)&v5->super.isa + v7) = (Class)sub_2413131A4(v6);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_requestedCancelations) = (Class)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader____lazy_storage___downloadSession) = 0;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return -[MotionCacheAssetLoader init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader____lazy_storage___downloadSession));
}

@end
