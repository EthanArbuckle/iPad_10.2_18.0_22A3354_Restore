@implementation OverriddenAMSBag

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[OverriddenAMSBag dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)forwardSnapshotBagExpiredValueAccessed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9JetEngine16OverriddenAMSBag *v9;
  uint64_t v10;

  v4 = sub_19CFDEA74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEA50();
  v9 = self;
  sub_19CF3B238();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)isExpired
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing), sel_isExpired);
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
  _TtC9JetEngine16OverriddenAMSBag *v12;
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
  v11 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing);
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
  return (NSString *)sub_19CF3B534((char *)self, (uint64_t)a2, (SEL *)&selRef_profile);
}

- (NSString)profileVersion
{
  return (NSString *)sub_19CF3B534((char *)self, (uint64_t)a2, (SEL *)&selRef_profileVersion);
}

- (id)arrayForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_arrayForKey_);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_BOOLForKey_);

  return v6;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_doubleForKey_);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_integerForKey_);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_stringForKey_);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_URLForKey_);

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  _TtC9JetEngine16OverriddenAMSBag *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_19CF3B7AC(v4, (SEL *)&selRef_dictionaryForKey_);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _TtC9JetEngine16OverriddenAMSBag *v10;
  _QWORD v11[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing);
  v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_overrides);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_19CDC8C08;
  v8[3] = v5;
  v8[4] = v7;
  v11[4] = sub_19CF3BDB4;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_19CCCBFA0;
  v11[3] = &block_descriptor_31;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_createSnapshotWithCompletion_, v9);
  _Block_release(v9);

  swift_release();
}

- (AMSBagProtocol)replacingSnapshotIfNeeded
{
  _TtC9JetEngine16OverriddenAMSBag *v2;
  id v3;

  v2 = self;
  v3 = sub_19CF3BAA4();

  return (AMSBagProtocol *)v3;
}

- (_TtC9JetEngine16OverriddenAMSBag)init
{
  _TtC9JetEngine16OverriddenAMSBag *result;

  result = (_TtC9JetEngine16OverriddenAMSBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9JetEngine16OverriddenAMSBag)initWithData:(id)a3
{
  id v3;
  _TtC9JetEngine16OverriddenAMSBag *result;

  v3 = a3;
  sub_19CFDEE70();

  result = (_TtC9JetEngine16OverriddenAMSBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
