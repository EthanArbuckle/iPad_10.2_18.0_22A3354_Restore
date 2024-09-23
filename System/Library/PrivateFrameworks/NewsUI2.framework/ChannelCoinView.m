@implementation ChannelCoinView

- (_TtC7NewsUI215ChannelCoinView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI215ChannelCoinView *)sub_1D6C7A448(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI215ChannelCoinView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6C7AE8C();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI215ChannelCoinView_secondaryNameLabel));

}

- (BOOL)accessibilityActivate
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI215ChannelCoinView_coinButton), sel_sendActionsForControlEvents_, 64);
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6C7A2F4);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6C7A99C);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6C7AB64);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  v3 = -[ChannelCoinView accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = *MEMORY[0x1E0DC4660];

  if ((v4 & ~v3) != 0)
    v5 = v4;
  else
    v5 = 0;
  return v5 | v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[ChannelCoinView setAccessibilityTraits:](&v4, sel_setAccessibilityTraits_, a3);
}

@end
