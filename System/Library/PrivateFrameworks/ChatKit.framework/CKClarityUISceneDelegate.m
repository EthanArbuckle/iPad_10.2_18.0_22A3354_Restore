@implementation CKClarityUISceneDelegate

- (UIWindow)window
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (CKClarityUISceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return -[CKClarityUISceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
