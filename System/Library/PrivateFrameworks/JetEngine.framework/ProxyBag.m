@implementation ProxyBag

- (BOOL)isExpired
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag), sel_isExpired);
}

- (NSDate)expirationDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC9JetEngine8ProxyBag *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v19 - v9;
  v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag);
  v12 = self;
  v13 = objc_msgSend(v11, sel_expirationDate);
  if (v13)
  {
    v14 = v13;
    sub_19CFDEF60();

    v15 = sub_19CFDEF84();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 0, 1, v15);
  }
  else
  {
    v15 = sub_19CFDEF84();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 1, 1, v15);
  }
  sub_19CD057DC((uint64_t)v6, (uint64_t)v10);

  sub_19CFDEF84();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) != 1)
  {
    v17 = (void *)sub_19CFDEF0C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v15);
  }
  return (NSDate *)v17;
}

- (NSString)profile
{
  return (NSString *)sub_19CDC8958((char *)self, (uint64_t)a2, (SEL *)&selRef_profile);
}

- (NSString)profileVersion
{
  return (NSString *)sub_19CDC8958((char *)self, (uint64_t)a2, (SEL *)&selRef_profileVersion);
}

- (id)arrayForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_arrayForKey_);
}

- (id)BOOLForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_BOOLForKey_);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC9JetEngine8ProxyBag *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag);
  v9[4] = sub_19CDC8C08;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_19CCCBFA0;
  v9[3] = &block_descriptor_2;
  v7 = _Block_copy(v9);
  v8 = self;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_createSnapshotWithCompletion_, v7);
  _Block_release(v7);

  swift_release();
  swift_unknownObjectRelease();
}

- (id)doubleForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_doubleForKey_);
}

- (id)integerForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_integerForKey_);
}

- (id)stringForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_stringForKey_);
}

- (id)URLForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_URLForKey_);
}

- (id)dictionaryForKey:(id)a3
{
  return sub_19CDC8B2C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_dictionaryForKey_);
}

- (_TtC9JetEngine8ProxyBag)init
{
  _TtC9JetEngine8ProxyBag *result;

  result = (_TtC9JetEngine8ProxyBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
