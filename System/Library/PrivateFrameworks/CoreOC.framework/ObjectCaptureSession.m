@implementation ObjectCaptureSession

- (void)dealloc
{
  _TtC6CoreOC20ObjectCaptureSession *v2;

  v2 = self;
  ObjectCaptureSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__state;
  v4 = sub_23925FB08(&qword_25692A8D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__canTakeManualShot;
  v6 = sub_23925FB08(&qword_25692A8F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  v7 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_identifier;
  v8 = sub_239352020();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  sub_239331658(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_stateOnPause));
  sub_2393351A8(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_stateAfterFinishing));
  sub_23925FE28((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_currentFrame, (uint64_t *)&unk_25692A910);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23925FE28((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_snapshotURL, &qword_256927AD0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_239331104(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_pointCloud));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23925FE28((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__replayVideoURL, &qword_256927AD0);
  sub_23925FE28((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__recordVideoURL, &qword_256927AD0);
  swift_bridgeObjectRelease();
}

- (_TtC6CoreOC20ObjectCaptureSession)init
{
  _TtC6CoreOC20ObjectCaptureSession *result;

  result = (_TtC6CoreOC20ObjectCaptureSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC6CoreOC20ObjectCaptureSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_239336834(v7);

}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  sub_239324D48(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))ObjectCaptureSession.session(_:didAdd:));
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  sub_239324D48(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))ObjectCaptureSession.session(_:didUpdate:));
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  sub_239324D48(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))ObjectCaptureSession.session(_:didRemove:));
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6;
  id v7;
  _TtC6CoreOC20ObjectCaptureSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_239337B38(v7);

}

- (void)sessionWasInterrupted:(id)a3
{
  sub_239337F60(0xD000000000000019, 0x8000000239360630, "ObjectCaptureSession.%{private}s: ARSession was interrupted!");
}

- (void)sessionInterruptionEnded:(id)a3
{
  sub_239337F60(0xD00000000000001CLL, 0x8000000239360610, "ObjectCaptureSession.%{private}s: ARSession interruption ended!");
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  id v4;
  _TtC6CoreOC20ObjectCaptureSession *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _s6CoreOC20ObjectCaptureSessionC34sessionShouldAttemptRelocalizationySbSo9ARSessionCF_0();

  return self & 1;
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC6CoreOC20ObjectCaptureSession *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_239338468(v8);

}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  sub_2393388E8(a4);
}

- (uint64_t)logThermalStateChange
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_2393520B0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v5 = objc_msgSend(v4, sel_thermalState);

  v6 = sub_239275A60();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
  v7 = sub_239352098();
  v8 = sub_239352578();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136380931;
    v14 = sub_23925F3EC(0xD000000000000017, 0x8000000239360550, &v15);
    sub_2393526B0();
    *(_WORD *)(v9 + 12) = 2082;
    v14 = (uint64_t)v5;
    type metadata accessor for ThermalState(0);
    v11 = sub_23935232C();
    v14 = sub_23925F3EC(v11, v12, &v15);
    sub_2393526B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23925B000, v7, v8, "ObjectCaptureSession.%{private}s: Caution! Thermal State changed to %{public}s!", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B83BC04](v10, -1, -1);
    MEMORY[0x23B83BC04](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end
