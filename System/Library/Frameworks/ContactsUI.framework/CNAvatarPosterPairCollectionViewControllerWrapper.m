@implementation CNAvatarPosterPairCollectionViewControllerWrapper

- (UIViewController)viewController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v15;
  id v16;
  id v17;
  id v18;
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v19;
  objc_super v21;
  void *v22;

  v22 = &unk_1EE04E8D0;
  swift_unknownObjectRetain_n();
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  if (!swift_dynamicCastObjCProtocolConditional())
    swift_unknownObjectRelease();
  objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewController());
  v16 = v12;
  v17 = v13;
  v18 = v14;
  *(Class *)((char *)&v15->super.isa
           + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController) = (Class)sub_18AD4ACC8(v16, v17, v18, a6);

  v21.receiver = v15;
  v21.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewControllerWrapper();
  v19 = -[CNAvatarPosterPairCollectionViewControllerWrapper init](&v21, sel_init);

  swift_unknownObjectRelease();
  return v19;
}

- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)init
{
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *result;

  result = (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController));
}

@end
