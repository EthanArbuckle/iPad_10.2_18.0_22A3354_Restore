@implementation BiometricBindingReplacementViewController

- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213FF6C0C();
}

- (void)loadView
{
  _TtC9CoreIDVUI41BiometricBindingReplacementViewController *v2;

  v2 = self;
  sub_213FF5D90();

}

- (void)performBinding
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC9CoreIDVUI41BiometricBindingReplacementViewController *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_213FF9554();
  v7 = self;
  v8 = sub_213FF9548();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_213F4BE78((uint64_t)v5, (uint64_t)&unk_254D5D1B8, (uint64_t)v9);
  swift_release();

}

- (void)cancelBarButtonClicked
{
  _TtC9CoreIDVUI41BiometricBindingReplacementViewController *v2;

  v2 = self;
  sub_213FF5CB8();

}

- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI41BiometricBindingReplacementViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI41BiometricBindingReplacementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context));
  sub_213F4CF1C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate, &qword_254D5D1B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem));
}

@end
