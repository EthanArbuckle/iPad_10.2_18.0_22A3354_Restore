@implementation SFTabIconRegistration

- (UIImage)content
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  return (UIImage *)*(id *)(v2 + 16);
}

- (id)contentObserver
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(_QWORD *)(v2 + 32);
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18B891688;
  aBlock[3] = &block_descriptor;
  v5 = _Block_copy(aBlock);
  sub_18BABFBB4();
  swift_release();
  return v5;
}

- (void)setContentObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  *(_QWORD *)(v6 + 24) = sub_18B8928C8;
  *(_QWORD *)(v6 + 32) = v5;
  swift_release();
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_18BAC0088();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped)
     + OBJC_IVAR____TtC12MobileSafari19TabIconRegistration_id;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_18BAC0058();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (SFTabIconRegistration)init
{
  SFTabIconRegistration *result;

  result = (SFTabIconRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
