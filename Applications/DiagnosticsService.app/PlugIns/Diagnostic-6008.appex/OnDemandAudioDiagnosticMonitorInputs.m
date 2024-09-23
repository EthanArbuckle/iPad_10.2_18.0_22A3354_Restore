@implementation OnDemandAudioDiagnosticMonitorInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4;
  OnDemandAudioDiagnosticMonitorInputs *v5;
  char v6;

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v4 = 0;
  v5 = self;
  v6 = sub_1000083F8(v4);

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

- (OnDemandAudioDiagnosticMonitorInputs)init
{
  return (OnDemandAudioDiagnosticMonitorInputs *)sub_100008D60();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->diagnosticTestWaitDurationKey[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton]);
}

@end
