@implementation CNContactPickerAdaptor.Coordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  char *v6;
  id v7;
  _TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator *v8;
  void (*v9)(uint64_t);

  sub_2154CFE3C(0, &qword_254DD0C00);
  sub_215688B64();
  v6 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator_adaptor;
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD0BB0);
  sub_21568872C();
  v9 = (void (*)(uint64_t))*((_QWORD *)v6 + 5);
  swift_retain();
  v9(1);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator)init
{
  _TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator *result;

  result = (_TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator_viewController));
}

@end
