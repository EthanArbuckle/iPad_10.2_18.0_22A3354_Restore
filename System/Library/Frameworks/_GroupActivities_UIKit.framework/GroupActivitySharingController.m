@implementation GroupActivitySharingController

- (NSString)shareSheetSessionID
{
  uint64_t (*v2)(void);
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x24BEE4EA0])
                           + 0xC0);
  v3 = self;
  v4 = v2();
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x2207D3EF8](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setShareSheetSessionID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller))
                                               + 0xC8);
  v8 = self;
  v7(v4, v6);

}

- (BOOL)startStagedActivity
{
  uint64_t (*v2)(void);
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v3;
  char v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x24BEE4EA0])
                           + 0xD8);
  v3 = self;
  v4 = v2();

  return v4 & 1;
}

- (void)setStartStagedActivity:(BOOL)a3
{
  _BOOL8 v3;
  void (*v4)(_BOOL8);
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v5;

  v3 = a3;
  v4 = *(void (**)(_BOOL8))((**(_QWORD **)((char *)&self->super.super.super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x24BEE4EA0])
                                     + 0xE0);
  v5 = self;
  v4(v3);

}

- (int64_t)modalPresentationStyle
{
  return 1;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroupActivitySharingController();
  -[GroupActivitySharingController setModalPresentationStyle:](&v3, sel_setModalPresentationStyle_, 1);
}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithItemProvider:(id)a3
{
  return (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)GroupActivitySharingController.init(itemProvider:)(a3);
}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithCoder:(id)a3
{
  return (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)GroupActivitySharingController.init(coder:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v4;

  v4 = self;
  GroupActivitySharingController.viewWillAppear(_:)(a3);

}

- (void)viewDidLoad
{
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v2;

  v2 = self;
  GroupActivitySharingController.viewDidLoad()();

}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *result;

  v4 = a4;
  result = (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController__resultValue;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<GroupActivitySharingResult?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (void)registerWithResultHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC22_GroupActivities_UIKit30GroupActivitySharingController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  GroupActivitySharingController.registerResultHandler(_:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v5);

  swift_release();
}

@end
