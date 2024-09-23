@implementation GDVURecognitionResult

- (GDEntityIdentifier)entityIdentifier
{
  return (GDEntityIdentifier *)GDVURecognitionResult.entityIdentifier.getter();
}

- (void)setEntityIdentifier:(id)a3
{
  id v4;
  GDVURecognitionResult *v5;

  v4 = a3;
  v5 = self;
  GDVURecognitionResult.entityIdentifier.setter(v4);

}

- (NSUUID)tag
{
  return (NSUUID *)sub_1AE8DB4A8(self, (uint64_t)a2, GDVURecognitionResult.tag.getter);
}

- (float)confidence
{
  return GDVURecognitionResult.confidence.getter();
}

- (GDVURecognitionResult)init
{
  GDVURecognitionResult.init()();
}

- (void).cxx_destruct
{

  swift_release();
}

@end
