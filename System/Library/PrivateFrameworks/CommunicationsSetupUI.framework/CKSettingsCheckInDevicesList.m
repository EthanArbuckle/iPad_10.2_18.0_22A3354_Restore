@implementation CKSettingsCheckInDevicesList

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)initWithFullDataSharing:(BOOL)a3
{
  char v4;
  void *v5;
  _TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v12;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v7, sel_bounds);
  v9 = v8;

  v10 = (char *)v6 + OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view;
  *(_QWORD *)v10 = v9;
  v10[8] = v4;

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return -[CKSettingsCheckInDevicesList init](&v12, sel_init);
}

- (id)getView
{
  id v3;
  _TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *v4;
  void *v5;

  sub_2139357DC();
  MEMORY[0x24BDAC7A8]();
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254D0C218));
  v4 = self;
  v5 = (void *)sub_2139357AC();
  sub_2139357D0();
  sub_2139357A0();

  return v5;
}

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)init
{
  _TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *result;

  result = (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
