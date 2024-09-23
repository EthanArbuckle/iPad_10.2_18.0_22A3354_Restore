@implementation FBKSDraftLauncher_FrameworkPrivateName

- (FBKSForm_FrameworkPrivateName)form
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  return (FBKSForm_FrameworkPrivateName *)*v2;
}

- (void)setForm:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (FBKSDraftLauncher_FrameworkPrivateName)initWithFeedbackForm:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKSDraftLauncher();
  v4 = a3;
  return -[FBKSDraftLauncher_FrameworkPrivateName init](&v6, sel_init);
}

- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  FBKSDraftLauncher_FrameworkPrivateName *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_23B47D5E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_23B47C9B8(a3, v6, v7);
  sub_23B47D5B0((uint64_t)v6);

}

- (FBKSDraftLauncher_FrameworkPrivateName)init
{
  FBKSDraftLauncher_FrameworkPrivateName *result;

  result = (FBKSDraftLauncher_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
