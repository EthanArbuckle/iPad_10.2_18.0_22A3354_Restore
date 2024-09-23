@implementation BlastDoorNicknameInformationMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for NicknameInformationMessage, &OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage);
}

- (BlastDoorNicknameInformation)nicknameInformation
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_class *v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 168];
  v32 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 152];
  v33 = v2;
  v34 = *(_QWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 184];
  v3 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 104];
  v28 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 88];
  v29 = v3;
  v4 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 136];
  v30 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 120];
  v31 = v4;
  v5 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 40];
  v24 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 24];
  v25 = v5;
  v6 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 72];
  v26 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 56];
  v27 = v6;
  v7 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 8];
  v22 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage);
  v23 = v7;
  v8 = (objc_class *)type metadata accessor for _ObjCNicknameInformationWrapper();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation];
  *(_OWORD *)v10 = v22;
  v11 = v26;
  v13 = v23;
  v12 = v24;
  *((_OWORD *)v10 + 3) = v25;
  *((_OWORD *)v10 + 4) = v11;
  *((_OWORD *)v10 + 1) = v13;
  *((_OWORD *)v10 + 2) = v12;
  v14 = v30;
  v16 = v27;
  v15 = v28;
  *((_OWORD *)v10 + 7) = v29;
  *((_OWORD *)v10 + 8) = v14;
  *((_OWORD *)v10 + 5) = v16;
  *((_OWORD *)v10 + 6) = v15;
  v18 = v32;
  v17 = v33;
  v19 = v31;
  *((_QWORD *)v10 + 24) = v34;
  *((_OWORD *)v10 + 10) = v18;
  *((_OWORD *)v10 + 11) = v17;
  *((_OWORD *)v10 + 9) = v19;
  sub_1AD28AEFC(&v22);
  v21.receiver = v9;
  v21.super_class = v8;
  return (BlastDoorNicknameInformation *)-[BlastDoorNicknameInformationMessage init](&v21, sel_init);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  BlastDoorNicknameInformationMessage *v10;
  BlastDoorNicknameInformationMessage *v11;
  objc_super v13;

  v3 = type metadata accessor for Metadata();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage;
  v7 = type metadata accessor for NicknameInformationMessage();
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);
  v8 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  v9 = objc_allocWithZone(v8);
  sub_1AD0D3D2C((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = -[BlastDoorNicknameInformationMessage init](&v13, sel_init);
  sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v11;
}

- (BlastDoorNicknameInformationMessage)init
{
  BlastDoorNicknameInformationMessage *result;

  result = (BlastDoorNicknameInformationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage, (uint64_t (*)(_QWORD))type metadata accessor for NicknameInformationMessage);
}

@end
