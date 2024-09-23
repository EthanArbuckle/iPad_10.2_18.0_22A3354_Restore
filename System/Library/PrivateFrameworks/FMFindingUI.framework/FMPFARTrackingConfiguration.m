@implementation FMPFARTrackingConfiguration

+ (NSArray)supportedVideoFormats
{
  void *v2;

  swift_getObjCClassMetadata();
  sub_23AA0F4A0();
  sub_23A968488(0, &qword_2569D8518);
  v2 = (void *)sub_23AA330A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC11FMFindingUI27FMPFARTrackingConfiguration)init
{
  return (_TtC11FMFindingUI27FMPFARTrackingConfiguration *)sub_23AA100DC(self, (uint64_t)a2, (SEL *)&selRef_init);
}

- (id)initPrivate
{
  return sub_23AA100DC(self, (uint64_t)a2, (SEL *)&selRef_initPrivate);
}

@end
