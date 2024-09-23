@implementation EditorsChoiceBackgroundView

- (_TtC8AppStore27EditorsChoiceBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27EditorsChoiceBackgroundView *)sub_100237838(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27EditorsChoiceBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8AppStore27EditorsChoiceBackgroundView *result;

  v5 = OBJC_IVAR____TtC8AppStore27EditorsChoiceBackgroundView_imageView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8AppStore27EditorsChoiceBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/EditorsChoiceBackgroundView.swift", 42, 2, 67, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[EditorsChoiceBackgroundView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore27EditorsChoiceBackgroundView_imageView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27EditorsChoiceBackgroundView_imageView));
}

@end
