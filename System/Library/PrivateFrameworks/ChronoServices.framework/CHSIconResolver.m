@implementation CHSIconResolver

- (CHSIconResolver)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHSIconResolver *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  objc_super v15;

  v3 = sub_18FBCCE24();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConcreteFileManagerFactory();
  v7 = swift_allocObject();
  type metadata accessor for ConcreteImageIOPrimitives();
  v8 = swift_allocObject();
  v9 = qword_1EE189CB8;
  v10 = self;
  if (v9 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v3, (uint64_t)qword_1EE189DE8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  type metadata accessor for IconStore(0);
  v12 = swift_allocObject();
  *(Class *)((char *)&v10->super.isa + OBJC_IVAR___CHSIconResolver_iconStore) = (Class)sub_18FBCB1C0(v7, v8, (uint64_t)v6, v12);

  v15.receiver = v10;
  v15.super_class = (Class)CHSIconResolver;
  return -[CHSIconResolver init](&v15, sel_init);
}

- (void)resolveIconForContainerIdentity:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CHSIconResolver *v10;

  v5 = _Block_copy(a4);
  v6 = sub_18FBCD0DC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_18FBCAE14(v6, v8, (uint64_t)sub_18FBCB1B0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)resolveIconVersionForExtensionIdentity:(id)a3
{
  id v4;
  CHSIconResolver *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_18FBCAF98((uint64_t)v4);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_18FBCD0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
