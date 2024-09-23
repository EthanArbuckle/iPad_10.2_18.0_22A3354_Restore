@implementation TabOverviewNavigationBarTitleView

- (_TtC12MobileSafari33TabOverviewNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari33TabOverviewNavigationBarTitleView *)sub_18B9C98BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari33TabOverviewNavigationBarTitleView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari33TabOverviewNavigationBarTitleView *)sub_18B9C9B34(a3);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabOverviewNavigationBarTitleView();
  v2 = v3.receiver;
  -[TabOverviewNavigationBarTitleView layoutSubviews](&v3, sel_layoutSubviews);
  sub_18B9CB73C();
  sub_18B9CBBD0();

}

- (void)cancelRetitling
{
  _TtC12MobileSafari33TabOverviewNavigationBarTitleView *v2;

  v2 = self;
  sub_18B9CBD6C();

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC12MobileSafari33TabOverviewNavigationBarTitleView *v5;

  v4 = a3;
  v5 = self;
  sub_18B9CCFBC();

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC12MobileSafari33TabOverviewNavigationBarTitleView *v5;

  v4 = a3;
  v5 = self;
  sub_18B9CC098(v4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_configuration);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 1;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(NSMutableArray **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_configuration);
  v4 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_configuration);
  v5 = *(uint64_t *)((char *)&self->super.super._animationInfo
                  + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_configuration);
  v6 = *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_configuration);
  swift_bridgeObjectRelease();
  sub_18B8F4920(v3, v4, v5, v6);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_cancelRetitlingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_contentView));
  objc_release(*(id *)((char *)&self->super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_metrics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView____lazy_storage___textFieldLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari33TabOverviewNavigationBarTitleView_titleButton));
}

@end
