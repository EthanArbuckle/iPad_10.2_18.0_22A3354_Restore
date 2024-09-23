@implementation AudiogramDetectorModel

- (MLModel)model
{
  return (MLModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model));
}

- (void)setModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model) = (Class)a3;
  v3 = a3;

}

- (NSURL)url
{
  return (NSURL *)(id)sub_22FB8D088();
}

- (CGSize)modelInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize);
  v3 = *(double *)&self->model[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)confidenceThreshold
{
  return *(float *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold);
}

- (_TtC18AudiogramIngestion22AudiogramDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  double height;
  double width;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  height = a4.height;
  width = a4.width;
  sub_22FB8D0A0();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8D094();
  return (_TtC18AudiogramIngestion22AudiogramDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v9, width, height, a5);
}

- (_TtC18AudiogramIngestion22AudiogramDetectorModel)init
{
  _TtC18AudiogramIngestion22AudiogramDetectorModel *result;

  result = (_TtC18AudiogramIngestion22AudiogramDetectorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url;
  v4 = sub_22FB8D0A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_logger;
  v6 = sub_22FB8D10C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
