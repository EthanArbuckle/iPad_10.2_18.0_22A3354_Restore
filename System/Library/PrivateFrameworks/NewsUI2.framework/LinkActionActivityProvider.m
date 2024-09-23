@implementation LinkActionActivityProvider

- (_TtC7NewsUI226LinkActionActivityProvider)init
{
  _TtC7NewsUI226LinkActionActivityProvider *result;

  result = (_TtC7NewsUI226LinkActionActivityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_router);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_handler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_linkedContentProvider));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_tracker);
}

- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  _TtC7NewsUI226LinkActionActivityProvider *v13;
  id v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  swift_unknownObjectRetain();
  v12 = a4;
  v13 = self;
  v14 = sub_1D670B0B8((uint64_t)a3, a4, x, y, width, height);
  swift_unknownObjectRelease();

  return v14;
}

- (id)previewActivityForAction:(id)a3
{
  _TtC7NewsUI226LinkActionActivityProvider *v4;
  id v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_1D670FF04();
  swift_unknownObjectRelease();

  return v5;
}

@end
