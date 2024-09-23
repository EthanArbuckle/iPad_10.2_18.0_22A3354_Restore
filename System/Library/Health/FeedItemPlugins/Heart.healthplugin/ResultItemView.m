@implementation ResultItemView

- (_TtC5Heart14ResultItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2313B2A20();
}

- (void)learnMoreButtonTapped
{
  _TtC5Heart14ResultItemView *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_2313B1630();
  objc_msgSend(v3, sel_setHidden_, 0);

  v4 = sub_2313B16F0();
  objc_msgSend(v4, sel_setHidden_, 1);

}

- (_TtC5Heart14ResultItemView)initWithFrame:(CGRect)a3
{
  sub_231334824();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___itemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___bodyStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___stackView));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
