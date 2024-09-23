@implementation TapbackPickerTintableMessageBalloonView

- (void)layoutSubviews
{
  _TtC7ChatKit39TapbackPickerTintableMessageBalloonView *v2;

  v2 = self;
  sub_18E572D74();

}

- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerTintableMessageBalloonView();
  return -[TapbackPickerTintableMessageBalloonView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerTintableMessageBalloonView();
  return -[TapbackPickerTintableMessageBalloonView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon));
}

@end
