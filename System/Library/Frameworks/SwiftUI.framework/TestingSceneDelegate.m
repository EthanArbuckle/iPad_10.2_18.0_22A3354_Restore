@implementation TestingSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7SwiftUI20TestingSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  specialized TestingSceneDelegate.scene(_:willConnectTo:options:)(v8);

}

- (_TtC7SwiftUI20TestingSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_comparisonWindow) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TestingSceneDelegate();
  return -[TestingSceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
