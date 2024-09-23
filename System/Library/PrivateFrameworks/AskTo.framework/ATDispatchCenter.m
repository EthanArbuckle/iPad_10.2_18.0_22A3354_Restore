@implementation ATDispatchCenter

+ (_TtC5AskTo16ATDispatchCenter)shared
{
  if (qword_25643A8D8 != -1)
    swift_once();
  return (_TtC5AskTo16ATDispatchCenter *)(id)qword_25643A9C0;
}

- (void)dealloc
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ATDispatchCenter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC5AskTo16ATDispatchCenter_dispatcher);

}

- (void)send:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _TtC5AskTo10ATQuestion *v18;
  _TtC5AskTo16ATDispatchCenter *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643AA18);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_WORD *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = self;
  v15 = sub_236AF5C08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25643AA28;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25643AA38;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_236AF5110((uint64_t)v12, (uint64_t)&unk_25643AA48, (uint64_t)v17);
  swift_release();
}

- (void)addResponseListener:(id)a3
{
  sub_236AF4DF4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)removeResponseListener:(id)a3
{
  sub_236AF4DF4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (_TtC5AskTo16ATDispatchCenter)init
{
  _TtC5AskTo16ATDispatchCenter *result;

  result = (_TtC5AskTo16ATDispatchCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
