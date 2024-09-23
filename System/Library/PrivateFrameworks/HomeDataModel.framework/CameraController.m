@implementation CameraController

- (void)cameraStreamControlDidStartStream:(id)a3
{
  sub_23E2BC03C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))CameraController.cameraStreamControlDidStartStream(_:));
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  swift_retain();
  v6 = a4;
  CameraController.cameraStreamControl(_:didStopStreamWithError:)(v5, a4);

  swift_release();
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  sub_23E2BC03C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))CameraController.cameraSnapshotControlDidUpdateMostRecentSnapshot(_:));
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[3];
  char v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D413C0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = a4;
  v17[1] = a5;
  v17[2] = 0;
  v18 = 1;
  v12 = a4;
  v13 = a5;
  v14 = v12;
  v15 = v13;
  v16 = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D413C8);
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_release();
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  sub_23E2BC03C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))CameraController.cameraUserSettingsDidUpdate(_:));
}

- (_TtC13HomeDataModel16CameraController)init
{
  _TtC13HomeDataModel16CameraController *result;

  swift_defaultActor_initialize();
  result = (_TtC13HomeDataModel16CameraController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
