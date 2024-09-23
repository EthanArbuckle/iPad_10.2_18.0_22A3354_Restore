@implementation BlastDoorTextMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (BlastDoorTextMessageMessageTypeWrapper)messageSubType
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  BlastDoorTextMessage *v10;
  BlastDoorTextMessage *v11;
  objc_super v13;

  v3 = type metadata accessor for TextMessage.MessageType(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  v7 = type metadata accessor for TextMessage(0);
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, type metadata accessor for TextMessage.MessageType);
  v8 = (objc_class *)type metadata accessor for _ObjCEnumTextMessageMessageTypeWrapper(0);
  v9 = objc_allocWithZone(v8);
  sub_1AD0D3D2C((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorTextMessageMessageTypeWrapper_textMessage_MessageType, type metadata accessor for TextMessage.MessageType);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = -[BlastDoorTextMessage init](&v13, sel_init);
  sub_1AD066230((uint64_t)v5, type metadata accessor for TextMessage.MessageType);

  return (BlastDoorTextMessageMessageTypeWrapper *)v11;
}

- (NSUUID)replyToGUID
{
  return (NSUUID *)sub_1AD4CBBD8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)threadIdentifierGUID
{
  return (NSString *)sub_1AD4BCC2C((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage);
}

- (NSString)threadOriginatorFallbackHash
{
  return (NSString *)sub_1AD4CBD50((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage);
}

- (NSString)expressiveSendStyleIdentifier
{
  return (NSString *)sub_1AD4C0E6C((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage);
}

- (NSString)groupID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *result;
  uint64_t v12;

  v3 = type metadata accessor for TextMessage(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 40)];
  v8 = *((_QWORD *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v9 = *((_QWORD *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for TextMessage);
    if (v8)
    {
      v10 = (void *)sub_1AD63B744();
      sub_1AD003F24(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1AD4CC1C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_groupParticipantVersion
{
  return sub_1AD4CC294((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (unint64_t)groupParticipantVersion
{
  return sub_1AD4CC334((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_groupProtocolVersion
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return (v2[*(int *)(type metadata accessor for TextMessage(0) + 52) + 8] & 1) == 0;
}

- (unint64_t)groupProtocolVersion
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  v3 = &v2[*(int *)(type metadata accessor for TextMessage(0) + 52)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_groupPhotoCreationTime
{
  return sub_1AD4CC4E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (unint64_t)groupPhotoCreationTime
{
  return sub_1AD4CC584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BlastDoorTextMessage_MessageSummaryInfo)messageSummaryInfo
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  char *v13;
  char *v14;
  BlastDoorTextMessage *v15;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  v3 = &v2[*(int *)(type metadata accessor for TextMessage(0) + 60)];
  v4 = *((_QWORD *)v3 + 1);
  if (v4)
  {
    v5 = *((_QWORD *)v3 + 7);
    v6 = *((_QWORD *)v3 + 6);
    v17 = *((_QWORD *)v3 + 5);
    v18 = *((_QWORD *)v3 + 8);
    v8 = *((_QWORD *)v3 + 3);
    v7 = *((_QWORD *)v3 + 4);
    v9 = *((_QWORD *)v3 + 2);
    v10 = *(_QWORD *)v3;
    v11 = *(_QWORD *)v3 >> 8;
    v12 = (objc_class *)type metadata accessor for _ObjCTextMessage_MessageSummaryInfoWrapper();
    v13 = (char *)objc_allocWithZone(v12);
    v14 = &v13[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo];
    *v14 = v10;
    v14[1] = v11;
    *((_QWORD *)v14 + 1) = v4;
    *((_QWORD *)v14 + 2) = v9;
    *((_QWORD *)v14 + 3) = v8;
    *((_QWORD *)v14 + 4) = v7;
    *((_QWORD *)v14 + 5) = v17;
    *((_QWORD *)v14 + 6) = v6;
    *((_QWORD *)v14 + 7) = v5;
    *((_QWORD *)v14 + 8) = v18;
    swift_retain();
    sub_1AD003E48(v8, v7);
    swift_retain();
    sub_1AD003E48(v5, v18);
    v19.receiver = v13;
    v19.super_class = v12;
    v15 = -[BlastDoorTextMessage init](&v19, sel_init);
  }
  else
  {
    v15 = 0;
  }
  return (BlastDoorTextMessage_MessageSummaryInfo *)v15;
}

- (BOOL)isAutoReply
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 64)];
}

- (NSString)availabilityVerificationRecipientChannelIDPrefix
{
  return (NSString *)sub_1AD4CC900((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)availabilityVerificationRecipientEncryptionValidationToken
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for TextMessage(0) + 72) + 8])
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

- (NSString)availabilityOffGridRecipientSubscriptionValidationToken
{
  return (NSString *)sub_1AD4CCA88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)availabilityOffGridRecipientEncryptionValidationToken
{
  return (NSString *)sub_1AD4CCB5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_seenAsOffGrid
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 84)] != 2;
}

- (BOOL)seenAsOffGrid
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 84)] & 1;
}

- (NSString)lastPublisherOfOffGridStatus
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *result;
  uint64_t v12;

  v3 = type metadata accessor for TextMessage(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 88)];
  v8 = *((_QWORD *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v9 = *((_QWORD *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for TextMessage);
    if (v8)
    {
      v10 = (void *)sub_1AD63B744();
      sub_1AD003F24(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BlastDoorNicknameInformation)nicknameInformation
{
  char *v2;
  uint64_t v3;
  int v4;
  BlastDoorTextMessage *v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;
  _QWORD v20[25];
  _BYTE v21[200];
  _OWORD v22[12];
  uint64_t v23;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  v3 = type metadata accessor for TextMessage(0);
  sub_1AD00FF28((uint64_t)&v2[*(int *)(v3 + 92)], (uint64_t)v21, &qword_1ED2E1B00);
  sub_1AD00FF28((uint64_t)v21, (uint64_t)v22, &qword_1ED2E1B00);
  v4 = sub_1AD0CD93C((uint64_t *)v22);
  v5 = 0;
  if (v4 != 1)
  {
    v6 = (objc_class *)type metadata accessor for _ObjCNicknameInformationWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation];
    *(_OWORD *)v8 = v22[0];
    v9 = v22[4];
    v10 = v22[2];
    v11 = v22[1];
    *((_OWORD *)v8 + 3) = v22[3];
    *((_OWORD *)v8 + 4) = v9;
    *((_OWORD *)v8 + 1) = v11;
    *((_OWORD *)v8 + 2) = v10;
    v12 = v22[8];
    v13 = v22[6];
    v14 = v22[5];
    *((_OWORD *)v8 + 7) = v22[7];
    *((_OWORD *)v8 + 8) = v12;
    *((_OWORD *)v8 + 5) = v14;
    *((_OWORD *)v8 + 6) = v13;
    v15 = v22[11];
    v16 = v22[10];
    v17 = v22[9];
    *((_QWORD *)v8 + 24) = v23;
    *((_OWORD *)v8 + 10) = v16;
    *((_OWORD *)v8 + 11) = v15;
    *((_OWORD *)v8 + 9) = v17;
    sub_1AD00FF28((uint64_t)v21, (uint64_t)v20, &qword_1ED2E1B00);
    sub_1AD28AEFC(v20);
    v19.receiver = v7;
    v19.super_class = v6;
    v5 = -[BlastDoorTextMessage init](&v19, sel_init);
  }
  return (BlastDoorNicknameInformation *)v5;
}

- (NSString)truncatedNicknameRecordKey
{
  return (NSString *)sub_1AD4CD168((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)isExpirable
{
  return sub_1AD4CD23C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)isSOS
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 104)];
}

- (BOOL)isCritical
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 108)];
}

- (BOOL)has_replicationSourceID
{
  return sub_1AD4CD394((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (int64_t)replicationSourceID
{
  return sub_1AD4CD434((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (int64_t)scheduleType
{
  return sub_1AD4CD4E8();
}

- (NSDate)scheduledDate
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
  v6 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  v7 = type metadata accessor for TextMessage(0);
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 120)], (uint64_t)v5, (uint64_t *)&unk_1ED2E2D98);
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

- (NSArray)replicatedFallbackGUIDs
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for TextMessage(0) + 124)])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (BlastDoorTextMessage)init
{
  BlastDoorTextMessage *result;

  result = (BlastDoorTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

@end
