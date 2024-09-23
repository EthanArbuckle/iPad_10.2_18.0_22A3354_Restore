@implementation BiometricBindingTouchIDReplacementViewController

- (void)loadView
{
  _TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController *v2;

  v2 = self;
  sub_213F624EC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController *v4;

  v4 = self;
  sub_213F626D0(a3);

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  void (*v8)(void);
  _TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController *v9;

  v8 = (void (*)(void))_Block_copy(a5);
  if (a4)
    a4 = (id)sub_213FF93D4();
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = (void (*)(void))sub_213F64288;
  }
  v9 = self;
  sub_213F6397C(a3, (uint64_t)a4, v8);
  sub_213F4BE68((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController_hasObtainedTouchIDMatch) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyph) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyphContainerView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BiometricBindingTouchIDReplacementViewController();
  return -[BiometricBindingReplacementViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyphContainerView));
}

@end
