@implementation MUPlaceNotePromptView

- (_TtC6MapsUI21MUPlaceNotePromptView)initWithCoder:(id)a3
{
  id v5;
  _TtC6MapsUI21MUPlaceNotePromptView *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___topLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___bottomLabel) = 0;
  v5 = a3;

  result = (_TtC6MapsUI21MUPlaceNotePromptView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  sub_191DDBD94((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView_tapHandler);
}

- (_TtC6MapsUI21MUPlaceNotePromptView)initWithFrame:(CGRect)a3
{
  sub_191DCCF08();
}

- (void).cxx_destruct
{
  swift_release();
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView_userInfoProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___bottomLabel));
}

@end
