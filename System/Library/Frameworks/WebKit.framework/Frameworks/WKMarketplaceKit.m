@implementation WKMarketplaceKit

+ (void)requestAppInstallationWithTopOrigin:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, char *, uint64_t);
  uint64_t v33;
  void (**v34)(uint64_t);
  void (*v35)(char *, uint64_t);
  char *v36;
  char *v37;
  id v38;
  char *v39;
  uint64_t ObjCClassMetadata;
  char *v41;

  v38 = a4;
  ObjCClassMetadata = (uint64_t)a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v8;
  v9 = sub_2354A37A4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v37 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v36 - v14;
  v36 = (char *)&v36 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v36 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v36 - v19;
  v21 = _Block_copy(a5);
  sub_2354A3798();
  v41 = v18;
  sub_2354A3798();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v21;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v23 = sub_2354A3B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 1, 1, v23);
  v24 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v24(v15, v18, v9);
  v24((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v9);
  sub_2354A3AF8();
  swift_retain();
  v25 = sub_2354A3AEC();
  v26 = *(unsigned __int8 *)(v10 + 80);
  v27 = (v26 + 32) & ~v26;
  v28 = (v11 + v26 + v27) & ~v26;
  v29 = (v11 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = swift_allocObject();
  v31 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v30 + 16) = v25;
  *(_QWORD *)(v30 + 24) = v31;
  v32 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v32(v30 + v27, v36, v9);
  v32(v30 + v28, v37, v9);
  v33 = (uint64_t)v39;
  *(_QWORD *)(v30 + v29) = ObjCClassMetadata;
  v34 = (void (**)(uint64_t))(v30 + ((v29 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v34 = sub_23549B634;
  v34[1] = (void (*)(uint64_t))v22;
  sub_23549B0F8(v33, (uint64_t)&unk_2562362B8, v30);
  swift_release();
  swift_release();
  v35 = *(void (**)(char *, uint64_t))(v10 + 8);
  v35(v41, v9);
  v35(v20, v9);
}

- (WKMarketplaceKit)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[WKMarketplaceKit init](&v3, sel_init);
}

@end
