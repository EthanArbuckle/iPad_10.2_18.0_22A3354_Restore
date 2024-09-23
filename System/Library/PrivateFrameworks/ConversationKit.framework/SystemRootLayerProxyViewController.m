@implementation SystemRootLayerProxyViewController

- (_TtC15ConversationKit34SystemRootLayerProxyViewController)init
{
  return (_TtC15ConversationKit34SystemRootLayerProxyViewController *)SystemRootLayerProxyViewController.init()();
}

- (_TtC15ConversationKit34SystemRootLayerProxyViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemRootLayerProxyViewController.init(coder:)();
}

- (void)loadView
{
  _TtC15ConversationKit34SystemRootLayerProxyViewController *v2;

  v2 = self;
  SystemRootLayerProxyViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC15ConversationKit34SystemRootLayerProxyViewController *v2;

  v2 = self;
  SystemRootLayerProxyViewController.viewDidLoad()();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC15ConversationKit34SystemRootLayerProxyViewController *v8;

  v7 = a3;
  v8 = self;
  SystemRootLayerProxyViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKit34SystemRootLayerProxyViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  SystemRootLayerProxyViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit34SystemRootLayerProxyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  SystemRootLayerProxyViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit34SystemRootLayerProxyViewController_systemRootLayerProxyView));
}

@end
