@implementation RoundChevronButton

- (_TtC20ProductPageExtension18RoundChevronButton)init
{
  return (_TtC20ProductPageExtension18RoundChevronButton *)sub_10005C350();
}

- (_TtC20ProductPageExtension18RoundChevronButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10005CAEC();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension18RoundChevronButton *v3;

  v3 = self;
  sub_10005C65C((uint64_t)v3, v2);

}

- (_TtC20ProductPageExtension18RoundChevronButton)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension18RoundChevronButton *result;

  result = (_TtC20ProductPageExtension18RoundChevronButton *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.RoundChevronButton", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_chevronImageView));
}

@end
