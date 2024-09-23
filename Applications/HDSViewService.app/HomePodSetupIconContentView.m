@implementation HomePodSetupIconContentView

- (_TtC14HDSViewService27HomePodSetupIconContentView)initWithCardStyle:(int64_t)a3
{
  return (_TtC14HDSViewService27HomePodSetupIconContentView *)sub_10004018C(a3);
}

- (_TtC14HDSViewService27HomePodSetupIconContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100041820();
}

- (void)updateConstraints
{
  _TtC14HDSViewService27HomePodSetupIconContentView *v2;

  v2 = self;
  sub_100040570();

}

- (_TtC14HDSViewService27HomePodSetupIconContentView)initWithFrame:(CGRect)a3
{
  _TtC14HDSViewService27HomePodSetupIconContentView *result;

  result = (_TtC14HDSViewService27HomePodSetupIconContentView *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.HomePodSetupIconContentView", 42, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupIconContentView_imageViewConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupIconContentView_bodyLabelConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupIconContentView_moreButtonConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupIconContentView_accountLabelConstraints]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupIconContentView_imageViews]);
}

@end
