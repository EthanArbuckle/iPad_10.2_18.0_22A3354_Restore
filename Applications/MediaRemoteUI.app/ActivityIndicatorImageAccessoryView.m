@implementation ActivityIndicatorImageAccessoryView

- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
  v5 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView;
  v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/ActivityIndicatorImageAccessoryView.swift", 55, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  v2 = (char *)v5.receiver;
  -[ActivityIndicatorImageAccessoryView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  -[ActivityIndicatorImageAccessoryView sizeThatFits:](self, "sizeThatFits:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *result;

  result = (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.ActivityIndicatorImageAccessoryView", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView));
}

@end
