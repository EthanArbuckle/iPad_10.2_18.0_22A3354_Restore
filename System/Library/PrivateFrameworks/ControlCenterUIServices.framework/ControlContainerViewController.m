@implementation ControlContainerViewController

- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC23ControlCenterUIServices30ControlContainerViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners) = 0;
  v4 = a3;

  result = (_TtC23ControlCenterUIServices30ControlContainerViewController *)sub_238506DAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC23ControlCenterUIServices30ControlContainerViewController *v2;

  v2 = self;
  sub_2384F63D8();

}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double *v7;

  v7 = (double *)((char *)self + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo);
  *(_QWORD *)v7 = v3;
  *((_QWORD *)v7 + 1) = v4;
  *((_QWORD *)v7 + 2) = v5;
  v7[3] = v6;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController), sel_setCompactContinuousCornerRadius_, a3, v6);
}

- (id)sourceView
{
  _TtC23ControlCenterUIServices30ControlContainerViewController *v2;
  id result;
  id v4;

  v2 = self;
  result = -[ControlContainerViewController view](v2, sel_view);
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  BSRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)continuousCornerRadius
{
  return *(double *)((char *)&self->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo);
}

- (BOOL)showsSquareCorners
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners);
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners) = a3;
}

- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ControlCenterUIServices30ControlContainerViewController *result;

  v4 = a4;
  result = (_TtC23ControlCenterUIServices30ControlContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController));
}

@end
