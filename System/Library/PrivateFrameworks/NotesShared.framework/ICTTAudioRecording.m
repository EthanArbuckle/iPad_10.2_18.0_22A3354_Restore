@implementation ICTTAudioRecording

+ (NSDictionary)CRProperties
{
  return (NSDictionary *)sub_1BDAE92D0((uint64_t)a1, (uint64_t)a2, (void (*)(void))_sSo18ICTTAudioRecordingC11NotesSharedE12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0);
}

- (ICTTAudioRecording)initWithIdentity:(id)a3 fields:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  ICTTAudioRecording *v11;
  objc_super v13;

  v5 = sub_1BDBFCB40();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFCB10();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF50BBA0);
  sub_1BDBFD5C0();
  v9 = (void *)sub_1BDBFCAF8();
  v10 = (void *)sub_1BDBFD5B4();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)ICTTAudioRecording;
  v11 = -[ICCRObject initWithIdentity:fields:](&v13, sel_initWithIdentity_fields_, v9, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (ICTTAudioRecording)initWithICCRCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTTAudioRecording;
  return -[ICCRObject initWithICCRCoder:](&v4, sel_initWithICCRCoder_, a3);
}

@end
