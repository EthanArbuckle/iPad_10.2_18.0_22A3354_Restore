@implementation SettingsButton

- (_TtC16MagnifierSupport14SettingsButton)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport14SettingsButton *)sub_227543988(a3);
}

- (_TtC16MagnifierSupport14SettingsButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MagnifierSupport14SettingsButton *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_settingsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset) = xmmword_2275A1590;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SettingsButton();
  v8 = -[SettingsButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_227543AEC();

  return v8;
}

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
  v13.super_class = (Class)type metadata accessor for SettingsButton();
  v4 = a3;
  v5 = (char *)v13.receiver;
  -[SettingsButton menuAttachmentPointForConfiguration:](&v13, sel_menuAttachmentPointForConfiguration_, v4);
  v7 = v6;
  v8 = *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset + 8];
  v10 = v9 + *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset];

  v11 = v7 + v8;
  v12 = v10;
  result.y = v11;
  result.x = v12;
  return result;
}

- (void)didTapSettingsButton:(id)a3
{
  id v5;
  _TtC16MagnifierSupport14SettingsButton *v6;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_settingsDelegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_2274D9A6C();

    swift_unknownObjectRelease();
  }
}

- (NSString)largeContentTitle
{
  uint64_t v2;
  void *v3;

  sub_227544154();
  if (v2)
  {
    v3 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  return (UIImage *)sub_227543FD4();
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_settingsDelegate);
}

@end
