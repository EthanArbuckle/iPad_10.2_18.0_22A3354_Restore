@implementation APWriteClient

- (void)setBundleIdentifier:(id)a3 hidden:(BOOL)a4 completion:(id)a5
{
  sub_23628DF64(self, (int)a2, (int)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, id, void *))sub_23628E298);
}

- (void)setBundleIdentifier:(id)a3 locked:(BOOL)a4 completion:(id)a5
{
  sub_23628DF64(self, (int)a2, (int)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, id, void *))sub_23628E534);
}

- (_TtC13AppProtection13APWriteClient)init
{
  _TtC13AppProtection13APWriteClient *result;

  result = (_TtC13AppProtection13APWriteClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection13APWriteClient_delegate);
}

@end
