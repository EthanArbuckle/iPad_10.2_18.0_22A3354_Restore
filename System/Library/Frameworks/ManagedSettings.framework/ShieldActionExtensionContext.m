@implementation ShieldActionExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1B7668648((uint64_t)a1, (uint64_t)a2, &qword_1EF1771B0, (id *)&qword_1EF1778C0);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1B7668648((uint64_t)a1, (uint64_t)a2, &qword_1EF1771B8, (id *)&qword_1EF1778C8);
}

- (void)handleWithAction:(int64_t)a3 applicationTokenData:(id)a4 replyHandler:(id)a5
{
  sub_1B7668888(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, unint64_t, id, void *))sub_1B7668FF8);
}

- (void)handleWithAction:(int64_t)a3 categoryTokenData:(id)a4 replyHandler:(id)a5
{
  sub_1B7668888(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, unint64_t, id, void *))sub_1B76691E4);
}

- (void)handleWithAction:(int64_t)a3 webDomainTokenData:(id)a4 replyHandler:(id)a5
{
  sub_1B7668888(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, unint64_t, id, void *))sub_1B76693D0);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15ManagedSettings28ShieldActionExtensionContext____lazy_storage___shieldActionDelegate) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShieldActionExtensionContext();
  return -[ShieldActionExtensionContext init](&v3, sel_init);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_1B76DBB70();
  else
    v3 = 0;
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1B7668984(v3);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1774C0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1B76DBB70();
  if (a4)
  {
    sub_1B76DB87C();
    v10 = sub_1B76DB888();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_1B76DB888();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1B7668A60((uint64_t)a3, (uint64_t)v9);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1774C0);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1B76DBB70();
  if (a5)
  {
    sub_1B76DB87C();
    v12 = sub_1B76DB888();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_1B76DB888();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a4;
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1B7668C98((uint64_t)a3, a4, (uint64_t)v11);
}

- (void).cxx_destruct
{
  sub_1B7668F50(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC15ManagedSettings28ShieldActionExtensionContext____lazy_storage___shieldActionDelegate));
}

@end
