@implementation UIKitTabBarController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI21UIKitTabBarController)init
{
  return (_TtC7SwiftUI21UIKitTabBarController *)UIKitTabBarController.init()();
}

- (_TtC7SwiftUI21UIKitTabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UIKitTabBarController.init(coder:)();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC7SwiftUI21UIKitTabBarController *v8;

  v7 = a3;
  v8 = self;
  UIKitTabBarController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  @objc UIKitTabBarController._observeScrollViewDidScroll(_:)(self, (uint64_t)a2, a3, (const char **)&selRef__observeScrollViewDidScroll_);
}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  @objc UIKitTabBarController._observeScrollViewDidScroll(_:)(self, (uint64_t)a2, a3, (const char **)&selRef__observeScrollViewGeometryAffectingContentBottomDidChange_);
}

- (_TtC7SwiftUI21UIKitTabBarController)initWithTabs:(id)a3
{
  _TtC7SwiftUI21UIKitTabBarController *result;

  result = (_TtC7SwiftUI21UIKitTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI21UIKitTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  @objc UIKitNavigationController.init(nibName:bundle:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI21UIKitTabBarController_popoverBridge));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI21UIKitTabBarController_sidebarBottomBarHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI21UIKitTabBarController_backgroundHost));
}

@end
