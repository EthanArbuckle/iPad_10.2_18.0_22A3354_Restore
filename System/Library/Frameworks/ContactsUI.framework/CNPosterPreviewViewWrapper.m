@implementation CNPosterPreviewViewWrapper

- (UIViewController)hostingController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)initWithConfiguration:(id)a3 contact:(id)a4 editingState:(int64_t)a5 delegate:(id)a6 windowScene:(id)a7
{
  id v11;
  id v12;
  id v13;
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *v14;

  v11 = a3;
  v12 = a4;
  swift_unknownObjectRetain();
  v13 = a7;
  v14 = (_TtC10ContactsUI26CNPosterPreviewViewWrapper *)sub_18AD61C68(v11, v12, a5, (uint64_t)a6, a7);

  swift_unknownObjectRelease();
  return v14;
}

- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)init
{
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *result;

  result = (_TtC10ContactsUI26CNPosterPreviewViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController));
}

@end
