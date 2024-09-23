@implementation AXBoundingBox

- (NSString)description
{
  _TtC16AXMediaUtilities13AXBoundingBox *v2;
  void *v3;

  v2 = self;
  sub_1B0EE0F88();

  v3 = (void *)sub_1B0EF3110();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)postComputeWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5
{
  return sub_1B0EE22A0(a4, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(float))sub_1B0EE9754, (void (*)(uint64_t))type metadata accessor for AXMElementDetectorResult);
}

+ (id)postComputeClickabilityWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5
{
  return sub_1B0EE22A0(a4, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(float))sub_1B0EEA7D4, (void (*)(uint64_t))type metadata accessor for AXMClickabilityDetectorResult);
}

- (_TtC16AXMediaUtilities13AXBoundingBox)init
{
  _TtC16AXMediaUtilities13AXBoundingBox *result;

  result = (_TtC16AXMediaUtilities13AXBoundingBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  v3 = sub_1B0EF30A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
