@implementation MAGCaptureService

- (void)sessionRuntimeErrorWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274A6558(v4);

}

- (void)sessionWasInterruptedWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274A6D48(v4);

}

- (void)sessionInterruptionEndedWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274A7548(v4);

}

- (_TtC16MagnifierSupport17MAGCaptureService)init
{
  _TtC16MagnifierSupport17MAGCaptureService *result;

  result = (_TtC16MagnifierSupport17MAGCaptureService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_captureSessionQueue));
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_captureSessionRuntimeErrorSubscription, &qword_2558DBCD0);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_cameraVideoDataOutput));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_videoDeviceRotationCoordinator));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_contrastSliderControl));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_brightnessSliderControl));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_filterPickerControl));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService__capturedImage;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B9C30);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  opaqueCMSampleBuffer *v19;
  _TtC16MagnifierSupport17MAGCaptureService *v20;
  opaqueCMSampleBuffer *v21;
  _TtC16MagnifierSupport17MAGCaptureService *v22;
  id v23;
  id v24;
  uint64_t v25;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12, v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAGCMSampleBufferWrapper();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a4;
  v17 = sub_22758E4C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = self;
  v19 = a4;
  v20 = self;
  v21 = v19;
  v22 = v20;
  v23 = a3;
  v24 = a5;
  sub_2274193DC((uint64_t)v15, (uint64_t)&unk_2558DBC10, (uint64_t)v18);

  swift_release();
}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport17MAGCaptureService *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2274AA28C();

}

- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport17MAGCaptureService *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2274AA28C();

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC16MagnifierSupport17MAGCaptureService *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_2274AA448(v9, a5);

}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274AA28C();

}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274AA28C();

}

- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274AA28C();

}

- (void)sessionControlsWillExitFullscreenAppearance:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MAGCaptureService *v5;

  v4 = a3;
  v5 = self;
  sub_2274AA28C();

}

@end
