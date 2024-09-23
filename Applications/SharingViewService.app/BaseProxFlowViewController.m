@implementation BaseProxFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService26BaseProxFlowViewController *v4;

  v4 = self;
  sub_100072490(a3);

}

- (void)_willAppearInRemoteViewController
{
  id v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  v2 = v5.receiver;
  -[BaseProxFlowViewController _willAppearInRemoteViewController](&v5, "_willAppearInRemoteViewController");
  v3 = (void *)sub_100064288();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAllowsAlertStacking:", 1, v5.receiver, v5.super_class);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (_TtC18SharingViewService26BaseProxFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18SharingViewService26BaseProxFlowViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  v11 = -[BaseProxFlowViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18SharingViewService26BaseProxFlowViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  return -[BaseProxFlowViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
