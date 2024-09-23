@implementation FMPFRingView

- (_TtC11FMFindingUI12FMPFRingView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC11FMFindingUI12FMPFRingView *result;

  v4 = OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_style;
  v5 = qword_2569D4B10;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v7 = (char *)self + v4;
  v8 = qword_2569D6E80;
  v9 = (void *)qword_2569D6E88;
  *(_OWORD *)v7 = xmmword_2569D6E70;
  *((_QWORD *)v7 + 2) = v8;
  *((_QWORD *)v7 + 3) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_additionalRadiusScale) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_startAngle) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_endAngle) = 0;
  v10 = v9;

  result = (_TtC11FMFindingUI12FMPFRingView *)sub_23AA335A8();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_23A968488(0, &qword_2569D6F10);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)description
{
  _TtC11FMFindingUI12FMPFRingView *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11FMFindingUI12FMPFRingView *v2;

  v2 = self;
  sub_23A9B8668();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_startAngleSpring));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_additionalRadiusScaleSpring));

}

- (void)drawRect:(CGRect)a3
{
  _TtC11FMFindingUI12FMPFRingView *v3;

  v3 = self;
  sub_23A9B9888();

}

- (_TtC11FMFindingUI12FMPFRingView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI12FMPFRingView *result;

  result = (_TtC11FMFindingUI12FMPFRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
