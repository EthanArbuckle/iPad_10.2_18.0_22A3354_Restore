@implementation CameraModel

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC13ClarityCamera11CameraModel *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  objc_super v12;

  v3 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = swift_allocObject(&unk_100029C58, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = &protocol witness table for MainActor;
  v10 = sub_100009270((uint64_t)v5, (uint64_t)&unk_10002D788, v9);
  swift_release(v10);
  v11 = (objc_class *)type metadata accessor for CameraModel(0);
  v12.receiver = v7;
  v12.super_class = v11;
  -[CameraModel dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel__recordButtonEnabled;
  v4 = sub_1000071DC(&qword_10002D790);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel__isRecordingVideo, v4);
  sub_1000077A4((uint64_t)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription, &qword_10002D710);

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  _TtC13ClarityCamera11CameraModel *v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = self;
  v10 = a5;
  sub_10000D3E8(v8, (uint64_t)a5);

}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v8;
  _TtC13ClarityCamera11CameraModel *v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = self;
  v10 = a5;
  sub_10000D68C((uint64_t)a5);

}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC13ClarityCamera11CameraModel *v15;
  id v16;
  __n128 v17;
  uint64_t v18;

  v10 = type metadata accessor for URL(0, a2, a3, a4, a5);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  v16 = a6;
  sub_10000D924(v17, (uint64_t)v13, (uint64_t)a6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)orientationChangedWithNotification:(id)a3
{
  id v4;
  _TtC13ClarityCamera11CameraModel *v5;

  v4 = a3;
  v5 = self;
  sub_10000DB20();

}

- (void)sessionWasInterruptedWithNotification:(id)a3
{
  id v4;
  __n128 v5;
  _TtC13ClarityCamera11CameraModel *v6;

  v4 = a3;
  v6 = self;
  sub_10000DE5C(v4, "Session was interrupted: %@", v5);

}

- (void)sessionInterruptionEndedWithNotification:(id)a3
{
  id v4;
  __n128 v5;
  _TtC13ClarityCamera11CameraModel *v6;

  v4 = a3;
  v6 = self;
  sub_10000DE5C(v4, "Session ended interruption: %@", v5);

}

- (_TtC13ClarityCamera11CameraModel)init
{
  _TtC13ClarityCamera11CameraModel *result;

  result = (_TtC13ClarityCamera11CameraModel *)_swift_stdlib_reportUnimplementedInitializer("ClarityCamera.CameraModel", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
