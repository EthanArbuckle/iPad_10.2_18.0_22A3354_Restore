@implementation FormatBackgroundViewController

- (_TtC8NewsFeed30FormatBackgroundViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB80AB80();
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  _TtC8NewsFeed30FormatBackgroundViewController *v4;
  id v5;
  void *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = -[FormatBackgroundViewController view](v4, sel_view);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_addSubview_, *(Class *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_containerView));

    v7.receiver = v4;
    v7.super_class = ObjectType;
    -[FormatBackgroundViewController viewDidLoad](&v7, sel_viewDidLoad);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC8NewsFeed30FormatBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed30FormatBackgroundViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed30FormatBackgroundViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_pluggableDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_gutterView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_options);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_options);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_options);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_layoutManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30FormatBackgroundViewController_containerView));
}

@end
