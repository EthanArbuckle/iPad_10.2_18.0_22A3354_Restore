@implementation SVSLEDPasscodeActivityIndicatorView

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  _TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *v6;

  v5 = a3;
  v6 = self;
  sub_10007A9DC(v5);

}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)init
{
  return (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *)sub_100078904();
}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007ABD4();
}

- (void)layoutSubviews
{
  _TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *v2;

  v2 = self;
  sub_100078D14();

}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *result;

  result = (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.SVSLEDPasscodeActivityIndicatorView", 50, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_viewFinderTintLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_viewFinderBorderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_borderLayerMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_initialWhiteTintLayer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->viewFinderTintLayer[OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_rotKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->viewFinderTintLayer[OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_colorsKey]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_initialColors));
}

@end
