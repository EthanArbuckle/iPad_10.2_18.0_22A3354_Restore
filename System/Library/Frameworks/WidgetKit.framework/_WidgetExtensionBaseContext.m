@implementation _WidgetExtensionBaseContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1908B5264((uint64_t)a1, (uint64_t)a2, &qword_1ECF6D2E8, (id *)&qword_1ECF6D248);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1908B5264((uint64_t)a1, (uint64_t)a2, qword_1ECF6B9B0, (id *)&qword_1ECF6B9A0);
}

+ (BOOL)_shouldSendHostApplicationStateNotifications
{
  return 0;
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _WidgetExtensionBaseContext();
  return -[_WidgetExtensionBaseContext init](&v3, sel_init);
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3
{
  void *v4;
  _TtC9WidgetKit27_WidgetExtensionBaseContext *v5;
  objc_super v7;

  if (a3)
  {
    sub_190A47C5C();
    v4 = (void *)sub_190A47C50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _WidgetExtensionBaseContext();
  v5 = -[_WidgetExtensionBaseContext initWithInputItems:](&v7, sel_initWithInputItems_, v4);

  if (v5)
  return v5;
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF6C750);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_190A47C5C();
  if (a4)
  {
    sub_190A460B4();
    v9 = sub_190A460CC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_190A460CC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC9WidgetKit27_WidgetExtensionBaseContext *)sub_190A38E2C((uint64_t)a3, (uint64_t)v8);
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF6C750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_190A47C5C();
  if (a5)
  {
    sub_190A460B4();
    v11 = sub_190A460CC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_190A460CC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a4;
  return (_TtC9WidgetKit27_WidgetExtensionBaseContext *)sub_190A39054((uint64_t)a3, a4, (uint64_t)v10);
}

@end
