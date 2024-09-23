@implementation BlurViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25679B9D0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_237327270;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10Blackbeard18BlurViewController_viewController);
  *(_QWORD *)(v3 + 32) = v4;
  sub_237320168();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25679BA30);
  v6 = (void *)sub_23732012C();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC10Blackbeard18BlurViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  _TtC10Blackbeard18BlurViewController *result;

  v5 = OBJC_IVAR____TtC10Blackbeard18BlurViewController_blurView;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = objc_msgSend(v6, sel_effectWithStyle_, 2);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v8);

  v10 = (objc_class *)sub_23732054C();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v10;

  result = (_TtC10Blackbeard18BlurViewController *)sub_23732087C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10Blackbeard18BlurViewController *v2;

  v2 = self;
  sub_2370EEFF0();

}

- (_TtC10Blackbeard18BlurViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10Blackbeard18BlurViewController *result;

  v4 = a4;
  result = (_TtC10Blackbeard18BlurViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard18BlurViewController_viewController));
}

@end
