@implementation FMPFSKBTRangeDiskNode

- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _TtC11FMFindingUI21FMPFSKBTRangeDiskNode *result;

  v4 = OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_sizeSpring;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_23A9CCC54(0, 0, 0x3F50624DD2F1A9FCLL, 0);
  v6 = OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_opacitySpring;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_23A9CCF6C(0, 0, 0x3F847AE147AE147BLL, 0, 0, 1);

  result = (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode *)sub_23AA335A8();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)init
{
  _TtC11FMFindingUI21FMPFSKBTRangeDiskNode *result;

  result = (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_sizeSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_opacitySpring));
}

@end
