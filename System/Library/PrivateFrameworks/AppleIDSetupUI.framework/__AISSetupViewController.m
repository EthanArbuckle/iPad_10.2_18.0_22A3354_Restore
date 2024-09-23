@implementation __AISSetupViewController

- (BOOL)shouldAutoDismiss
{
  __AISSetupViewController *v2;
  BOOL v4;

  v2 = self;
  swift_retain();
  sub_236736760();

  swift_release();
  return v4;
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  __AISSetupViewController *v3;

  v3 = self;
  swift_retain();
  sub_23673676C();

  swift_release();
}

- (__AISSetupViewController)initWithContext:(id)a3 dontSuggestUserAction:(id)a4 skipAction:(id)a5 shouldAutoDismiss:(BOOL)a6 reportHandler:(id)a7
{
  FBSSceneIdentityToken *v11;
  __AISSetupViewController *result;
  __AISSetupViewController *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char *v22;

  v11 = (FBSSceneIdentityToken *)_Block_copy(a7);
  result = (__AISSetupViewController *)swift_allocObject();
  result->super.super.__layeringSceneIdentity = v11;
  if (a3)
  {
    v13 = result;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = sub_236737480();

    if (!v17)
    {
      sub_236735E48();
      v17 = MEMORY[0x23B7F6DAC]();
    }
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v14;
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_2366FB3D8;
    *(_QWORD *)(v19 + 24) = v18;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_2366FB220;
    *(_QWORD *)(v20 + 24) = v13;
    v21 = objc_allocWithZone((Class)type metadata accessor for SetupViewController());
    v22 = SetupViewController.init(dontSuggestUserAction:skipAction:shouldAutoDismiss:model:contextBuilder:reportHandler:)(v15, v16, a6, v17, (uint64_t)sub_2366F9BFC, v19, (uint64_t)sub_2366FB3F8, v20);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return (__AISSetupViewController *)v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (__AISSetupViewController)initWithCoder:(id)a3
{
  id v4;
  __AISSetupViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR_____AISSetupViewController_hostingController) = 0;
  v4 = a3;

  result = (__AISSetupViewController *)sub_23673757C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  __AISSetupViewController *v2;

  v2 = self;
  sub_2366FA358();

}

- (__AISSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __AISSetupViewController *result;

  v4 = a4;
  result = (__AISSetupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

@end
