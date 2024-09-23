@implementation OnDemandAudioDiagnosticTriggerInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4;
  OnDemandAudioDiagnosticTriggerInputs *v5;
  char v6;

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v4 = 0;
  v5 = self;
  v6 = sub_100005E58(v4);

  swift_bridgeObjectRelease(v4);
  return v6 & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (OnDemandAudioDiagnosticTriggerInputs)init
{
  return (OnDemandAudioDiagnosticTriggerInputs *)sub_100006264();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->triggerTimeoutKey[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->triggerTimeoutKey[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->triggerTimeoutKey[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->triggerTimeoutKey[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey]);
}

@end
