@implementation BlastDoorAPSQuickRelaySelfAllocToken

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 8];
  v3 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 40];
  v4 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 48];
  v5 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 56];
  v6 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 64];
  v7 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 72];
  v10 = *(_OWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                    + 16];
  v11 = *(_OWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                    + 80];
  sub_1AD00408C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken), *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken]);
  sub_1AD00408C(v2, v10);
  sub_1AD00408C(v3, v4);
  sub_1AD00408C(v5, v6);
  sub_1AD00408C(v7, v11);
  sub_1AD63B798();
  v8 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSData)relayIp
{
  return (NSData *)sub_1AD4C4F1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken, (void (*)(uint64_t, uint64_t))sub_1AD0040A0);
}

- (NSData)relayIpv6
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 16];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                     + 8];
    sub_1AD0040A0(v4, v2);
    v3 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_relayPort
{
  return (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                          + 32] & 1) == 0;
}

- (int64_t)relayPort
{
  if (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                       + 32])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                       + 24];
}

- (NSData)relaySessionKey
{
  return (NSData *)sub_1AD4A67FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (NSData)relaySessionId
{
  return (NSData *)sub_1AD4A68BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (NSData)relayAccessToken
{
  return (NSData *)sub_1AD4A60F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (BOOL)has_relayProvider
{
  return (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                          + 96] & 1) == 0;
}

- (int64_t)relayProvider
{
  if (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                       + 96])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                       + 88];
}

- (BlastDoorAPSQuickRelaySelfAllocToken)init
{
  BlastDoorAPSQuickRelaySelfAllocToken *result;

  result = (BlastDoorAPSQuickRelaySelfAllocToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 8];
  v3 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 16];
  v4 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 40];
  v5 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 48];
  v6 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 56];
  v7 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 64];
  v8 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 72];
  v9 = *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 80];
  sub_1AD004118(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken), *(_QWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken]);
  sub_1AD004118(v2, v3);
  sub_1AD004118(v4, v5);
  sub_1AD004118(v6, v7);
  sub_1AD004118(v8, v9);
}

@end
