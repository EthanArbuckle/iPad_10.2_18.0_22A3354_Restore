@implementation __RKEntityAction

- (id)copyWithZone:(void *)a3
{
  void *v3;
  uint64_t v4;

  swift_beginAccess();
  type metadata accessor for __RKEntityAction();
  v3 = (void *)swift_allocObject();
  v4 = swift_retain();
  __RKEntityAction.init(targetEntity:)(v4);
  return v3;
}

@end
