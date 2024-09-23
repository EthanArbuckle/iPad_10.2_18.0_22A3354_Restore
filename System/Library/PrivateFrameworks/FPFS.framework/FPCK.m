@implementation FPCK

- (int64_t)numberOfFilesChecked
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfFilesChecked);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfFilesChecked:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfFilesChecked);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSAndFSSnapshotCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSAndFSSnapshotCheck);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInReconciliationTableCheck
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInReconciliationTableCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInReconciliationTableCheck);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInBackupManifestCheck
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInBackupManifestCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInBackupManifestCheck);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)numberOfReconciliationTableEntries
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfReconciliationTableEntries);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfReconciliationTableEntries:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfReconciliationTableEntries);
  swift_beginAccess();
  *v4 = a3;
}

- (NSDictionary)telemetryReport
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_telemetryReport);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23B1C61F4();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setTelemetryReport:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_23B1C620C();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_telemetryReport);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC9libfssync4FPCK)initWithDatabasesBackupsPaths:(id)a3 volumeRole:(unsigned int)a4 providerDomainID:(id)a5 domainUserInfo:(id)a6 reason:(unint64_t)a7 usingFPFS:(BOOL)a8 iCDPackageDetection:(BOOL)a9 useShouldPause:(BOOL)a10 shouldPause:(id)a11 isInvalidated:(id)a12
{
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id (*v22)();
  uint64_t v23;
  _TtC9libfssync4FPCK *v24;

  v15 = _Block_copy(a11);
  v16 = _Block_copy(a12);
  v17 = sub_23B1C620C();
  if (a6)
    v18 = sub_23B1C620C();
  else
    v18 = 0;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v15;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v16;
  v21 = a8;
  if (a10)
  {
    swift_retain();
    v22 = sub_23ADF21DC;
    v23 = v19;
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  swift_getObjectType();
  v24 = (_TtC9libfssync4FPCK *)sub_23ADEC718(v17, a4, a5, v18, a7, v21, a9, 0, 256, (uint64_t)v22, v23, (uint64_t)sub_23ADF21FC, (uint64_t (*)())v20);
  swift_release();
  swift_deallocPartialClassInstance();
  return v24;
}

- (void)dealloc
{
  _TtC9libfssync4FPCK *v2;

  v2 = self;
  sub_23ADC00EC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23AAB7948(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_shouldPause));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _Block_release(*(const void **)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_ioContext));
  swift_release();
  swift_bridgeObjectRelease();
  sub_23AA8A05C((uint64_t)self + OBJC_IVAR____TtC9libfssync4FPCK_rootURL, (uint64_t *)&unk_2542E6740);
  swift_bridgeObjectRelease();
}

- (BOOL)launchWithTelemetryFromURLs:(id)a3 options:(unint64_t)a4 error:(id *)a5 resultHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC9libfssync4FPCK *v11;

  v8 = _Block_copy(a6);
  sub_23B1C5A08();
  v9 = sub_23B1C6704();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = self;
  sub_23ADC62F4(v9, a4, (uint8_t *)sub_23ADF219C, v10);
  swift_bridgeObjectRelease();
  swift_release();

  return 1;
}

- (BOOL)checker:(id)a3 handleItem:(int)a4 itemStatus:(id *)a5 under:(id)a6 brokenInvariants:(unint64_t)a7
{
  uint64_t v12;
  id v13;
  _TtC9libfssync4FPCK *v14;

  sub_23AA9F52C(0, (unint64_t *)&qword_2542E7568);
  v12 = sub_23B1C6704();
  v13 = a3;
  v14 = self;
  LOBYTE(a7) = sub_23ADED998(a4, (uint64_t)a5, v12, a7);

  swift_bridgeObjectRelease();
  return a7 & 1;
}

- (BOOL)checker:(id)a3 handleLockedItemAtPath:(id)a4 handle:(const fpfs_item_handle *)a5
{
  unint64_t var0;
  id v8;
  _TtC9libfssync4FPCK *v9;
  uint64_t v11;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_fsSnapshotChecker))
  {
    var0 = a5->var0;
    swift_beginAccess();
    v8 = a3;
    v9 = self;
    swift_retain();
    sub_23ADE11B8(&v11, var0, &qword_2542DF398);
    swift_endAccess();

    swift_release();
  }
  return 1;
}

+ (BOOL)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = a4;
  v8 = sub_23B1C63E0();
  v10 = v9;
  v11 = a5;
  sub_23ADEFB8C(v8, v10, v7, v11);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC9libfssync4FPCK)init
{
  _TtC9libfssync4FPCK *result;

  result = (_TtC9libfssync4FPCK *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
