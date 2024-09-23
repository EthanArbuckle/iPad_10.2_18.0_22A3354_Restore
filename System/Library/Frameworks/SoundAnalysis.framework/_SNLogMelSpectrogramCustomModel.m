@implementation _SNLogMelSpectrogramCustomModel

- (_SNLogMelSpectrogramCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = sub_1D451A5CC();
  return (_SNLogMelSpectrogramCustomModel *)sub_1D4484FD4((uint64_t)a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _SNLogMelSpectrogramCustomModel *v9;
  void *v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_1D4483D84(a3);

  swift_unknownObjectRelease();
  return v10;
}

- (_SNLogMelSpectrogramCustomModel)init
{
  sub_1D44855C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
