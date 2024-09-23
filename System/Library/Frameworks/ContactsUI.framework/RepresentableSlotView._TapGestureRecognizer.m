@implementation RepresentableSlotView._TapGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer *v8;

  sub_18AD0AAD4();
  sub_18ACB7AD8(&qword_1EDF99CA8, (uint64_t (*)(uint64_t))sub_18AD0AAD4, MEMORY[0x1E0DEFCF8]);
  v6 = sub_18AF4FE54();
  v7 = a4;
  v8 = self;
  sub_18AD07E3C(v6, v7);

  swift_bridgeObjectRelease();
}

- (_TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  result = (_TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_18ACCDD44(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer_approvalCallback));
}

@end
