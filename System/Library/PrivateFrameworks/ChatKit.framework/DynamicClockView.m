@implementation DynamicClockView

- (_TtC7ChatKit16DynamicClockView)initWithFrame:(CGRect)a3
{
  sub_18E5988E4(0xD00000000000001DLL, 0x800000018E8107B0);
}

- (_TtC7ChatKit16DynamicClockView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5988E4(0xD000000000000025, 0x800000018E80C060);
}

- (void)layoutSubviews
{
  _TtC7ChatKit16DynamicClockView *v2;

  v2 = self;
  sub_18E59750C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC7ChatKit16DynamicClockView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_18E596764(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)didMoveToWindow
{
  _TtC7ChatKit16DynamicClockView *v2;

  v2 = self;
  sub_18E5976E0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void *v5;

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit16DynamicClockView_currentDate;
  v4 = sub_18E766284();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16DynamicClockView_behavior);

}

@end
