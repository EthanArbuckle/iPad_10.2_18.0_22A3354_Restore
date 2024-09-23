@implementation AssertionNotification

- (void)didExpire
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC7CoreNFC21AssertionNotification *v7;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC490);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8[15] = 0;
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACE0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);

}

- (void)didFinishCooldown
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC7CoreNFC21AssertionNotification *v7;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC490);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8[15] = 1;
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACE0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  sub_215BFACEC();

}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7CoreNFC21AssertionNotification *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACEC();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[AssertionNotification dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC7CoreNFC21AssertionNotification_eventStreamContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (_TtC7CoreNFC21AssertionNotification)init
{
  _TtC7CoreNFC21AssertionNotification *result;

  result = (_TtC7CoreNFC21AssertionNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
