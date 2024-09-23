@implementation BlastDoorSMSMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage);
}

- (BOOL)has_spamCategory
{
  return (self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage] & 1) == 0;
}

- (int64_t)spamCategory
{
  if (self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage);
}

- (int64_t)filterSubCategory
{
  int64_t result;
  char v3;

  result = sub_1AD4D92B0(self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage + 1]);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (NSString)version
{
  return (NSString *)sub_1AD4CFC08();
}

- (int64_t)type
{
  return sub_1AD4C5D4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage);
}

- (NSArray)recipients
{
  void *v2;

  if (*(_QWORD *)&self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage + 32])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2E2D98);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  v7 = type metadata accessor for SMSMessage();
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 36)], (uint64_t)v5, (uint64_t *)&unk_1ED2E2D98);
  v8 = sub_1AD63B03C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1AD63B018();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (NSString)sender
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 40) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_iMessageCapability
{
  return sub_1AD4C5FE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (int64_t)iMessageCapability
{
  return sub_1AD4C6084((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)serviceCenter
{
  return (NSString *)sub_1AD4C612C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)originatedDeviceNumber
{
  return (NSString *)sub_1AD4C6200((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)originatedDeviceEmail
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 56) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)originatedDeviceSIM
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 60) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)subject
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 64) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)contentType
{
  return (NSString *)sub_1AD4CC900((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (BOOL)has_replaceMessage
{
  return sub_1AD4C6518((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (int64_t)replaceMessage
{
  return sub_1AD4C65B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)countryCode
{
  return (NSString *)sub_1AD4CCA88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)GUID
{
  return (NSString *)sub_1AD4CCB5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)fallbackHash
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 84) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)items
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C6764, (void (*)(void))type metadata accessor for _ObjCSMSCTPartWrapper);
}

- (BOOL)has_trackMessage
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 92)] != 2;
}

- (BOOL)trackMessage
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 92)] & 1;
}

- (BOOL)has_sendEnabled
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 96)] != 2;
}

- (BOOL)sendEnabled
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 96)] & 1;
}

- (BOOL)foundAppleGUID
{
  return sub_1AD4CD23C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

- (NSString)groupID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 104) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)originalGroupID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 108) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)displayName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 112) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)originatedDeviceUniqueID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for SMSMessage() + 116) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BlastDoorSMSMessage_SMSFilteringSettings)smsFilteringSettings
{
  char *v2;
  uint64_t v3;
  BlastDoorSMSMessage *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  v3 = type metadata accessor for SMSMessage();
  v4 = 0;
  v5 = &v2[*(int *)(v3 + 120)];
  v6 = *((_QWORD *)v5 + 1);
  if (v6 != 1)
  {
    v7 = *((_QWORD *)v5 + 2);
    v8 = *(_QWORD *)v5;
    v9 = (objc_class *)type metadata accessor for _ObjCSMSMessage_SMSFilteringSettingsWrapper();
    v10 = (char *)objc_allocWithZone(v9);
    v11 = &v10[OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings];
    *(_QWORD *)v11 = v8;
    *((_QWORD *)v11 + 1) = v6;
    *((_QWORD *)v11 + 2) = v7;
    v13.receiver = v10;
    v13.super_class = v9;
    swift_bridgeObjectRetain();
    v4 = -[BlastDoorSMSMessage init](&v13, sel_init);
  }
  return (BlastDoorSMSMessage_SMSFilteringSettings *)v4;
}

- (BlastDoorSMSMessage)init
{
  BlastDoorSMSMessage *result;

  result = (BlastDoorSMSMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(_QWORD))type metadata accessor for SMSMessage);
}

@end
