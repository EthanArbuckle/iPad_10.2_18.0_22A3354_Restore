@implementation BlastDoorRelayGroupMutationMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage);
}

- (NSString)sender
{
  return (NSString *)sub_1AD4C2054((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage);
}

- (NSString)service
{
  return (NSString *)sub_1AD4C324C();
}

- (BlastDoorGroupID)groupID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 40];
  v2 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 48];
  v5 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 56];
  v4 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 64];
  v6 = (objc_class *)type metadata accessor for _ObjCGroupIDWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorGroupID_groupID];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v5;
  *((_QWORD *)v8 + 3) = v4;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  return (BlastDoorGroupID *)-[BlastDoorRelayGroupMutationMessage init](&v10, sel_init);
}

- (BlastDoorGroupID)originalGroupID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 72];
  v2 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 80];
  v5 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 88];
  v4 = *(_QWORD *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 96];
  v6 = (objc_class *)type metadata accessor for _ObjCGroupIDWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorGroupID_groupID];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v5;
  *((_QWORD *)v8 + 3) = v4;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  return (BlastDoorGroupID *)-[BlastDoorRelayGroupMutationMessage init](&v10, sel_init);
}

- (NSUUID)guid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1AD63B084();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage;
  v8 = type metadata accessor for RelayGroupMutationMessage();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 32)], v3);
  v9 = (void *)sub_1AD63B060();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v9;
}

- (NSString)destinationCallerID
{
  return (NSString *)sub_1AD4C0E6C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage);
}

- (BOOL)fromMe
{
  return sub_1AD4C271C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(_QWORD))type metadata accessor for RelayGroupMutationMessage);
}

- (BlastDoorRelayGroupMutationWrapper)mutation
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  objc_class *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage;
  v3 = &v2[*(int *)(type metadata accessor for RelayGroupMutationMessage() + 44)];
  v4 = *(_QWORD *)v3;
  v5 = *((_QWORD *)v3 + 1);
  v6 = *((_QWORD *)v3 + 2);
  v7 = *((_QWORD *)v3 + 3);
  v8 = v3[32];
  v9 = (objc_class *)type metadata accessor for _ObjCEnumRelayGroupMutationWrapper();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation];
  *(_QWORD *)v11 = v4;
  *((_QWORD *)v11 + 1) = v5;
  *((_QWORD *)v11 + 2) = v6;
  *((_QWORD *)v11 + 3) = v7;
  v11[32] = v8;
  sub_1AD28BEFC(v4, v5, v6, v7, v8);
  v13.receiver = v10;
  v13.super_class = v9;
  return (BlastDoorRelayGroupMutationWrapper *)-[BlastDoorRelayGroupMutationMessage init](&v13, sel_init);
}

- (BlastDoorRelayGroupMutationMessage)init
{
  BlastDoorRelayGroupMutationMessage *result;

  result = (BlastDoorRelayGroupMutationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(_QWORD))type metadata accessor for RelayGroupMutationMessage);
}

@end
