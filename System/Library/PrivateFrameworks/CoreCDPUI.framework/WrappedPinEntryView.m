@implementation WrappedPinEntryView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)isSecureTextEntry
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry) = a3;
}

- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithCoder:(id)a3
{
  id v5;
  _TtC9CoreCDPUI19WrappedPinEntryView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry) = 1;
  v5 = a3;

  result = (_TtC9CoreCDPUI19WrappedPinEntryView *)sub_20DCF6E8C();
  __break(1u);
  return result;
}

- (int64_t)keyboardType
{
  void *v3;
  _TtC9CoreCDPUI19WrappedPinEntryView *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6 == (id)1)
    return 1;
  else
    return 4;
}

- (void)setKeyboardType:(int64_t)a3
{
  uint64_t v3;
  _TtC9CoreCDPUI19WrappedPinEntryView *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  v3 = qword_2549E1F08;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_20DCF61C0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2549E61A8);
  oslog = sub_20DCF61A8();
  v6 = sub_20DCF6D3C();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DC8F000, oslog, v6, "KeyboardType cannot be set.", v7, 2u);
    MEMORY[0x212BB3D58](v7, -1, -1);
  }

}

- (BOOL)hasText
{
  _TtC9CoreCDPUI19WrappedPinEntryView *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_20DCC44E0();

  return v3;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC9CoreCDPUI19WrappedPinEntryView *v7;

  v4 = sub_20DCF6BE0();
  v6 = v5;
  v7 = self;
  sub_20DCC4558(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)deleteBackward
{
  _TtC9CoreCDPUI19WrappedPinEntryView *v2;

  v2 = self;
  sub_20DCC4824();

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9CoreCDPUI19WrappedPinEntryView *v8;

  sub_20DCC63E4();
  sub_20DCC24F8(&qword_2549E2440, (uint64_t (*)(uint64_t))sub_20DCC63E4, MEMORY[0x24BEE5BD8]);
  v6 = sub_20DCF6D00();
  v7 = a4;
  v8 = self;
  sub_20DCC6420(v6);

  swift_bridgeObjectRelease();
}

- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithFrame:(CGRect)a3
{
  _TtC9CoreCDPUI19WrappedPinEntryView *result;

  result = (_TtC9CoreCDPUI19WrappedPinEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_20DCC2410((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_delegate);
}

@end
