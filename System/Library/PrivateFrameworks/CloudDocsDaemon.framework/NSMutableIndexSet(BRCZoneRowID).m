@implementation NSMutableIndexSet(BRCZoneRowID)

- (uint64_t)addZoneRowID:()BRCZoneRowID
{
  return objc_msgSend(a1, "addIndex:", objc_msgSend(a3, "unsignedLongValue"));
}

- (uint64_t)removeZoneRowID:()BRCZoneRowID
{
  return objc_msgSend(a1, "removeIndex:", objc_msgSend(a3, "unsignedLongValue"));
}

@end
