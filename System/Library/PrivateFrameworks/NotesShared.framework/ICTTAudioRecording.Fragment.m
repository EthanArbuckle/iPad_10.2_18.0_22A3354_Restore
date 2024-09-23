@implementation ICTTAudioRecording.Fragment

+ (NSDictionary)CRProperties
{
  return (NSDictionary *)sub_1BDAE92D0((uint64_t)a1, (uint64_t)a2, (void (*)(void))_sSo18ICTTAudioRecordingC11NotesSharedE8FragmentC12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0);
}

- (id)initWithIdentity:(void *)a1 fields:
{
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_1BDBFCB40();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFCB10();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF50BBA0);
  sub_1BDBFD5C0();
  v7 = (void *)sub_1BDBFCAF8();
  v8 = (void *)sub_1BDBFD5B4();
  swift_bridgeObjectRelease();
  v11.receiver = a1;
  v11.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v11, sel_initWithIdentity_fields_, v7, v8);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

- (id)initWithICCRCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithICCRCoder_, a3);
}

@end
