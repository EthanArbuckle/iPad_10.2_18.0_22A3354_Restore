@implementation _SNVGGishFrontEndProcessingCustomModel

- (_SNVGGishFrontEndProcessingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  _SNVGGishFrontEndProcessingCustomModel *result;

  sub_1D451A5CC();
  sub_1D446DF34(a3);
  return result;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _SNVGGishFrontEndProcessingCustomModel *v9;
  void *v10;
  void *v11;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  sub_1D446E738(a3);
  v11 = v10;

  swift_unknownObjectRelease();
  return v11;
}

- (_SNVGGishFrontEndProcessingCustomModel)init
{
  sub_1D446EF24();
}

- (void).cxx_destruct
{

}

@end
