@implementation ImageDescriptionViewRepresentable.Coordinator

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  id v5;
  _TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator *v6;
  _QWORD v7[4];

  sub_23EFD182C();
  v7[2] = self;
  v5 = a3;
  v6 = self;
  sub_23EE99518((void (*)(void))sub_23EE9C87C, (uint64_t)v7);

}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  id v5;
  _TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator *v6;
  _QWORD v7[6];

  sub_23EFD182C();
  v7[2] = a3;
  v7[3] = self;
  v5 = a3;
  v6 = self;
  sub_23EE99518((void (*)(void))sub_23EE9C78C, (uint64_t)v7);

}

- (_TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator)init
{
  _TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator *result;

  result = (_TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator_parent);
  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator_parent];
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
