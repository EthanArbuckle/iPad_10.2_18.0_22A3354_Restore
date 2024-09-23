@implementation ModernBatteryStatusView

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *v12;
  id v13;
  objc_super v15;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners) = (Class)MEMORY[0x1E0DEE9E8];
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  v11 = a4;
  v12 = -[HPSBatteryStatusView initWithFrame:device:darkMode:](&v15, sel_initWithFrame_device_darkMode_, v11, v5, x, y, width, height);
  v13 = objc_msgSend(v11, sel_headphoneDevice, v15.receiver, v15.super_class);
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v12->super.super.super.super.isa) + 0x78))();

  return v12;
}

- (void)startLisentingWithDevice:(id)a3
{
  id v5;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *v6;

  v5 = a3;
  v6 = self;
  sub_1DB38A884(a3);

}

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners) = (Class)MEMORY[0x1E0DEE9E8];
  v4 = a3;

  result = (_TtC16HeadphoneConfigs23ModernBatteryStatusView *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (void)cleanUp
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners);
  swift_beginAccess();
  *v2 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
}

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3
{
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *result;

  result = (_TtC16HeadphoneConfigs23ModernBatteryStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
