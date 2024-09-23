@implementation TapbackView

- (void)prepareForAppearingAnimation
{
  -[TapbackView setHidden:](self, sel_setHidden_, 1);
}

- (void)performViewControllerAppearingAnimation
{
  _TtC7ChatKit11TapbackView *v2;

  v2 = self;
  sub_18E6720E8();

}

- (void)performSendAnimation
{
  void (*v2)(void);
  _TtC7ChatKit11TapbackView *v3;

  v2 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x58);
  v3 = self;
  v2();

}

- (_TtC7ChatKit11TapbackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackView();
  return -[TapbackView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit11TapbackView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackView();
  return -[TapbackView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
