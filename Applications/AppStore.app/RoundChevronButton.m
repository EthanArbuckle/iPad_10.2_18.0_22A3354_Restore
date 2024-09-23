@implementation RoundChevronButton

- (_TtC8AppStore18RoundChevronButton)init
{
  return (_TtC8AppStore18RoundChevronButton *)sub_10007286C();
}

- (_TtC8AppStore18RoundChevronButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100309924();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore18RoundChevronButton *v3;

  v3 = self;
  sub_1003094B4((uint64_t)v3, v2);

}

- (_TtC8AppStore18RoundChevronButton)initWithFrame:(CGRect)a3
{
  _TtC8AppStore18RoundChevronButton *result;

  result = (_TtC8AppStore18RoundChevronButton *)_swift_stdlib_reportUnimplementedInitializer("AppStore.RoundChevronButton", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_chevronImageView));
}

@end
