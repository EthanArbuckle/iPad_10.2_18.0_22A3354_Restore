@implementation SearchHomeSectionTitleView

- (_TtC7NewsUI226SearchHomeSectionTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI226SearchHomeSectionTitleView *)sub_1D699FA18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI226SearchHomeSectionTitleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC7NewsUI226SearchHomeSectionTitleView *result;

  v5 = OBJC_IVAR____TtC7NewsUI226SearchHomeSectionTitleView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC7NewsUI226SearchHomeSectionTitleView_actionButton;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1D6E1CB5C()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI226SearchHomeSectionTitleView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226SearchHomeSectionTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226SearchHomeSectionTitleView_actionButton));
}

@end
