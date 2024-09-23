@implementation HKLinkSetWrapper

- (HKLinkSetWrapper)initWithLinks:(id)a3
{
  unint64_t v3;

  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  v3 = sub_19A3534CC();
  return (HKLinkSetWrapper *)LinkSetWrapper.init(_:)(v3);
}

- (HKLinkSetWrapper)initWithSerializedData:(id)a3 error:(id *)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  HKLinkSetWrapper *v16;
  HKLinkSetWrapper *v17;
  id *v19;
  objc_super v20;

  v19 = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = sub_19A352F20();
  v15 = v14;

  v16 = self;
  sub_19A3119F0(v13, v15);
  sub_19A306A54(&qword_1EE397D18, (uint64_t (*)(uint64_t))sub_19A31A58C, MEMORY[0x1E0D11DB0]);
  sub_19A3532B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v16 + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v11, v8);

  v20.receiver = v16;
  v20.super_class = ObjectType;
  v17 = -[HKLinkSetWrapper init](&v20, sel_init, v19);
  sub_19A311AA4(v13, v15);
  return v17;
}

- (id)serializedDataWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  HKLinkSetWrapper *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = sub_19A353298();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = qword_1EE396A70;
  v9 = self;
  if (v8 != -1)
    swift_once();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0D12378], v4);
  sub_19A31A58C(0);
  sub_19A306A54(&qword_1EE397D18, (uint64_t (*)(uint64_t))sub_19A31A58C, MEMORY[0x1E0D11DB0]);
  v10 = sub_19A3532A4();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  v13 = (void *)sub_19A352F08();
  sub_19A311AA4(v10, v12);
  return v13;
}

- (NSArray)elements
{
  HKLinkSetWrapper *v3;
  void *v4;

  sub_19A31A58C(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  v3 = self;
  sub_19A3531C0();

  v4 = (void *)sub_19A3534C0();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (int64_t)count
{
  HKLinkSetWrapper *v3;
  int64_t v4;

  sub_19A31A58C(0);
  v3 = self;
  v4 = sub_19A3531CC();

  return v4;
}

- (id)appendingElement:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  HKLinkSetWrapper *v16;
  char *v17;
  HKLinkSetWrapper *v18;
  void (*v19)(char *, uint64_t);
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v21 - v12;
  v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v14((char *)&v21 - v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v7);
  v15 = a3;
  v16 = self;
  sub_19A3531E4();
  v14(v11, v13, v7);
  v17 = (char *)objc_allocWithZone(ObjectType);
  v14(&v17[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v21.receiver = v17;
  v21.super_class = ObjectType;
  v18 = -[HKLinkSetWrapper init](&v21, sel_init);
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v13, v7);

  return v18;
}

- (id)appendingElements:(id)a3
{
  return sub_19A31D3F0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))LinkSetWrapper.appendingElements(_:));
}

- (id)insertingElement:(id)a3 index:(int64_t)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;
  HKLinkSetWrapper *v17;
  char *v18;
  HKLinkSetWrapper *v19;
  void (*v20)(char *, uint64_t);
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v22 - v13;
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15((char *)&v22 - v13, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v8);
  v16 = a3;
  v17 = self;
  sub_19A3531F0();
  v15(v12, v14, v8);
  v18 = (char *)objc_allocWithZone(ObjectType);
  v15(&v18[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v12, v8);
  v22.receiver = v18;
  v22.super_class = ObjectType;
  v19 = -[HKLinkSetWrapper init](&v22, sel_init);
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  v20(v14, v8);

  return v19;
}

- (id)movingElementFrom:(int64_t)a3 to:(int64_t)a4
{
  HKLinkSetWrapper *v6;
  char *v7;

  v6 = self;
  v7 = LinkSetWrapper.movingElement(from:to:)(a3, a4);

  return v7;
}

- (id)removingAtIndex:(int64_t)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  HKLinkSetWrapper *v14;
  char *v15;
  HKLinkSetWrapper *v16;
  void (*v17)(char *, uint64_t);
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v19 - v11;
  v13 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v13((char *)&v19 - v11, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v6);
  v14 = self;
  sub_19A3531FC();
  v13(v10, v12, v6);
  v15 = (char *)objc_allocWithZone(ObjectType);
  v13(&v15[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v10, v6);
  v19.receiver = v15;
  v19.super_class = ObjectType;
  v16 = -[HKLinkSetWrapper init](&v19, sel_init);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v17(v12, v6);

  return v16;
}

