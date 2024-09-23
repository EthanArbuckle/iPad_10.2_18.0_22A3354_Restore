@implementation AppShowcaseLockupView

- (_TtC22SubscribePageExtension21AppShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21AppShowcaseLockupView *)sub_100246CC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21AppShowcaseLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10024B458();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21AppShowcaseLockupView *v2;

  v2 = self;
  sub_10024904C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension21AppShowcaseLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1002493E8(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_offerLabel));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_offerLabelPresenter, &qword_1007F6E90);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_offerDisplayProperties));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_crossLinkPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_crossLinkSubtitleLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView_type;
  v4 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView____lazy_storage___lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension21AppShowcaseLockupView____lazy_storage___crossLinkViews));
}

@end
