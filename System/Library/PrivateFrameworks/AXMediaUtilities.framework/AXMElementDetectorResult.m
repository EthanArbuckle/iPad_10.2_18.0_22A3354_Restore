@implementation AXMElementDetectorResult

- (CGRect)resultBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1B0EE4328((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)resultLabel
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label);
}

- (id)resultLabelName
{
  return sub_1B0EE43A0();
}

- (double)resultConfidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence);
}

- (_TtC16AXMediaUtilities24AXMElementDetectorResult)init
{
  _TtC16AXMediaUtilities24AXMElementDetectorResult *result;

  result = (_TtC16AXMediaUtilities24AXMElementDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
