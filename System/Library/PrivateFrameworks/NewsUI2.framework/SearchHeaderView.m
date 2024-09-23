@implementation SearchHeaderView

- (_TtC7NewsUI216SearchHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI216SearchHeaderView *)sub_1D696CA08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI216SearchHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC7NewsUI216SearchHeaderView *result;

  v5 = OBJC_IVAR____TtC7NewsUI216SearchHeaderView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC7NewsUI216SearchHeaderView_bottomMarginView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);

  result = (_TtC7NewsUI216SearchHeaderView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
