@implementation AXCCAppPickerButtonWrapperView

- (AXCCAppPickerButtonWrapperView)initWithFrame:(CGRect)a3
{
  return (AXCCAppPickerButtonWrapperView *)sub_230F8A734(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AXCCAppPickerButtonWrapperView)initWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  AXCCAppPickerButtonWrapperView *result;

  v5 = OBJC_IVAR___AXCCAppPickerButtonWrapperView_model;
  type metadata accessor for AppPickerButtonModel();
  v6 = (objc_class *)swift_allocObject();
  v7 = a3;
  sub_230F8A4C8();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;

  result = (AXCCAppPickerButtonWrapperView *)sub_230F8C6C8();
  __break(1u);
  return result;
}

- (void)setOptions:(id)a3
{
  uint64_t v4;
  AXCCAppPickerButtonWrapperView *v5;

  sub_230F8B5A4(0, &qword_255EAEF18);
  v4 = sub_230F8C698();
  v5 = self;
  AppPickerButtonWrapperView.setOptions(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)setHelper:(id)a3
{
  id v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = a3;
  swift_retain();
  sub_230F8C554();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
