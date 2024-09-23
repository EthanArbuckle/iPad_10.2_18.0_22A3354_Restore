@implementation ATXMegadomeContextualPersonRelationships

- (id)megadomePersonIDFromName:(id)a3 error:(id *)a4
{
  return sub_1C9E10D40(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1C9E12194);
}

- (id)megadomePersonIDFromContactID:(id)a3 error:(id *)a4
{
  return sub_1C9E10D40(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1C9E1230C);
}

- (id)megadomePersonIDFromPhoneNumber:(id)a3 error:(id *)a4
{
  return sub_1C9E10D40(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1C9E12440);
}

- (void)entityRelationshipsFrom:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSString *v16;
  ATXMegadomeContextualPersonRelationships *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF933348;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF933350;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1C9DF9768((uint64_t)v10, (uint64_t)&unk_1EF933358, (uint64_t)v15);
  swift_release();
}

- (ATXMegadomeContextualPersonRelationships)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MegadomeContextualPersonRelationships();
  return -[ATXMegadomeContextualPersonRelationships init](&v3, sel_init);
}

@end
