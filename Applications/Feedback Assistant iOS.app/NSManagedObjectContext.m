@implementation NSManagedObjectContext

- (id)addObjectsDidChangeNotificationObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  NSManagedObjectContext *v6;
  id v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000EA1F8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_10008EC88((uint64_t)sub_10006FB04, v5);

  swift_release(v5);
  return v7;
}

@end
