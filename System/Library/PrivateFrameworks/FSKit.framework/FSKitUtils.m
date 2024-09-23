@implementation FSKitUtils

+ (id)stringWithFormatString:(id)a3 locale:(id)a4 arguments:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_23B2DC398();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23B2DC3B0();
  v11 = v10;
  sub_23B2DC38C();
  sub_23B2D4274(0, &qword_256A09D00);
  v12 = sub_23B2DC3C8();
  _sSo10FSKitUtilsC0A0E6string16withFormatString6locale9argumentsS2S_10Foundation6LocaleVSaySo8NSObjectCGtFZ_0(v9, v11, (uint64_t)v8, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = (void *)sub_23B2DC3A4();
  swift_bridgeObjectRelease();
  return v13;
}

- (FSKitUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSKitUtils;
  return -[FSKitUtils init](&v3, sel_init);
}

@end
