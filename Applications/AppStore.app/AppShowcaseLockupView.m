@implementation AppShowcaseLockupView

- (_TtC8AppStore21AppShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21AppShowcaseLockupView *)sub_10026BBC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21AppShowcaseLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10026EEAC();
}

- (void)layoutSubviews
{
  _TtC8AppStore21AppShowcaseLockupView *v2;

  v2 = self;
  sub_10026DF54();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore21AppShowcaseLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10026AB2C(width, height);
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
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_wordmarkView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_offerButton));

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_offerLabelPresenter, (uint64_t *)&unk_10082B490);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_offerDisplayProperties));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_crossLinkPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_crossLinkSubtitleLabel));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_type;
  v4 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView____lazy_storage___lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView____lazy_storage___crossLinkViews));
}

@end
