@implementation MagazineFeedRefreshControl

- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI226MagazineFeedRefreshControl *)sub_1D6119D14();
}

- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI226MagazineFeedRefreshControl *result;

  v5 = OBJC_IVAR____TtC7NewsUI226MagazineFeedRefreshControl_messageLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI226MagazineFeedRefreshControl *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC7NewsUI226MagazineFeedRefreshControl *v2;

  v2 = self;
  sub_1D6119B70();

}

- (void)handleRefresh
{
  -[UIRefreshControl endRefreshing](self, sel_endRefreshing);
}

- (_TtC7NewsUI226MagazineFeedRefreshControl)init
{
  _TtC7NewsUI226MagazineFeedRefreshControl *result;

  result = (_TtC7NewsUI226MagazineFeedRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedRefreshControl_messageLabel));
}

@end
