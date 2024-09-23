@implementation HearingRecord

- (char)pmeVoiceEnabled
{
  _TtC16HeadphoneManager13HearingRecord *v2;
  char v5;

  v2 = self;
  v5 = HearingRecord.pmeVoiceEnabled.getter();

  return v5;
}

- (void)setPmeVoiceEnabled:(char)a3
{
  _TtC16HeadphoneManager13HearingRecord *v3;

  v3 = self;
  HearingRecord.pmeVoiceEnabled.setter(a3);

}

- (char)pmeMediaEnabled
{
  _TtC16HeadphoneManager13HearingRecord *v2;
  char v5;

  v2 = self;
  v5 = HearingRecord.pmeMediaEnabled.getter();

  return v5;
}

- (void)setPmeMediaEnabled:(char)a3
{
  _TtC16HeadphoneManager13HearingRecord *v3;

  v3 = self;
  HearingRecord.pmeMediaEnabled.setter(a3);

}

- (char)listeningModeOffAllowed
{
  _TtC16HeadphoneManager13HearingRecord *v2;
  char v5;

  v2 = self;
  v5 = HearingRecord.listeningModeOffAllowed.getter();

  return v5;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  _TtC16HeadphoneManager13HearingRecord *v3;

  v3 = self;
  HearingRecord.listeningModeOffAllowed.setter(a3);

}

- (NSString)debugDescription
{
  _TtC16HeadphoneManager13HearingRecord *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = self;
  v6 = HearingRecord.debugDescription.getter();
  v7 = v3;

  v8 = (id)MEMORY[0x24263ADA4](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (_TtC16HeadphoneManager13HearingRecord)init
{
  return (_TtC16HeadphoneManager13HearingRecord *)HearingRecord.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(char *);

  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  v2 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__bluetoothAddress;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<String>);
  v4 = *(void (**)(char *))(*(_QWORD *)(v3 - 8) + 8);
  v4((char *)self + v2);
  ((void (*)(char *, uint64_t))v4)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__bluetoothUUID, v3);
  outlined destroy of HMDeviceRecord?((id *)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord_deviceRecord));
}

@end
