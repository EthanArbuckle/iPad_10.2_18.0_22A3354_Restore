@implementation AudioBoxInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return sub_10000B7C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AudioBoxInputs_predicates);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4;
  AudioBoxInputs *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = self;
  LOBYTE(self) = sub_10000B3A4(v4);

  swift_bridgeObjectRelease(v4);
  return self & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return sub_10000B7C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AudioBoxInputs_specifications);
}

- (AudioBoxInputs)init
{
  return (AudioBoxInputs *)sub_10000B824();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_audioBoxIDKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_sourcesKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_audioBoxID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audioBoxIDKey[OBJC_IVAR___AudioBoxInputs_audioBoxToken]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioBoxInputs_sources));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioBoxInputs_predicates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioBoxInputs_parameters));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioBoxInputs_specifications));
}

@end
