@implementation APSubjectAccessAssertion

- (APSubjectAccessAssertion)initWithSubject:(id)a3 uuid:(id)a4
{
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  objc_super v12;

  v7 = OBJC_IVAR___APSubjectAccessAssertion_invalidated;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563D7518);
  v8 = (objc_class *)swift_allocObject();
  *((_BYTE *)v8 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v7) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSubjectAccessAssertion_subject) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSubjectAccessAssertion_uuid) = (Class)a4;
  v12.receiver = self;
  v12.super_class = (Class)APSubjectAccessAssertion;
  v9 = a3;
  v10 = a4;
  return -[APSubjectAccessAssertion init](&v12, sel_init);
}

+ (void)acquireForSubject:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  void *v12;
  __int128 v13;
  __int128 aBlock;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = APGetAuditTokenForSelf();
  if (v9)
  {
    v13 = *(_OWORD *)v9;
    v10 = *(void (**)(uint64_t, void *, void *))(v9 + 16);
    v11 = *(void **)(v9 + 24);
    v17 = sub_236280D78;
    v18 = v7;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v15 = sub_23627B924;
    v16 = &block_descriptor_46;
    v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    aBlock = v13;
    v15 = v10;
    v16 = v11;
    objc_msgSend(a1, sel_acquireForSubject_onBehalfOfProcessWithAuditToken_accessGrantReason_completion_, v8, &aBlock, 0x7FFFFFFFFFFFFFFFLL, v12);
    _Block_release(v12);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

+ (void)acquireForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v8 = *(_QWORD *)a4->var0;
  v9 = *(_QWORD *)&a4->var0[2];
  v10 = *(_QWORD *)&a4->var0[4];
  v11 = *(_QWORD *)&a4->var0[6];
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  sub_23628064C(v14, v8, v9, v10, v11, a5, (uint64_t)sub_236274210, v13);

  swift_release();
}

- (void)dealloc
{
  APSubjectAccessAssertion *v2;

  v2 = self;
  sub_23627D80C();
}

- (void).cxx_destruct
{

  swift_release();
}

- (NSString)description
{
  APSubjectAccessAssertion *v2;
  void *v3;

  v2 = self;
  APSubjectAccessAssertion.description.getter();

  v3 = (void *)sub_2362CB674();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)invalidate
{
  APSubjectAccessAssertion *v2;

  v2 = self;
  sub_23627DDFC();

}

- (APSubjectAccessAssertion)init
{
  APSubjectAccessAssertion *result;

  result = (APSubjectAccessAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
