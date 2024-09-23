@implementation AudiogramSymbolDetectorModel

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5 classNames:(id)a6 collisionMitigationClassNames:(id)a7
{
  double height;
  double width;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  objc_class *v18;
  objc_class *v19;
  _TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *v20;
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v11 = sub_22FB8D0A0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v22 - v16;
  sub_22FB8D094();
  v18 = (objc_class *)sub_22FB8D1D8();
  v19 = (objc_class *)sub_22FB8D1D8();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames) = v18;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames) = v19;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v20 = (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v15, width, height, a5);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return v20;
}

- (id)getSymbolDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4 in:(id)a5
{
  uint64_t v6;
  CGImage *v8;
  id v9;
  _TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *v10;
  uint64_t v11;
  void *v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = self;
  v11 = sub_22FB85A28(v8, v6, (uint64_t)v9);

  if (v11)
  {
    type metadata accessor for AudiogramSymbolDetectorResult();
    v12 = (void *)sub_22FB8D1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  uint64_t v5;
  _TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *result;

  v5 = sub_22FB8D0A0();
  MEMORY[0x24BDAC7A8](v5);
  sub_22FB8D094();
  result = (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
