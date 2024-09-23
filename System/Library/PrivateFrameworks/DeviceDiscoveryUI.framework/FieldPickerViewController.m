@implementation FieldPickerViewController

- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4
{
  unint64_t v6;
  void (*v7)(id);
  uint64_t v8;
  id v9;
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *v10;
  id v11;
  id v12;
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *v13;
  id v14;

  sub_23A3C9498(0, (unint64_t *)&qword_25697B4C0);
  v6 = sub_23A447320();
  v7 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_fieldSaveHandler);
  if (!(v6 >> 62))
  {
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = a3;
    v10 = self;
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_9;
  }
  v12 = a3;
  v13 = self;
  swift_bridgeObjectRetain();
  if (!sub_23A447710())
    goto LABEL_8;
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_9:
    v11 = (id)MEMORY[0x23B84C83C](0, v6);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v6 + 32);
LABEL_6:
    v14 = v11;
    swift_bridgeObjectRelease();
    v7(v14);

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithCoder:(id)a3
{
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *result;

  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)sub_23A447704();
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *result;

  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *result;

  v3 = a3;
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17DeviceDiscoveryUI25FieldPickerViewController *result;

  v4 = a4;
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_presentedContact));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_selectionFromContact));
  swift_release();
  swift_release();
}

@end
