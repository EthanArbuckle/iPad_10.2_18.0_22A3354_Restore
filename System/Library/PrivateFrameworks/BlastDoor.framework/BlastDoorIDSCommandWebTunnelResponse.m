@implementation BlastDoorIDSCommandWebTunnelResponse

- (NSString)description
{
  char *v2;
  void *v3;
  _BYTE v5[280];
  _QWORD __dst[35];

  v2 = (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse, sizeof(__dst));
  memcpy(v5, v2, sizeof(v5));
  sub_1AD4D9A20(__dst);
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)command
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_messageId
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 8] & 1) == 0;
}

- (int64_t)messageId
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 8])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse];
}

- (NSData)messageUUID
{
  return (NSData *)sub_1AD4B3B48((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_responseStatus
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 40] & 1) == 0;
}

- (int64_t)responseStatus
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 40])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                       + 32];
}

- (NSString)contentType
{
  return (NSString *)sub_1AD4D3644((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_epochTimeNanos
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 72] & 1) == 0;
}

- (int64_t)epochTimeNanos
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 72])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                       + 64];
}

- (NSString)httpUrl
{
  return (NSString *)sub_1AD4BD7EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BlastDoorAPSUserPayloadHttpHeaders)httpHeaders
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
  v3 = *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 104];
  if (v3 == 1)
    return (BlastDoorAPSUserPayloadHttpHeaders *)0;
  v5 = v2[22];
  v17 = v2[23];
  v18 = v2[24];
  v6 = v2[20];
  v16 = v2[21];
  v7 = v2[18];
  v8 = v2[19];
  v9 = v2[16];
  v10 = v2[17];
  v11 = v2[15];
  v12 = v2[13];
  v13 = (objc_class *)type metadata accessor for _ObjCAPSUserPayloadHttpHeadersWrapper();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = &v14[OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders];
  *(_QWORD *)v15 = v12;
  *((_QWORD *)v15 + 1) = v3;
  *((_QWORD *)v15 + 2) = v11;
  *((_QWORD *)v15 + 3) = v9;
  *((_QWORD *)v15 + 4) = v10;
  *((_QWORD *)v15 + 5) = v7;
  *((_QWORD *)v15 + 6) = v8;
  *((_QWORD *)v15 + 7) = v6;
  *((_QWORD *)v15 + 8) = v16;
  *((_QWORD *)v15 + 9) = v5;
  *((_QWORD *)v15 + 10) = v17;
  *((_QWORD *)v15 + 11) = v18;
  v19.receiver = v14;
  v19.super_class = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorAPSUserPayloadHttpHeaders *)-[BlastDoorIDSCommandWebTunnelResponse init](&v19, sel_init);
}

- (NSData)httpBody
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 200];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                     + 192];
    sub_1AD0040A0(v4, v2);
    v3 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)httpBodyUrl
{
  void *v2;

  if (*(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 216])
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

- (NSData)httpBodyKey
{
  return (NSData *)sub_1AD4B4074((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_httpResponseStatus
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 248] & 1) == 0;
}

- (int64_t)httpResponseStatus
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 248])
    return 0;
  else
    return *(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                       + 240];
}

- (NSString)httpErrorMsg
{
  void *v2;

  if (*(_QWORD *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 264])
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

- (BlastDoorIDSCommandWebTunnelResponse)init
{
  BlastDoorIDSCommandWebTunnelResponse *result;

  result = (BlastDoorIDSCommandWebTunnelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD __dst[35];

  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse, sizeof(__dst));
  sub_1AD4DFF54(__dst);
}

@end
