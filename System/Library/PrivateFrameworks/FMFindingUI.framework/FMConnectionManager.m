@implementation FMConnectionManager

- (void)dealloc
{
  void (*v2)(void);
  _TtC11FMFindingUI19FMConnectionManager *v3;
  objc_super v4;

  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x98);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMConnectionManager();
  -[FMConnectionManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11FMFindingUI19FMConnectionManager)init
{
  _TtC11FMFindingUI19FMConnectionManager *result;

  result = (_TtC11FMFindingUI19FMConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
