@implementation InformationalAccessoryGridViewController.AccessoryLikeObjectContainer

- (NSSet)hf_accessoryLikeObjects
{
  void *v2;

  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D9E0);
  sub_1B8F55134();
  sub_1B93ECF74();
  v2 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setHf_accessoryLikeObjects:(id)a3
{
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D9E0);
  sub_1B8F55134();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer_hf_accessoryLikeObjects) = (Class)sub_1B93EE0FC();
  swift_bridgeObjectRelease();
}

- (_TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer)init
{
  _TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer *result;

  result = (_TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
