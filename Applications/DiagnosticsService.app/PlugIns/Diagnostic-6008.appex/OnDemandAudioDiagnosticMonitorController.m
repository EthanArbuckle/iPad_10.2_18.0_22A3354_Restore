@implementation OnDemandAudioDiagnosticMonitorController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  uint64_t v7;
  OnDemandAudioDiagnosticMonitorController *v8;

  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  sub_1000040B0((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)start
{
  OnDemandAudioDiagnosticMonitorController *v2;

  v2 = self;
  sub_100004524();

}

- (void)teardown
{
  void *v2;
  void *v3;
  OnDemandAudioDiagnosticMonitorController *v4;

  v2 = *(void **)&self->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient];
  v4 = self;
  objc_msgSend(v2, "invalidate");
  v3 = *(void **)&v4->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder];
  if (v3)
  {
    objc_msgSend(v3, "clearAllowSessionAccessoryDisconnect");

  }
  else
  {
    __break(1u);
  }
}

- (OnDemandAudioDiagnosticMonitorController)init
{
  return (OnDemandAudioDiagnosticMonitorController *)sub_100006D14();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->inputs[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID]);
}

@end
