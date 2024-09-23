@implementation HGMotionDataProvider

- (NSString)description
{
  return (NSString *)(id)sub_23DA9BAA0();
}

- (_TtC12HeadGestures20HGMotionDataProvider)init
{
  return (_TtC12HeadGestures20HGMotionDataProvider *)sub_23DA73C78();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider__isStreamingData;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
}

@end
