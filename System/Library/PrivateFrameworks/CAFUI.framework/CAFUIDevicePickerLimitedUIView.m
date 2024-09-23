@implementation CAFUIDevicePickerLimitedUIView

- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC5CAFUI30CAFUIDevicePickerLimitedUIView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_presentedAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_dismissAction);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_button;
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)closure #1 in variable initialization expression of CAFUIDevicePickerLimitedUIView.button();
  v8 = OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_label;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)closure #1 in variable initialization expression of CAFUIDevicePickerLimitedUIView.label();

  result = (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  @objc CAFUIDevicePickerLimitedUIView.layoutSubviews()((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_presentedAction);
}

- (void)buttonPressed
{
  @objc CAFUIDevicePickerLimitedUIView.layoutSubviews()((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_dismissAction);
}

- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithFrame:(CGRect)a3
{
  _TtC5CAFUI30CAFUIDevicePickerLimitedUIView *result;

  result = (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_presentedAction));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_dismissAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_label));
}

@end
