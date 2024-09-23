@implementation RealtimeCollaborationSelectionDocument.State

+ (NSDictionary)CRProperties
{
  void *v2;

  _s11NotesShared38RealtimeCollaborationSelectionDocumentC5StateC12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF50BBA0);
  v2 = (void *)sub_1BDBFD5B4();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithIdentity:(id)a3 fields:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  _TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1BDBFCB40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFCB10();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF50BBA0);
  sub_1BDBFD5C0();
  v10 = (void *)sub_1BDBFCAF8();
  v11 = (void *)sub_1BDBFD5B4();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[ICCRObject initWithIdentity:fields:](&v14, sel_initWithIdentity_fields_, v10, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithICCRCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[ICCRObject initWithICCRCoder:](&v5, sel_initWithICCRCoder_, a3);
}

@end
