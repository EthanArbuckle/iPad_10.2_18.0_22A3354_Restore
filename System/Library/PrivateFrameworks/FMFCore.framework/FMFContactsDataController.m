@implementation FMFContactsDataController

- (void)contactStoreChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  id v8;

  if (MEMORY[0x212BE496C](&self->delegate[7], a2))
  {
    v5 = *(_QWORD *)&self->delegate[15];
    ObjectType = swift_getObjectType();
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v8 = a3;
    swift_retain();
    v7(ObjectType, v5);

    swift_release();
    swift_unknownObjectRelease();
  }
}

@end
