@implementation AudioAutoClosePlayerHandler

- (_TtC7NewsUI227AudioAutoClosePlayerHandler)init
{
  _TtC7NewsUI227AudioAutoClosePlayerHandler *result;

  result = (_TtC7NewsUI227AudioAutoClosePlayerHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t (*v3)(uint64_t);

  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_paidBundleConfigManager);

  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  sub_1D5EC4E54((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_idledAt, (unint64_t *)&qword_1ED5E0280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1D5EC4E54((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_autoCloseAt, (unint64_t *)&qword_1ED5E0280, v3);

  swift_unknownObjectRelease();
}

- (void)sessionDidDisconnect:(id)a3
{
  id v5;
  _TtC7NewsUI227AudioAutoClosePlayerHandler *v6;
  void *v7;
  _TtC7NewsUI227AudioAutoClosePlayerHandler *v8;

  sub_1D5EEBE18();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D6E27C08();
  sub_1D6E27374();
  sub_1D6E1C61C();

  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v8 = v6;
  sub_1D6E1AFF0();

  swift_release();
}

@end
