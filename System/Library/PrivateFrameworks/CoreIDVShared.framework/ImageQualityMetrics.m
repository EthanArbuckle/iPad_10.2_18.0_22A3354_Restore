@implementation ImageQualityMetrics

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBBF820;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBBF820 = a3;
}

- (_TtC13CoreIDVShared19ImageQualityMetrics)init
{
  return (_TtC13CoreIDVShared19ImageQualityMetrics *)ImageQualityMetrics.init()();
}

- (_TtC13CoreIDVShared19ImageQualityMetrics)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared19ImageQualityMetrics *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared19ImageQualityMetrics *)sub_1CF98AE50();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared19ImageQualityMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_1CF98563C(v4);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))sub_1CF987C84);
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
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared19ImageQualityMetrics_fuzzyMatchAssessment));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
