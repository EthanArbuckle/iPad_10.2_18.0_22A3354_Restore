@implementation FMPFSKBTRangingNode

- (_TtC11FMFindingUI19FMPFSKBTRangingNode)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11FMFindingUI19FMPFSKBTRangingNode *result;

  v5 = OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDotNode;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMPFSKBTRangeDotNode());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11FMFindingUI19FMPFSKBTRangingNode *)sub_23AA335A8();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI19FMPFSKBTRangingNode)init
{
  _TtC11FMFindingUI19FMPFSKBTRangingNode *result;

  result = (_TtC11FMFindingUI19FMPFSKBTRangingNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDiskNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDotNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_levelRingsNode));
}

@end
