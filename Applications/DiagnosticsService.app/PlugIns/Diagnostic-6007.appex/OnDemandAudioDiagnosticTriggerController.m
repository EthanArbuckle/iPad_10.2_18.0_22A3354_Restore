@implementation OnDemandAudioDiagnosticTriggerController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  OnDemandAudioDiagnosticTriggerController *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000040DC((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)start
{
  OnDemandAudioDiagnosticTriggerController *v2;

  v2 = self;
  sub_1000041F0();

}

- (void)teardown
{
  objc_msgSend(*(id *)&self->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_hearingModeClient], "invalidate");
}

- (OnDemandAudioDiagnosticTriggerController)init
{
  uint64_t v3;
  id v4;
  OnDemandAudioDiagnosticTriggerController *v5;
  objc_super v7;

  v3 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_hearingModeClient;
  v4 = objc_allocWithZone((Class)HMServiceClient);
  v5 = self;
  *(_QWORD *)&self->DKDiagnosticController_opaque[v3] = objc_msgSend(v4, "init");
  *(_QWORD *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs] = 0;
  *(_QWORD *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder] = 0;
  *(_QWORD *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount] = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerController();
  return -[OnDemandAudioDiagnosticTriggerController init](&v7, "init");
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder]);
}

@end
