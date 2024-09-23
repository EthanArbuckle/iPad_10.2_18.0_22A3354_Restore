@implementation AnyHashable:

- (uint64_t)Any
{
  return swift_release();
}

- (void)Any
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

- (id)Any
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

@end
