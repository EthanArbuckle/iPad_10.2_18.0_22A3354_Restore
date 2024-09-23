@implementation BlastDoorAttributionInfo

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  _OWORD v9[9];
  _OWORD v10[2];

  v2 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 136];
  v9[8] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 120];
  v10[0] = v2;
  *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo
                                                                  + 146];
  v3 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  v9[4] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 56];
  v9[5] = v3;
  v4 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 104];
  v9[6] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
  v9[1] = v5;
  v6 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
  v9[2] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 24];
  v9[3] = v6;
  sub_1AD4D9434((uint64_t)v9);
  sub_1AD63B798();
  v7 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (BOOL)has_adamID
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo] & 1) == 0;
}

- (unint64_t)adamID
{
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo])
    return 0;
  else
    return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
}

- (NSString)accessibilityStickerName
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
}

- (NSString)bundleID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 48];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (NSString)packName
{
  return (NSString *)sub_1AD4BB0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
}

- (BOOL)has_previewGenerationSizeHeight
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 80] & 1) == 0;
}

- (double)previewGenerationSizeHeight
{
  double result;

  result = *(double *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 80])
    return 0.0;
  return result;
}

- (BOOL)has_previewGenerationSizeWidth
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 96] & 1) == 0;
}

- (double)previewGenerationSizeWidth
{
  double result;

  result = *(double *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 96])
    return 0.0;
  return result;
}

- (BlastDoorAttributionInfo_PreviewGenerationConstraints)previewGenerationConstraints
{
  char *v2;
  __int16 v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  objc_class *v12;
  char *v13;
  char *v14;
  objc_super v15;

  v2 = (char *)self + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo;
  v3 = *(_WORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 160];
  if ((v3 & 0xFF00) == 0x200)
    return (BlastDoorAttributionInfo_PreviewGenerationConstraints *)0;
  v5 = *((_QWORD *)v2 + 20);
  v6 = *((_DWORD *)v2 + 38);
  v7 = *((_QWORD *)v2 + 18);
  v8 = *((_DWORD *)v2 + 34);
  v9 = *((_QWORD *)v2 + 16);
  v10 = *((_DWORD *)v2 + 30);
  v11 = *((_QWORD *)v2 + 14);
  v12 = (objc_class *)type metadata accessor for _ObjCAttributionInfo_PreviewGenerationConstraintsWrapper();
  v13 = (char *)objc_allocWithZone(v12);
  v14 = &v13[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints];
  *(_QWORD *)v14 = v11;
  v14[8] = v10 & 1;
  *((_QWORD *)v14 + 2) = v9;
  v14[24] = v8 & 1;
  *((_QWORD *)v14 + 4) = v7;
  v14[40] = v6 & 1;
  *((_QWORD *)v14 + 6) = v5;
  v14[56] = v3 & 1;
  v14[57] = HIBYTE(v3) & 1;
  v15.receiver = v13;
  v15.super_class = v12;
  return (BlastDoorAttributionInfo_PreviewGenerationConstraints *)-[BlastDoorAttributionInfo init](&v15, sel_init);
}

- (BlastDoorAttributionInfo)init
{
  BlastDoorAttributionInfo *result;

  result = (BlastDoorAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
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
  _OWORD v7[9];
  _OWORD v8[2];

  v2 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 136];
  v7[8] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 120];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo
                                                                 + 146];
  v3 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  v7[4] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 56];
  v7[5] = v3;
  v4 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 104];
  v7[6] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  v7[7] = v4;
  v5 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
  v7[1] = v5;
  v6 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
  v7[2] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 24];
  v7[3] = v6;
  sub_1AD283B54((uint64_t)v7);
}

@end
