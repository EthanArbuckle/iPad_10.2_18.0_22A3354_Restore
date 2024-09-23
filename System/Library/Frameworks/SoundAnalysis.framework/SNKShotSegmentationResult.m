@implementation SNKShotSegmentationResult

- (SNKShotSegmentationResult)init
{
  SNKShotSegmentationResult *result;

  SNKShotSegmentationResult.init()((uint64_t)self);
  return result;
}

- (MLMultiArray)exemplarEmbedding
{
  SNKShotSegmentationResult *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D42C4BD4();
  v4 = v3;

  return (MLMultiArray *)v4;
}

- (void)setExemplarEmbedding:(id)a3
{
  id v4;
  SNKShotSegmentationResult *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C4C44((uint64_t)v4);

}

- (NSArray)segments
{
  SNKShotSegmentationResult *v2;
  void *v3;

  v2 = self;
  sub_1D42C4D54();

  type metadata accessor for SNKShotSegment(0);
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setSegments:(id)a3
{
  sub_1D42C3B68(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for SNKShotSegment);
}

- (NSNumber)exemplarIndex
{
  SNKShotSegmentationResult *v2;
  id v3;

  v2 = self;
  v3 = sub_1D42C5118();

  return (NSNumber *)v3;
}

- (void)setExemplarIndex:(id)a3
{
  id v4;
  SNKShotSegmentationResult *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C51A4(v4);

}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNKShotSegmentationResult_impl);
  swift_bridgeObjectRelease();
  sub_1D42CB630(v2);
}

@end
