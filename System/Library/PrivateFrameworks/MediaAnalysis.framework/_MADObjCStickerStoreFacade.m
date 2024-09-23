@implementation _MADObjCStickerStoreFacade

- (_MADObjCStickerStoreFacade)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _MADObjCStickerStoreFacade *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  objc_class *v14;
  objc_super v16;

  v3 = sub_1B6FA0D54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](*(_QWORD **)(v4 + 64), v3, v5, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1B6FA0D30();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v8, *MEMORY[0x1E0DACAA8], v3);
  v10 = sub_1B6FA0D60();
  swift_allocObject();
  v11 = sub_1B6FA0D48();
  v12 = MEMORY[0x1E0DACAD0];
  v13 = (uint64_t *)((char *)v9 + OBJC_IVAR____MADObjCStickerStoreFacade_store);
  v13[3] = v10;
  v13[4] = v12;
  *v13 = v11;

  v14 = (objc_class *)type metadata accessor for _MADObjCStickerStoreFacade();
  v16.receiver = v9;
  v16.super_class = v14;
  return -[_MADObjCStickerStoreFacade init](&v16, sel_init);
}

- (BOOL)addAnimatedRepresentationWithIdentifiers:(id)a3 data:(id)a4 uti:(id)a5 size:(CGSize)a6 isPreferred:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  id v19;
  _MADObjCStickerStoreFacade *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  uint64_t v26;

  v25[1] = a8;
  v8 = a7;
  v26 = sub_1B6FA0D18();
  v12 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](*(_QWORD **)(v12 + 64), v26, v13, v14);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6FA0CC4();
  v17 = sub_1B6FA0E50();
  v18 = a4;
  v19 = a5;
  v20 = self;
  v21 = sub_1B6FA0CAC();
  v23 = v22;

  sub_1B6FA0D0C();
  sub_1B6F57E34(v17, v21, v23, (uint64_t)v16, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v26);

  sub_1B6F587B4(v21, v23);
  swift_bridgeObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____MADObjCStickerStoreFacade_store);
  v3 = (char *)self + OBJC_IVAR____MADObjCStickerStoreFacade_logger;
  v4 = sub_1B6FA0D3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
