@implementation BlastDoorNicknameInformation

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v10[12];
  uint64_t v11;

  v2 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 168];
  v10[10] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 152];
  v10[11] = v2;
  v3 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 104];
  v10[6] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 88];
  v10[7] = v3;
  v4 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 136];
  v10[8] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 120];
  v10[9] = v4;
  v5 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 40];
  v10[2] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 24];
  v10[3] = v5;
  v6 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 72];
  v10[4] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 56];
  v10[5] = v6;
  v7 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 8];
  v10[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation);
  v10[1] = v7;
  v11 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 184];
  sub_1AD28AEFC(v10);
  sub_1AD63B798();
  v8 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSString)recordKey
{
  return (NSString *)sub_1AD4C3120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation);
}

- (NSData)decryptionKey
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  NSData *result;

  v2 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 48];
  if (v2 >> 60 == 15)
  {
    result = (NSData *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 40];
    sub_1AD0040A0(v3, v2);
    v4 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v3, v2);
    return (NSData *)v4;
  }
  return result;
}

- (BOOL)includesWallpaperData
{
  return self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 56];
}

- (BOOL)has_updateInfoIncluded
{
  return (self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 72] & 1) == 0;
}

- (int64_t)updateInfoIncluded
{
  if (self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 72])
    return 0;
  else
    return *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 64];
}

- (NSString)messageType
{
  return (NSString *)sub_1AD4BD7EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation);
}

- (NSData)wallpaperTag
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  NSData *result;

  v2 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 120];
  if (v2 >> 60 == 11)
  {
    result = (NSData *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    if (v2 >> 60 == 15)
    {
      v3 = 0;
    }
    else
    {
      v4 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 112];
      sub_1AD0040A0(v4, v2);
      v3 = (void *)sub_1AD63AFA0();
      sub_1AD009794(v4, v2);
    }
    return (NSData *)v3;
  }
  return result;
}

- (NSData)lowResWallpaperTag
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  NSData *result;

  v2 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 152];
  if (v2 >> 60 == 11)
  {
    result = (NSData *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    if (v2 >> 60 == 15)
    {
      v3 = 0;
    }
    else
    {
      v4 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 144];
      sub_1AD0040A0(v4, v2);
      v3 = (void *)sub_1AD63AFA0();
      sub_1AD009794(v4, v2);
    }
    return (NSData *)v3;
  }
  return result;
}

- (NSData)wallpaperMetadataTag
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  NSData *result;

  v2 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 184];
  if (v2 >> 60 == 11)
  {
    result = (NSData *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    if (v2 >> 60 == 15)
    {
      v3 = 0;
    }
    else
    {
      v4 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 176];
      sub_1AD0040A0(v4, v2);
      v3 = (void *)sub_1AD63AFA0();
      sub_1AD009794(v4, v2);
    }
    return (NSData *)v3;
  }
  return result;
}

- (BlastDoorNicknameInformation)init
{
  BlastDoorNicknameInformation *result;

  result = (BlastDoorNicknameInformation *)_swift_stdlib_reportUnimplementedInitializer();
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
  __int128 v7;
  _OWORD v8[12];
  uint64_t v9;

  v2 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 168];
  v8[10] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 152];
  v8[11] = v2;
  v9 = *(_QWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 184];
  v3 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 104];
  v8[6] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 88];
  v8[7] = v3;
  v4 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 136];
  v8[8] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 120];
  v8[9] = v4;
  v5 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 40];
  v8[2] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 24];
  v8[3] = v5;
  v6 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 72];
  v8[4] = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 56];
  v8[5] = v6;
  v7 = *(_OWORD *)&self->nicknameInformation[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation);
  v8[1] = v7;
  sub_1AD28ADD8(v8);
}

@end
