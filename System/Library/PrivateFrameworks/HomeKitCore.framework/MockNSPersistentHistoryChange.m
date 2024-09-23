@implementation MockNSPersistentHistoryChange

- (int64_t)changeID
{
  if (self->mockChangeID[OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID);
}

- (NSDictionary)tombstone
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockTombstone))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_228866E88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (int64_t)changeType
{
  if (self->mockChangeID[OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType);
}

- (NSManagedObjectID)changedObjectID
{
  void *v3;
  _TtC11HomeKitCore29MockNSPersistentHistoryChange *v4;
  id v5;
  id v6;
  _TtC11HomeKitCore29MockNSPersistentHistoryChange *v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x24BDBB6A8]);
    v7 = self;
    v5 = objc_msgSend(v6, sel_init);
  }
  v8 = v3;

  return (NSManagedObjectID *)v5;
}

- (NSSet)updatedProperties
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockUpdatedProperties))
  {
    sub_2288410E4();
    sub_228830CEC();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2288671E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (_TtC11HomeKitCore29MockNSPersistentHistoryChange)init
{
  objc_class *ObjectType;
  char *v4;
  char *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockTombstone) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockUpdatedProperties) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MockNSPersistentHistoryChange init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID));
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)(id)sub_228866EE8();
}

@end
