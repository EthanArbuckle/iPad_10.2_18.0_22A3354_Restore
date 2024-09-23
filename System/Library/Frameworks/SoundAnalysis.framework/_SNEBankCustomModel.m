@implementation _SNEBankCustomModel

- (_SNEBankCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = sub_1D451A5CC();
  return (_SNEBankCustomModel *)sub_1D4402B84((uint64_t)a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _SNEBankCustomModel *v9;
  void *v10;
  void *v11;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  sub_1D4402EDC(a3);
  v11 = v10;

  swift_unknownObjectRelease();
  return v11;
}

- (_SNEBankCustomModel)init
{
  sub_1D4403A68();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
