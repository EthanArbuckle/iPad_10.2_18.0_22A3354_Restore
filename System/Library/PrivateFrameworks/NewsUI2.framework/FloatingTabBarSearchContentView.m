@implementation FloatingTabBarSearchContentView

- (_TtC7NewsUI231FloatingTabBarSearchContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI231FloatingTabBarSearchContentView *result;

  v5 = OBJC_IVAR____TtC7NewsUI231FloatingTabBarSearchContentView_searchBar;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3C38]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI231FloatingTabBarSearchContentView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231FloatingTabBarSearchContentView)initWithFrame:(CGRect)a3
{
  _TtC7NewsUI231FloatingTabBarSearchContentView *result;

  result = (_TtC7NewsUI231FloatingTabBarSearchContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231FloatingTabBarSearchContentView_searchBar));
  swift_release();
}

@end
