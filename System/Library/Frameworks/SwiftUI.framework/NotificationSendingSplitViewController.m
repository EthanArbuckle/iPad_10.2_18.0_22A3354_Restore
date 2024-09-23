@implementation NotificationSendingSplitViewController

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v6;
  _TtC7SwiftUI38NotificationSendingSplitViewController *v7;
  id v8;
  _TtC7SwiftUI38NotificationSendingSplitViewController *v9;
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
  NotificationSendingSplitViewController.showDetailViewController(_:sender:)(a3, (uint64_t)v10);

  outlined destroy of Any?((uint64_t)v10);
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  return -[NotificationSendingSplitViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _TtC7SwiftUI38NotificationSendingSplitViewController *v12;
  objc_super v14;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    v9 = a4;
    v10 = (void *)MEMORY[0x18D75CC88](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = a4;
    v10 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  v12 = -[NotificationSendingSplitViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, v10, a4);

  return v12;
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  return -[NotificationSendingSplitViewController initWithStyle:](&v5, sel_initWithStyle_, a3);
}

@end
