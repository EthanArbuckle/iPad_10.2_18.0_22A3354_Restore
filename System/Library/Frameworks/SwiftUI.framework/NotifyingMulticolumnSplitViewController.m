@implementation NotifyingMulticolumnSplitViewController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v6;
  _TtC7SwiftUI39NotifyingMulticolumnSplitViewController *v7;
  id v8;
  _TtC7SwiftUI39NotifyingMulticolumnSplitViewController *v9;
  _OWORD v10[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a3;
    v9 = self;
  }
  NotifyingMulticolumnSplitViewController.showDetailViewController(_:sender:)(a3, (uint64_t)v10);

  outlined destroy of Any?((uint64_t)v10);
}

- (id)makeDetailNavigationControllerWithRoot:(id)a3
{
  Class v4;

  type metadata accessor for EnvironmentPropertyKey<AccessibilityLargeContentViewerKey>(0, &lazy cache variable for type metadata for StyleContextSplitViewNavigationController<NoStyleContext>, MEMORY[0x1E0CE2820], MEMORY[0x1E0CE2818], (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for StyleContextSplitViewNavigationController);
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithRootViewController_, a3);
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  _TtC7SwiftUI39NotifyingMulticolumnSplitViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  NotifyingMulticolumnSplitViewController.childForStatusBarHidden.getter();
  v4 = v3;

  return (UIViewController *)v4;
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[NotifyingMulticolumnSplitViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC7SwiftUI39NotifyingMulticolumnSplitViewController *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;
    v11 = a4;
    a3 = (id)MEMORY[0x18D75CC88](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[NotifyingMulticolumnSplitViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, a3, a4);

  return v13;
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[NotifyingMulticolumnSplitViewController initWithStyle:](&v5, sel_initWithStyle_, a3);
}

@end
