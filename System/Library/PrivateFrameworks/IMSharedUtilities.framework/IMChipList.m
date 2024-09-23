@implementation IMChipList

- (NSArray)chipList
{
  void *v2;

  type metadata accessor for IMChip();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)replied
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMChipList_replied);
}

- (IMChipList)initWithChipList:(id)a3
{
  void *v4;
  IMChipList *v5;

  type metadata accessor for IMChip();
  sub_19E36F960();
  v4 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  v5 = -[IMChipList initWithChipList:replied:](self, sel_initWithChipList_replied_, v4, 0);

  return v5;
}

- (IMChipList)initWithChipList:(id)a3 replied:(BOOL)a4
{
  objc_super v7;

  type metadata accessor for IMChip();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipList_chipList) = (Class)sub_19E36F960();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMChipList_replied) = a4;
  v7.receiver = self;
  v7.super_class = (Class)IMChipList;
  return -[IMChipList init](&v7, sel_init);
}

- (IMChipList)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMChipList *)IMChipList.init(dictionary:)(v3);
}

- (IMChipList)initWithChipArray:(id)a3
{
  void *v4;
  IMChipList *v5;

  sub_19E247E74(&qword_1EE503490);
  sub_19E36F960();
  v4 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  v5 = -[IMChipList initWithChipArray:replied:](self, sel_initWithChipArray_replied_, v4, 0);

  return v5;
}

- (IMChipList)initWithChipArray:(id)a3 replied:(BOOL)a4
{
  uint64_t v5;

  sub_19E247E74(&qword_1EE503490);
  v5 = sub_19E36F960();
  return (IMChipList *)sub_19E349CC0(v5, a4);
}

- (id)dictionaryRepresentation
{
  IMChipList *v2;
  void *v3;

  v2 = self;
  sub_19E349F24();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)suggestedReplies
{
  return sub_19E34A408(self, (uint64_t)a2, (uint64_t)off_1E3FB01F0, (void (*)(_QWORD))type metadata accessor for IMChipReply);
}

- (id)suggestedActions
{
  return sub_19E34A408(self, (uint64_t)a2, (uint64_t)off_1E3FB01E0, (void (*)(_QWORD))type metadata accessor for IMChipAction);
}

- (BOOL)isEqual:(id)a3
{
  IMChipList *v4;
  IMChipList *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMChipList.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (id)messageItem
{
  IMChipList *v2;
  id v3;

  v2 = self;
  v3 = sub_19E34A8E8();

  return v3;
}

+ (id)merge:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = _sSo10IMChipListC17IMSharedUtilitiesE5merge_4withABSgAF_AFtFZ_0(a3, a4);

  return v8;
}

- (IMChipList)init
{
  IMChipList *result;

  result = (IMChipList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
