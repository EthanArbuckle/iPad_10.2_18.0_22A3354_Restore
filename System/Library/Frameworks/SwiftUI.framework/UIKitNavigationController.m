@implementation UIKitNavigationController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (BOOL)_supportsDataDrivenNavigation
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_isDataDriven);
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithRootViewController:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC7SwiftUI25UIKitNavigationController *)UIKitNavigationController.init(rootViewController:)(a3);
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UIKitNavigationController.init(coder:)();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t ObjectType;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UIKitNavigationController();
  v4 = v11.receiver;
  -[UIKitNavigationController viewDidAppear:](&v11, sel_viewDidAppear_, v3);
  v5 = objc_msgSend(v4, sel_delegate, v11.receiver, v11.super_class);
  if (v5)
  {
    v6 = v5;
    swift_getObjectType();
    v7 = swift_conformsToProtocol2();
    if (v7)
      v8 = v7;
    else
      v8 = 0;
    if (v7)
      v9 = v6;
    else
      v9 = 0;
    if (v9)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(id, _BOOL8, uint64_t, uint64_t))(v8 + 8))(v4, v3, ObjectType, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (BOOL)_canShowWhileLocked
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_isSecure);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  UIViewController *v6;
  _TtC7SwiftUI25UIKitNavigationController *v7;

  v6 = (UIViewController *)a3;
  v7 = self;
  UIKitNavigationController.pushViewController(_:animated:)(v6, a4);

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC7SwiftUI25UIKitNavigationController *v6;
  Class isa;
  objc_super v8;

  v4 = a4;
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIViewController);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for UIKitNavigationController();
  -[UIKitNavigationController setViewControllers:animated:](&v8, sel_setViewControllers_animated_, isa, v4);

  swift_bridgeObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  _TtC7SwiftUI25UIKitNavigationController *v2;

  v2 = self;
  UIKitNavigationController.viewWillLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC7SwiftUI25UIKitNavigationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  UIKitNavigationController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC7SwiftUI25UIKitNavigationController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  UIKitNavigationController._observeScrollViewDidScroll(_:)(v4);

}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  UIScrollView *v4;
  _TtC7SwiftUI25UIKitNavigationController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  UIKitNavigationController._observeScrollViewGeometryAffectingContentBottomDidChange(_:)(v4);

}

- (_TtC7SwiftUI25UIKitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC7SwiftUI25UIKitNavigationController *result;

  result = (_TtC7SwiftUI25UIKitNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  @objc UIKitNavigationController.init(nibName:bundle:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of AccessibilityScrollableContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_navigationAuthority, &lazy cache variable for type metadata for NavigationAuthority?, (uint64_t)&type metadata for NavigationAuthority, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  outlined destroy of UIKitNavigationController.PlatformNavigationRequestStrategy((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_platformNavigationPresentationStrategy);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_backgroundHost));
}

@end
