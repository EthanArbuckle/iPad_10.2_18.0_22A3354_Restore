@implementation RecursiveMLModel

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)sub_1D4441974();
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _TtC13SoundAnalysis16RecursiveMLModel *v9;
  id v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = sub_1D444217C((uint64_t)a3, (uint64_t)v8);

  swift_unknownObjectRelease();
  return v10;
}

- (_TtC13SoundAnalysis16RecursiveMLModel)init
{
  sub_1D44424C4();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
