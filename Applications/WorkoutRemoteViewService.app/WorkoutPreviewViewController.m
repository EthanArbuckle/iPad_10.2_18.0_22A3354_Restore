@implementation WorkoutPreviewViewController

+ (id)_remoteViewControllerInterface
{
  return sub_10000436C((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceExportedInterface);
}

+ (id)_exportedInterface
{
  return sub_10000436C((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceInterface);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)dismissView
{
  id v2;
  id v3;
  WorkoutPreviewViewController *v4;

  v4 = self;
  v2 = -[WorkoutPreviewViewController _remoteViewControllerProxy](v4, "_remoteViewControllerProxy");
  v3 = v2;
  swift_unknownObjectRelease(v2);
  if (v3)
  {
    objc_msgSend(v3, "dismiss");

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (WorkoutPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  WorkoutPreviewViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  v11 = -[WorkoutPreviewViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (WorkoutPreviewViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  return -[WorkoutPreviewViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager));
}

- (void)presentWorkoutDataRepresentation:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  WorkoutPreviewViewController *v12;

  v5 = a3;
  v12 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  type metadata accessor for WorkoutConfiguration(0);
  type metadata accessor for Occurrence(0);
  v9 = (void *)Occurrence.__allocating_init(count:)(0);
  type metadata accessor for WorkoutConfigurationValidator(0);
  v10 = static WorkoutConfigurationValidator.shared.getter();
  v11 = (void *)static WorkoutConfiguration.importFromData(_:with:validator:)(v6, v8, v9, v10);

  swift_release(v10);
  sub_1000043B4(v11);

  sub_1000040D0(v6, v8);
}

@end
