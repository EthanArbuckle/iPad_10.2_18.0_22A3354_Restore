@implementation EXRemoteSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___EXRemoteSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  EXRemoteSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_20AE8F610((uint64_t)v8, v9);

}

- (EXRemoteSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EXRemoteSceneDelegate();
  return -[EXRemoteSceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
