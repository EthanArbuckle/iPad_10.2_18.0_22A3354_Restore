@implementation HFReorderableItemList

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (HFReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  void *v4;

  sub_1DD63E14C();
  v4 = (void *)swift_unknownObjectRetain();
  return (HFReorderableItemList *)ReorderableItemList.init(applicationDataContainer:category:)(v4);
}

- (BOOL)sortedIdentifiersWithIdentifier1:(id)a3 identifier2:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  HFReorderableItemList *v12;
  char v13;
  char v14;
  char v15;

  v5 = sub_1DD63E14C();
  v7 = v6;
  v8 = sub_1DD63E14C();
  v10 = v9;
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa)
                                                                     + 0xA8);
  v12 = self;
  v13 = v11(v5, v7, v8, v10);
  if (v13 == 2)
  {
    if (v5 == v8 && v7 == v10)
    {
      swift_bridgeObjectRelease_n();
      v14 = 0;
    }
    else
    {
      v14 = sub_1DD63E860();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v15 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = v15 & 1;
  }

  return v14 & 1;
}

- (BOOL)sortedItemsWithItem1:(id)a3 item2:(id)a4
{
  id v6;
  id v7;
  HFReorderableItemList *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DD3A1564(v6, v7);

  return v9 & 1;
}

- (BOOL)isEmpty
{
  return (*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR___HFReorderableItemList_sortedIdentifiers))[2] == 0;
}

- (void)setSortedItems:(id)a3
{
  uint64_t v4;
  HFReorderableItemList *v5;
  unint64_t v6;

  v4 = sub_1DD63E1F4();
  v5 = self;
  v6 = sub_1DD41B508(v4);
  if (v6)
  {
    *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR___HFReorderableItemList_sortedIdentifiers) = (Class)sub_1DD41B05C(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  swift_bridgeObjectRelease();
}

- (id)saveWithSender:(id)a3
{
  HFReorderableItemList *v4;
  HFReorderableItemList *v5;
  id v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DD63E56C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1DD41B6C0((uint64_t)v8);

  sub_1DD3F6180((uint64_t)v8);
  return v6;
}

@end
