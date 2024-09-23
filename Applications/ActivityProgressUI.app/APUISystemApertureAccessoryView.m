@implementation APUISystemApertureAccessoryView

- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithCoder:(id)a3
{
  _TtC18ActivityProgressUI31APUISystemApertureAccessoryView *result;

  result = (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUISystemApertureElementHostingController.swift", 67, 2, 306, 0);
  __break(1u);
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for APUISystemApertureAccessoryView();
  -[APUISystemApertureAccessoryView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for APUISystemApertureAccessoryView();
  v7 = (char *)v10.receiver;
  -[APUISystemApertureAccessoryView setFrame:](&v10, "setFrame:", x, y, width, height);
  v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController], "view", v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, "bounds");
    objc_msgSend(v9, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController), "preferredContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC18ActivityProgressUI31APUISystemApertureAccessoryView *result;

  result = (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView *)_swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUISystemApertureAccessoryView", 50, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController));
}

@end
