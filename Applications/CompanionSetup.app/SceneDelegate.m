@implementation SceneDelegate

- (UIWindow)window
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC14CompanionSetup13SceneDelegate *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = type metadata accessor for MainActor(0);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 12, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 12, v10, v12);
  v13 = *(id *)((char *)&v8->super.super.isa + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window);
  swift_release(v4);

  swift_release(v9);
  return (UIWindow *)v13;
}

- (void)setWindow:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  _TtC14CompanionSetup13SceneDelegate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = type metadata accessor for MainActor(0);
  v6 = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 12, v7, v9);
  v10 = (objc_class *)a3;
  v11 = self;
  v12 = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 12, v13, v15);
  v16 = *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window);
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window) = v10;
  swift_release(v6);

  swift_release(v12);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC14CompanionSetup13SceneDelegate *v17;

  v9 = type metadata accessor for MainActor(0);
  v10 = static MainActor.shared.getter();
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 14, v11, v13);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_100005970(v14);
  swift_release(v10);

}

- (_TtC14CompanionSetup13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
