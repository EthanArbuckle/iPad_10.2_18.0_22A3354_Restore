@implementation FBAManagedObjectChanges

- (NSSet)insertedObjects
{
  return (NSSet *)sub_10008E6E4(self, (uint64_t)a2, &NSInsertedObjectsKey);
}

- (NSSet)updatedObjects
{
  return (NSSet *)sub_10008E6E4(self, (uint64_t)a2, &NSUpdatedObjectsKey);
}

- (NSSet)deletedObjects
{
  return (NSSet *)sub_10008E6E4(self, (uint64_t)a2, &NSDeletedObjectsKey);
}

- (NSSet)refreshedObjects
{
  return (NSSet *)sub_10008E6E4(self, (uint64_t)a2, &NSRefreshedObjectsKey);
}

- (NSSet)invalidatedObjects
{
  return (NSSet *)sub_10008E6E4(self, (uint64_t)a2, &NSInvalidatedObjectsKey);
}

- (BOOL)invalidatedAllObjects
{
  _TtC18Feedback_Assistant23FBAManagedObjectChanges *v2;
  char v3;

  v2 = self;
  v3 = sub_10008E7D4();

  return v3 & 1;
}

- (NSManagedObjectContext)managedObjectContext
{
  _TtC18Feedback_Assistant23FBAManagedObjectChanges *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10008E91C();

  return (NSManagedObjectContext *)v3;
}

- (_TtC18Feedback_Assistant23FBAManagedObjectChanges)init
{
  _TtC18Feedback_Assistant23FBAManagedObjectChanges *result;

  result = (_TtC18Feedback_Assistant23FBAManagedObjectChanges *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAManagedObjectChanges", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant23FBAManagedObjectChanges_notification;
  v3 = type metadata accessor for Notification(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
