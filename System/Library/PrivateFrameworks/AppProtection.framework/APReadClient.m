@implementation APReadClient

- (void)getConfiguration:(id)a3
{
  void *v4;
  _TtC13AppProtection12APReadClient *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_236281238((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC13AppProtection12APReadClient)init
{
  _TtC13AppProtection12APReadClient *result;

  result = (_TtC13AppProtection12APReadClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection12APReadClient_delegate);
}

@end
