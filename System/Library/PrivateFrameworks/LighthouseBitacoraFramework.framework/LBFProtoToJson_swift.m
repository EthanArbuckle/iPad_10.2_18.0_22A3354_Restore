@implementation LBFProtoToJson_swift

+ (id)serializeBitacoraStateToJsonWithProtoData:(id)a3
{
  return sub_240313CCC((uint64_t)a1, (uint64_t)a2, a3, (uint64_t *)&unk_256FF5730, type metadata accessor for LighthouseBitacoraProto_BitacoraState, &qword_256FF54A0, (uint64_t)&unk_240318F68);
}

+ (id)serializeBitacoraBitacoraMlruntimedEventToJsonWithProtoData:(id)a3
{
  return sub_240313CCC((uint64_t)a1, (uint64_t)a2, a3, &qword_256FF5728, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, &qword_256FF5520, (uint64_t)&unk_240319530);
}

+ (id)serializeBitacoraLighthousePluginEventToJsonWithProtoData:(id)a3
{
  return sub_240313CCC((uint64_t)a1, (uint64_t)a2, a3, &qword_256FF5720, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, &qword_256FF5560, (uint64_t)&unk_240319800);
}

+ (id)serializeBitacoraTrialdEventToJsonWithProtoData:(id)a3
{
  return sub_240313CCC((uint64_t)a1, (uint64_t)a2, a3, &qword_256FF5710, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, &qword_256FF54C0, (uint64_t)&unk_2403190F8);
}

- (_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return -[LBFProtoToJson_swift init](&v3, sel_init);
}

@end
