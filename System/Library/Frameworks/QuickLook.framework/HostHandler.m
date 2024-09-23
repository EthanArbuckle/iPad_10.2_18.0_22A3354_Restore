@implementation HostHandler

- (void)launchSucceededWithSessionUUID:(id)a3
{
  sub_20D57F844((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_20D581E28);
}

- (void)launchFailedWithSessionUUID:(id)a3 error:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;

  v5 = sub_20D5A6660();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6648();
  v9 = a4;
  swift_retain();
  sub_20D582438((uint64_t)v8, v9);
  swift_release();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)previewClosedWithSessionUUID:(id)a3
{
  sub_20D57F844((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_20D5826DC);
}

- (void)previewTerminatedWithSessionUUID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_20D5A6660();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6648();
  sub_20D5826DC((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)previewSceneMovedWithSessionUUID:(id)a3 sceneIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_20D5A6660();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6648();
  sub_20D582A40((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
