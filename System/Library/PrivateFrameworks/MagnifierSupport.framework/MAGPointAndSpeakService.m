@implementation MAGPointAndSpeakService

- (void)playHandAbsentTone
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v2 = type metadata accessor for MAGOutputEvent(0);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAGOutputEvent.EventType(0);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  swift_retain();
  sub_22758C978();
  v8[*(int *)(v2 + 24)] = 1;
  v8[*(int *)(v2 + 28)] = 1;
  sub_2273C9264((uint64_t)v8);
  swift_release();
  sub_22730DFB0((uint64_t)v8, type metadata accessor for MAGOutputEvent);
  swift_release();
}

@end
