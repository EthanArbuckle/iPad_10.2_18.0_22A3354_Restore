@implementation CameraTrayUIButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  v4 = a3;
  v5 = (char *)v13.receiver;
  -[CameraTrayUIButton menuAttachmentPointForConfiguration:](&v13, sel_menuAttachmentPointForConfiguration_, v4);
  v7 = v6;
  v8 = *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset + 8];
  v10 = v9 + *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset];

  v11 = v7 + v8;
  v12 = v10;
  result.y = v11;
  result.x = v12;
  return result;
}

- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithFrame:(CGRect)a3
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
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset) = xmmword_2275A1590;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  return -[CameraTrayUIButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset) = xmmword_2275A1590;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  return -[CameraTrayUIButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
