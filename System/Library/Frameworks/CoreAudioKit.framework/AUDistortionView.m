@implementation AUDistortionView

- (_TtC12CoreAudioKit16AUDistortionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16AUDistortionView *)sub_2131799C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16AUDistortionView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16AUDistortionView *)sub_213179D38(a3);
}

- (void)removeFromSuperview
{
  _TtC12CoreAudioKit16AUDistortionView *v2;

  v2 = self;
  sub_21317A298();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUDistortionView();
  -[AUDistortionView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC12CoreAudioKit16AUDistortionView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_21317A654(x, y, width, height);

}

- (void).cxx_destruct
{

  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_parameterDataSource, &qword_254B885E8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_collectionView));
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_delaySectionCellRegistration, &qword_254B885E0);
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_ringModSectionCellRegistration, &qword_254B885D8);
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_decimationSectionCellRegistration, &qword_254B885D0);
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_overdriveSectionCellRegistration, &qword_254B885C8);
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_globalSectionCellRegistration, &qword_254B885C0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_auAudioUnit));
}

@end
