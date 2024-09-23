@implementation DebugFormatSwitchCell

- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1BB8729A0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC8NewsFeed21DebugFormatSwitchCell *)sub_1BAF98854(v4, v5);
}

- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC8NewsFeed21DebugFormatSwitchCell *result;

  v5 = OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3D18]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC8NewsFeed21DebugFormatSwitchCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)valueChanged
{
  void (*v2)(id);
  void *v3;
  _TtC8NewsFeed21DebugFormatSwitchCell *v4;

  v2 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock);
  if (v2)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl);
    v4 = self;
    sub_1BA4BEB58((uint64_t)v2);
    v2(objc_msgSend(v3, sel_isOn));
    sub_1BA49EBE0((uint64_t)v2);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock));
}

@end
