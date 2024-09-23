@implementation AISAppleIDSignInController

- (AISAppleIDSignInConfiguration)configuration
{
  return (AISAppleIDSignInConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___AISAppleIDSignInController_configuration));
}

- (AISAppleIDSignInControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___AISAppleIDSignInController_delegate;
  swift_beginAccess();
  return (AISAppleIDSignInControllerDelegate *)(id)MEMORY[0x23B7F8D8C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UIViewController)hostingViewController
{
  AISAppleIDSignInController *v2;
  id v3;

  v2 = self;
  v3 = sub_236714BC8();

  return (UIViewController *)v3;
}

- (void)setHostingViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController) = (Class)a3;
  v3 = a3;

}

- (AISAppleIDSignInController)initWithConfiguration:(id)a3
{
  id v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController_configuration) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AISAppleIDSignInController();
  v5 = a3;
  return -[AISAppleIDSignInController init](&v7, sel_init);
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)();
  id v11;
  AISAppleIDSignInController *v12;
  id v13;
  _QWORD v14[6];

  v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v10 = sub_2367156D0;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = a3;
  v12 = self;
  v13 = sub_236714BC8();
  if (v8)
  {
    v14[4] = v10;
    v14[5] = v9;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 1107296256;
    v14[2] = sub_2367025AC;
    v14[3] = &block_descriptor_8;
    v8 = _Block_copy(v14);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v11, sel_presentViewController_animated_completion_, v13, v5, v8);
  _Block_release(v8);

  sub_2366E8868((uint64_t)v10);
}

- (AISAppleIDSignInController)init
{
  AISAppleIDSignInController *result;

  result = (AISAppleIDSignInController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_2366BDBF0((uint64_t)self + OBJC_IVAR___AISAppleIDSignInController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController));
}

@end
