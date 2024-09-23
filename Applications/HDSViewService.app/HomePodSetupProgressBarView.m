@implementation HomePodSetupProgressBarView

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCardStyle:(int64_t)a3
{
  return (_TtC14HDSViewService27HomePodSetupProgressBarView *)sub_10007B144(a3);
}

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007C5E8();
}

- (void)updateConstraints
{
  _TtC14HDSViewService27HomePodSetupProgressBarView *v2;

  v2 = self;
  sub_10007B510();

}

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithFrame:(CGRect)a3
{
  _TtC14HDSViewService27HomePodSetupProgressBarView *result;

  result = (_TtC14HDSViewService27HomePodSetupProgressBarView *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.HomePodSetupProgressBarView", 42, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupProgressBarView_imageViewConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupProgressBarView_progressViewConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupProgressBarView_bodyLabelConstraints]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupProgressBarView_imageViews]);
}

@end
