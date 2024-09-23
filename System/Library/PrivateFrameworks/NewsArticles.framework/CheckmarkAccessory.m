@implementation CheckmarkAccessory

- (_TtC12NewsArticles18CheckmarkAccessory)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles18CheckmarkAccessory *)sub_1B9EEC500(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles18CheckmarkAccessory)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9EECB20();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_linkedToggle);
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_toggleState;
  v4 = sub_1BA0BABE0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_iconImageView));

}

@end
