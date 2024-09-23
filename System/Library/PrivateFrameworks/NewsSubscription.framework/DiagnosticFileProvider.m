@implementation DiagnosticFileProvider

- (id)diagnosticFiles
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  _TtC16NewsSubscription22DiagnosticFileProvider *v18;

  v3 = sub_1BA435E78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8];
  sub_1BA2F3474(0, &qword_1ED5C2050, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v17 - v11;
  v18 = self;
  sub_1BA386F84();
  sub_1BA2F3474(0, &qword_1EF28D238, v8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v13 = sub_1BA435EFC();
  v14 = *(_QWORD *)(v13 - 8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BA43A710;
  if (qword_1ED5C0E68 != -1)
    swift_once();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CAFD78], v3);
  swift_bridgeObjectRetain();
  sub_1BA435EF0();

  v15 = (void *)sub_1BA437DC8();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)diagnosticData
{
  sub_1BA436490();
  return (id)sub_1BA437DC8();
}

- (_TtC16NewsSubscription22DiagnosticFileProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DiagnosticFileProvider init](&v3, sel_init);
}

@end
