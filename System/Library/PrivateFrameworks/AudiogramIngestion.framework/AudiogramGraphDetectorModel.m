@implementation AudiogramGraphDetectorModel

- (id)getGraphDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4
{
  uint64_t v4;
  CGImage *v6;
  _TtC18AudiogramIngestion27AudiogramGraphDetectorModel *v7;
  uint64_t v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = self;
  v8 = sub_22FB86B0C((uint64_t)v6, v4);

  if (v8)
  {
    type metadata accessor for AudiogramGraphDetectorResult();
    v9 = (void *)sub_22FB8D1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _TtC18AudiogramIngestion27AudiogramGraphDetectorModel *v15;
  uint64_t v17;

  height = a4.height;
  width = a4.width;
  v8 = sub_22FB8D0A0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - v13;
  sub_22FB8D094();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v15 = (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v12, width, height, a5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v15;
}

@end
