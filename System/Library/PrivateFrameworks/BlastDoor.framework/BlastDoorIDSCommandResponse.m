@implementation BlastDoorIDSCommandResponse

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  _OWORD v9[10];
  unsigned __int8 v10;

  v2 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136];
  v9[8] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 120];
  v9[9] = v2;
  v3 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  v9[4] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56];
  v9[5] = v3;
  v4 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
  v9[6] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 88];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
  v9[1] = v5;
  v6 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40];
  v9[2] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 24];
  v9[3] = v6;
  v10 = self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152];
  sub_1AD4D9998(v9);
  sub_1AD63B798();
  v7 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (int64_t)command
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_messageId
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8] & 1) == 0;
}

- (int64_t)messageId
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse];
}

- (NSData)messageUUID
{
  return (NSData *)sub_1AD4B3B48((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_responseStatus
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40] & 1) == 0;
}

- (int64_t)responseStatus
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 32];
}

- (BOOL)has_failReason
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56] & 1) == 0;
}

- (int64_t)failReason
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 48];
}

- (NSData)token
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 64];
    sub_1AD0040A0(v4, v2);
    v3 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_internalBuild
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 80] != 2;
}

- (BOOL)internalBuild
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 80] & 1;
}

- (BOOL)has_loggingProfile
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 81] != 2;
}

- (BOOL)loggingProfile
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 81] & 1;
}

- (NSString)applicationId
{
  void *v2;

  if (*(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 96])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_requestType
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 112] & 1) == 0;
}

- (int64_t)requestType
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 112])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
}

- (NSData)idsSessionId
{
  return (NSData *)sub_1AD4B3540((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_sharedSession
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136] != 2;
}

- (BOOL)sharedSession
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136] & 1;
}

- (BOOL)has_protocolVersion
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152] & 1) == 0;
}

- (int64_t)protocolVersion
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 144];
}

- (BlastDoorIDSCommandResponse)init
{
  BlastDoorIDSCommandResponse *result;

  result = (BlastDoorIDSCommandResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[10];
  unsigned __int8 v8;

  v2 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136];
  v7[8] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 120];
  v7[9] = v2;
  v8 = self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152];
  v3 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  v7[4] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56];
  v7[5] = v3;
  v4 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
  v7[6] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 88];
  v7[7] = v4;
  v5 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
  v7[1] = v5;
  v6 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40];
  v7[2] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 24];
  v7[3] = v6;
  sub_1AD4E0060(v7);
}

@end
