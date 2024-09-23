@implementation MUIHighlightedMessagesController

- (void).cxx_destruct
{
  swift_getObjectType();

  sub_1D5565CF4();
  sub_1D5565788();
  sub_1D5565D18((id *)((char *)&self->super.isa + OBJC_IVAR___MUIHighlightedMessagesController_filterPredicate));
  sub_1D5565D40();
}

- (EMMessageRepository)repository
{
  MUIHighlightedMessagesController *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1D55ED618();

  return (EMMessageRepository *)v6;
}

- (MUIHighlightedMessagesControllerDelegate)delegate
{
  MUIHighlightedMessagesController *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = (id)sub_1D55ED6A4();

  return (MUIHighlightedMessagesControllerDelegate *)v6;
}

- (void)setDelegate:(id)a3
{
  MUIHighlightedMessagesController *v4;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1D55ED75C();

}

- (MUIHighlightedMessagesController)initWithRepository:(id)a3 delegate:(id)a4
{
  id v4;

  swift_getObjectType();
  v4 = a3;
  swift_unknownObjectRetain();
  return (MUIHighlightedMessagesController *)sub_1D55ED834(a3, (uint64_t)a4);
}

- (NSArray)mailboxes
{
  MUIHighlightedMessagesController *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  sub_1D55EDB1C();

  sub_1D55ED9F4();
  v6 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)setMailboxes:(id)a3
{
  id v4;
  MUIHighlightedMessagesController *v5;
  uint64_t v6;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  sub_1D55ED9F4();
  v6 = sub_1D565FF90();
  sub_1D55EDBEC(v6);

}

- (NSPredicate)filterPredicate
{
  MUIHighlightedMessagesController *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1D55EDE6C();

  return (NSPredicate *)v6;
}

- (void)setFilterPredicate:(id)a3
{
  id v4;
  MUIHighlightedMessagesController *v5;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  sub_1D55EDF24(a3);

}

- (id)messageList
{
  MUIHighlightedMessagesController *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1D55EE1A0();

  return v6;
}

- (void)reload
{
  MUIHighlightedMessagesController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1D55EE2B8();

}

- (MUIHighlightedMessagesController)init
{
  swift_getObjectType();
  return (MUIHighlightedMessagesController *)MUIHighlightedMessagesController.init()();
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  MUIHighlightedMessagesController *v4;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  MUIHighlightedMessagesController.collectionDidFinishInitialLoad(_:)((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  MUIHighlightedMessagesController *v7;
  uint64_t v8;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v8 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:addedItemIDs:before:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  MUIHighlightedMessagesController *v7;
  uint64_t v8;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v8 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:addedItemIDs:after:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  MUIHighlightedMessagesController *v7;
  uint64_t v8;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v8 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:movedItemIDs:before:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  MUIHighlightedMessagesController *v7;
  uint64_t v8;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v8 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:movedItemIDs:after:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v5;
  MUIHighlightedMessagesController *v6;
  uint64_t v7;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = a4;
  v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v7 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:changedItemIDs:)((uint64_t)a3, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v5;
  MUIHighlightedMessagesController *v6;
  uint64_t v7;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = a4;
  v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D9B8);
  v7 = sub_1D565FF90();
  MUIHighlightedMessagesController.collection(_:deletedItemIDs:)((uint64_t)a3, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  MUIHighlightedMessagesController *v6;

  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  MUIHighlightedMessagesController.collection(_:replacedExisting:withNewItemID:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
