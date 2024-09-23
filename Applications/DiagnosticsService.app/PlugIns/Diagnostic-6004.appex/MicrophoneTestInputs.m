@implementation MicrophoneTestInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return sub_10000D954((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_predicates);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4;
  MicrophoneTestInputs *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = self;
  LOBYTE(self) = sub_10000D18C(v4);

  swift_bridgeObjectRelease(v4);
  return self & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return sub_10000D954((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_specifications);
}

- (MicrophoneTestInputs)init
{
  return (MicrophoneTestInputs *)sub_10000D9B4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_stringProperties));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_microphoneSequence));
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioRecordingDuration[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioRecordingDuration[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioRecordingDuration[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioRecordingDuration[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_predicates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_parameters));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MicrophoneTestInputs_specifications));
}

@end
