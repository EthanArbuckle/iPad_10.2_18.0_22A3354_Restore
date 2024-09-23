@implementation CKChatItemDiff

- (NSIndexSet)inserted
{
  return (NSIndexSet *)sub_18E619BE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_inserted);
}

- (void)setInserted:(id)a3
{
  sub_18E619D1C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CKChatItemDiff_inserted);
}

- (NSIndexSet)removed
{
  return (NSIndexSet *)sub_18E619BE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_removed);
}

- (void)setRemoved:(id)a3
{
  sub_18E619D1C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CKChatItemDiff_removed);
}

- (NSIndexSet)parentItemsToReload
{
  return (NSIndexSet *)sub_18E619BE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_parentItemsToReload);
}

- (void)setParentItemsToReload:(id)a3
{
  sub_18E619D1C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CKChatItemDiff_parentItemsToReload);
}

- (CKChatItemDiff)init
{
  CKChatItemDiff *result;

  result = (CKChatItemDiff *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___CKChatItemDiff_inserted;
  v4 = sub_18E766404();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CKChatItemDiff_removed, v4);
  v5((char *)self + OBJC_IVAR___CKChatItemDiff_parentItemsToReload, v4);
}

@end
