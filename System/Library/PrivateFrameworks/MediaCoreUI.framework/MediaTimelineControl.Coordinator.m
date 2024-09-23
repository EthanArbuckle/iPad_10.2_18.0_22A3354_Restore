@implementation MediaTimelineControl.Coordinator

- (float)minValue
{
  return 0.0;
}

- (float)maxValue
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_maxValue);
}

- (void)setMaxValue:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_maxValue) = a3;
}

- (float)currentValue
{
  return *(float *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_currentValue);
}

- (void)setCurrentValue:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_currentValue) = a3;
}

- (BOOL)isPlaying
{
  return 1;
}

- (BOOL)isLoading
{
  return 0;
}

- (NSString)currentValueText
{
  return (NSString *)0;
}

- (NSString)maxValueText
{
  return (NSString *)0;
}

- (NSArray)timeRangeMarks
{
  void *v2;

  sub_2412CC884(0, (unint64_t *)&unk_257126640);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2414B4EB8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setTimeRangeMarks:(id)a3
{
  sub_2412CC884(0, (unint64_t *)&unk_257126640);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_timeRangeMarks) = (Class)sub_2414B4EC4();
  swift_bridgeObjectRelease();
}

- (void)mediaTimelineControl:(id)a3 didChangeScrubbingRate:(unint64_t)a4
{
  id v6;
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *v7;

  swift_getKeyPath();
  sub_2412C8030(&qword_257125450, type metadata accessor for ScrubberViewModel, (uint64_t)&unk_2414C1898);
  v6 = a3;
  v7 = self;
  swift_retain();
  sub_2414B2B78();

  swift_release();
  swift_release();
}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4;
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2413AFD84(v4);

}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  id v6;
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *v7;

  v6 = a3;
  v7 = self;
  sub_2413C514C(a4);

}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4;
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2413B0108(v4);

}

- (void)mediaTimelineControl:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = self;
  sub_2413C5380(top, left, bottom, right);

}

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  double Height;
  double v5;
  CGSize result;

  Height = CGRectGetHeight(a4);
  v5 = 1.9047619;
  result.height = Height;
  result.width = v5;
  return result;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  void *v4;
  double v5;

  v4 = (void *)objc_opt_self();
  LODWORD(v5) = 0;
  return objc_msgSend(v4, sel_maskedTimeRangeMarkUIProxyWithCornerRadius_, v5);
}

- (_TtCV11MediaCoreUI20MediaTimelineControl11Coordinator)init
{
  _TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *result;

  result = (_TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_2412CBE78((uint64_t)self + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_contrast, &qword_257126670);
}

@end
