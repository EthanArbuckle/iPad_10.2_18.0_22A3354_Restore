@implementation TransactionChangesObserver

- (void)contextDidMergeChangesObjectIDsNotificationWithNotification:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t ObjectType;

  v4 = a3;
  swift_retain();
  if ((sub_2333EA120(v4) & 1) != 0 && MEMORY[0x23493465C](self->delegate))
  {
    v5 = *(_QWORD *)&self->delegate[8];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
  }
}

@end
