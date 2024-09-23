@implementation ChannelTagView

- (_TtC7NewsUI214ChannelTagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI214ChannelTagView *)sub_1D66FF9E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI214ChannelTagView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D67004B4();
}

- (void).cxx_destruct
{

}

- (BOOL)accessibilityActivate
{
  _TtC7NewsUI214ChannelTagView *v2;

  v2 = self;
  sub_1D66FFDD0();

  return 1;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC7NewsUI214ChannelTagView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI214ChannelTagView_nameLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1D6E26978();

    v6 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6700080);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6700248);
}

@end
