@implementation CSMainViewController

- (_TtC14CompanionSetup20CSMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC14CompanionSetup20CSMainViewController *v16;
  objc_super v18;

  v7 = type metadata accessor for MainActor(0);
  v8 = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/CSMainViewController.swift", 41, 1, 11, v9, v11);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v13 = v12;
    v14 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    v15 = a4;
  }
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for CSMainViewController();
  v16 = -[CSMainViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", a3, a4);
  swift_release(v8);

  return v16;
}

- (_TtC14CompanionSetup20CSMainViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC14CompanionSetup20CSMainViewController *v10;
  objc_super v12;

  v5 = type metadata accessor for MainActor(0);
  v6 = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/CSMainViewController.swift", 41, 1, 11, v7, v9);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CSMainViewController();
  v10 = -[CSMainViewController initWithCoder:](&v12, "initWithCoder:", a3);
  swift_release(v6);
  return v10;
}

@end
