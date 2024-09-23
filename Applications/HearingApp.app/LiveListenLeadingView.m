@implementation LiveListenLeadingView

- (_TtC10HearingApp21LiveListenLeadingView)initWithCoder:(id)a3
{
  return (_TtC10HearingApp21LiveListenLeadingView *)sub_100005264(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  uint64_t *v4;
  double *v5;
  double v6;
  double v7;
  CGSize result;

  v4 = &OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize;
  if (a4 != 4)
    v4 = &OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize;
  v5 = (double *)((char *)self + *v4);
  v6 = *v5;
  v7 = v5[1];
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC10HearingApp21LiveListenLeadingView)initWithFrame:(CGRect)a3
{
  _TtC10HearingApp21LiveListenLeadingView *result;

  result = (_TtC10HearingApp21LiveListenLeadingView *)_swift_stdlib_reportUnimplementedInitializer("HearingApp.LiveListenLeadingView", 32, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

@end
