@implementation __RKEntityToggleAnimateAction

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;

  swift_beginAccess();
  type metadata accessor for __RKEntityToggleAnimateAction();
  *(_QWORD *)(swift_allocObject() + 264) = 0;
  v3 = swift_retain();
  return (id)__RKEntityAnimateAction.init(targetEntity:)(v3);
}

@end
