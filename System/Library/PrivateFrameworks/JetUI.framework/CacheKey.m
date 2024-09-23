@implementation CacheKey

- (void).cxx_destruct
{
  sub_1AC6921AC(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase), *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase], *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 8], *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 16], *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 24], self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 32]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_traitCollection));
}

- (BOOL)isEqual:(id)a3
{
  _TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *v4;
  _TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AC726724();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1AC690D00((uint64_t)v8);

  sub_1AC690CC0((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *v9;
  uint64_t v10;
  unint64_t v11;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase);
  v4 = *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase];
  v5 = *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 8];
  v6 = *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 16];
  v7 = *(_QWORD *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 24];
  v8 = self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 32];
  sub_1AC726AFC();
  v9 = self;
  sub_1AC692480(v3, v4, v5, v6, v7, v8);
  FontUseCase.hash(into:)();
  v10 = sub_1AC726B2C();
  sub_1AC6921AC(v3, v4, v5, v6, v7, v8);
  v11 = (unint64_t)objc_msgSend(*(id *)((char *)&v9->super.isa+ OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_traitCollection), sel_hash);

  return v11 ^ v10;
}

- (_TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey)init
{
  _TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *result;

  result = (_TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
