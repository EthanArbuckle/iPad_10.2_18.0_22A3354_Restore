@implementation BlastDoorSyndicationAction

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  _OWORD v8[9];
  __int16 v9;

  v2 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  v8[6] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  v8[7] = v2;
  v8[8] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  v3 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  v8[2] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 24];
  v8[3] = v3;
  v4 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  v8[4] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  v8[5] = v4;
  v5 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  v8[1] = v5;
  v9 = *(_WORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  sub_1AD4DA448((uint64_t)v8);
  sub_1AD63B798();
  v6 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (unsigned)itemType
{
  unsigned int v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  if (v2 > 2)
    __break(1u);
  return v2;
}

- (unsigned)actionType
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 1);
}

- (unint64_t)encodedSyndicationStartDate
{
  return *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction];
}

- (_NSRange)syndicatedMessagePartRange
{
  char *v2;
  NSUInteger v3;
  uint64_t v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction;
  v3 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  v4 = *((_QWORD *)v2 + 3);
  if (v4 < 0)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  a2 = (SEL)(v4 - v3);
LABEL_6:
  result.length = (NSUInteger)a2;
  result.location = v3;
  return result;
}

- (NSString)messagePartGUID
{
  return (NSString *)sub_1AD4CFC9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
}

- (BlastDoorGroupContext)groupContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  unsigned __int8 v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v3 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  v2 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 48];
  v4 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  v5 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 64];
  v6 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  v7 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 80];
  v8 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  v9 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  v17 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 112];
  v18 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 96];
  v16 = self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  v15 = *(_QWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 128];
  v14 = self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  v10 = (objc_class *)type metadata accessor for _ObjCGroupContextWrapper();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___BlastDoorGroupContext_groupContext];
  *(_QWORD *)v12 = v3;
  *((_QWORD *)v12 + 1) = v2;
  *((_QWORD *)v12 + 2) = v4;
  *((_QWORD *)v12 + 3) = v5;
  *((_QWORD *)v12 + 4) = v6;
  *((_QWORD *)v12 + 5) = v7;
  *((_QWORD *)v12 + 6) = v8;
  *((_QWORD *)v12 + 7) = v18;
  *((_QWORD *)v12 + 8) = v9;
  *((_QWORD *)v12 + 9) = v17;
  v12[80] = v16;
  *((_QWORD *)v12 + 11) = v15;
  v12[96] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1AD003E48(v7, v8);
  v19.receiver = v11;
  v19.super_class = v10;
  swift_bridgeObjectRetain();
  return (BlastDoorGroupContext *)-[BlastDoorSyndicationAction init](&v19, sel_init);
}

- (unsigned)version
{
  return self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 137];
}

- (BlastDoorSyndicationAction)init
{
  BlastDoorSyndicationAction *result;

  result = (BlastDoorSyndicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[9];
  __int16 v7;

  v2 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  v6[6] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  v6[7] = v2;
  v6[8] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  v7 = *(_WORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  v3 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  v6[2] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 24];
  v6[3] = v3;
  v4 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  v6[4] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  v6[5] = v4;
  v5 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  v6[1] = v5;
  sub_1AD4DFED8((uint64_t)v6);
}

@end
