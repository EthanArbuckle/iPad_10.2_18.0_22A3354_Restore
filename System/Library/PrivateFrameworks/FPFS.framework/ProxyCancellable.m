@implementation ProxyCancellable

- (void)cancel
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB316ProxyCancellable_cancellable), sel_cancel);
}

- (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB316ProxyCancellable)init
{
  _TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB316ProxyCancellable *result;

  result = (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB316ProxyCancellable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
