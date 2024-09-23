@implementation SRCarPlayScrollView

- (_TtC4Siri19SRCarPlayScrollView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10008C1C8();
}

- (NSArray)preferredFocusEnvironments
{
  _TtC4Siri19SRCarPlayScrollView *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  sub_10008BEF0();
  v4 = v3;

  sub_100076100(&qword_10014FD40);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC4Siri19SRCarPlayScrollView)initWithFrame:(CGRect)a3
{
  _TtC4Siri19SRCarPlayScrollView *result;

  result = (_TtC4Siri19SRCarPlayScrollView *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRCarPlayScrollView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint));
}

@end
