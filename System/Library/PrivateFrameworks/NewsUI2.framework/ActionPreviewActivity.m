@implementation ActionPreviewActivity

- (id)previewViewControllerForAction:(id)a3
{
  _TtC7NewsUI221ActionPreviewActivity *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1D67C8430();
  swift_unknownObjectRelease();

  return v5;
}

- (void)commitViewController:(id)a3 action:(id)a4
{
  id v5;
  _TtC7NewsUI221ActionPreviewActivity *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1D67C88E0();

  swift_unknownObjectRelease();
}

- (_TtC7NewsUI221ActionPreviewActivity)init
{
  _TtC7NewsUI221ActionPreviewActivity *result;

  result = (_TtC7NewsUI221ActionPreviewActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221ActionPreviewActivity_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221ActionPreviewActivity_handler);
}

@end