- (id)removingLinksWithUUID:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  HKLinkSetWrapper *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  HKLinkSetWrapper *v23;
  char *v24;
  objc_super v25;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - v11;
  v13 = sub_19A353010();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A352FF8();
  v17 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v17(v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v6);
  v24 = v16;
  v23 = self;
  sub_19A353238();
  v17(v10, v12, v6);
  v18 = (char *)objc_allocWithZone(ObjectType);
  v17(&v18[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v10, v6);
  v25.receiver = v18;
  v25.super_class = ObjectType;
  v19 = -[HKLinkSetWrapper init](&v25, sel_init);
  v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  v20(v12, v6);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v19;
}

- (id)removingAll
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, char *, uint64_t);
  HKLinkSetWrapper *v13;
  char *v14;
  HKLinkSetWrapper *v15;
  void (*v16)(char *, uint64_t);
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v18 - v10;
  v12 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v12((char *)&v18 - v10, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v5);
  v13 = self;
  sub_19A353244();
  v12(v9, v11, v5);
  v14 = (char *)objc_allocWithZone(ObjectType);
  v12(&v14[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v9, v5);
  v18.receiver = v14;
  v18.super_class = ObjectType;
  v15 = -[HKLinkSetWrapper init](&v18, sel_init);
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);

  return v15;
}

- (id)replacingElementAt:(int64_t)a3 withElement:(id)a4
{
  id v6;
  HKLinkSetWrapper *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = LinkSetWrapper.replacingElementAt(_:withElement:)(a3, (uint64_t)v6);

  return v8;
}

- (id)retargetingLinksWithUUID:(id)a3 newUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  HKLinkSetWrapper *v12;
  id v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v5 = sub_19A353010();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v16 - v10;
  sub_19A352FF8();
  sub_19A352FF8();
  v12 = self;
  v13 = LinkSetWrapper.retargetingLinksWithUUID(_:newUUID:)((uint64_t)v11, (uint64_t)v9);

  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
  return v13;
}

- (id)swappingElementsAt:(int64_t)a3 andAt:(int64_t)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  HKLinkSetWrapper *v15;
  char *v16;
  HKLinkSetWrapper *v17;
  void (*v18)(char *, uint64_t);
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20 - v12;
  v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v14((char *)&v20 - v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v7);
  v15 = self;
  sub_19A353214();
  v14(v11, v13, v7);
  v16 = (char *)objc_allocWithZone(ObjectType);
  v14(&v16[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v20.receiver = v16;
  v20.super_class = ObjectType;
  v17 = -[HKLinkSetWrapper init](&v20, sel_init);
  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v18(v13, v7);

  return v17;
}

- (id)mergingLinkSet:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  id v15;
  HKLinkSetWrapper *v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  HKLinkSetWrapper *v19;
  void (*v20)(char *, uint64_t);
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A31A58C(0);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v22 - v12;
  sub_19A306A54(&qword_1EE397D18, v14, MEMORY[0x1E0D11DB0]);
  v15 = a3;
  v16 = self;
  sub_19A3532BC();
  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v17(v11, v13, v7);
  v18 = (char *)objc_allocWithZone(ObjectType);
  v17(&v18[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v22.receiver = v18;
  v22.super_class = ObjectType;
  v19 = -[HKLinkSetWrapper init](&v22, sel_init);
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v11, v7);
  v20(v13, v7);

  return v19;
}

- (id)mergingLegacyElementsArray:(id)a3
{
  return sub_19A31D3F0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))LinkSetWrapper.mergingLegacyElementsArray(_:));
}

- (NSString)description
{
  HKLinkSetWrapper *v3;
  void *v4;

  sub_19A31A58C(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  v3 = self;
  sub_19A3531C0();
  MEMORY[0x19AEC6648]();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_19A353400();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_19A31D6C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))LinkSetWrapper.isEqual(_:));
}

- (int64_t)hash
{
  HKLinkSetWrapper *v3;
  int64_t v4;

  sub_19A31A58C(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  v3 = self;
  sub_19A3531C0();
  sub_19A306A54(&qword_1EE397D38, type metadata accessor for UserDomainConceptLinkStructWrapper, MEMORY[0x1E0DEFCF8]);
  v4 = sub_19A353514();

  swift_bridgeObjectRelease();
  return v4;
}

- (HKLinkSetWrapper)init
{
  HKLinkSetWrapper *result;

  result = (HKLinkSetWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet;
  sub_19A31A58C(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
