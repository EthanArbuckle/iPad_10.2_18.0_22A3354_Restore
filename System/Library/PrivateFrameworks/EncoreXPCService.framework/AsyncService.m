@implementation AsyncService

- (_TtC16EncoreXPCService12AsyncService)init
{
  return (_TtC16EncoreXPCService12AsyncService *)sub_23A89EC90();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A89F1E4((uint64_t)self + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation);
}

@end
